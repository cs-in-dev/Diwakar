using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataAccessLayer;
using System.Configuration;
using System.Net.Mail;


namespace Amazewellness
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        sms S1 = new sms();
        string status;
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {
           SqlCommand cmd = new SqlCommand("select UserCode,LoginPassword,address,Email,MobileNo from tblMemberMaster where UserCode =@usercode or Loginname = @usercode", con);
            cmd.Parameters.AddWithValue("@usercode", TextBox1.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (!dr.HasRows)
                msgbox("Invalid Userid");
            while (dr.Read())
            {
                if (dr["Email"].ToString() != "")
                {
                    System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
                    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                    string Msg = "Your Login Password for Memeber ID : " + dr["UserCode"].ToString() + " <br>" + "<span style='font-size:large'><p> " + dr["LoginPassword"].ToString() + "</span></p>";
                    n.To.Add(dr["Email"].ToString());
                    n.From = new MailAddress("admin@myamgf.com");
                    n.Body = Msg;
                    n.IsBodyHtml = true;
                    client.EnableSsl=false;
                    n.Subject = "Your Login Password";
                    client.Send(n);
                  msgbox("Login Password Sent on Your Email,Kindly Check Your Email");
                    return;
                }
                String Msgs = "";
                if (dr["MobileNo"].ToString() != "")
                {
                    Msgs = "Your Login Password for Memeber ID : " + dr["UserCode"].ToString() + " <br>" + "<span style='font-size:large'><p> " + dr["LoginPassword"].ToString() + "</span></p>";
                    status = S1.SendNormalSMS(dr["MobileNo"].ToString(), Msgs);
                    msgbox("Login Password Sent on Your Mobile,Kindly Check Your Mobile.");
                }
                TextBox1.Text = "";
            }
            dr.Close();
            dr.Dispose();
            con.Close();

        }
        protected void msgbox(string msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + msg + "');</script>"));
        }
    }
}