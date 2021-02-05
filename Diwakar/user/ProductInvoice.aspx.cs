using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Bigshop._240578
{
    public partial class ProductInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select ProductName,Mrp From products  where id in(Select isnull(GiftPackage,0) From TblMembeRMAster where USercode ='" + Session["usercode"].ToString() + "' );Select UserCode,UserName,PinAmount,City,Convert(Varchar(24),DOJ,105)as DOJ,InvoiceNo,MobileNo,Address from tblMEmberMASter where USerCode ='" + Session["usercode"].ToString() + "'", con);
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                //ProductName.Text = rd["ProductName"].ToString();
                

            }
            rd.NextResult();
            if (rd.Read())
            {
                lblinvno.Text = rd["InvoiceNo"].ToString();
                Amount.Text = rd["PinAmount"].ToString();
                //lblAmount.Text = rd["PinAmount"].ToString();
                lblTotalAmount.Text = rd["PinAmount"].ToString(); ;
                lblDate.Text = rd["DOJ"].ToString();
                lblName.Text = rd["UserName"].ToString();

                lblName.Text = rd["UserName"].ToString();
                lblid.Text =rd["UserCode"].ToString();
                lblmob.Text = rd["MobileNo"].ToString();
                //lblCity.Text = rd["city"].ToString();
            }
            if (lblTotalAmount.Text == "1450.00")
            {
                lblqnty.Text = "1";
                lblAmount.Text = "2500.00";
            }
            else if (lblTotalAmount.Text == "3250.00")
            {
                lblqnty.Text = "1";
                lblAmount.Text = "5000.00";
            }
            else if (lblTotalAmount.Text == "2650.00")
            {
                lblqnty.Text = "2";
                lblAmount.Text = "5000.00";
            }
            else
            {
                lblqnty.Text = "1";
                //lblAmount.Text = "5000.00";
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

            Session["ctrl"] =pnl1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
        }
    }
}