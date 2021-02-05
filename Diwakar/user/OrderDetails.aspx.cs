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
    public partial class OrderDetailsFranchise : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        Double Qty = 0, TotalTaxAmount = 0, TotalDP = 0, Total = 0, UnitPrice = 0, TotalPrice = 0, TotalAddtax = 0, Tottax = 0;
        Double GrossAmt = 0;
        NumberToEnglish NoToEng = new NumberToEnglish();
   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (Request.QueryString["ID"] == null)
                Response.Redirect("~/Franchise/ViewOrders.aspx");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT panno  from TblMemberMaster where usercode = @LoginName", con);
            cmd.Parameters.AddWithValue("@LoginName", Session["Usercode"].ToString());
            lblPanNo.Text = cmd.ExecuteScalar().ToString();
            con.Close();


            string msg = Request.QueryString["ID"].ToString();            
            cmd = new SqlCommand("select UserCode,UserName,Address from tblMemberMaster where UserCode=(select MemberID from OrderMaster where FrenchiseId='RSG201501' and OrderID=" + Request.QueryString["ID"].ToString() + ")", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustname.Text = dr["UserName"].ToString();                
                lblMemberID.Text = dr["UserCode"].ToString();

                
            }
            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select isnull(Paymentmode,'NA')paymode,isnull(ChequeNo,'NA')chequeNo,isnull(ChequeDate,'')chequedate,isnull(BankName,'NA')bankname,isnull(Referencenumber,'NA')impsrefno,isnull(Impsamount,0)impsamount,isnull(Impsdate,'')impsdate, FrenchiseId,Date,ISNULL(CourierCharges,0)CourierCharges from OrderMaster where FrenchiseId='RSG201501' and  OrderID=" + Request.QueryString["ID"].ToString();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblCourierCharges.Text = string.Format("{0:f2}", Convert.ToDouble(dr["CourierCharges"].ToString()));
                lblinvoiceno.Text = Request.QueryString["ID"].ToString();
                lblFrenchiseID.Text = "Branch ID : " + dr["FrenchiseId"].ToString();
                lblDate.Text = dr["Date"].ToString();
                lblpaymode.Text = dr["paymode"].ToString();
                if (lblpaymode.Text == "Cheque")
                {
                    panelcheque.Visible = true;
                    ChecqueNo.Text = dr["chequeNo"].ToString();
                    ChecqueDate.Text = dr["chequedate"].ToString();
                    chequebankname.Text = dr["bankname"].ToString();
                }
                if (lblpaymode.Text == "IMPS")
                {
                    panelIMPS.Visible = true;
                    IMPSReffNo.Text = dr["impsrefno"].ToString();
                    IMPSDate.Text = dr["impsdate"].ToString();
                    IMPSAmount.Text = dr["impsamount"].ToString();
                }
            }

            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select Address from tblFrenchiseMaster where FrenchiseId='RSG201501'";

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustaddr.Text = dr["Address"].ToString();

            }

            dr.Close();
            dr.Dispose();
                       
            cmd.CommandText = "select dbo.MySponsor('" + lblMemberID.Text + "') SPID, dbo.MySponsorName('" + lblMemberID.Text + "') SPName";
            dr = cmd.ExecuteReader();
            while (dr.Read())
                lblUplineDisID.Text = dr["SPID"].ToString() + "-" + dr["SPname"].ToString();

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
                //TotalTaxAmount = TotalTaxAmount + Double.Parse(e.Row.Cells[8].Text);                
                TotalPrice = TotalPrice + Double.Parse(e.Row.Cells[12].Text);                
                lblTotalTaxAmount.Text = string.Format("{0:f2}", (Double.Parse(lblTotalTaxAmount.Text)));
                GrossAmt = GrossAmt  + Double.Parse(e.Row.Cells[12].Text);
                Tottax = (0 + Double.Parse(lblTotalTaxAmount.Text.ToString().Replace(".0000", ".00")));
            }
            
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Total :";
                e.Row.Cells[7].Text = string.Format("{0:f2}", UnitPrice);
                e.Row.Cells[6].Text = Qty.ToString();
                e.Row.Cells[10].Text = string.Format("{0:f0}", TotalDP);
                //e.Row.Cells[8].Text = string.Format("{0:f2}", TotalTaxAmount);                
                e.Row.Cells[12].Text = string.Format("{0:f2}", TotalPrice);
               
                Double Courch = Double.Parse((lblCourierCharges.Text).ToString().Replace(".0000", ".00"));
                Double NetPay = Tottax + TotalPrice + Courch;
               
                lblTotalPayment.Text = TotalPrice.ToString();
                bvdiscountamount.Text = "0.00";
            }

        }
    }
}