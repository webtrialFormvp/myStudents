<%@ WebHandler Language="C#" Class="updateinfo" %>

using System;
using System.Web;
using System.Web.SessionState;
public class updateinfo : IHttpHandler,IRequiresSessionState{

    public void ProcessRequest (HttpContext context) {

        string profilename = context.Request.Params["profilename"] == null ? "" : context.Request.Params["profilename"].ToString();
        string usertel= context.Request.Params["usertel"] == null ? "" : context.Request.Params["usertel"].ToString();
        string useradd= context.Request.Params["useradd"] == null ? "" : context.Request.Params["useradd"].ToString();
        string uremark= context.Request.Params["uremark"] == null ? "" : context.Request.Params["uremark"].ToString();
        uremark = uremark.Trim();
        uremark =uremark.Length>255? uremark.Substring(0, 255):uremark;
        String usertype = HttpContext.Current.Session["utype"].ToString();
        String userid= HttpContext.Current.Session["userid"].ToString();
        String tabName = string.Empty;
        switch (usertype)
        {
            case "1":
                tabName = "student";
                break;
            case "2":
                tabName = "teacher";
                break;
        }
        string updateSql = "update  " + tabName + " t set t.username='"+profilename+
                "',t.telephone='"+usertel+"', t.address='" +useradd+"',t.remark='"+ uremark + "' where userid='" + userid + "';";
        int rowcount= MyDB.ExecuteUpdateSql(updateSql);
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