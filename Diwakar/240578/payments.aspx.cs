using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using WGRL._03032003;
using System.Net.Mail;

namespace Amazewellness._240578
{
    public partial class payments : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtmemberid.Text = Request.QueryString["Ucode"];
                txtdate.Text = Request.QueryString["dt"];
                txtAmount.Text = Request.QueryString["amt"];
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Insert into accountmaster values(6,@MemberID,Dateadd(hh,10,@Date),@particular,0,@Amount,0,0)", con);
            cmd.Parameters.AddWithValue("@MemberID", txtmemberid.Text);
            cmd.Parameters.AddWithValue("@Date", txtdate.Text);
            cmd.Parameters.AddWithValue("@particular", txtparticulars.Text);
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblmsg.Text = "Your payments has successfully done !";

            //SqlCommand cmds = new SqlCommand("select mobileno,username from tblmembermaster where usercode=@usercode", con);
            //cmds.Parameters.AddWithValue("@usercode", txtmemberid.Text);
            //HiddenField1.Value = "username";
            //con.Open();
            //string mobile = cmds.ExecuteScalar().ToString();
            //con.Close();
            cmd = new SqlCommand("Select * From tblmembermaster where Usercode = @usercode", con);
            cmd.Parameters.AddWithValue("usercode",txtmemberid.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    HiddenField1.Value = dr["UserName"].ToString();
                    HiddenField2.Value = dr["MobileNo"].ToString();
                    HiddenField3.Value = dr["UserCode"].ToString();
                
                }

                dr.Close();
            }
            con.Close();

            //Gen obj = new Gen();
            //System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
            //System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();

            //if (!string.IsNullOrEmpty(mobile) && mobile.Trim().Length > 9)
            //{
            //    try
            //    {
            //        obj.SendNormalSMS(System.Configuration.ConfigurationManager.AppSettings["SMSSenderID"], mobile, lblmsg.Text);
            //    }
            //    catch
            //    { }
            //}

            Gen obj = new Gen();
            string msg = "Dear " + HiddenField1.Value + " (" + HiddenField3.Value + "-"+ HiddenField2.Value + "), your payout of Rs "+ txtAmount.Text + " has been generated. Regards, Diwakar Retail Ltd.";

            if (!string.IsNullOrEmpty(HiddenField2.Value) && HiddenField2.Value.Trim().Length > 9)
            {
                try
                {
                    obj.SendNormalSMS(System.Configuration.ConfigurationManager.AppSettings["SMSSenderID"], HiddenField2.Value, msg);
                }
                catch(Exception ex)
                { }
            }

            txtmemberid.Text = "";
            txtdate.Text = "";
            txtparticulars.Text = "";
            txtAmount.Text = "";

        }

       
    }
}