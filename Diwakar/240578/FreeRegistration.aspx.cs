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
    public partial class FreeRegistration : System.Web.UI.Page
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
            
            //txtSponserID.Text = "";
            //txtLoginPass.Text = "";
            //PinVarificationMessage.Visible = false;
            if (!IsPostBack)
            {
                if (Session["ReferralID"] != null)
                {
                    txtSponserID.Text = Session["ReferralID"].ToString();
                    txtSponserID.Enabled = false;
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

                ddlConnectingSide.Enabled = false;
                for (int i = 1940; i <= (DateTime.Now.Year); i++)
                {
                    DOB_YYYY.Items.Add(i.ToString());
                }
                //PinPannel.Visible = true;
                SponsorPanel.Visible = true;
                InformationPanel.Visible = false;
                txtParentId.Enabled = false;
                //txtYourPin.Focus();

                //if (Request.QueryString["pin"] != null)
                //{
                //    txtYourPin.Text = Request.QueryString["pin"].ToString();
                //    objPin.PinCode = txtYourPin.Text;
                //    objPin = objBALPin.checkPinAvalability(objPin);
                //    string message = objPin.Message;
                //    PinVarificationMessage.Text = message;
                //    if (message == "Pin is Valid. Please Enter Sponsor ID")
                //    {
                //        InformationPanel.Visible = false;
                //        SponsorPanel.Enabled = true;
                //        SponsorPanel.Visible = true;
                //        txtYourPin.Enabled = false;
                //        btnCheckSponsorPin.Enabled = false;
                //        PinPannel.Visible = true;

                //        if (Request.QueryString["sid"] != null)
                //        {
                //            txtSponserID.Text = Request.QueryString["sid"].ToString();
                //            GetSponsorNameAndAddress(txtSponserID.Text);
                //            if (txtsponsoraddress.Text.Length != 0)
                //            {                                
                //                ddlConnectingSide.Enabled = true;
                //                txtSponserID.Enabled = false;
                //            }
                //            else
                //            {
                //                ddlConnectingSide.Enabled = false;
                //                txtSponserID.Enabled = true;
                //            }
                //        }


                //    }
                //}


                       
                    }

                }


        //protected void btnCheckSponsorPin_Click(object sender, EventArgs e)
        //{
        //    objPin.PinCode = txtYourPin.Text;

        //    objPin = objBALPin.checkPinAvalability(objPin);

        //    string message = objPin.Message;

        //    PinVarificationMessage.Text = message;

        //    if (message == "Pin is Valid. Please Enter Sponsor ID")
        //    {
        //        //double PinAmount = 0;
        //        ////Calulating pin Amount


        //        SponsorPanel.Enabled = true;
        //        SponsorPanel.Visible = true;
        //        txtYourPin.Enabled = false;
        //        btnCheckSponsorPin.Enabled = false;
        //    }

        //}



        // for sponsor name//

        protected void GetSponsorNameAndAddress(String memberid)
        {
            try
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
                SqlCommand cmd = new SqlCommand("select UserName,Address from tblmembermaster where UserCode='" + memberid + "' OR LoginName='" + memberid + "';", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                    txtsponsoraddress.Text = dr["UserName"].ToString();
                con.Close();
            }
            catch { }

        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
           
            InformationPanel.Visible = false;
             //Sponsorcount(txtSponserID.Text); ////check sponsor count >=3
            GetSponsorNameAndAddress(txtSponserID.Text);
            txtsponsoraddress.Enabled = false;
            txtSponserID.Enabled = false;
            txtParentId.Enabled = true;


            //if (txtsponsoraddress.Text.Length != 0)
            //{
                
            //    ddlConnectingSide.Enabled = true;
            //    txtSponserID.Enabled = false;
            //    ADDleft(txtSponserID.Text);
            //    ADDRight(txtSponserID.Text);
            //   // Panel3.Visible = true;
            //}
            //else
            //{
                
            //    ddlConnectingSide.Enabled = false;
            //    txtSponserID.Enabled = true;
            //  //  Panel3.Visible = true;
            //}
           
        }
    
        protected void ADDleft(string sponserid)
        {
           // InformationPanel.Visible = true;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand comm = new SqlCommand("select ISNULL(LeftChild,0) from tbltreemaster where MemberID='"+sponserid+"' ", conn);
            conn.Open();
            string left = comm.ExecuteScalar().ToString();
            if (left == "0")
            {
                ddlConnectingSide.Items.Add("Left");
            }
            else
                lbllefthighlight.Text = "Left side already filled.";
        }
        protected void ADDRight(string sponserid)
        {
            //InformationPanel.Visible = true;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand comm = new SqlCommand("select ISNULL(RightChild,0) from tbltreemaster where MemberID='" + sponserid + "' ", conn);
            conn.Open();
            string left = comm.ExecuteScalar().ToString();
            if (left == "0")
            {
                ddlConnectingSide.Items.Add("Right");
            }
            else
                lblrighthighlight.Text = "Right side already filled.";
        }
        protected void ddlConnectingSide_SelectedIndexChanged(object sender, EventArgs e)
        {
            InformationPanel.Visible = true;
            if (ddlConnectingSide.SelectedValue == "Left")
            {
                JoinSide.Value = "Left";
                //ParentID.Value = txtSponserID.Text;
                ParentID.Value = txtParentId.Text;
                InformationPanel.Enabled = true;
                InformationPanel.Visible = true;
            }
            else if (ddlConnectingSide.SelectedValue == "Right")
            {
                JoinSide.Value = "Right";
                //ParentID.Value = txtSponserID.Text;
                ParentID.Value = txtParentId.Text;
                InformationPanel.Enabled = true;
                InformationPanel.Visible = true;
            }
        }
        protected void AddMember()
        {
            InformationPanel.Visible = true;
            objMemberMaster.PinCode = txtPinCode.Text; 
            objMemberMaster.SponsorID = txtSponserID.Text;
            objMemberMaster.ParentID = ParentID.Value;
           // objMemberMaster.OwnerName = txtOwnername.Text;
            objMemberMaster.FatherName = txtfname.Text;
            objMemberMaster.ConnectingSide = JoinSide.Value;
            objMemberMaster.LoginName = "NA";
            objMemberMaster.LoginPassword = txtLoginPass.Text;
            objMemberMaster.TransectionPassword = txtLoginPass.Text;
            //objMemberMaster.UserName = txtOwnername.Text;
            objMemberMaster.UserName = txtname.Text;

            DateTime DOB;
            if (DOB_DD.SelectedValue == "DD" || DOB_MM.SelectedValue == "MM" || DOB_YYYY.SelectedValue == "YYYY")
                DOB = new DateTime(1940, 01, 01);
            else
                DOB = new DateTime(int.Parse(DOB_YYYY.Text), int.Parse(DOB_MM.Text), int.Parse(DOB_DD.Text));
            objMemberMaster.DOB = DOB;
            objMemberMaster.Address = txtAddress.Text;
            //objMemberMaster.Landmark = txtLandmark.Text;
            //objMemberMaster.District = txtDistrict.Text;
            objMemberMaster.city = txtCity.Text;
            objMemberMaster.State = txtState.Text;
            objMemberMaster.Country = txtCountry.Text;
            objMemberMaster.PostalCode = txtPinCode.Text;
            objMemberMaster.MobileNo = txtMobileNo.Text;
            objMemberMaster.TelephoneNo = "";
            objMemberMaster.EMailID = txtEmailID.Text;
            objMemberMaster.PanNo = " ";
            objMemberMaster.BankName = " ";
            objMemberMaster.AccountNo = " ";
            objMemberMaster.IFSCCode = " ";
            objMemberMaster.NomineeName = txtNomineeName.Text;
            objMemberMaster.NomineeContact = txtNomineeaddress.Text;
            objMemberMaster.NomineeRelation = txtNomineeRelation.Text;
            objMemberMaster.Pin ="";
            objMemberMaster.PinAmount = txtpinAmount.Text;
            objMemberMaster.Status = "Active";
            objMemberMaster.BankName = BankName.Text;
            //objMemberMaster.BranchName = BranchName.Text;
            objMemberMaster.AccountNo = AccountNo.Text;
            objMemberMaster.IFSCCode = IFSCode.Text;
            objMemberMaster.PanNo = "0";
            String result = objBALMemberMaster.InsertMember_Admin(objMemberMaster);

           if (result.Length > 2)
           {
                Mid = result;
                PlaceHolder1.Controls.Add(new LiteralControl("<font color=Black><p>Dear " + txtname.Text + "  <br><br> Congratulations! You are now an associate on " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + "  <br><br>Your Member ID : " + Mid + " <br><br> Your Password : " + txtLoginPass.Text + "<br><br> Please Login Now : " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "</font></p><a href=\"Default.aspx\">Home Page</a> | <a href=\"User/unusedpin.aspx\">Register More</a>"));
                string Msg = "";
                Msg = "Dear " + txtname.Text + ", Congratulation! Your MemberId is: " + Mid + " Password is: " + txtLoginPass.Text + " Please logon to " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "";
                              
                Gen obj = new Gen();                
                System.Net.Mail.MailMessage n = new System.Net.Mail.MailMessage();
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                if (txtEmailID.Text != "")
                {
                    n.To.Add(txtEmailID.Text);                    
                    n.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["Email"].ToString());
                    n.Body = Msg;
                    n.Subject = "Congratulation on Joining " + System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() + " ";
                    n.IsBodyHtml = true;
                    client.EnableSsl = false;
                    try
                    {
                        client.Send(n);
                        SendWelcomeletter(txtEmailID.Text, result);
                    }
                    catch { }
                }
                if (!string.IsNullOrEmpty(txtMobileNo.Text) && txtMobileNo.Text.Trim().Length > 9)
                {
                    try
                    {
                        obj.SendNormalSMS("NGINDN", txtMobileNo.Text.Trim(), Msg);
                    }
                    catch
                    { }                    
                }

                Panel1.Enabled = true;
               // PinPannel.Visible = false;
                InformationPanel.Visible = false;
                SponsorPanel.Visible = false;
            }
         else

               lblMessage.Text = "Added Failed ...";
        }

        protected void SendWelcomeletter(String Email,String UserCode)
        {
         
            string Msg = "Welcome";
            Msg += "<br /><br />Please click the following link for your Welcome Letter";
            Msg += "<br /><a href =  http://cp.viratfuture.com /webform2.aspx?id=" + UserCode + " >Click here.</a>";
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
               // lblMessage.Text="You must accept Terms and Conditions";
                MsgBox("You must accept Terms and Conditions");
                return;
            }
            AddMember();

           //else if (ddlConnectingSide.SelectedIndex == 0)
           // {
           //     lblMessage.Text = "Please select Position.";
           //     return;
           // }
            
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
           
            //SendWellcomeMail();
         
          //  MainContent_Panel1.Visible = true;

            
        }

        

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }


        protected void btnparentname_Click(object sender, EventArgs e)
        {
            getparentname(txtParentId.Text);
            txtparentname.Enabled = false;

            if (txtParentId.Text.Length != 0)
            {

                ddlConnectingSide.Enabled = true;
                
                txtParentId.Enabled = false;
                ADDleft(txtParentId.Text);
                ADDRight(txtParentId.Text);
                // Panel3.Visible = true;
            }
            else
            {

                ddlConnectingSide.Enabled = false;
                
                txtParentId.Enabled = true;
                //  Panel3.Visible = true;
            }
        }

        protected void getparentname(String memberid)
        {
            try
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
                SqlCommand cmd = new SqlCommand("select UserName from tblmembermaster where UserCode='" + memberid + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                    txtparentname.Text = dr["UserName"].ToString();
                con.Close();
            }
            catch { }

        }
    }
}