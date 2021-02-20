using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;

public partial class SMSEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/240578/Default.aspx");
        if (User.IsInRole("Admin") == false && User.IsInRole("SMS & Email") == false)
            Response.Redirect("~/240578/AdminHome.aspx");
    }

    public void Show(String Msg)
    {
        this.Page.Controls.Add(new LiteralControl("<script>alert('" + Msg + "');</script>"));
    }

    protected void SendEmail_Click(object sender, EventArgs e)
    {
        MailMessage n = new MailMessage();
        SmtpClient client = new SmtpClient();
        n.To.Add(EmailTO.Text);
        n.From = new MailAddress(ConfigurationManager.AppSettings["Email"].ToString(),"Diwakar Retails");
        n.Body = EmailBody.Content;
        n.Subject = EmailSubject.Text;
        client.EnableSsl = false;
        n.IsBodyHtml = true;
        foreach (ListItem item in CheckBoxList1.Items)
        {
            if (item.Selected == true)
                n.Attachments.Add(new System.Net.Mail.Attachment(item.Value));
        }
        client.Send(n);
        Show("Mails Sent");
    }

    protected void SendSMS_Click(object sender, EventArgs e)
    {
        Gen obj = new Gen();
        obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), Mobiles.Text, Message.Text);
        //if (RadioButtonList2.SelectedValue == "Normal")
        //    obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(),Mobiles.Text,Message.Text);
        //else
        //    obj.SendFlashSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), Mobiles.Text, Message.Text);
        Show("SMS Sent");
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (Mobiles.Text.Length>0)
            Mobiles.Text = "";

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT     MobileNo FROM         tblMemberMaster WHERE     (UserType like '%" + RadioButtonList1.SelectedValue + "%')", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Mobiles.Text += Mobiles.Text.Trim() == "" ? dr[0].ToString() : "," + dr[0].ToString();
            }
            dr.Close();
            con.Close();
      
        
    }

    protected void Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        EmailTO.Text = "";
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
        SqlCommand cmd = new SqlCommand("SELECT     Email FROM         tblMemberMaster WHERE     (UserType like '%" + Type.SelectedValue + "%')", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            EmailTO.Text += EmailTO.Text.Trim() == "" ? dr[0].ToString() : "," + dr[0].ToString();
        }
        dr.Close();
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                FileUpload1.SaveAs(Server.MapPath("~/upload/" + FileUpload1.FileName));
                CheckBoxList1.Items.Add(new ListItem(FileUpload1.FileName.ToString(), Server.MapPath("~/upload/" + FileUpload1.FileName)));
            }
            catch (Exception ex)
            {
                Show(ex.Message);
            }
        }
    }

    

   

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
    //    SqlCommand cmd = new SqlCommand("select Pass from AdminLogin where UserID = 'admin'", con);
    //    con.Open();
    //    object o = cmd.ExecuteScalar();
    //    con.Close();
    //    string pass = Convert.ToString(o);
    //    if (pass == TextBox1.Text)
    //    {
    //        cmd.CommandText = "Update AdminLogin set Pass = '" + TextBox2.Text + "' where UserID = 'admin'";
    //        con.Open();
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        Show("Login Password Changed Successfully");
    //    }
    //    else
    //    {
    //        Show("Invalid Existing Login Password");
    //    }
    //}

}