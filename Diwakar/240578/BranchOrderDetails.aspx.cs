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
    public partial class BranchOrderDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        Double Qty = 0, TotalTaxAmount = 0, TotalDP = 0, Total = 0, UnitPrice = 0, TotalPrice=0,net=0,TTax=0,TAddTax=0;
        String Branch;
        NumberToEnglish NoToEng = new NumberToEnglish();
        protected void Page_Load(object sender, EventArgs e)
        {
        
        //    if (!User.Identity.IsAuthenticated)
        //        Response.Redirect("~/19111973/default.aspx");
        //    if (User.IsInRole("19111973") == false)
        //        Response.Redirect("~/19111973/AdminHome.aspx");

            SqlCommand cmd = new SqlCommand("Select FrenchiseID from Stockrequest where OrderID='" + Request.QueryString["OrderID"].ToString() + "'", con);
            con.Open();

            String stor = cmd.ExecuteScalar().ToString().Trim();

            con.Close();
            cmd.CommandText = "Select Name from tblFrenchiseMaster where FrenchiseID='" + stor + "'";
            con.Open();

            String Name = cmd.ExecuteScalar().ToString().Trim();

            con.Close();
            if (Name == "District Franchise")
            {
                cmd.CommandText = "SELECT     ProductRepurchase.ProductCode,ProductRepurchase.ProductName,ProductRepurchase.BV,(ProductRepurchase.SalesAmount)BranchPrice,(ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat) as PriceBeforVAT,((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)-((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)))UnitPrice,derivedtbl_1.Qty,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)) as TotalDP,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty*(ISNULL((ProductRepurchase.DiscountAmount),0)))) as Dis, ((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*(ProductRepurchase.Vat/100))VAT,  (((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*ProductRepurchase.AddVat/100))AddVAT,(ProductRepurchase.BV*derivedtbl_1.Qty)TotalBV,(ProductRepurchase.SalesAmount*derivedtbl_1.Qty)as TotalPrice, ProductRepurchase.MRP,  derivedtbl_1.OrderID, derivedtbl_1.Status, derivedtbl_1.FrenchiseID, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN   (SELECT     StockRequest.OrderID, StockRequest.Status, StockRequest.FrenchiseID, StockRequestDetails.Amount, StockRequestDetails.Qty, StockRequestDetails.MRP, StockRequestDetails.ProductID  FROM   StockRequest INNER JOIN StockRequestDetails ON StockRequest.OrderID = StockRequestDetails.OrderId) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductID  where derivedtbl_1.OrderID='" + Request.QueryString["OrderID"].ToString() + "'";
                con.Open();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }
            else if (Name == "Master Franchise")
            {
                cmd.CommandText = "SELECT     ProductRepurchase.ProductCode,ProductRepurchase.ProductName,ProductRepurchase.BV,(ProductRepurchase.SalesAmount)BranchPrice,(ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat) as PriceBeforVAT,((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)-((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)))UnitPrice,derivedtbl_1.Qty,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)) as TotalDP,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty*(ISNULL((ProductRepurchase.DiscountAmount),0)))) as Dis, ((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*(ProductRepurchase.Vat/100))VAT,(((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*ProductRepurchase.AddVat/100))AddVAT,(ProductRepurchase.BV*derivedtbl_1.Qty)TotalBV,(ProductRepurchase.SalesAmount*derivedtbl_1.Qty)asTotalPrice, ProductRepurchase.MRP,  derivedtbl_1.OrderID, derivedtbl_1.Status, derivedtbl_1.FrenchiseID, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN  (SELECT     StockRequest.OrderID, StockRequest.Status, StockRequest.FrenchiseID, StockRequestDetails.Amount, StockRequestDetails.Qty, StockRequestDetails.MRP, StockRequestDetails.ProductID FROM          StockRequest INNER JOIN StockRequestDetails ON StockRequest.OrderID = StockRequestDetails.OrderId) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductID  where derivedtbl_1.OrderID='" + Request.QueryString["OrderID"].ToString() + "'";
                con.Open();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }

            else if (Name == "Mini Franchise")
            {
                cmd.CommandText = "SELECT     ProductRepurchase.ProductCode,ProductRepurchase.ProductName,ProductRepurchase.BV,(ProductRepurchase.SalesAmount)BranchPrice,(ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat) as PriceBeforVAT,((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)-((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)))UnitPrice,derivedtbl_1.Qty,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)) as TotalDP,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty*(ISNULL((ProductRepurchase.DiscountAmount),0)))) as Dis, ((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*(ProductRepurchase.Vat/100))VAT,(((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*ProductRepurchase.AddVat/100))AddVAT,(ProductRepurchase.BV*derivedtbl_1.Qty)TotalBV,(ProductRepurchase.SalesAmount*derivedtbl_1.Qty)asTotalPrice, ProductRepurchase.MRP,  derivedtbl_1.OrderID, derivedtbl_1.Status, derivedtbl_1.FrenchiseID, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN  (SELECT     StockRequest.OrderID, StockRequest.Status, StockRequest.FrenchiseID, StockRequestDetails.Amount, StockRequestDetails.Qty, StockRequestDetails.MRP, StockRequestDetails.ProductID FROM          StockRequest INNER JOIN StockRequestDetails ON StockRequest.OrderID = StockRequestDetails.OrderId) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductID  where derivedtbl_1.OrderID='" + Request.QueryString["OrderID"].ToString() + "'";
                con.Open();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }

            else
            {
                cmd.CommandText = "SELECT     ProductRepurchase.ProductCode,ProductRepurchase.ProductName,ProductRepurchase.BV,(ProductRepurchase.SalesAmount)BranchPrice,(ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat) as PriceBeforVAT,((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)-((ProductRepurchase.SalesAmount*100)/(100+ProductRepurchase.Vat+ProductRepurchase.AddVat)))UnitPrice,derivedtbl_1.Qty,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)) as TotalDP,((ProductRepurchase.SalesAmount*derivedtbl_1.Qty*(ISNULL((ProductRepurchase.DiscountAmount),0)))) as Dis, ((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*(ProductRepurchase.Vat/100))VAT,(((ProductRepurchase.SalesAmount*derivedtbl_1.Qty)*ProductRepurchase.AddVat/100))AddVAT,(ProductRepurchase.BV*derivedtbl_1.Qty)TotalBV,(ProductRepurchase.SalesAmount*derivedtbl_1.Qty)asTotalPrice, ProductRepurchase.MRP,  derivedtbl_1.OrderID, derivedtbl_1.Status, derivedtbl_1.FrenchiseID, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN  (SELECT     StockRequest.OrderID, StockRequest.Status, StockRequest.FrenchiseID, StockRequestDetails.Amount, StockRequestDetails.Qty, StockRequestDetails.MRP, StockRequestDetails.ProductID FROM          StockRequest INNER JOIN StockRequestDetails ON StockRequest.OrderID = StockRequestDetails.OrderId) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductID  where derivedtbl_1.OrderID='" + Request.QueryString["OrderID"].ToString() + "'";
                con.Open();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }


            cmd = new SqlCommand("select UserCode,UserName,(Select Address from tblFrenchiseMaster where FrenchiseID=(Select FrenchiseID from stockrequest where OrderID=" + Request.QueryString["OrderID"].ToString()+"))Address from tblMemberMaster where UserCode=(select MemberID from OrderMaster where OrderID='" + Request.QueryString["OrderID"].ToString() + "')", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblcustname.Text = dr["UserName"].ToString();
                lblcustaddr.Text = dr["Address"].ToString();
                lblMemberID.Text = dr["UserCode"].ToString();
               
            }
            dr.Close();
            dr.Dispose();
            cmd.CommandText = "Select FrenchiseId,OrderDate from stockrequest where OrderID=" + Request.QueryString["OrderID"].ToString();

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                lblinvoiceno.Text = Request.QueryString["OrderID"].ToString();
                lblFrenchiseId.Text = "Branch ID : " + dr["FrenchiseId"].ToString();
                lblDate.Text = dr["OrderDate"].ToString();
                 Session["Branch"]= dr["FrenchiseId"].ToString(); 
                
            }

            dr.Close();
            dr.Dispose();

            cmd.CommandText = "select  dbo.BWeightDetails('" + Request.QueryString["OrderID"].ToString() + "','" + Session["Branch"].ToString() + "') Weight";//[dbo].[BWeightDetails]
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //lblTotalBV.Text = dr["TotalBV"].ToString();
                //lblTotalPV.Text = dr["TotalPV"].ToString();
                lblTotalWeight.Text = dr["Weight"].ToString().Replace(".0000","");
                //  lblUplineDisID.Text = dr["SPID"].ToString()+"-"+dr["SPname"].ToString();

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
                Double qtyes = Double.Parse(e.Row.Cells[5].Text);
                Double taxes = (Double.Parse(e.Row.Cells[8].Text) + Double.Parse(e.Row.Cells[7].Text)) * (qtyes);
                Qty = Qty + Double.Parse(e.Row.Cells[5].Text);
                UnitPrice = UnitPrice + Double.Parse(e.Row.Cells[4].Text);
                TotalDP = TotalDP + Double.Parse(e.Row.Cells[6].Text);
                TotalTaxAmount = TotalTaxAmount + Double.Parse(e.Row.Cells[7].Text); 
                Total = Total + Double.Parse(e.Row.Cells[9].Text);
                TotalPrice = TotalPrice + Double.Parse(e.Row.Cells[10].Text);
                TTax = TTax + Double.Parse(e.Row.Cells[8].Text);
               // lblTotalTaxAmount.Text = string.Format("{0:f2}", (Double.Parse(e.Row.Cells[10].Text)) - (Double.Parse(e.Row.Cells[4].Text) * Double.Parse(e.Row.Cells[5].Text)));
               // lblnetprice.Text = string.Format("{0:f2}", (Double.Parse(e.Row.Cells[4].Text) * Double.Parse(e.Row.Cells[5].Text)));
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Total :";
               // e.Row.Cells[4].Text = string.Format("{0:f2}", UnitPrice);
                e.Row.Cells[5].Text = Qty.ToString();
               // e.Row.Cells[6].Text = string.Format("{0:f2}", TotalDP);
                e.Row.Cells[7].Text = string.Format("{0:f2}", TotalTaxAmount);
                e.Row.Cells[8].Text = string.Format("{0:f2}", TTax);
                e.Row.Cells[9].Text = string.Format("{0:f2}", Total);
                e.Row.Cells[10].Text = string.Format("{0:f2}", TotalPrice);

               // lblMoneyInWord.Text = NoToEng.changeNumericToWords(TotalPrice);
                lblNetProductValue.Text = TotalDP.ToString();
                lbltotalprice.Text = TotalPrice.ToString();
                lblAddvat.Text = TTax.ToString();
                lblTotalTaxAmount.Text = TotalTaxAmount.ToString();
                 
                
            }
        }

               
    }
}