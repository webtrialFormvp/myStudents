<%@ WebHandler Language="C#" Class="getInfos" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
public class getInfos : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest(HttpContext context)
    {

        String usertype = HttpContext.Current.Session["utype"].ToString();
        String userid= HttpContext.Current.Session["userid"].ToString();
        String sql = String.Empty;

        sql = "select * from teacher where userid='" + userid + "';";

        DataSet ds = MyDB.Query(sql);
        DataTable dt = ds.Tables[0];
        User user = new User();        
        user.Username = HttpContext.Current.Session["usename"].ToString();
        user.Address = dt.Rows[0]["address"].ToString();
        user.Remark=dt.Rows[0]["remark"].ToString();
        user.Telephone=dt.Rows[0]["telephone"].ToString();
        
        context.Response.ContentType = "text/json";
        context.Response.Write(Utils.ObjectToJson(user));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}