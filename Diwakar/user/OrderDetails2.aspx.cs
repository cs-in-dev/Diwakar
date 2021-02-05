using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WGRL.Franchise;
using System.IO;


namespace Rainsonglobal.user
{
    public partial class OrderDetails2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        Double Qty = 0, TotalTaxAmount = 0, TotalDP = 0, Total = 0, UnitPrice = 0, TotalPrice = 0, TotalAddtax = 0, Tottax = 0, TotalTax = 0, TotalBv = 0, TotalDp = 0;


        Double GrossAmt = 0;

        public object PageSize { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (Request.QueryString["ID"] == null)
                Response.Redirect("~/Franchise/ViewOrders.aspx");

            string msg = Request.QueryString["ID"].ToString();
            cmd = new SqlCommand("select UserCode,UserName,Address from tblMemberMaster where UserCode=(select MemberID from OrderMaster where  OrderID=" + Request.QueryString["ID"].ToString() + ")", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustname.Text = dr["UserName"].ToString();
                lblMemberID.Text = dr["UserCode"].ToString();
            }
            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select FrenchiseId,Convert(varchar(10),Date,103) as date2,ISNULL(CourierCharges,0)CourierCharges from OrderMaster where   OrderID=" + Request.QueryString["ID"].ToString();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblCourierCharges.Text = string.Format("{0:f0}", Convert.ToDouble(dr["CourierCharges"].ToString()));
                lblinvoiceno.Text = Request.QueryString["ID"].ToString();
                //  lblFrenchiseID.Text = "Branch ID : " + dr["FrenchiseId"].ToString();
                lblDate.Text = dr["date2"].ToString();
            }

            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select * from tblmembermaster where UserCode='" + lblMemberID.Text + "'";

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustaddr.Text = dr["Address"].ToString() + ", " + dr["City"].ToString() + ", <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + dr["State"].ToString() + ", \n" + dr["PostalCode"].ToString() + ", <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + dr["Country"].ToString();

            }

            dr.Close();
            dr.Dispose();

            //cmd.CommandText = "select dbo.MySponsor('" + lblMemberID.Text + "') SPID, dbo.MySponsorName('" + lblMemberID.Text + "') SPName";
            //dr = cmd.ExecuteReader();
            //while (dr.Read())
            //  //  lblUplineDisID.Text = dr["SPID"].ToString() + "-" + dr["SPname"].ToString();

            //dr.Close();
            //dr.Dispose();
            con.Close();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            NumberToEnglish NoToEng = new NumberToEnglish();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Qty = Qty + Double.Parse(e.Row.Cells[3].Text);
                //UnitPrice = UnitPrice + Double.Parse(e.Row.Cells[7].Text);
                // TotalDP = TotalDP + Double.Parse(e.Row.Cells[10].Text);
                //TotalTaxAmount = TotalTaxAmount + Double.Parse(e.Row.Cells[8].Text);  
                TotalTax = TotalTax + Double.Parse(e.Row.Cells[10].Text);
                TotalBv = TotalBv + Double.Parse(e.Row.Cells[11].Text);
                TotalDp = TotalDp + Double.Parse(e.Row.Cells[12].Text);
                // TotalPrice = TotalPrice + Double.Parse(e.Row.Cells[11].Text);
                // lblTotalTaxAmount.Text = string.Format("{0:f2}", (Double.Parse(lblTotalTaxAmount.Text)));
                GrossAmt = GrossAmt + Double.Parse(e.Row.Cells[11].Text);
                //  Tottax = (0 + Double.Parse(lblTotalTaxAmount.Text.ToString().Replace(".0000", ".00")));
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "Total :";
                // e.Row.Cells[7].Text = string.Format("{0:f2}", UnitPrice);
                //  e.Row.Cells[6].Text = Qty.ToString();
                //  e.Row.Cells[10].Text = string.Format("{0:f0}", TotalDP);
                //e.Row.Cells[8].Text = string.Format("{0:f2}", TotalTaxAmount);                
                e.Row.Cells[10].Text = string.Format("{0:f0}", TotalTax);
                e.Row.Cells[11].Text = string.Format("{0:f0}", TotalBv);
                e.Row.Cells[12].Text = string.Format("{0:f0}", TotalDp);

                Double Courch = Double.Parse((lblCourierCharges.Text).ToString().Replace(".0000", ".00"));
                Double NetPay = Tottax + TotalPrice + Courch;

                // lblTotalPayment.Text = TotalPrice.ToString();
                lblTotalPayment.Text = (TotalDp + Courch).ToString().Replace(".0000", ".00");
                //  bvdiscountamount.Text = "0.00";
                lblamountinword.Text = NoToEng.changeNumericToWords(Double.Parse(lblTotalPayment.Text)) + " Rupees Only.";

            }

        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            //Document document = new Document();

            //Page page = new Page(PageSize.Letter, PageOrientation.Portrait);
            //document.Pages.Add(page);

            //page.Elements.Add(new Label("My PDF Document", 0, 0, 512, 40, Font.Helvetica));
            //document.Draw(@"C:\MyDocument.pdf");
            Session["ctrl"] = Panel1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
        }
    }
}