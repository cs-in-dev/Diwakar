using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperAdmin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usercode"] == null)
        {
            //Response.Redirect("~/240578/Default.aspx");
        }
        if ( Request.UserAgent.IndexOf("ApplceWebKit") > 0)
        {
        Request.Browser.Adapters.Clear();
        }
         
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/240578/default.aspx");
    }
   
}
