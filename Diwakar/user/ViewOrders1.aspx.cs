using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Rainsonglobal.user
{
    public partial class ViewOrders1 : System.Web.UI.Page
    {
        Double totalPayout = 0;
        Double totalBV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalBV += Double.Parse(e.Row.Cells[4].Text);
               // totalPayout += Double.Parse(e.Row.Cells[4].Text);

            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Grand Total:";
                e.Row.Cells[4].Text = totalBV.ToString().Replace(".0000", ".00");
              //  e.Row.Cells[4].Text = totalPayout.ToString().Replace(".0000", ".00");


            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // ResponseHelper.Redirect("~/User/PrintPayouts.aspx?ID=" + GridView1.SelectedDataKey[0].ToString(), "_blank", "menubar=0");

            //main //Response.Redirect("~/User/OrderDetails.aspx?ID=" + GridView1.SelectedDataKey[0].ToString());

            //Response.Write("<script type='text/javascript'>window.open('PrintPayouts.aspx?ID=" + GridView1.SelectedDataKey[0].ToString() + "','_blank');</script>");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton grd = (LinkButton)sender;
            var lblID = (Label)grd.FindControl("LblId");
            int EID = int.Parse(lblID.Text.ToString());
            var InvoiceType = (Label)grd.FindControl("InvoiceType");
            string Invoice = InvoiceType.Text.ToString();
            if (Invoice == "DP")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandText = "select [dbo].[Orderdate]('" + EID + "')";
                con.Open();
                int count = int.Parse(cmd.ExecuteScalar().ToString());
                con.Close();
                if (count == 1)
                {
                    Response.Redirect("~/User/GSTInvoice.aspx?ID=" + EID);
                }

                else
                {
                    Response.Redirect("~/User/OrderDetails2.aspx?ID=" + EID);
                }
            }
            else
            {
                Response.Redirect("~/User/Redemption_Invoice.aspx?ID=" + EID);
            }
        }

        protected void btnbydate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

            SqlCommand cmd = new SqlCommand("SELECT Sum(OrderDetails.TotalMRP)TotalMRP, Sum(OrderDetails.TotalPV)TotalPV, Sum(OrderDetails.TotalDP)TotalDP, Sum(OrderDetails.TotalBV)TotalBV,OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date)Date, OrderMaster.PayStatus,OrderMaster.InvoiceType, case OrderMaster.status when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts  FROM OrderDetails INNER JOIN OrderMaster ON OrderDetails.OrderID = OrderMaster.OrderID where cast(Date as date)>=cast(@date1 as date) and cast(Date as date)<=cast(@date2 as date) and memberid='" + Session["Usercode"] + "'group by OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date), OrderMaster.PayStatus,OrderMaster.InvoiceType, OrderMaster.Status order by cast(OrderMaster.PaymentDate as date) desc", con);

            cmd.Parameters.AddWithValue("@date1", date1.Text);
            cmd.Parameters.AddWithValue("@date2", date2.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            con.Close();
        }

        protected void btnbyorderid_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT Sum(OrderDetails.TotalMRP)TotalMRP, Sum(OrderDetails.TotalPV)TotalPV, Sum(OrderDetails.TotalDP)TotalDP, Sum(OrderDetails.TotalBV)TotalBV,OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date)Date, OrderMaster.PayStatus,OrderMaster.InvoiceType, case OrderMaster.status when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts  FROM OrderDetails INNER JOIN OrderMaster ON OrderDetails.OrderID = OrderMaster.OrderID where OrderMaster.OrderID=@OrderId group by OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date), OrderMaster.PayStatus,OrderMaster.InvoiceType, OrderMaster.Status order by cast(OrderMaster.PaymentDate as date) desc", con);
            cmd.Parameters.AddWithValue("@OrderId", txtOrderID.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            con.Close();
        }

        public void bind()

        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT Sum(OrderDetails.TotalMRP)TotalMRP, Sum(OrderDetails.TotalPV)TotalPV, Sum(OrderDetails.TotalDP)TotalDP, Sum(OrderDetails.TotalBV)TotalBV, OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date)Date, OrderMaster.PayStatus, OrderMaster.Status,OrderMaster.InvoiceType,case OrderMaster.status when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts FROM OrderDetails INNER JOIN OrderMaster ON OrderDetails.OrderID = OrderMaster.OrderID where OrderMaster.MemberID = @UserCode group by OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date), OrderMaster.PayStatus,OrderMaster.Status,OrderMaster.InvoiceType order by cast(OrderMaster.PaymentDate as date) desc", con);
            cmd.Parameters.AddWithValue("@UserCode", Session["usercode"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}