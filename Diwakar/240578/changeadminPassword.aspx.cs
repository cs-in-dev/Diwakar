using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OpinionWorldGroup.Admin
{
    public partial class changeadminPassword : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Change Admin Password") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/240578/AdminHome.aspx");


            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/User/Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString); ;
            SqlCommand cmd = new SqlCommand("select Password from AdminLogin where LoginID = 'admin'", con);
            con.Open();
            object o = cmd.ExecuteScalar();
            con.Close();
            string pass = Convert.ToString(o);
            if (pass == TextBox1.Text)
            {
                cmd.CommandText = "Update AdminLogin set Password = '" + TextBox2.Text + "' where LoginID = 'admin'";
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Login Password Changed Successfully";
            }
            else
            {
                Label1.Text = "Invalid Existing Login Password";
            }
        }
    }
}