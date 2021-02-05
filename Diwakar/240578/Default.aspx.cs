using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admin_Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Session["Level"] = 1;
        Session["UserCode"] = "Administrator";
        Session["ID"] = ConfigurationManager.AppSettings["MainID"].ToString();
    }

 
}
