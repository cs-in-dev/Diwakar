using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Drawing;

namespace RealSecureLife
{
    public partial class JoinNow : System.Web.UI.Page
    {
        String Mid;
        BALPin objBALPin = new BALPin();
        BOPin objPin = new BOPin();
        sms S1 = new sms();
        BALTreeMaster objBALTreeMaster = new BALTreeMaster();
        BOTreeMaster objTreeMaster = new BOTreeMaster();

        BOMemberMaster objMemberMaster = new BOMemberMaster();
        BALMemberMaster objBALMemberMaster = new BALMemberMaster();
        Double PinAmount;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnLogIn.Visible = true;
            if (!IsPostBack)
            {

                
                if (Session["ReferralID"] != null)
                {
                    txtSponserID.Text = Session["ReferralID"].ToString();
                }
                else
                {
                    txtSponserID.Text = "";
                }
                if (Session["ReferralName"] != null)
                {
                    txtsponsoraddress.Text = Session["ReferralName"].ToString();
                    btnCheck.Visible = false;
                    ddlConnectingSide.Enabled = true;
                }
                else
                {
                    txtsponsoraddress.Text = "";
                    btnCheck.Visible = true;
                    ddlConnectingSide.Enabled = false;
                }

                //ddlConnectingSide.Enabled = false;
                for (int i = 1940; i <= (DateTime.Now.Year - 18); i++)
                {
                    DOB_YYYY.Items.Add(i.ToString());
                }
              //  PinPannel.Visible = true;
               // SponsorPanel.Visible = true;
                InformationPanel.Visible = true;
               // txtYourPin.Focus();

                //if (Request.QueryString["pin"] != null)
                //{
                //    txtYourPin.Text = Request.QueryString["pin"].ToString();
                //    objPin.PinCode = txtYourPin.Text;
                //    objPin = objBALPin.checkPinAvalability(objPin);
                //    string message = objPin.Message;
                //    PinVarificationMessage.Text = message;
                //    if (message == "Pin is Valid. Please Enter Sponsor ID")
                //    {
                //        //  SponsorPanel.Enabled = true;
                //        // SponsorPanel.Visible = true;
                //        //  txtYourPin.Enabled = false;
                //        //   btnCheckSponsorPin.Enabled = false;
                //        //PinPannel.Visible = true;
                //        //if (Request.QueryString["sid"] != null)
                //        //{
                //        //    txtSponserID.Text = Request.QueryString["sid"].ToString();
                //        //    GetSponsorNameAndAddress(txtSponserID.Text);
                //        //    if (txtsponsoraddress.Text.Length != 0)
                //        //    {
                //        //        //GetSideList(txtSponserID.Text);
                //        //        ddlConnectingSide.Enabled = true;
                //        //        txtSponserID.Enabled = false;
                //        //    }
                //        //    else
                //        //    {
                //        //        ddlConnectingSide.Enabled = false;
                //        //        txtSponserID.Enabled = true;
                //        //    }
                //        //}
                //    }

                //}
            }
        }

        protected void btnCheckSponsorPin_Click(object sender, EventArgs e)
        {
            //objPin.PinCode = txtYourPin.Text;

            //objPin = objBALPin.checkPinAvalability(objPin);

            //string message = objPin.Message;

            //PinVarificationMessage.Text = message;

            //if (message == "Pin is Valid. Please Enter Sponsor ID")
            //{
            //    //double PinAmount = 0;
            //    ////Calulating pin Amount
            //    //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            //    //con.Open();
            //    //SqlCommand cmd = new SqlCommand("select PinAmount from tblPinMaster Where PinCode='" + txtYourPin.Text + "';", con);
            //    //PinAmount = Convert.ToDouble(cmd.ExecuteScalar().ToString());
            //    //con.Close();
            //    //if (PinAmount == 2000)
            //    //{
            //    //    PinVarificationMessage.Text = "Sorry! This pin cannot be used for joining";
            //    //    return;
            //    //}

            //    SponsorPanel.Enabled = true;
            //    SponsorPanel.Visible = true;
            //    txtYourPin.Enabled = false;
            //    btnCheckSponsorPin.Enabled = false;
            //}

        }

        protected void GetSponsorNameAndAddress(String memberid)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("select UserName,Address from tblmembermaster where UserCode='" + memberid + "';", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                txtsponsoraddress.Text = dr["UserName"].ToString();
            con.Close();

        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {
            btnLogIn.Visible = true;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("select isnull(count(*),0) from AccountMaster where MemberID='" + txtSponserID.Text + "' and TxnType=1;", con);
            PinAmount = Convert.ToDouble(cmd.ExecuteScalar().ToString());
            con.Close();
            if (PinAmount <= 0)
            {
                // PinVarificationMessage.Visible = true;
                lblAccountDetail.Text = "Sorry!This SponserID cannot be used for joining";
                lblAccountDetail.ForeColor = System.Drawing.Color.Red;
                txtSponserID.Text = "";
                btnLogIn.Visible = true;
                return;
            }
            else
            {
                btnLogIn.Visible = true;
            }

            GetSponsorNameAndAddress(txtSponserID.Text);
            txtsponsoraddress.Enabled = false;
            if (txtsponsoraddress.Text.Length != 0)
            {
                ddlConnectingSide.Enabled = true;
                txtSponserID.Enabled = false;
                ADDleft(txtSponserID.Text);
                ADDRight(txtSponserID.Text);
            }
            else
            {
                ddlConnectingSide.Enabled = false;
                txtSponserID.Enabled = true;
            }

            //string Message = "Congratulations! Dear " + txtname.Text + ", Thank You for choosing imagine success as your business for bright future.  Growth And success. Your User ID: " + Mid + ", Password:" + txtLoginPass.Text + " And Sponsor ID:" + txtSponserID.Text + " visit us at www.imaginesuccess.in";
            //HttpWebRequest request;
            //HttpWebResponse response = null;
            //String url;
            //string host;
            //Message = Message.Replace("\\", "\\\\");
            //host = "http://esms.esolutionscurry.com/api/sms.php?";
            //string Massage = HttpUtility.UrlEncode(Message);
            //Massage = Massage.Replace("!", "%21");
            //Massage = Massage.Replace(".", "%2E");
           
            //request = (HttpWebRequest)WebRequest.Create(url);
            //response = (HttpWebResponse)request.GetResponse();
            //string status = (response.StatusDescription);
        }
    
        protected void ADDleft(string sponserid)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand comm = new SqlCommand("select ISNULL(LeftChild,0) from tbltreemaster where MemberID='"+sponserid+"' ", conn);
            conn.Open();
            string left = comm.ExecuteScalar().ToString();
            if (left == "0")
            {
               
                //ddlConnectingSide.Items.Add("Left");
            }
        }
        protected void ADDRight(string sponserid)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand comm = new SqlCommand("select ISNULL(RightChild,0) from tbltreemaster where MemberID='" + sponserid + "' ", conn);
            conn.Open();
            string left = comm.ExecuteScalar().ToString();
            if (left == "0")
            {
                //ddlConnectingSide.Items.Add("Right");
            }
        }
        protected void ddlConnectingSide_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlConnectingSide.SelectedValue == "Left")
            {
                JoinSide.Value = "Left";
                ParentID.Value = txtSponserID.Text;
                InformationPanel.Enabled = true;
                InformationPanel.Visible = true;
            }
            else if (ddlConnectingSide.SelectedValue == "Right")
            {
                JoinSide.Value = "Right";
                ParentID.Value = txtSponserID.Text;
                InformationPanel.Enabled = true;
                InformationPanel.Visible = true;
            }
        }
        protected void SendWelcomeletter(String Email, String UserCode)
        {

            string Msg = "Welcome";
            Msg += "<br /><br />Please click the following link for your Welcome Letter";
            Msg += "<br /><a href =  http://amazeindian.in/webform2.aspx?id=" + UserCode + " >Click here.</a>";
            Msg += "<br /><br />Thanks";

            Gen obj = new Gen();
            System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();

            n.To.Add(Email);

            n.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["Email"].ToString());
            n.Body = Msg;
            n.IsBodyHtml = true;
            n.Subject = "Welcome Letter from " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + " ";
            client.EnableSsl = false;
            try
            {
                client.Send(n);
            }
            catch
            {
            }


        }
        protected void AddMember()
        {
            objMemberMaster.PinCode = txtPinCode.Text; 
            objMemberMaster.SponsorID = txtSponserID.Text;
            objMemberMaster.ParentID = ParentID.Value;

            objMemberMaster.OwnerName = txtOwnername.Text;


            objMemberMaster.FatherName = txtfname.Text;
            objMemberMaster.ConnectingSide = JoinSide.Value;
            objMemberMaster.LoginName = txtname.Text;
            objMemberMaster.LoginPassword = txtLoginPass.Text;
            objMemberMaster.TransectionPassword = txtLoginPass.Text;
            objMemberMaster.UserName = txtOwnername.Text;
            //objMemberMaster.BAName = txtBAname.Text;

            DateTime DOB;
            if (DOB_DD.SelectedValue == "DD" || DOB_MM.SelectedValue == "MM" || DOB_YYYY.SelectedValue == "YYYY")
                DOB = new DateTime(1940, 01, 01);
            else
                DOB = new DateTime(int.Parse(DOB_YYYY.Text), int.Parse(DOB_MM.Text), int.Parse(DOB_DD.Text));
            objMemberMaster.DOB = DOB;
            objMemberMaster.Address = txtAddress.Text;
            objMemberMaster.Landmark = txtLandmark.Text;
            objMemberMaster.District = txtDistrict.Text;
            objMemberMaster.city = txtCity.Text;
            objMemberMaster.State = txtState.Text;
            objMemberMaster.Country = txtCountry.Text;
            objMemberMaster.PostalCode = txtPinCode.Text;
            objMemberMaster.MobileNo = txtMobileNo.Text;
            objMemberMaster.TelephoneNo = txtTelephoneNo.Text;
            objMemberMaster.EMailID = txtEmailID.Text;
            objMemberMaster.PanNo = " ";
            objMemberMaster.BankName = " ";
            objMemberMaster.AccountNo = " ";
            objMemberMaster.IFSCCode = " ";
            objMemberMaster.NomineeName = txtNomineeName.Text;
            objMemberMaster.NomineeContact = txtNomineeContact.Text;
            objMemberMaster.NomineeRelation = txtNomineeRelation.Text;
            objMemberMaster.Pin = "0";// txtYourPin.Text;
            objMemberMaster.PinAmount = "0";
            objMemberMaster.Status = "Active";
            objMemberMaster.BankName = BankName.Text;
            objMemberMaster.BranchName = BranchName.Text;

            objMemberMaster.AccountNo = AccountNo.Text;
            objMemberMaster.IFSCCode = IFSCode.Text;
            objMemberMaster.PanNo = PanNo.Text;
            String result = objBALMemberMaster.insertMember(objMemberMaster);

           if (result.ToString()!="0")
           {
                Mid = result;
                PlaceHolder1.Controls.Add(new LiteralControl("<font color=Black><p> Congratulations! You are now an associate on " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + "  <br><br>Your Member ID : " + Mid + " <br><br> Your Password : " + txtLoginPass.Text + "<br><br> Please Login Now : " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "</font></p><a href=\"Default.aspx\">Home Page</a> | <a href=\"Register.aspx\">Register More</a>"));
                string Msg = "";
                Msg = "Congratulation your Member BA Name is: " + Mid + " Password is: " + txtLoginPass.Text + " Please logon to " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "";

                //string Message = "Congrats! Dear "+txtname.Text+", Welcome to Big Dreams, Your User ID: "+Mid+", Password:"+txtLoginPass.Text+" visit us at www.imaginesuccess.in";
                //HttpWebRequest request;
                //HttpWebResponse response = null;
                //String url;
                //string host;
                //Message = Message.Replace("\\", "\\\\");
                //host = "http://esms.esolutionscurry.com/api/sms.php?";
                //string Massage = HttpUtility.UrlEncode(Message);
                //Massage = Massage.Replace("!", "%21");
                //Massage = Massage.Replace(".", "%2E");
                //url = host + "uid=696d6167696e6573756363657373&pin=513f39f18f4a5&sender=BDMKTG&route=5&tempid=6521&mobile="+ txtMobileNo.Text + "&message=" + Massage;
                //request = (HttpWebRequest)WebRequest.Create(url);
                //response = (HttpWebResponse)request.GetResponse();
                //string status = (response.StatusDescription);
               
                
               // String status = S1.sendsms(txtMobileNo.Text, Msg);                
                Gen obj = new Gen();
                obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), txtMobileNo.Text, Msg);
                System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                if (txtEmailID.Text != "")
                {
                    n.To.Add(txtEmailID.Text);
                    //n.Bcc.Add("ads.trso@gmail.com");
                    n.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["Email"].ToString());
                    n.Body = Msg;
                    n.Subject = "Congratulation on Joining " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + " ";
                    client.EnableSsl = false;
                    try
                    {
                        client.Send(n);
                        SendWelcomeletter(txtEmailID.Text, result);
                    }
                    catch { }
                }
              //  Panel1.Enabled = true;
           //     PinPannel.Visible = false;
               
              //  SponsorPanel.Visible = false;
           

                InformationPanel.Visible = false;
               
                Panel1.Enabled = true;
     }
         else

               lblMessage.Text = "Added Failed ...";
        }


        protected string GetParentIdForMyLeftChild(String SponsorId)
        {

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());

            SqlCommand cmd6 = new SqlCommand();
            cmd6.Connection = conn;

            string leftchild = "";
            while (true)
            {
                cmd6.CommandText = "Select LeftChild from tblTreeMaster where Memberid='" + SponsorId + "'";
                conn.Open();
                SqlDataReader dr = cmd6.ExecuteReader();
                leftchild = "";
                while (dr.Read())
                {
                    leftchild = dr["LeftChild"].ToString();
                }

                if (leftchild == "")
                {
                    dr.Close();
                    conn.Close();
                    return SponsorId;
                }
                else
                {
                    SponsorId = leftchild;
                    dr.Close();
                    conn.Close();
                }


            }

        }

        protected string GetParentIdForMyRightChild(String SponsorId)
        {

            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());

            SqlCommand cmd6 = new SqlCommand();
            cmd6.Connection = conn1;
            string rightchild = "";

            while (true)
            {
                cmd6.CommandText = "Select RightChild from tblTreeMaster where Memberid='" + SponsorId + "'";
                conn1.Open();
                SqlDataReader dr1 = cmd6.ExecuteReader();
                rightchild = "";
                while (dr1.Read())
                {
                    rightchild = dr1["RightChild"].ToString();
                }

                if (rightchild == "")
                {
                    dr1.Close();
                    conn1.Close();
                    return SponsorId;
                }
                else
                {
                    SponsorId = rightchild;
                    dr1.Close();
                    conn1.Close();
                }


            }


        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            if (txtcheckbox.Checked == false)
            {
                lblMessage.Text = "You must accept Terms and Conditions";
                return;
            }

           

            GetSponsorNameAndAddress(txtSponserID.Text);
            txtsponsoraddress.Enabled = false;
            if (txtsponsoraddress.Text.Length != 0)
            {

                ddlConnectingSide.Enabled = true;
                txtSponserID.Enabled = false;
                ADDleft(txtSponserID.Text);
                ADDRight(txtSponserID.Text);
                // Panel3.Visible = true;
            }

            //checkLoginName.CommandText = "select isnull(count(*),0) from tblMembermaster where MobileNo = '" + txtMobileNo.Text + "'";
            //x = int.Parse(checkLoginName.ExecuteScalar().ToString());
            //if (x > 7)
            //{
            //    lblMessage.Text = "Sorry! Max 7 registrations are allowed on " + txtMobileNo.Text;
            //    return;
            //}
            //checkLoginName.CommandText = "select isnull(count(*),0) from tblMembermaster where Email = '" + txtEmailID.Text + "'";
            //x = int.Parse(checkLoginName.ExecuteScalar().ToString());
            //if (x > 3)
            //{
            //    lblMessage.Text = "Sorry! Max 3 registrations are allowed on " + txtEmailID.Text;
            //    return;
            //}
            //lblMessage.Text = "";
            AddMember();
         
          //  MainContent_Panel1.Visible = true;
        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
            if (txtname.Text.Contains(" ") == true)
            {
                txtname.Text = "";
                lblchsusrnm.Text = "Sorry! Choose BA Name without Space";
                
                lblchsusrnm.ForeColor = Color.Red;
                lblchsusrnm.Font.Bold = true;
                return;
            }
            int x;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("select count(*) from tblmembermaster where UserName='" + txtname.Text + "'", con);
            con.Open();
            x = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (x != 0)
            {
                lblchsusrnm.Text = "Sorry! BA Name Already Exist.";
                lblchsusrnm.ForeColor = Color.Red;
                lblchsusrnm.Font.Bold = true;
                txtname.Text = "";
                return;
            }
            else
            {
                lblchsusrnm.Text = "Congrats! BA Name is available";
                lblchsusrnm.ForeColor = Color.Green;
                lblchsusrnm.Font.Bold = true;
            }
            btnLogIn.Visible = true;
        }
    }
}