using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OpinionWorldGroup.Admin
{
    public partial class transactionpassword : System.Web.UI.Page
    {
        SqlConnection con= new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            Panelviewinformation.Visible = false;

            Panel1.Visible = true;
        }

        protected void btngetmember_Click(object sender, EventArgs e)
        {
            CheckMember();
        }
        protected void CheckMember()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
            string s = "select UserCode from tblMemberMaster";
            SqlCommand cmd = new SqlCommand(s, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[0].ToString() == TextBox1.Text)
                {
                    lblmess.Text = "Valid User ID";
                    Panelviewinformation.Visible = true;

                    Panel1.Visible = false;
                    return;
                }
                else
                {
                    lblmess.Text = "Wrong User ID";
                    Panelviewinformation.Visible = false;
                }
            }
            con.Close();
        }

        protected void btntransaction_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select TransectionPassword from tblMemberMaster where UserCode = '" + TextBox1.Text + "'", con);
            con.Open();
            String pass = cmd.ExecuteScalar().ToString();
            con.Close();
            if (pass == txtExistingPassword.Text)
            {
                cmd.CommandText = "Update tblMemberMaster set TransectionPassword = '" + txtConfirmPassword.Text + "' where UserCode = '" + TextBox1.Text + "'";
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Transaction Password Changed Successfully";
                Panelviewinformation.Visible = true;

                Panel1.Visible = false;
            }
            else
            {
                Label1.Text = "Invalid Existing Transaction Password";
                Panelviewinformation.Visible = true;

                Panel1.Visible = false;
            }
        }
    }
}