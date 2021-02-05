using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Starlinenetworking.user
{
    public partial class DownlineRewardStatus : System.Web.UI.Page
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
            else
            {
                Response.Redirect("~/user/userhome.aspx");           
            }  
            
        }

        protected void Left_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            
            Label2.Text = e.AffectedRows.ToString();
        }

        protected void Right_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            Label2.Text = e.AffectedRows.ToString();
            
               
        }
        }
    }
