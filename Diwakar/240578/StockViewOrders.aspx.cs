using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using WGRL._240578;
using WGRL._03032003; 

namespace SuperBusines
{
    public partial class Stockdetails : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        //SqlCommand cmd=new SqlCommand();
        decimal Amount, Amounts = 0, ADDVATS = 0, Vats = 0, Amountsss=0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Search Stock") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

            //cmd = new SqlCommand("",con);
            
        }
               
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("OrderDetails.aspx?ID=" + GridView1.SelectedRow.Cells[0].Text);
            Response.Redirect("EditOrderDetails.aspx?OrderID=" + GridView1.SelectedRow.Cells[0].Text);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("Orders.xls", this.GridView1);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd=new SqlCommand("",con);
            if (date1.Text != "" && date2.Text != "" && txtproduct.Text == "" && txtbill.Text == "")
                cmd.CommandText = "SELECT   derivedtbl_1.Date,ProductRepurchase.ProductCode, ProductRepurchase.ProductName,ProductRepurchase.CategoryID, derivedtbl_1.RecievedQty,(derivedtbl_1.Amount*VehicleNo/100)VAT,Cast(derivedtbl_1.Amount/derivedtbl_1.RecievedQty as money)Rate,(derivedtbl_1.Amount*DriversName/100)AddVat,Cast((derivedtbl_1.Amount*DriversName/100)+(derivedtbl_1.Amount*VehicleNo/100)+derivedtbl_1.Amount as money)Amountss,  derivedtbl_1.Amount, derivedtbl_1.InvoiceNo,derivedtbl_1.InwardNo, derivedtbl_1.CompanyName, derivedtbl_1.Particulars,derivedtbl_1.InwardDate FROM          ProductRepurchase INNER JOIN (SELECT     ProductId , Date, RecievedQty, Amount, ISNULL(InwardNo, 0) AS InwardNo,ISNULL(DCNo,0)InvoiceNo,ISNULL(VehicleNo,0)VehicleNo,  ISNULL(DriversName,0)DriversName, CompanyName, Particulars,InwardDate FROM  Inventory WHERE   (Particulars = 'Stock Recieved')) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId and Cast(Date as Date)>='" + date1.Text + "' And Cast(Date as Date)<='" + date2.Text + "'";
            else if (date1.Text != "" && date2.Text != "" && txtproduct.Text != "" && txtbill.Text == "")
                cmd.CommandText = "SELECT   derivedtbl_1.Date,ProductRepurchase.ProductCode, ProductRepurchase.ProductName,ProductRepurchase.CategoryID, derivedtbl_1.RecievedQty,(derivedtbl_1.Amount*VehicleNo/100)VAT,Cast(derivedtbl_1.Amount/derivedtbl_1.RecievedQty as money)Rate,(derivedtbl_1.Amount*DriversName/100)AddVat, Cast((derivedtbl_1.Amount*DriversName/100)+(derivedtbl_1.Amount*VehicleNo/100)+derivedtbl_1.Amount as money)Amountss, derivedtbl_1.Amount, derivedtbl_1.InvoiceNo,derivedtbl_1.InwardNo, derivedtbl_1.CompanyName, derivedtbl_1.Particulars,derivedtbl_1.InwardDate FROM          ProductRepurchase INNER JOIN (SELECT     ProductId , Date, RecievedQty, Amount, ISNULL(InwardNo, 0) AS InwardNo,ISNULL(DCNo,0)InvoiceNo,ISNULL(VehicleNo,0)VehicleNo,  ISNULL(DriversName,0)DriversName, CompanyName, Particulars,InwardDate FROM  Inventory WHERE   (Particulars = 'Stock Recieved')) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId and Cast(Date as Date)>='" + date1.Text + "' And Cast(Date as Date)<='" + date2.Text + "' and ProductRepurchase.ProductCode like '%" + txtproduct.Text + "%' ORDER BY [Date] DESC";
            else if (date1.Text != "" && date2.Text != "" && txtproduct.Text == "" && txtbill.Text != "")
                cmd.CommandText = "SELECT   derivedtbl_1.Date,ProductRepurchase.ProductCode, ProductRepurchase.ProductName,ProductRepurchase.CategoryID, derivedtbl_1.RecievedQty,(derivedtbl_1.Amount*VehicleNo/100)VAT,Cast(derivedtbl_1.Amount/derivedtbl_1.RecievedQty as money)Rate,(derivedtbl_1.Amount*DriversName/100)AddVat, Cast((derivedtbl_1.Amount*DriversName/100)+(derivedtbl_1.Amount*VehicleNo/100)+derivedtbl_1.Amount as money)Amountss, derivedtbl_1.Amount, derivedtbl_1.InvoiceNo,derivedtbl_1.InwardNo, derivedtbl_1.CompanyName, derivedtbl_1.Particulars,derivedtbl_1.InwardDate FROM          ProductRepurchase INNER JOIN (SELECT     ProductId , Date, RecievedQty, Amount, ISNULL(InwardNo, 0) AS InwardNo,ISNULL(DCNo,0)InvoiceNo,ISNULL(VehicleNo,0)VehicleNo,  ISNULL(DriversName,0)DriversName, CompanyName, Particulars,InwardDate FROM  Inventory WHERE   (Particulars = 'Stock Recieved')) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId and Cast(Date as Date)>='" + date1.Text + "' And Cast(Date as Date)<='" + date2.Text + "' and ProductRepurchase.ProductCode like '%" + txtproduct.Text + "%' and derivedtbl_1.Invoice=" + txtbill.Text + " ORDER BY [Date] DESC";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                
                decimal Vat = Decimal.Parse(DataBinder.Eval(e.Row.DataItem, "Vat").ToString());
                decimal ADDVAT = Decimal.Parse(DataBinder.Eval(e.Row.DataItem, "ADDVAT").ToString());
                decimal Amount = Decimal.Parse(DataBinder.Eval(e.Row.DataItem, "Amount").ToString());
                decimal Amountss = Decimal.Parse(DataBinder.Eval(e.Row.DataItem, "Amountss").ToString());



                Amounts += Amount;
                ADDVATS += ADDVAT;
                Vats += Vat;
                Amountsss += Amountss;
                
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Total:";

                e.Row.Cells[8].Text = Math.Round(Vats, 2).ToString();
                e.Row.Cells[9].Text = Math.Round(ADDVATS, 2).ToString();
                e.Row.Cells[10].Text = Math.Round(Amounts, 2).ToString();
                e.Row.Cells[11].Text = Math.Round(Amountsss, 2).ToString();
                


            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("stockdetails.xls", this.GridView1);
        }
             
    }
}