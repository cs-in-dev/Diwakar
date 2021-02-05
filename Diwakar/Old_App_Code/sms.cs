using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;

/// <summary>
/// Summary description for sms
/// </summary>

public class sms
{
    public sms()
    {
        // TODO: Add constructor logic here
    }
    public String sendsms(string No, string Msg)
    {
        String status;
        try
        {
            String req;
            req = "http://sms.esolutionscurry.com/WebServiceSMS.aspx?User=mlm&passwd=escmlm&mobilenumber=" + No + "&message=" + Msg + "&sid=" + ConfigurationManager.AppSettings["SMSSenderID"].ToString() + "&mtype=N";
        
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(req);
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();
            status = responseString;
        }
        catch (Exception)
        {
            status = "Not send";
        }
        return status;
    }
    public String SendNormalSMS(String Recepient, String Message)
    {
        HttpWebRequest request;
        HttpWebResponse response = null;
        String url;
        string host;
        String username;
        String password, SenderID = "";
        Message = Message.Replace("\\", "\\\\");
        host = "http://sms.emlm.in/login.php";
        username = "anmolratan";
        password = "anmol123";
        SenderID = "ANMOLR";
        url = "http://46.4.24.210/api/sendmsg.php?user=" + HttpUtility.UrlEncode(username) + "&pass=" + HttpUtility.UrlEncode(password) + "&sender=" + HttpUtility.UrlEncode(SenderID) + "&phone=" + HttpUtility.UrlEncode(Recepient) + "&text=" + HttpUtility.UrlEncode(Message) + "&priority=ndnd&stype=normal";

        request = (HttpWebRequest)WebRequest.Create(url);
        response = (HttpWebResponse)request.GetResponse();
        return (response.StatusDescription);


    }
}
