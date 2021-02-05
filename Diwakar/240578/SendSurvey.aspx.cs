using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace NationalSurvey.Admin
{
    public partial class SendSurvey : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Getgridview()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT tblMemberMaster.UserCode, tblMemberMaster.UserName, tblMemberMaster.DOJ, tblMemberMaster.Email FROM tblMemberMaster where ValidUpto>=GETDATE() AND MyInvestment = " + DropDownList2.SelectedValue + ";", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            con.Close();  
        }

        protected void btnselect_Click(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[index].FindControl("chk");
                chk.Checked = true;
            }
            
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            try
            {
                String CmdText = "";
                String EmailList = "";
                String Message = "";
                foreach (GridViewRow item in GridView1.Rows)
                {
                    CheckBox c = (CheckBox)item.FindControl("chk");
                    if (c.Checked)
                    {
                        CmdText = CmdText == "" ? "INSERT INTO dbo.tblSurveyDate (SurveyID, UserId, ReceiveDate) VALUES(" + DropDownList1.SelectedValue + ",'" + item.Cells[2].Text.ToString() + "',getdate());" : CmdText + "INSERT INTO dbo.tblSurveyDate (SurveyID, UserId, ReceiveDate) VALUES(" + DropDownList1.SelectedValue + ",'" + item.Cells[2].Text.ToString() + "',getdate());";
                        EmailList = EmailList == "" ? item.Cells[5].Text.ToString() : EmailList + ", " + item.Cells[5].Text.ToString();
                    }
                }
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd = new SqlCommand(CmdText, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();  
                Message = "Dear Member, <br/><br/> We are very excited to have you EARN Rewards just by devoting little time on Task: " + DropDownList1.SelectedItem.Text + ".<br/><br/> Please use below given link to login to your member area and start earning your rewards. <br/><a href='http://FreeTimePlus.net/'>Login to Member Area</a><br/><br/>You received this email as a member of Free Time Plus. Add support@FreeTimePlus.net to your address book so you won't miss a single task invitation. Please do not reply to this e-mail; we're unable to read e-mails sent as replies.";
                System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                n.To.Add(ConfigurationManager.AppSettings["Email"].ToString());
                n.Bcc.Add(EmailList);
                n.From = new MailAddress(ConfigurationManager.AppSettings["Email"].ToString());
                n.Body = Message;
                n.IsBodyHtml = true;
                n.Subject = "Task Opportunity From " + ConfigurationManager.AppSettings["CoName"].ToString();
                client.EnableSsl = false;
                client.Send(n);
                lblSuccess.Text = "Tasks Sent!";
            }
            catch(Exception ex)
            {
                lblSuccess.Text = ex.Message.ToString();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getgridview();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getgridview();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            for (int index = 0; index < GridView1.Rows.Count; index++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[index].FindControl("chk");
                chk.Checked = !chk.Checked;

            }
            
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
            DropDownList1.DataBind();
            Getgridview();
            
        }

      
    }
}