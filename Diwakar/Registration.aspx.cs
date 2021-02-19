using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace GyanTechnologies._240578
{
    public partial class Registration : System.Web.UI.Page
    {
        public class Register1
        {
            public string EnterPin { get; set; }
            public string sponserid { get; set; }
            public string sponsername { get; set; }
            public string ParentID { get; set; }
            public string ParentName { get; set; }
            public string Position { get; set; }
            public string UserId { get; set; }
            public string LoginPassword { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string FatherHusband { get; set; }
            public string DateofBirth { get; set; }
            public string Address { get; set; }
            public string State { get; set; }
            public string city { get; set; }
            public string Country { get; set; }
            public string District { get; set; }
            public string PinCode { get; set; }
            public string MobileNo { get; set; }
            public string EmailID { get; set; }
            public string BankName { get; set; }
            public string AccountNo { get; set; }
            public string IFSCode { get; set; }
            public string PANNo { get; set; }
            public string NomineeFirst { get; set; }
            public string NomineeLastName { get; set; }
            public string Relation { get; set; }
            public string NomineeFatherHusband { get; set; }
            public string NomineeAddress { get; set; }
            public string Amount { get; set; }
            public string ChequeNo { get; set; }
            public string ChequeDate { get; set; }
            public string BankName1 { get; set; }
            public string ReferenceNumber { get; set; }
            public string IMPSDate { get; set; }
            public string IMPSAmount { get; set; }
            public string Mode { get; set; }
            public string DateofPayment { get; set; }
            public string AadharCard { get; set; }


        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["Pid"] != null)
            {
                string ParentID = "";
                string sponserid = "";

                ParentID = Request.QueryString["Pid"].ToString();
                sponserid = Request.QueryString["Pid"].ToString();
                txtsponserid.Text = " " + sponserid;
                txtsponserid.Text = null;
             
                txtsponserid.Text = sponserid;
                //Position.SelectedValue = Request.QueryString["Side"];
                

            }
        }

       
        [WebMethod]
        public static string insertrecord(Register1 Register)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

                string fullname = Register.FirstName + " " + Register.LastName;
                string NomineeName = Register.NomineeFirst + " " + Register.NomineeLastName;

                SqlCommand cmd = new SqlCommand("dbo.SP_InsertMember", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@PinCode", Register.EnterPin);
                //cmd.Parameters.AddWithValue("@Pin", Register.EnterPin); ;
                cmd.Parameters.AddWithValue("@SponsorID", Register.sponserid);
                cmd.Parameters.AddWithValue("@ParentID", Register.sponserid);
                //cmd.Parameters.AddWithValue("@ConnectingSide", Register.Position);
                cmd.Parameters.AddWithValue("@LoginPassword", Register.LoginPassword);
                cmd.Parameters.AddWithValue("@TransectionPassword", Register.LoginPassword);
                cmd.Parameters.AddWithValue("@LoginName", "NA");
                cmd.Parameters.AddWithValue("@UserName", fullname);
                cmd.Parameters.AddWithValue("@Status", Register.FatherHusband);
                cmd.Parameters.AddWithValue("@DOB", Register.DateofBirth);
                cmd.Parameters.AddWithValue("@Address", Register.Address);
                cmd.Parameters.AddWithValue("@State", Register.State);
                cmd.Parameters.AddWithValue("@City", Register.city);
                cmd.Parameters.AddWithValue("@Country", Register.Country);
                cmd.Parameters.AddWithValue("@District", Register.District);
                cmd.Parameters.AddWithValue("@PostalCode", Register.PinCode);
                cmd.Parameters.AddWithValue("@MobileNo", Register.MobileNo);
                cmd.Parameters.AddWithValue("@TelephoneNo", "");
                cmd.Parameters.AddWithValue("@EMail", Register.EmailID);
                cmd.Parameters.AddWithValue("@BankName", Register.BankName);
                cmd.Parameters.AddWithValue("@AccountNo", Register.AccountNo);
                cmd.Parameters.AddWithValue("@IFSCCode", Register.IFSCode);
                cmd.Parameters.AddWithValue("@NomineeName", "");
                cmd.Parameters.AddWithValue("@NomineeRelation", "");
                cmd.Parameters.AddWithValue("@NomineeFatherName", "");
                cmd.Parameters.AddWithValue("@NomineeContact", "");
                cmd.Parameters.AddWithValue("@PanNo", Register.PANNo);
                cmd.Parameters.AddWithValue("@AadharCard", Register.AadharCard);
                //cmd.Parameters.AddWithValue("@PinAmount", pinamonut);

                con.Open();
                string result = cmd.ExecuteScalar().ToString();

                con.Close();

               
                //Gen obj = new Gen();

                //string Msg = "Dear " + fullname + ", Congratulation! Your MemberId is: " + result + " Password is: " + Register.LoginPassword + " Please logon to " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "";

                //if (!string.IsNullOrEmpty(Register.MobileNo) && Register.MobileNo.Trim().Length > 9)
                //{
                //    try
                //    {
                //        obj.SendNormalSMS(System.Configuration.ConfigurationManager.AppSettings["SMSSenderID"], Register.MobileNo.Trim(), Msg);
                //    }
                //    catch
                //    { }
                //}


                if (result.Length > 2)
                {
                    Register.MobileNo = "";
                    Register.PANNo = "";
                    Register.AadharCard = "";
                    string Msg = "";
                    string url = "https://retail.diwakarretail.com/";
                    Msg = "Dear " + fullname + " <br><br> Congratulations! You are now an associate on " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + " <br><br> Your User Id is: " + result + "<br> Password is: " + Register.LoginPassword + "<br><br> Please logon to " + url + "";

                    Gen obj = new Gen();
                    System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
                    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                    if (Register.EmailID != "")
                    {
                        n.To.Add(Register.EmailID);
                        n.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["Email"].ToString());
                        n.Body = Msg;
                        n.Subject = "Congratulations on Joining " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + " ";
                        n.IsBodyHtml = true;
                        client.EnableSsl = false;
                        try
                        {
                            client.Send(n);
                        }
                        catch { }
                    }
                }

                return result;
            }

            catch (Exception ex)
            {
                return "error";
            }
        }

        [WebMethod()]
        public static string checkpin(string EnterPin)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select isnull(count(*),0) from tblpinmaster where status=0 and pincode=@EnterPin", con);
            cmd.Parameters.AddWithValue("@EnterPin", EnterPin);
            con.Open();
            int i = int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            if (i > 0)
            {
                return "Success";
            }
            else
            {
                return "error";
            }

        }
        //public static bool IsPhoneNumber(string number)
        //{
        //    Regax Is


        //}
        [WebMethod()]
        public static string CheckMobile(string MobileNo)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmdd = new SqlCommand("select isnull(count(*),0) from tblmembermaster where MobileNo=@MobileNo", con);
            cmdd.Parameters.AddWithValue("@MobileNo", MobileNo);
            con.Open();
            int i = int.Parse(cmdd.ExecuteScalar().ToString());
            con.Close();
            if (i >=1|| MobileNo.Length<10)
            {
                return "error";
            }
            else
            {
                return "Success";
            }

        }

        [WebMethod()]
        public static string CheckPANNo(string PANNo)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmdd = new SqlCommand("select isnull(count(*),0) from tblmembermaster where PanNo=@PanNo", con);
            cmdd.Parameters.AddWithValue("@PanNo", PANNo);
            con.Open();
            int i = int.Parse(cmdd.ExecuteScalar().ToString());
            con.Close();
            if (i >= 1)

            {
                return "error";
            }
            else
            {
                return "Success";
            }
        }

        [WebMethod()]
        public static string AadharNumberCheck(string AadharCard)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmdd = new SqlCommand("select isnull(count(*),0) from tblmembermaster where AadharCard=@AadharCard", con);
            cmdd.Parameters.AddWithValue("@AadharCard", AadharCard);
            con.Open();
            int i = int.Parse(cmdd.ExecuteScalar().ToString());
            con.Close();
            if (i >= 1)

            {
                return "error";
            }
            else
            {
                return "Success";
            }
        }

        [WebMethod()]
        public static string CheckEmailCount(string EmailId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmdd = new SqlCommand("select isnull(count(*),0) from tblmembermaster where Email=@Email", con);
            cmdd.Parameters.AddWithValue("@Email", EmailId);
            con.Open();
            int i = int.Parse(cmdd.ExecuteScalar().ToString());
            con.Close();
            if (i >= 1)

            {
                return "error";
            }
            else
            {
                return "Success";
            }
        }


        [WebMethod()]
        public static string checkUserId(string UserId)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select isnull(count(usercode), 0)from tblmembermaster where UserCode=@UserCode", con);
            cmd.Parameters.AddWithValue("@UserCode", UserId);
            con.Open();
            int i = int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            if (i > 0)
            {

                return "error";
            }
            else
            {
                return "Success";
            }

        }


        [WebMethod()]
        public static string checktxtsponserid(string sponserid)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            string result = "";
            SqlCommand cmd1 = new SqlCommand("select isnull(count(*),0) from tblmembermaster where usercode=@usercode", con);
            cmd1.Parameters.AddWithValue("@usercode", sponserid);
            con.Open();
            int a = int.Parse(cmd1.ExecuteScalar().ToString());
            con.Close();
            if (a == 1)
            {
                SqlCommand cmd = new SqlCommand("select username from tblmembermaster where usercode=@usercode1", con);
                cmd.Parameters.AddWithValue("@usercode1", sponserid);
                con.Open();
                result = cmd.ExecuteScalar().ToString();
                con.Close();

            }
            else
            {
                result = "Invaild Sponsorid";
            }

            SqlCommand cmdd = new SqlCommand("select isnull(count(*),0) from tblmembermaster where sponsorId=@sp_id", con);
            cmdd.Parameters.AddWithValue("@sp_id", sponserid);
            con.Open();
            int i = int.Parse(cmdd.ExecuteScalar().ToString());
            con.Close();
            if (i >= 4)

            {
                return "error";
            }
            else
            {
                return result;
            }

            return result;
        }


        [WebMethod()]
        public static string checktxtParentID(string ParentID)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            string result = "";
            SqlCommand cmd1 = new SqlCommand("select isnull(count(*),0) from tblmembermaster where usercode=@usercode", con);
            cmd1.Parameters.AddWithValue("@usercode", ParentID);
            con.Open();
            int a = int.Parse(cmd1.ExecuteScalar().ToString());
            con.Close();
            if (a == 1)
            {
                SqlCommand cmd = new SqlCommand("select username from tblmembermaster where usercode=@usercode1", con);
                cmd.Parameters.AddWithValue("@usercode1", ParentID);
                con.Open();
                result = cmd.ExecuteScalar().ToString();
                con.Close();
            }
            else
            {
                result = "Invaild ParentID";
            }

            return result;
        }

       
        protected void txtMobileNo_TextChanged(object sender, EventArgs e)
        {

            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

            //SqlCommand cmd1 = new SqlCommand("SELECT isnull(count(*),0) FROM tblmembermaster where MobileNo=@mobile", conn);
            //cmd1.Parameters.AddWithValue("@mobile", txtMobileNo.Text);
            //conn.Open();
            //int a = int.Parse(cmd1.ExecuteScalar().ToString());
            //conn.Close();
            //if (a > 3)

            //{
            //    MsgBox("This MobileNo is Already Used Three Times..Please Try Again with Diffrent MobileNo ");

            //}
            //else

        }

        protected void redirecttologin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}