using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using WGRL._03032003; 

namespace SuperBusines
{
    public partial class AdminViewOrdersFranchise : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

           if(!IsPostBack)
            {
                getdata();
            }


        }
               
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
           
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /*Tell the compiler that the control is rendered
			 * explicitly by overriding the VerifyRenderingInServerForm event.*/
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
           

            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=Orders.xls");
            Response.ContentType = "application/excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("", con);
            if (date1.Text != "" && date2.Text != "" && txtMemberID.Text == "" && txtOrderID.Text == "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,OrderMaster.[Date],OrderMaster.DispatchStatus from[OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where cast(OrderMaster.[Date] as date)>=cast('" + date1.Text + "' as date) and cast(OrderMaster.[Date] as date)<=cast('" + date2.Text + "' as date) group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (date1.Text != "" && date2.Text != "" && txtMemberID.Text != "" && txtOrderID.Text == "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where cast(OrderMaster.[Date] as date)>=cast('" + date1.Text + "' as date) and cast(OrderMaster.[Date] as date)<=cast('" + date2.Text + "' as date) and  OrderMaster.memberid='" + txtMemberID.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (date1.Text != "" && date2.Text != "" && txtMemberID.Text != "" && txtOrderID.Text != "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from[OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where cast(OrderMaster.[Date] as date)>=cast('" + date1.Text + "' as date) and cast(OrderMaster.[Date] as date)<=cast('" + date2.Text + "' as date) and OrderDetails.OrderID='" + txtOrderID.Text + "' and OrderMaster.memberid='" + txtMemberID.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (txtOrderID.Text != "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text == "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where OrderDetails.OrderID='" + txtOrderID.Text + "'  group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (txtOrderID.Text == "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text == "" && txtfrnid.Text != "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where  OrderMaster.FrenchiseID='" + txtfrnid.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (txtOrderID.Text == "" && date1.Text != "" && date2.Text != "" && txtMemberID.Text == "" && txtfrnid.Text != "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from[OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where cast(OrderMaster.[Date] as date)>=cast('" + date1.Text + "' as date) and cast(OrderMaster.[Date] as date)<=cast('" + date2.Text + "' as date) and  OrderMaster.memberid='" + txtfrnid.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (txtOrderID.Text != "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text != "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where OrderDetails.OrderID='" + txtOrderID.Text + "' and OrderMaster.memberid='" + txtMemberID.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (txtOrderID.Text == "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text != "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where OrderMaster.memberid='" + txtMemberID.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else if (txtOrderID.Text != "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text == "" && txtfrnid.Text == "")
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID, OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name,OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid where OrderDetails.OrderID='" + txtOrderID.Text + "' group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";
            else
                cmd.CommandText = "select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID,OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name, OrderMaster.[Date],OrderMaster.DispatchStatus from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.DispatchStatus,ordermaster.PayStatus";

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
            //(case when BranchInvoiceNo=0 Then 'Bill NOT GENERATED'  Else cast(BranchInvoiceNo as Varchar) END)BillNo,
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton grd = (LinkButton)sender;
            var lblID = (Label)grd.FindControl("Label1");
            int EID = int.Parse(lblID.Text.ToString());


            var frenchise = (Label)grd.FindControl("Label2");
            String franchiseid = (frenchise.Text.ToString());

           

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select [dbo].[Orderdate]('" + EID + "')";
            con.Open();
            int count = int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            if (count == 1)
            {
                Response.Redirect("AdminGstInvoice.aspx?ID=" + EID + "&franchiseid=" + franchiseid);
            }

            else
            {
                Response.Redirect("Orderdetails2.aspx?ID=" + EID + "&franchiseid=" + franchiseid);
            }
        }

        protected void msgbox(string msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + msg + "');</script>"));
        }

        protected void linkdelete_Click(object sender, EventArgs e)
        {
            LinkButton grd = (LinkButton)sender;
            var lblID = (Label)grd.FindControl("Label1");
            int EID = int.Parse(lblID.Text.ToString());

            SqlCommand cmd = new SqlCommand("[dbo].[DeleteOrders]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@OID", EID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            msgbox("Order Delete Succesfully");
            getdata();
        }

        public void getdata()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select OrderDetails.orderid,cASE when ordermaster.PayStatus = 0 THEN CAST(1 as bit) ELSE CAST(0 as bit) END AS VisiblleLinks,sum(OrderDetails.totalmrp) as totalmrp, sum(OrderDetails.qty) as qty , sum(OrderDetails.totaldp) as totaldp , sum(OrderDetails.totalbv) as totalbv,[dbo].getorderdate(OrderDetails.OrderID) as orderdate, OrderMaster.FrenchiseID,OrderMaster.memberid,[dbo].[GetMemberName](OrderMaster.memberid) as Name, OrderMaster.[Date] from [OrderMaster] INNER JOIN OrderDetails ON OrderDetails.orderid = OrderMaster.orderid group by OrderDetails.OrderID,OrderMaster.FrenchiseID,OrderMaster.Date,OrderMaster.memberid,OrderMaster.PayStatus", con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }
    }
}