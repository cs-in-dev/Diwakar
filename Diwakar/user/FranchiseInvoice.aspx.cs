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

namespace Rexima.Franchise12
{
    public partial class FranchiseInvoice : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        Double Qty = 0, TotalTaxAmount = 0, TotalDP = 0, TotalPP =0, Total = 0, UnitPrice = 0, TotalPrice = 0, Bv = 0, TotalAddtax = 0, Tottax = 0, Qty2 = 0, tax2 = 0, Totalweight=0;


        Double GrossAmt = 0;
        NumberToEnglish NoToEng = new NumberToEnglish();
        protected void Page_Load(object sender, EventArgs e)
        {


           
            string FrenchiseId = "";
            string msg = Request.QueryString["ID"].ToString();
            cmd = new SqlCommand("select t.*,t.Loginname from tblMemberMaster t ,OrderMaster o where t.UserCode=(select MemberID from OrderMaster where  OrderID=" + Request.QueryString["ID"].ToString() + ")", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label1.Text = dr["Loginname"].ToString();
                Label2.Text = dr["UserName"].ToString();
                Label5.Text = dr["mobileno"].ToString();
                Label3.Text = dr["address"].ToString();
                Label4.Text = dr["city"].ToString();
               // Label10.Text = dr["ShippingAddress"].ToString();

            }
            dr.Close();
            dr.Dispose();



            //cmd.CommandText = "Select FrenchiseId,Convert(varchar(10),Date,103) as date2,[dbo].[GetInvoice](OrderID) as Type,ISNULL(CourierCharges,0)CourierCharges from OrderMaster where OrderID=" + Request.QueryString["ID"].ToString();
            //dr = cmd.ExecuteReader();
            //while (dr.Read())
            //{
            //    //Label12.Text = string.Format("{0:f2}", Convert.ToDouble(dr["CourierCharges"].ToString()));
            //    Label6.Text = Request.QueryString["ID"].ToString();
            //    ////  lblFrenchiseID.Text = "Branch ID : " + dr["FrenchiseId"].ToString();
            //    Label7.Text = dr["date2"].ToString();

            //    FrenchiseId = dr["FrenchiseId"].ToString();
            //    hhdinvoice.Value = dr["Type"].ToString();
            //    lblinvoiceType.Text = dr["Type"].ToString();
            //}

            //dr.Close();
            //dr.Dispose();


            //cmd.CommandText = "Select Address from tblFrenchiseMaster where FrenchiseId='" + FrenchiseId + "'";
            //dr = cmd.ExecuteReader();
            //while (dr.Read())
            //{
            //    // lblcustaddr.Text = dr["Address"].ToString();

            //}

            //dr.Close();
            //dr.Dispose();


            //try
            //{
            //    SqlCommand cmd11 = new SqlCommand("select username from tblmembermaster where usercode='" + FrenchiseId + "'", con);
            //    con.Open();
            //    string a = cmd11.ExecuteScalar().ToString();
            //    con.Close();


            //    SqlCommand cmd21 = new SqlCommand("select paymentmode from [dbo].[OrderMaster] where FrenchiseId='" + FrenchiseId + "' and  OrderID='" + Request.QueryString["ID"].ToString() + "'", con);
            //    con.Open();
            //    string paymentmode = cmd21.ExecuteScalar().ToString();
            //    con.Close();

            //}

            //catch (Exception ex)
            //{

            //}



            //SqlCommand cmd1 = new SqlCommand("select * from [dbo].[tblFrenchiseMaster] where FrenchiseID='" + FrenchiseId + "'", con);

            //SqlDataReader dr1 = cmd1.ExecuteReader();
            //while (dr1.Read())
            //{
            //    Label8.Text = FrenchiseId;
            //    Label9.Text = dr1["FranchiseName"].ToString();
            //    Label11.Text = dr1["name"].ToString();

            //}
            //dr1.Close();



            SqlCommand cmd2 = new SqlCommand("SELECT Product.ID Code,isnull(Product.Gtin,0),isnull(Product.Gtin,0) as pp ,isnull(Product.Gtin,0)*OrderDetails.Qty as totalPP,[dbo].[GETTax_Ecommerce](Product.ID)*OrderDetails.Qty as totalvat,Product.ID,[dbo].[GETTax_Ecommerce](Product.ID) as vat, Product.Name,Product.Price, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV, OrderDetails.TAX,OrderDetails.TotalBV, ((Product.Price*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.', OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*(([dbo].[GETTax_Ecommerce](Product.ID))/100))as myvat, (Product.Price*OrderDetails.Qty)TotalMRP, (OrderDetails.TotalDP ) 'Total Price' FROM OrderDetails INNER JOIN Product ON OrderDetails.ProductID = Product.ID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where  OrderMaster.OrderId='" + msg + "' and FrenchiseID = '" + FrenchiseId + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet dt = new DataSet();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (hhdinvoice.Value == "DP")
            {
                GridView1.Columns[3].Visible = false;
                GridView1.Columns[6].Visible = false;
                GridView1.Columns[11].Visible = false;
                GridView1.Columns[13].Visible = false;

            }
            else if (hhdinvoice.Value == "MRP")
            {
                GridView1.Columns[5].Visible = false;
 
                GridView1.Columns[10].Visible = false;
                GridView1.Columns[12].Visible = false;
                GridView1.Columns[4].Visible = false;

            }



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
                Qty2 = Qty2 + Double.Parse(e.Row.Cells[6].Text);
                UnitPrice = UnitPrice + Double.Parse(e.Row.Cells[9].Text);
                TotalDP = TotalDP + Double.Parse(e.Row.Cells[10].Text);
                TotalTaxAmount = TotalTaxAmount + Double.Parse(e.Row.Cells[9].Text);
                TotalPrice = TotalPrice + Double.Parse(e.Row.Cells[11].Text);
                // lblTotalTaxAmount.Text = string.Format("{0:f2}", (Double.Parse(lblTotalTaxAmount.Teext)));
                GrossAmt = GrossAmt + Double.Parse(e.Row.Cells[13].Text);
                TotalPP = TotalPP + Double.Parse(e.Row.Cells[12].Text);
                tax2 = tax2 + Double.Parse(e.Row.Cells[13].Text);
                //tax3 = tax2 * Qty2;
                Bv = Bv + Double.Parse(e.Row.Cells[10].Text);

            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {

                e.Row.Cells[2].Text = "Total:";
                e.Row.Cells[10].Text = string.Format("{0:f2}", TotalDP);
                // e.Row.Cells[6].Text = Qty.ToString();
                e.Row.Cells[11].Text = string.Format("{0:f0}", TotalDP);
                e.Row.Cells[9].Text = string.Format("{0:f2}", TotalTaxAmount);
                e.Row.Cells[11].Text = string.Format("{0:f2}", TotalPrice);
                e.Row.Cells[13].Text = string.Format("{0:f2}", tax2);
                e.Row.Cells[12].Text = string.Format("{0:f2}", TotalPP);

            }




        }
    }
}