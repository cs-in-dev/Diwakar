using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using WGRL.Franchise;
using System.Data;

namespace Sabaic.user
{
    public partial class GSTInvoice : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        Double Qty = 0, CGST = 0, SGST = 0, IGST = 0, TotalTaxAmount = 0, TotalDP = 0, Total = 0, UnitPrice = 0, TotalPrice = 0, Bv = 0, TotalAddtax = 0, Tottax = 0, Qty2 = 0, tax2 = 0, Totalweight = 0,CashBack=0, TotalRP=0;


        Double GrossAmt = 0;
        NumberToEnglish NoToEng = new NumberToEnglish();
        protected void Page_Load(object sender, EventArgs e)
        {


            // GridView1.Columns[12].Visible = false;
            string FrenchiseId = "";
            string msg = Request.QueryString["ID"].ToString();
            cmd = new SqlCommand("select * from tblMemberMaster where UserCode=(select MemberID from OrderMaster where   OrderID=" + Request.QueryString["ID"].ToString() + ")", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label1.Text = dr["usercode"].ToString();
                Label2.Text = dr["UserName"].ToString();
                Label5.Text = dr["mobileno"].ToString();
                Label3.Text = dr["address"].ToString();
                Label4.Text = dr["city"].ToString();
                lblsate.Text = dr["State"].ToString();

            }
            dr.Close();
            dr.Dispose();



            cmd.CommandText = "Select FrenchiseId,Convert(varchar(10),Date,103) as date2,ISNULL(CourierCharges,0)CourierCharges from OrderMaster where OrderID=" + Request.QueryString["ID"].ToString();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //Label12.Text = string.Format("{0:f2}", Convert.ToDouble(dr["CourierCharges"].ToString()));
                Label6.Text = Request.QueryString["ID"].ToString();
                ////  lblFrenchiseID.Text = "Branch ID : " + dr["FrenchiseId"].ToString();
                Label7.Text = dr["date2"].ToString();
                FrenchiseId = dr["FrenchiseId"].ToString();
            }

            dr.Close();
            dr.Dispose();


            cmd.CommandText = "Select Address from tblFrenchiseMaster where FrenchiseId='" + FrenchiseId + "'";
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                // lblcustaddr.Text = dr["Address"].ToString();

            }

            dr.Close();
            dr.Dispose();


            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd21 = new SqlCommand("select paymentmode from [dbo].[OrderMaster] where FrenchiseId='" + FrenchiseId + "' and  OrderID='" + Request.QueryString["ID"].ToString() + "'", con);
                con.Open();
                string paymentmode = cmd21.ExecuteScalar().ToString();
                con.Close();

                lblpaymentmode.Text = paymentmode; 
                SqlCommand cmd11 = new SqlCommand("select username from tblmembermaster where usercode='" + FrenchiseId + "'", con);
                con.Open();
                string a = cmd11.ExecuteScalar().ToString();
                con.Close();
                
            }

            catch (Exception ex)
            {

            }
            
            SqlCommand cmd1 = new SqlCommand("select * from [dbo].[tblFrenchiseMaster] where FrenchiseID='" + FrenchiseId + "'", con);

            SqlDataReader dr1 = cmd1.ExecuteReader();
            while (dr1.Read())
            {
                Label8.Text = FrenchiseId;
                Label9.Text = dr1["FranchiseName"].ToString();
                Label11.Text = dr1["name"].ToString();

            }
            dr1.Close();
            con.Close();


            //SqlCommand cmd12 = new SqlCommand("select State from tblmembermaster where usercode='" + Label1.Text + "'", con);
            //con.Open();
            //string State = cmd12.ExecuteScalar().ToString();
            //con.Close();

            if (lblsate.Text == "UTTAR PRADESH" || lblsate.Text == "UP" || lblsate.Text == "Uttar Pradesh")
            {
                SqlCommand cmd2 = new SqlCommand("SELECT ProductRepurchase.ProductCode Code,OrderDetails.CGST as CGS,OrderDetails.SGST as SGS,OrderDetails.TotalDiscount as TotalDiscount,OrderDetails.IGST as IGS,ProductRepurchase.productid,ProductRepurchase.ProductName, cast(ProductRepurchase.RedemptionPoints as Decimal(18,2)) as RP,(CAST(ProductRepurchase.RedemptionPoints as decimal(18,2))*OrderDetails.Qty) as [Total RP], ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, OrderDetails.TotalMRP Value, (OrderDetails.IGST*OrderDetails.Qty)TotalIGST,(OrderDetails.SGST*OrderDetails.Qty)TotalSGST,(OrderDetails.CGST*OrderDetails.Qty)TotalCGST, (ProductRepurchase.SalesAmount*OrderDetails.Qty-ProductRepurchase.DiscountAmount)TotalMRP, (OrderMaster.Amount ) 'Total Price',ProductRepurchase.CashBack FROM OrderDetails INNER JOIN ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.OrderId='" + msg + "' and FrenchiseID = '" + FrenchiseId + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd2);
                DataSet dt = new DataSet();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            else
            {
                SqlCommand cmd2 = new SqlCommand("SELECT ProductRepurchase.ProductCode Code,OrderDetails.CGST as CGS,OrderDetails.SGST as SGS,OrderDetails.TotalDiscount as TotalDiscount,OrderDetails.IGST as IGS,ProductRepurchase.productid,ProductRepurchase.ProductName, cast(ProductRepurchase.RedemptionPoints as Decimal(18,2)) as RP,(CAST(ProductRepurchase.RedemptionPoints as decimal(18,2))*OrderDetails.Qty) as [Total RP], ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, OrderDetails.TotalMRP Value, (OrderDetails.IGST*OrderDetails.Qty)TotalIGST,(OrderDetails.SGST*OrderDetails.Qty)TotalSGST,(OrderDetails.CGST*OrderDetails.Qty)TotalCGST, (ProductRepurchase.SalesAmount*OrderDetails.Qty-ProductRepurchase.DiscountAmount)TotalMRP, (OrderMaster.Amount ) 'Total Price',ProductRepurchase.CashBack FROM OrderDetails INNER JOIN ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.OrderId='" + msg + "' and FrenchiseID = '" + FrenchiseId + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd2);
                DataSet dt = new DataSet();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            GridView1.Columns[12].Visible = false;
            GridView1.Columns[13].Visible = false;
            GridView1.Columns[14].Visible = false;
            GridView1.Columns[15].Visible = false;
        }


        protected void PrintButton_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = Panel1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");

        }
        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            GridView1.Columns[12].Visible = true;
            GridView1.Columns[13].Visible = true;
            GridView1.Columns[14].Visible = true;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Qty = Qty + Double.Parse(e.Row.Cells[9].Text);
                Qty2 = Qty2 + Double.Parse(e.Row.Cells[9].Text);
                UnitPrice = UnitPrice + Double.Parse(e.Row.Cells[10].Text);
                TotalTaxAmount = TotalTaxAmount + Double.Parse(e.Row.Cells[8].Text);
                TotalPrice = TotalPrice + Double.Parse(e.Row.Cells[11].Text);
                GrossAmt = GrossAmt + Double.Parse(e.Row.Cells[11].Text);
                tax2 = tax2 + Double.Parse(e.Row.Cells[12].Text);
                Bv = Bv + Double.Parse(e.Row.Cells[9].Text);
                //CashBack = CashBack + Double.Parse(e.Row.Cells[15].Text);

                IGST = IGST + Double.Parse(e.Row.Cells[13].Text);
                SGST = SGST + Double.Parse(e.Row.Cells[14].Text);
                CGST = CGST + Double.Parse(e.Row.Cells[15].Text);
                TotalRP= TotalRP + Double.Parse(e.Row.Cells[16].Text);



            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                
                e.Row.Cells[11].Text = string.Format("{0:f2}", TotalPrice);
                //e.Row.Cells[9].Text = string.Format("{0:f2}", Bv);
                e.Row.Cells[16].Text= string.Format("{0:f2}", TotalRP);
                lblamount.Text = string.Format("{0:f2}", TotalPrice);
                lblTotalCGST.Text = string.Format("{0:f2}", CGST);
                lblTotalSGST.Text = string.Format("{0:f2}", SGST);
                lblTotalIGST.Text = string.Format("{0:f2}", IGST);
                //Double NetPay = CGST + SGST + IGST + TotalPrice;
                lblGrandTotal.Text = string.Format("{0:f2}", GrossAmt);
                
                ////Double Courch = Double.Parse((Label12.Text).ToString().Replace(".0000", ".00"));
                ////Double NetPay = Tottax + TotalPrice + Courch;
                //Label10.Text = string.Format("{0:f2}", tax2);

                //Label14.Text = (GrossAmt).ToString();
                ////Label13.Text = TotalPrice.ToString();
                ////Label14.Text = (TotalPrice + Courch + tax2).ToString();
                //////  bvdiscountamount.Text = "0.00";
                ////lblamountinword.Text = NoToEng.changeNumericToWords(Double.Parse(lblTotalPayment.Text)) + " Rupees Only.";
            }



        }
    }
}