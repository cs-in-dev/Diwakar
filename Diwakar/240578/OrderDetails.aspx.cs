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

namespace SuperBusines
{
    public partial class AdminOrderDetailsFranchise : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        Double Qty = 0, TotalTaxAmount = 0, TotalDP = 0, Total = 0, UnitPrice = 0, TotalPrice = 0, TotalAddtax = 0, Tottax = 0;
        NumberToEnglish NoToEng = new NumberToEnglish();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["FrenchiseID"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}

            //if (Request.QueryString["BranchInvoiceNo"] == null)
            //    Response.Redirect("~/19111973/ViewOrders.aspx");

            string msg = Request.QueryString["BranchInvoiceNo"].ToString();
            string jbffsf = Request.QueryString["FrenchiseID"].ToString();
            cmd = new SqlCommand("select UserCode,UserName,Address from tblMemberMaster where UserCode=(select MemberID from OrderMaster where FrenchiseID='" + Request.QueryString["FrenchiseID"].ToString() + "' and  BranchInvoiceNo=" + Request.QueryString["BranchInvoiceNo"].ToString() + ")", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustname.Text = dr["UserName"].ToString();
                // lblcustaddr.Text = dr["Address"].ToString();
                lblMemberID.Text = dr["UserCode"].ToString();
            }
            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select FrenchiseId,Date,ISNULL(CourierCharges,0)CourierCharges from OrderMaster where  FrenchiseID='" + Request.QueryString["FrenchiseID"].ToString() + "' and   BranchInvoiceNo=" + Request.QueryString["BranchInvoiceNo"].ToString();

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblCourierCharges.Text = string.Format("{0:f2}", Convert.ToDouble(dr["CourierCharges"].ToString()));
                lblinvoiceno.Text = Request.QueryString["BranchInvoiceNo"].ToString();
                lblFrenchiseID.Text = "Branch ID : " + dr["FrenchiseId"].ToString();
                Session["Fadd"] = dr["FrenchiseId"].ToString();
                lblDate.Text = dr["Date"].ToString();
            }

            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select Address from tblFrenchiseMaster where FrenchiseId='" + Session["Fadd"].ToString() + "'";

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustaddr.Text = dr["Address"].ToString();

            }

            dr.Close();
            dr.Dispose();

            cmd.CommandText = "select dbo.MySponsor('" + lblMemberID.Text + "') SPID, dbo.MySponsorName('" + lblMemberID.Text + "') SPName, dbo.WeightDetails('" + Request.QueryString["BranchInvoiceNo"].ToString() + "','" + Session["Fadd"].ToString() + "') Weight";
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //lblTotalBV.Text = dr["TotalBV"].ToString();
                //lblTotalPV.Text = dr["TotalPV"].ToString();
                //lblTotalWeight.Text = dr["Weight"].ToString();
                lblUplineDisID.Text = dr["SPID"].ToString() + "-" + dr["SPname"].ToString();
            }

            dr.Close();
            dr.Dispose();
            con.Close();

        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = Panel1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Qty = Qty + Double.Parse(e.Row.Cells[6].Text);
                UnitPrice = UnitPrice + Double.Parse(e.Row.Cells[7].Text);
                TotalDP = TotalDP + Double.Parse(e.Row.Cells[10].Text);
                TotalTaxAmount = TotalTaxAmount + Double.Parse(e.Row.Cells[8].Text);
                Total = Total + Double.Parse(e.Row.Cells[9].Text);
                TotalPrice = TotalPrice + Double.Parse(e.Row.Cells[12].Text);
                TotalAddtax = TotalAddtax + Double.Parse(e.Row.Cells[9].Text);
                lblTotalTaxAmount.Text = string.Format("{0:f2}", (Double.Parse(lblTotalTaxAmount.Text) + Double.Parse(e.Row.Cells[9].Text) + Double.Parse(e.Row.Cells[8].Text)));
                Tottax = (0 + Double.Parse(lblTotalTaxAmount.Text.ToString().Replace(".0000", ".00")));
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Total :";
                e.Row.Cells[7].Text = string.Format("{0:f2}", UnitPrice);
                e.Row.Cells[6].Text = Qty.ToString();
                e.Row.Cells[10].Text = string.Format("{0:f0}", TotalDP);
                e.Row.Cells[8].Text = string.Format("{0:f2}", TotalTaxAmount);
                e.Row.Cells[9].Text = string.Format("{0:f2}", Total);
                e.Row.Cells[12].Text = string.Format("{0:f2}", TotalPrice);
                // lblMoneyInWord.Text = NoToEng.changeNumericToWords(TotalPrice);
                //e.Row.Cells[5].Text=string.Format("{0:f}", TotalDP);
                //lblNetProductValue.Text = string.Format("{0:f}", TotalDP);              
                lblTotalPayment.Text = e.Row.Cells[12].Text;
                Double Courch = Double.Parse((lblCourierCharges.Text).ToString().Replace(".0000", ".00"));

                Double NetPay = Tottax + TotalPrice + Courch;//Double.Parse(lblTotalPayment.Text.ToString() + lblCourierCharges.Text.ToString() + lblTotalTaxAmount.Text.ToString());
                // Label2.Text = string.Format("{0:f2}", NetPay);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}