using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Starlinenetworking.user
{
    public partial class NewJoinings : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            string x = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            con = new SqlConnection(x);
            if (Request.QueryString["Side"] == "Left")
            {
                GridView1.Visible = true;
                GridView2.Visible = false;
            }
            else if (Request.QueryString["Side"] == "Right")
            {

                GridView2.Visible = true;
                GridView1.Visible = false;
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

        protected void Button1_Click(object sender, EventArgs e)
        {

        }


    }
}
