using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Globalization;

namespace eSolutionsCurry.User
{
    public partial class MyPayoutsPrint : System.Web.UI.Page
    {
        //SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
                Response.Redirect("~/user/MyPayouts.aspx");
            else
            {
                String DF = "";
                String DT = "";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
                cmd = new SqlCommand("SELECT     Payouts.*, tblMemberMaster.UserName, tblMemberMaster.Address, tblMemberMaster.City, tblMemberMaster.State, tblMemberMaster.Country, tblMemberMaster.MobileNo, tblMemberMaster.PanNo, tblMemberMaster.BankName,tblMemberMaster.BranchName, tblMemberMaster.AccountNo, tblMemberMaster.IFSCCode FROM         Payouts INNER JOIN tblMemberMaster ON Payouts.UserCode = tblMemberMaster.UserCode WHERE     (TrackID = " + Request.QueryString["ID"].ToString() + ")", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    MemberID.Text = dr["UserCode"].ToString();
                    //BDB.Text = dr["StarIncome"].ToString().Replace(".0000", "");
                    Binary.Text = dr["BinaryIncome"].ToString().Replace(".0000", "");
                    lblrepurchase.Text = dr["SingleLegIncome"].ToString().Replace(".0000", ""); // level income
                    lblredemption.Text = dr["stateIncome"].ToString().Replace(".0000", ""); // level income
                    lbldirect.Text = dr["PinCharges"].ToString().Replace(".0000", ""); //direct income
                    lblsalaryincome.Text=dr["SalaryIncome"].ToString().Replace(".0000", "");
                    lblpromance.Text = dr["ZoneIncome"].ToString().Replace(".0000", "");
                   // pymnt.Text = dr["Payments"].ToString().Replace(".0000", "");
                    grossPayment.Text=dr["GrossPayable"].ToString().Replace(".0000", "");
                    //lblrprchs.Text = dr["RepurchaseIncome"].ToString().Replace(".0000", "");
                    TotalPayout.Text = dr["TotalPayout"].ToString().Replace(".0000", "");
                    //TDS.Text = dr["TDS"].ToString();
                    tds.Text = dr["TDS"].ToString();
                    AdminCharges.Text = dr["AdminCharges"].ToString();
                   // NetPayable.Text = dr["NetPayable"].ToString();
                    TrackID.Text = dr["TrackID"].ToString();
                    MemberAddress.Text = dr["Address"].ToString() + " " + dr["City"].ToString() + " " + dr["State"].ToString();
                    MemberPanNo.Text =dr["panno"].ToString();
                    MemberMobile.Text = dr["MobileNo"].ToString();
                    MemberName.Text = dr["UserName"].ToString();
                    DateFrom.Text = DateTime.Parse(dr["DateFrom"].ToString()).ToString(new CultureInfo("en-GB")).Substring(0,10);
                    DateTill.Text = DateTime.Parse(dr["DateTo"].ToString()).ToString(new CultureInfo("en-GB")).Substring(0, 10);
                    BankName.Text = dr["BankName"].ToString() + " " + dr["BranchName"].ToString();
                    AccountNo.Text = dr["AccountNo"].ToString();
                    IFSCode.Text = dr["IFSCCode"].ToString();
                    DF = dr["DateFrom"].ToString();
                    DT = dr["DateTo"].ToString();
                    lblselfcashback.Text = dr["SelfCashBackIncome"].ToString();
                }
                dr.Close();
                
            
            }
        
        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = Panel1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
        }

        
    }

}
