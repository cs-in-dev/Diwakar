using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MoneyMagnet.Admin
{
    public partial class BankWithdraw : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["UserCode"] == null)
                Response.Redirect("default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Update tblbankWithdraw set status='Cleared' where TXNID = " + DropDownList1.SelectedValue, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            

            Gridbankwithdraw.DataBind();
            DropDownList1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Update tblbankWithdraw set status='Cancel' where TXNID = " + DropDownList1.SelectedValue, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Gridbankwithdraw.DataBind();
            DropDownList1.DataBind();
        }
    }
}