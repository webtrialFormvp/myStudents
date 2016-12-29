<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Configuration;
using System.Web.SessionState;
using System.Security.Cryptography;
public class login : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        string name = context.Request.Params["name"] == null ? "" : context.Request.Params["name"].ToString();
        string password= context.Request.Params["password"] == null ? "" : context.Request.Params["password"].ToString();
        string usertype= context.Request.Params["utype"] == null ? "" : context.Request.Params["utype"].ToString();
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        string t2 = BitConverter.ToString(md5.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password)), 4, 8);
        t2 = t2.Replace("-", "");
        t2 = t2.ToLower();
        String sql = "select userid from userInfo where username='" + name + "' and  password='" + t2 + "' and usertype='" + usertype + "';";
        String userid = MyDB.ExecuteSQL(sql);
        string result = !userid.Equals(string.Empty)?"success":"failure";
        if (!userid.Equals(string.Empty))
        {
            HttpContext.Current.Session["usename"] = name;
            HttpContext.Current.Session["utype"] = usertype;
            HttpContext.Current.Session["userid"] = userid;
        }


        context.Response.ContentType = "text/json";
        context.Response.Write(Utils.ObjectToJson(result));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}