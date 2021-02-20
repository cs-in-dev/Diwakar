using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Collections;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;

public partial class SuperAdminUpdateMember : System.Web.UI.Page
{
    BOMemberMaster objMemberMaster;
    BALMemberMaster objBALMemberMaster;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/240578/Default.aspx");
        if (User.IsInRole("Update Profile") == false && User.IsInRole("Admin") == false)
            Response.Redirect("~/240578/AdminHome.aspx");

        objMemberMaster = new BOMemberMaster();
        objBALMemberMaster = new BALMemberMaster();
        if (!Page.IsPostBack)
        {
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/240578/Default.aspx");
            }
            else if (Session["Usercode"].ToString() == "BI250241")
            {
                txtMemberCode.Text = "";
                InformationPanel.Visible = false;
            }

        }

    }

    protected void btnGetInfo_Click(object sender, EventArgs e)
    {

        objMemberMaster.UserCode = txtMemberCode.Text;

        objMemberMaster = objBALMemberMaster.getMemberProfileByMemberCode(objMemberMaster);
        if (objMemberMaster.UserName == "")
        {
            Label1.Text = "Invalid Member ID";
            return;
        }
        txtname.Text = objMemberMaster.UserName;
        if (objMemberMaster.DOB.ToString() == "")
        {
            txtDateOfBirth.Text = "";
        }
        else
        {
            txtDateOfBirth.Text = objMemberMaster.DOB.ToString(new CultureInfo("en-GB"));
        }

        txtLoginPassword.Text = objMemberMaster.LoginPassword;
        //txtTransactionPassword.Text = objMemberMaster.TransectionPassword;
        txtAddress.Text = objMemberMaster.Address;
        txtcity.Text = objMemberMaster.city;
        txtstate.Text = objMemberMaster.State;
        txtcountry.Text = objMemberMaster.Country;
        txtPinCode.Text = objMemberMaster.PostalCode;
        txtMobileNo.Text = objMemberMaster.MobileNo;
        //txtTelephoneNo.Text = objMemberMaster.TelephoneNo;
        txtEmailID.Text = objMemberMaster.EMailID;
        txtAmount.Text = objMemberMaster.Amount;
        txtAmount.Text = objMemberMaster.AccountNo;
        txtifsc.Text = objMemberMaster.IFSCCode;
        txtbranch.Text = objMemberMaster.BranchName;
        txtbankname.Text = objMemberMaster.BankName;
        txtpanno.Text = objMemberMaster.PanNo;
        Fname.Text = objMemberMaster.FatherName;
        //PanCard.HRef = objMemberMaster.Pancard;
        //AddressP.HRef = objMemberMaster.AddressProof;
        //txtLandmark.Text = objMemberMaster.Landmark;
        txtDistrict.Text = objMemberMaster.District;
        txtAadharnumber.Text = objMemberMaster.AadharCard;
        InformationPanel.Visible = true;

    }
    protected void MsgBox(string Message)
    {
        this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
       
        objMemberMaster.UserCode = txtMemberCode.Text;
        objMemberMaster = objBALMemberMaster.getMemberProfileByMemberCode(objMemberMaster);
        string AddressProof = "", Pancard = "";
        Guid g = Guid.NewGuid();
        //if (FileUploadAddressProof.HasFile)
        //{
        //    string fileName = Path.GetFileName(FileUploadAddressProof.PostedFile.FileName);
        //    FileUploadAddressProof.PostedFile.SaveAs(Server.MapPath("~/upload/") + g + "_AddProof_" + fileName);
        //    AddressProof = "~/upload/" + g + "_AddProof_" + fileName;
        //}
        //if (FileUploadPANCard.HasFile)
        //{
        //    string fileName = Path.GetFileName(FileUploadPANCard.PostedFile.FileName);
        //    FileUploadPANCard.PostedFile.SaveAs(Server.MapPath("~/upload/") + g + "_PAN_" + fileName);
        //    Pancard = "~/upload/" + g + "_PAN_" + fileName;
        //}
        if (AddressProof == "")
        {
            AddressProof = objMemberMaster.AddressProof;
        }
        if (Pancard == "")
        {
            Pancard = objMemberMaster.Pancard;
        }
        objMemberMaster.LoginPassword = txtLoginPassword.Text;
        objMemberMaster.TransectionPassword = "";
        objMemberMaster.UserCode = txtMemberCode.Text;
        objMemberMaster.UserName = txtname.Text;
        objMemberMaster.DOB = DateTime.Parse(txtDateOfBirth.Text.Trim(), new CultureInfo("en-GB"));
        objMemberMaster.Address = txtAddress.Text;
        objMemberMaster.city = txtcity.Text.ToString();
        objMemberMaster.State = txtstate.Text.ToString();
        objMemberMaster.Country = txtcountry.Text.ToString();
        objMemberMaster.PostalCode = txtPinCode.Text;
        objMemberMaster.MobileNo = txtMobileNo.Text;
        objMemberMaster.TelephoneNo = "";
        objMemberMaster.EMailID = txtEmailID.Text;
        objMemberMaster.PanNo = txtpanno.Text;
        objMemberMaster.BankName = txtbankname.Text;
        objMemberMaster.AccountNo = txtAmount.Text;
        objMemberMaster.IFSCCode = txtifsc.Text;
        objMemberMaster.Landmark = "";
        objMemberMaster.District = txtDistrict.Text;
        objMemberMaster.BranchName = txtbranch.Text;
        objMemberMaster.AddressProof = AddressProof;
        objMemberMaster.FatherName = Fname.Text;
        objMemberMaster.Pancard = Pancard;
        objMemberMaster.AadharCard = txtAadharnumber.Text;

        String result = objBALMemberMaster.updateMemberAdmin(objMemberMaster);
        if (int.Parse(result) == 1)
        {
            lblMessage.Text = "Profile Updated Successfully";
            txtname.Text = "";
            txtbankname.Text = "";
            txtAddress.Text = "";
            txtPinCode.Text = "";
            txtMobileNo.Text = "";
            txtEmailID.Text = "";
            txtDistrict.Text = "";
            Fname.Text = "";
            txtDateOfBirth.Text = "";
            txtbranch.Text = "";
            txtLoginPassword.Text = "";
            txtMemberCode.Text = "";
            txtcity.Text = "";
            txtstate.Text = "";
            txtAmount.Text = "";
            txtpanno.Text = "";
            txtcountry.Text = "";
            txtifsc.Text = "";
            txtAadharnumber.Text = "";

        }
        else
            lblMessage.Text = "Updation Failed";

    }
}