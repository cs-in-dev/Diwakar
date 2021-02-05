using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WGRL._240578;
using WGRL._03032003;
using System.Globalization;


namespace mmart2.Store
{
    public partial class TransactionDetailsss : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Stock Transferred Details") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

           
        }

       

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        decimal Amount, MRP, BV, PV,Tpvs;
        protected void grd1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    decimal Price = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "SalesAmount"));
            //    decimal PAmount = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Vat"));
            //    decimal TPV = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "AddVat"));
            //    decimal MBV = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalDP"));
            //    decimal TBV = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalBV"));
            //  MRP += Price;
            //  Amount += PAmount;
            //  BV += MBV;
            //  PV += TPV;
            //  Tpvs += TBV;

             
            //  var lblmr = e.Row.FindControl("lblbranch");

              
           

             
           // }
            //if(e.Row.RowType==DataControlRowType.Footer)
            //{
            //    e.Row.Cells[2].Text="Total:";
            //    e.Row.Cells[4].Text = string.Format("{0:f2}", Double.Parse(MRP.ToString()));
            //    e.Row.Cells[5].Text = string.Format("{0:f2}",Double.Parse(Amount.ToString()));
            //    e.Row.Cells[6].Text = string.Format("{0:f2}", Double.Parse(PV.ToString()));
            //    e.Row.Cells[8].Text = string.Format("{0:f2}", Double.Parse(BV.ToString()));
            //    e.Row.Cells[7].Text = string.Format("{0:f2}", Double.Parse(Tpvs.ToString()));   
            
            //}

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //String fcheck = txtsearch.Text.Substring(0, 15);
            
            //try
                
            //{
            //    if (txtsearch.Text == "")
            //    {
            //        SqlDataAdapter da = new SqlDataAdapter("SELECT     ProductRepurchase.ProductID,ProductRepurchase.ProductName,ProductRepurchase.MRP*TransferQty as TotalMRP, ProductRepurchase.BV*TransferQty as TotalBV, ProductRepurchase.SalesAmount*TransferQty as TotalDP, derivedtbl_1.StoreID, derivedtbl_1.Date, derivedtbl_1.Particulars, derivedtbl_1.RecievedQty, derivedtbl_1.TransferQty, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN        (SELECT     ProductId, StoreID, Date, Particulars, RecievedQty, TransferQty, TXNID, InwardNo, TimeIn, VehicleNo, CompanyName, DCNo, DriversName, Amount,InwardDate    FROM   Inventory  WHERE      (StoreID = 'Admin') and Particulars Like '%Stock Transfer%') AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId  where cast(Date as Date)>='  strNewDate  ' and cast(Date as Date)<=' strdatet ' ", con);
            //        DataSet ds = new DataSet();
            //        da.Fill(ds);
            //        grd1.DataSource = ds.Tables[0];
            //        grd1.DataBind();

            //    }

               
                
            //    else if (txtsearch.Text != "" && date1.Text!="" && date2.Text!="")
            //    {
            //        if (date1.Text != "" && date1.Text != "")
            //        {
            //            string dateString = date1.Text;
            //            string format = "dd/mm/yyyy";
            //            DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
            //            string strNewDate = dateTime.ToString("yyyy-dd-mm");
            //            String datetwo = date2.Text;
            //            DateTime dateTimes = DateTime.ParseExact(datetwo, format, CultureInfo.InvariantCulture);
            //            string strdatet = dateTimes.ToString("yyyy-dd-mm");
            //            SqlDataAdapter da = new SqlDataAdapter("SELECT     ProductRepurchase.ProductID,ProductRepurchase.ProductName,ProductRepurchase.MRP*TransferQty as TotalMRP, ProductRepurchase.BV*TransferQty as TotalBV, ProductRepurchase.SalesAmount*TransferQty as TotalDP, derivedtbl_1.StoreID, derivedtbl_1.Date, derivedtbl_1.Particulars, derivedtbl_1.RecievedQty, derivedtbl_1.TransferQty, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN        (SELECT     ProductId, StoreID, Date, Particulars, RecievedQty, TransferQty, TXNID, InwardNo, TimeIn, VehicleNo, CompanyName, DCNo, DriversName, Amount,InwardDate    FROM   Inventory  WHERE      (StoreID = 'Admin') and Particulars Like '%Stock Transfer%') AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId   where cast(Date as Date)>='" + strNewDate + "' and  cast(Date as Date)<='" + strdatet + "' and Particulars Like '%Stock Transfer to " + txtsearch.Text + "%'", con);
            //            DataSet ds = new DataSet();
            //            da.Fill(ds);
            //            grd1.DataSource = ds.Tables[0];
            //            grd1.DataBind();
            //        }
                    

            //    }

               
                    
            //    else
            //    {
            //        if (date1.Text != "" && date1.Text != "")
            //        {
            //            string dateString = date1.Text;
            //            string format = "dd/mm/yyyy";
            //            DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
            //            string strNewDates = dateTime.ToString("yyyy-dd-mm");
            //            String datetwo = date2.Text;
            //            DateTime dateTimes = DateTime.ParseExact(datetwo, format, CultureInfo.InvariantCulture);
            //            string strdatets = dateTimes.ToString("yyyy-dd-mm");
            //            SqlDataAdapter da = new SqlDataAdapter("SELECT     ProductRepurchase.ProductID,ProductRepurchase.ProductName,ProductRepurchase.MRP*TransferQty as TotalMRP, ProductRepurchase.BV*TransferQty as TotalBV, ProductRepurchase.SalesAmount*TransferQty as TotalDP, derivedtbl_1.StoreID, derivedtbl_1.Date, derivedtbl_1.Particulars, derivedtbl_1.RecievedQty, derivedtbl_1.TransferQty, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN        (SELECT     ProductId, StoreID, Date, Particulars, RecievedQty, TransferQty, TXNID, InwardNo, TimeIn, VehicleNo, CompanyName, DCNo, DriversName, Amount,InwardDate    FROM   Inventory  WHERE      (StoreID = 'Admin') and Particulars Like '%Stock Transfer%') AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId   where   cast(Date as Date)>='" + strNewDates + "' and cast(Date as Date)<='" + strdatets + "'", con);
            //            DataSet ds = new DataSet();
            //            da.Fill(ds);
            //            grd1.DataSource = ds.Tables[0];
            //            grd1.DataBind();
            //        }
            //    }
            //}
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT     ProductRepurchase.ProductID,ProductRepurchase.ProductName,ProductRepurchase.MRP*TransferQty as TotalMRP, ProductRepurchase.BV*TransferQty as TotalBV, ProductRepurchase.SalesAmount*TransferQty as TotalDP, derivedtbl_1.StoreID, derivedtbl_1.Date, derivedtbl_1.Particulars, derivedtbl_1.RecievedQty, derivedtbl_1.TransferQty, derivedtbl_1.Amount FROM         ProductRepurchase INNER JOIN        (SELECT     ProductId, StoreID, Date, Particulars, RecievedQty, TransferQty, TXNID, InwardNo, TimeIn, VehicleNo, CompanyName, DCNo, DriversName, Amount,InwardDate    FROM   Inventory  WHERE      (StoreID = 'Admin') and Particulars Like '%Stock Transfer%') AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId  where cast(Date as Date)>='"+ date1.Text +"'  and cast(Date as Date)<='"+ date2.Text +"' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                grd1.DataSource = ds.Tables[0];
                grd1.DataBind();
            }
            catch
            {
                MsgBox("Try Again");

            }

           
            
           
                
            
        }
        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</Script>"));
        }
           

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("stockdetails.xls", this.grd1);
        }
    }
}