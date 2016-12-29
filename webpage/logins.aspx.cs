using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using myLog;
public partial class webpage_logins : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Logging.LogInit();
        Logging.LogInfo("mmddd");
    }
}