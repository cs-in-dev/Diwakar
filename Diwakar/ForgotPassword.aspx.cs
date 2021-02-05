using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using DataAccessLayer;

namespace CyraShop
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
       
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string UserCode = null;
        string Email = null;
        string Password = null;
        string Mobile = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                Page.Controls.Add(new LiteralControl("<script> alert('Please enter your username');</script>"));
            }

            //SqlCommand cmd = new SqlCommand("select Username , loginpassword, email,MobileNo from tblmembermaster where loginname=@username", con);
            //cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            //con.Open();
            //SqlDataReader dr = cmd.ExecuteReader();
            //if (!dr.HasRows)
            //{
            //    Page.Controls.Add(new LiteralControl("<script> alert('Invalid username');</script>"));
            //}
            //while (dr.Read())
            //{
            //    username = dr["username"].ToString();
            //    //usercode = dr["Usercode"].ToString();
            //    email = dr["Email"].ToString();
            //    password = dr["LoginPassword"].ToString();
            //    Gen obj1 = new Gen();
            //    //msg = "Your Login Credentials are:  <br><br>Login ID :" + usercode + " , <br>Password : " + password + "<br><br>Thanks,<br>with regards!<br><br>Hash99.";

            //    //msg = "<div style=\"background:#feef54;width:100%;padding:50px 0px;\"><div style=\"width:600px;background:white;margin:0px auto;\"><div style=\"text-align:center;padding-top:30px;\"><img src=\"http://www.hash99.com/wp-content/images/logo-mail.png\"></div><div style=\"padding:20px;padding: 40px;font-size: 17px;line-height: 22px;\">Dear " + username+"<br>Your Password is: "+ password+ "<hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>This is an automated email - Please do not reply.<br>This mailbox is not monitored and you will not receive a response.<br>To contact us, login to your PO account and send us a message via Support.<hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>Kindly note that our only official website is <a href=\"http://www.hash99.com\" target=\"_blank\">http://www.hash99.com</a><hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>Team Hash99</div></div></div>";


            //    string Msg = "<div style=\"background:#feef54;width:100%;padding:50px 0px;\"><div style=\"width:600px;background:white;margin:0px auto;\"><div style=\"text-align:center;padding-top:30px;\"><img src=\"http://diwakarretails.com/img/logo.png\"></div><div style=\"padding:20px;padding: 40px;font-size: 17px;line-height: 22px;\">Dear <strong>" + username + "</strong>,<hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>Your Password is : <strong>" + password + "</strong><hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>Please use your username and password to login inDiwakar Retail Ltd.Account.<br>Feel free to contact our Customer Support to get resolution of any issues related to diwakarretails<hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>Kindly note that our only official website is <a href=\"http://www.cyrashop.com\" target=\"_blank\">http://www.diwakarretail.com</a><hr style=\"border-bottom: 1px solid #f7931a;border-top: 0px;\"/>Team diwakarretails</div></div></div>";

            //    obj1.SendEmail(email, Msg, "Your Login Details", "admin@diwakarretails.com");


            //    msgbox("Password has been sent to your registered Email ID");
            //    //Label1.ForeColor = System.Drawing.Color.Green;
            //    TextBox1.Text = "";

            //}
            //String Msgs = "";
            //if (dr["MobileNo"].ToString() != "")
            //{
            //    Msgs = "Your Login Password for Memeber ID : " + dr["UserCode"].ToString() + " <br>" + "<span style='font-size:large'><p> " + dr["LoginPassword"].ToString() + "</span></p>";
            //    status = S1.SendNormalSMS(dr["MobileNo"].ToString(), Msgs);
            //    msgbox("Login Password Sent on Your Mobile,Kindly Check Your Mobile.");
            //}
            //TextBox1.Text = "";

            //con.Close();

            SqlCommand cmd = new SqlCommand("select LoginName,UserName,LoginPassword,MobileNo,EMail,TransectionPassword from tblMemberMaster where LoginName = @UserCode", con);
            cmd.Parameters.AddWithValue("@UserCode", TextBox1.Text);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            if (!dr.HasRows)
            {
               
                msgbox("Invalid UserCode");


            }
            string Msg = "";
            string Msg1 = "";
            while (dr.Read())
            {
                UserCode = dr["LoginName"].ToString();
                Email = dr["Email"].ToString();
                Password = dr["LoginPassword"].ToString();
                Mobile = dr["MobileNo"].ToString();
                //if (Email == "")
                //{

                    Msg1 = "You Login Credentials are:Login ID :" + UserCode + " , Password : " + Password + ",Thanks,with regards!Diwakar Retail Ltd.";
                   
                    Gen obj = new Gen();
                    obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), Mobile, Msg1);
                    msgbox("SMS Sent");
            //}
            //    else
            //    {
            //    Gen obj1 = new Gen();
            //    Msg = "You Login Credentials are:Login ID :" + UserCode + " , Password : " + Password + "Thanks,with regards!cyrashop.";
            //    // Msg1 = "You Login Credentials are:Login ID :" + UserCode + " , Password : " + Password + "Thanks,with regards!cyrashop.";
            //    //obj1.SendEmail(Email, Msg, "Your Login Deatils");
            //    //obj1.SendEmail(Email, Msg, "Your Login Details", "admin@diwakarretails.com");
            //    obj1.SendEmail(Email, Msg, "Your login Password", "admin@diwakarretails.com");
            //        obj1.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), Mobile, Msg1);
            //        msgbox("Login informations has been sent to your email address.");
            //}










            return;



            }
            con.Close();
        }
    
        protected void msgbox(string msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + msg + "');</script>"));
        }
    }
}