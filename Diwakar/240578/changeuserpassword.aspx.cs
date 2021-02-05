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
    public partial class changeuserpassword : System.Web.UI.Page
    {
        BOMemberMaster objMemberMaster;
        BALMemberMaster objBALMemberMaster;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/19111973/Default.aspx");
            if (User.IsInRole("Change User Password") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/19111973/AdminHome.aspx");

            objMemberMaster = new BOMemberMaster();
            objBALMemberMaster = new BALMemberMaster();
           
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/User/Default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd;
            SqlDataReader rd;

            cmd = new SqlCommand("select LoginPassword,LoginName from tblMemberMaster where UserCode='" + TextBox4.Text + "'", con1);
            con1.Open();
            rd = cmd.ExecuteReader();
            bool b = rd.Read();
            if (b == true)
            {
                Label2.Text = "";
                TextBox1.Text = rd[0].ToString();
                TextBox5.Text = rd[1].ToString();
                TextBox6.Text = rd[1].ToString();
            }
            else
            {
                Label2.Text = "Wrong Member ID inserted";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox5.Text = "";
               // rd.Close();
                return;
            }
            rd.Close();
            con1.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TextBox3.Text != TextBox2.Text)
            {
                Label1.Text = "Pass and Confirm Pass Must match";
                return;
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select isnull(count(*),0) from tblMemberMaster where Loginname='" + TextBox6.Text + "'", con);

            con.Open();
            int x = int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();

             if (x>=1 && TextBox5.Text !=TextBox6.Text)
            {
                Label1.Text = "Loginname not available";
                return;
            }

            cmd.CommandText = "Update tblMemberMaster set LoginPassword = '" + TextBox3.Text + "', LoginName ='" + TextBox6.Text + "' where UserCode = '" + TextBox4.Text + "'";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Label1.Text = "Login Credentials Changed Successfully";
        }
    }
}