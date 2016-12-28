<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Configuration;
using System.Web.SessionState;
public class login : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        string name = context.Request.Params["name"] == null ? "" : context.Request.Params["name"].ToString();
        string password= context.Request.Params["password"] == null ? "" : context.Request.Params["password"].ToString();
        string usertype= context.Request.Params["utype"] == null ? "" : context.Request.Params["utype"].ToString();

        String sql = "select COUNT(*) from userInfo where username='" + name + "' and  password='" + password + "' and usertype='" + usertype + "';";
        int rowcount = MyDB.ExecuteSql(sql);
        string result = rowcount>0?"success":"failure";
        if (rowcount > 0)
        {
            HttpContext.Current.Session["usename"] = name;
            HttpContext.Current.Session["utype"] = usertype;
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