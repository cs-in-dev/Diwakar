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

public partial class admin_UpdateMember : System.Web.UI.Page
{
    BOMemberMaster objMemberMaster = new BOMemberMaster();
    BALMemberMaster objBALMemberMaster = new BALMemberMaster();
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/default.aspx");
            }
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            btnGetInfo_Click(sender, e);
        }
    }
    protected void btnGetInfo_Click(object sender, EventArgs e)
    {
        objMemberMaster.UserCode = Session["Usercode"].ToString();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        

        objMemberMaster = objBALMemberMaster.getMemberProfileByMemberCode(objMemberMaster);
        Session.Add("UserName", objMemberMaster.UserName);
        if (objMemberMaster.DOB.ToString() == "")
        {
            txtDateOfBirth.Text = "";
        }
        else
        {
            txtDateOfBirth.Text = objMemberMaster.DOB.ToString(new CultureInfo("en-GB"));
        }

      
        if (txtPanNo.Text.Trim() != "")
            txtPanNo.Enabled = false;
        txtName.Text = objMemberMaster.UserName;
        txtBAName.Text = objMemberMaster.UserCode;
        txtAddress.Text = objMemberMaster.Address;
        txtCity.Text = objMemberMaster.city;
        txtState.Text = objMemberMaster.State;
        txtCountry.Text = objMemberMaster.Country;
        txtPinCode.Text = objMemberMaster.PostalCode;
        txtMobileNo.Text = objMemberMaster.MobileNo;
        txtTelephoneNo.Text = objMemberMaster.TelephoneNo;
        txtEmailID.Text = objMemberMaster.EMailID;
        txtPanNo.Text = objMemberMaster.PanNo;
        txtAccountNo.Text = objMemberMaster.AccountNo;
        txtIFSCCode.Text = objMemberMaster.IFSCCode;
        txtBankName.Text = objMemberMaster.BankName;
        txtBranchName.Text = objMemberMaster.BranchName;
        txtLandmark.Text = objMemberMaster.Landmark;
        txtDistrict.Text = objMemberMaster.District;
        usertype.Value = objMemberMaster.UserType;
        txtNomineeContact.Text = objMemberMaster.NomineeContact;
        txtNomineeName.Text = objMemberMaster.NomineeName;
        txtNomineeRelation.Text = objMemberMaster.NomineeRelation;
        Hiddenpassword.Value = objMemberMaster.LoginPassword;
        status.Value = objMemberMaster.Status;
        Fname.Text = objMemberMaster.FatherName;
        PanCard.HRef = objMemberMaster.Pancard;
        AddressP.HRef = objMemberMaster.AddressProof;
        //txtOwnerName.Text =objMemberMaster.OwnerName;
        InformationPanel.Visible = true;


        txtAccountNo.Enabled = txtAccountNo.Text == null || txtAccountNo.Text.Trim() == "";
        txtIFSCCode.Enabled = txtIFSCCode.Text == null || txtIFSCCode.Text.Trim() == "";
        txtNomineeRelation.Enabled = txtNomineeRelation.Text == null || txtNomineeRelation.Text.Trim() == "";
        txtNomineeName.Enabled = txtNomineeName.Text == null || txtNomineeName.Text.Trim() == "";
        txtNomineeContact.Enabled = txtNomineeContact.Text == null || txtNomineeContact.Text.Trim() == "";

    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objMemberMaster.UserCode = Session["Usercode"].ToString();


        objMemberMaster = objBALMemberMaster.getMemberProfileByMemberCode(objMemberMaster);
        string AddressProof = "", Pancard = "";
        Guid g = Guid.NewGuid();
        if (FileUploadAddressProof.HasFile)
        {
            string fileName = Path.GetFileName(FileUploadAddressProof.PostedFile.FileName);
            FileUploadAddressProof.PostedFile.SaveAs(Server.MapPath("~/upload/") + g + "_AddProof_" + fileName);
            AddressProof = "~/upload/" + g + "_AddProof_" + fileName;
        }
        if (FileUploadPANCard.HasFile)
        {
            string fileName = Path.GetFileName(FileUploadPANCard.PostedFile.FileName);
            FileUploadPANCard.PostedFile.SaveAs(Server.MapPath("~/upload/") + g + "_PAN_" + fileName);
            Pancard = "~/upload/" + g + "_PAN_" + fileName;
        }
        if (AddressProof == "")
        {
            AddressProof = objMemberMaster.AddressProof;
        }
        if (Pancard == "")
        {
            Pancard = objMemberMaster.Pancard;
        }



        objMemberMaster.UserCode = Session["Usercode"].ToString();
        objMemberMaster = objBALMemberMaster.getMemberProfileByMemberCode(objMemberMaster);
        objMemberMaster.DOB = DateTime.Parse(txtDateOfBirth.Text.Trim(), new CultureInfo("en-GB"));
        objMemberMaster.Address = txtAddress.Text;
        objMemberMaster.city = txtCity.Text;
        objMemberMaster.State = txtState.Text;
        objMemberMaster.Country = txtCountry.Text;
        objMemberMaster.EMailID = txtEmailID.Text;
        objMemberMaster.PostalCode = txtPinCode.Text;
        objMemberMaster.TelephoneNo = txtTelephoneNo.Text;
        objMemberMaster.BankName = txtBankName.Text;
        objMemberMaster.BranchName = txtBranchName.Text;
        objMemberMaster.AccountNo = txtAccountNo.Text;
        objMemberMaster.IFSCCode = txtIFSCCode.Text;
        objMemberMaster.NomineeName = txtNomineeName.Text;
        objMemberMaster.NomineeContact = txtNomineeContact.Text;
        objMemberMaster.NomineeRelation = txtNomineeRelation.Text;
        objMemberMaster.LoginPassword = Hiddenpassword.Value;
        objMemberMaster.Status = status.Value;
        objMemberMaster.FatherName = Fname.Text;
        //objMemberMaster.OwnerName = "";
        objMemberMaster.UserType = usertype.Value;
        objMemberMaster.Landmark = txtLandmark.Text;
        objMemberMaster.District = txtDistrict.Text;
        objMemberMaster.PanNo = txtPanNo.Text;
        objMemberMaster.MobileNo = txtMobileNo.Text;
        objMemberMaster.AddressProof = AddressProof;
        objMemberMaster.Pancard = Pancard;
        String result = objBALMemberMaster.updateMember(objMemberMaster);
        if (int.Parse(result) == 1)
        {
            lblMessage.Text = "Profile Updated";

            txtName.Text = "";
            txtBAName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtCountry.Text = "";
            txtPinCode.Text = "";
            txtMobileNo.Text = "";
            txtTelephoneNo.Text = "";
            txtEmailID.Text = "";
            txtPanNo.Text = "";
            txtAccountNo.Text = "";
            txtIFSCCode.Text = "";
            txtBankName.Text = "";
            txtBranchName.Text = "";
            txtLandmark.Text = "";
            txtDistrict.Text = "";
            usertype.Value = "";
            txtNomineeContact.Text = "";
            txtNomineeName.Text = "";
            txtNomineeRelation.Text = "";
            Hiddenpassword.Value = "";
            status.Value = "";
            Fname.Text = "";
            //txtOwnerName.Text ="";
            txtDateOfBirth.Text = "";
        }
        else
            lblMessage.Text = "Updation Failed";


    }
}