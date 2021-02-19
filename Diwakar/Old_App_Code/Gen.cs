using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Web;
using System.Net;
class Gen
{
    public String SendNormalSMS(String SenderID, String Recepient, String Message)
    {
        HttpWebRequest request;
        HttpWebResponse response = null;
        String url;
        String username;
        String password;
        Message = Message.Replace("\\", "\\\\");
        //username = "Cyrashop";
        //password = "cyra123";
        username = "";
        password = "";
        SenderID = "";

        // http://tsms.emlm.in/websms/sendsms.aspx?userid
        url = "http://103.231.100.41/websms/sendsms.aspx?userid=" + HttpUtility.UrlEncode(username) + "&password=" + HttpUtility.UrlEncode(password) + "&sender=" + HttpUtility.UrlEncode(SenderID) + "&mobileno=" + HttpUtility.UrlEncode(Recepient) + "&msg=" + (Message);
        //url = "http://sms.emlm.in/api/sendmsg.php?user=" + HttpUtility.UrlEncode(username) + "&pass=" + HttpUtility.UrlEncode(password) + "&sender=" + HttpUtility.UrlEncode(SenderID) + "&phone=" + HttpUtility.UrlEncode(Recepient) + "&text=" + (Message) + "&priority=ndnd&stype=normal";
        request = (HttpWebRequest)WebRequest.Create(url);
        response = (HttpWebResponse)request.GetResponse();
        return (response.StatusDescription);
        
    }
    public String SendFlashSMS(String SenderID, String Recepient, String Message)
    {
        HttpWebRequest request;
        HttpWebResponse response = null;
        String url;
        String username;
        String password;
        string host;
        Message = Message.Replace("\\", "\\\\");
        host = "http://sms.esolutionscurry.com";
        //username = "srASDSADSAl";
        //password = "heSDASDAllo";
        username = "";
        password = "";
        SenderID = "";
        url = host + "/WebServiceSMS.aspx?User=" + HttpUtility.UrlEncode(username) + "&passwd=" + HttpUtility.UrlEncode(password) + "&mobilenumber=" + HttpUtility.UrlEncode(Recepient) + "&message=" + HttpUtility.UrlEncode(Message) + "&sid=" + HttpUtility.UrlEncode(SenderID) + "&mtype=F&DR=Y";

        request = (HttpWebRequest)WebRequest.Create(url);
        response = (HttpWebResponse)request.GetResponse();
        return (response.StatusDescription);

    }
    public void SendEmail(String Recepient, String Msg, String Subject, String From)
    {

        System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage(Recepient, From);
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        m.To.Add(Recepient);
        m.From = new MailAddress(From);
        m.Body = Msg;
        m.Subject = Subject;
        m.IsBodyHtml = true;
        client.EnableSsl = false;
        client.Send(m);

        //System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage("anoreply@diwakarretail.com", Recepient);
        //System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        //m.To.Add(Recepient);
        //m.From = new MailAddress("noreply@diwakarretail.com", "Hash99 Alerts");
        //m.Body = Msg;
        //m.Subject = Subject;
        //m.IsBodyHtml = true;
        //client.EnableSsl = false;
        //client.Host = "49.50.95.38";
        //client.Port = 25;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client.UseDefaultCredentials = false;
        //client.Credentials = new NetworkCredential("noreply@diwakarretail.com", "NREtZFsNiM3X");
        //try
        //{
        //    client.Send(m);

        //}
        //catch (Exception ex)
        //{

        //}
    }
}
