using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WGRL.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
       // SqlConnection con;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select LoginPassword from tblMemberMaster where UserCode =@UserCode", con);
            cmd.Parameters.AddWithValue("@UserCode", Session["UserCode"].ToString());
            con.Open();
            String pass = cmd.ExecuteScalar().ToString();
            con.Close();
            if (pass == txtExistingPassword.Text)
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "Update tblMemberMaster set LoginPassword =@LoginPassword where UserCode =@UserCode1";
                cmd.Parameters.AddWithValue("@LoginPassword", txtConfirmPassword.Text);
                cmd.Parameters.AddWithValue("@UserCode1", Session["UserCode"].ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Login password changed successfully";
            }
            else
            {
                Label1.Text = "Invalid existing login Password";
            }
        }
    }
}