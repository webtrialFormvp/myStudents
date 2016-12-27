<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Configuration;
public class login : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string name = context.Request.Params["name"] == null ? "" : context.Request.Params["name"].ToString();
        string password= context.Request.Params["password"] == null ? "" : context.Request.Params["password"].ToString();
        string usertype= context.Request.Params["utype"] == null ? "" : context.Request.Params["utype"].ToString();

        String sql = "select COUNT(*) from userInfo where username='" + name + "' and  password='" + password + "' and usertype='" + usertype + "';";
       int rowcount = MyDB.ExecuteSql(sql);
        string result = rowcount>0?"success":"failure";
        


        context.Response.ContentType = "text/json";
        context.Response.Write(Utils.ObjectToJson(result));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}