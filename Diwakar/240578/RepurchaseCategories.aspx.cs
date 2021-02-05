using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace WGRL._240578
{
    public partial class RepurchaseCategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Manage Category") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

        }

        protected void sbmtbtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("insert into CategoryMaster(CategoryName) values('" + catnametxt.Text + "') ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("RepurchaseCategories.aspx");

        }
    }
}