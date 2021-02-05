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
    public partial class ViewOrdersFranchise : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;

        Double  TotalDP = 0, TotalBV = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            cmd = new SqlCommand("",con);
            
        }
               
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {           
            Response.Redirect("OrderDetails.aspx?ID=" + GridView1.SelectedRow.Cells[0].Text) ;
           
            Response.Redirect("UpdateOrders.aspx?OrderID=" + GridView1.SelectedRow.Cells[1].Text);
           
        }

        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    GridViewExportUtil.Export("Orders.xls", this.GridView1);
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (date1.Text != "" && date2.Text != "" && txtMemberID.Text == "" && txtOrderID.Text == "")
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where FrenchiseID = 'RSG201501' and memberid='"+Session["Usercode"].ToString()+"' AND cast(Date as date)>=cast('" + date1.Text + "' as date) and cast(Date as date)<=cast('" + date2.Text + "' as date) And InvoiceType='DP' ORDER BY OrderId ASC";
            else if (date1.Text != "" && date2.Text != "" && txtMemberID.Text != "" && txtOrderID.Text == "")
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where FrenchiseID = 'RSG201501' and memberid='" + Session["Usercode"].ToString() + "' AND cast(Date as date)>=cast('" + date1.Text + "' as date) and cast(Date as date)<=cast('" + date2.Text + "' as date) And InvoiceType='DP'  and MemberID like '%" + txtMemberID.Text + "%' ORDER BY OrderId ASC";
            else if (date1.Text != "" && date2.Text != "" && txtMemberID.Text != "" && txtOrderID.Text != "")
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where FrenchiseID = 'RSG201501' and memberid='" + Session["Usercode"].ToString() + "' AND cast(Date as date)>=cast('" + date1.Text + "' as date) and cast(Date as date)<=cast('" + date2.Text + "' as date) And InvoiceType='DP'  and MemberID like '%" + txtMemberID.Text + "%' and OrderId = " + txtOrderID.Text + " ORDER BY OrderId ASC";
            else if (txtOrderID.Text != "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text == "")
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM OrderMaster where FrenchiseID = 'RSG201501' and memberid='" + Session["Usercode"].ToString() + "' And InvoiceType='DP'  AND OrderId=" + txtOrderID.Text;
            else if (txtOrderID.Text != "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text != "")
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM OrderMaster where FrenchiseID = 'RSG201501' and memberid='" + Session["Usercode"].ToString() + "' And InvoiceType='DP'  AND MemberID='" + txtMemberID.Text + "' and OrderId=" + txtOrderID.Text;
            else if (txtOrderID.Text == "" && date1.Text == "" && date2.Text == "" && txtMemberID.Text != "")
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM OrderMaster where FrenchiseID = 'RSG201501' and memberid='" + Session["Usercode"].ToString() + "' And InvoiceType='DP'  AND MemberID='" + txtMemberID.Text + "'";
            else
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM OrderMaster WHERE FrenchiseID = 'RSG201501' and memberid='" + Session["Usercode"].ToString() + "' And InvoiceType='DP'  ORDER BY OrderId ASC";

            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                TotalDP = TotalDP + Double.Parse(e.Row.Cells[3].Text);
                TotalBV = TotalBV + Double.Parse(e.Row.Cells[4].Text);
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Total :";
                e.Row.Cells[3].Text = string.Format("{0:f2}", TotalDP);
                e.Row.Cells[4].Text = string.Format("{0:f0}", TotalBV);
            }
        }

   
    }
}