using System;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WGRL.User
{
    public partial class ListView2 : System.Web.UI.Page
    {
        SqlConnection con;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string x = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            con=new SqlConnection(x);
            if (Request.QueryString["Side"] == "Left")
            {
                Grid1.Visible = true;
                Grid2.Visible = false;
            }
            else if (Request.QueryString["Side"] == "Right")
            {
                Grid2.Visible = true;
                Grid1.Visible = false;
            }
            else if (Request.QueryString["Side"] == "Both")
            {
                Grid1.Visible = false;
                Grid2.Visible = false;
                Grid3.Visible = true;
            }
            else
            {
                Response.Redirect("~/user/userhome.aspx");
            }  
            
        }

        protected void Left_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            Label2.Text = e.AffectedRows.ToString();
            lblBoth.Text = "";
            check.Visible = false;
        }

        protected void Right_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            Label2.Text = e.AffectedRows.ToString();
            lblBoth.Text = "";
            check.Visible = false;
        }

        protected void Both_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {            
            lblBoth.Text = e.AffectedRows.ToString();
            check.Visible = true; 
        }



       
    }
}