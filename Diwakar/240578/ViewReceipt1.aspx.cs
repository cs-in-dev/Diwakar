using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WGRL._03032003;

namespace Rainsonglobal._240578
{
    public partial class ViewReceipt1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;

        Double TotalDP = 0, TotalBV = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Search Order") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            cmd = new SqlCommand("", con);

            if (!IsPostBack)
            {
                getorder();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("OrderDetails.aspx?ID=" + GridView1.SelectedRow.Cells[0].Text);

            Response.Redirect("UpdateOrders.aspx?OrderID=" + GridView1.SelectedRow.Cells[1].Text);
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
                e.Row.Cells[3].Text = string.Format("{0:f0}", TotalDP);
                e.Row.Cells[4].Text = string.Format("{0:f0}", TotalBV);
            }

        }

        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    getorder(int.Parse(DropDownList1.SelectedValue));            
        //}



        //protected void getorder(int dropdownvalue)
        protected void getorder()
        {
            SqlCommand cmd = new SqlCommand("[dbo].[OrderReport]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@sts", dropdownvalue);
            if (!string.IsNullOrEmpty(date1.Text))
                cmd.Parameters.AddWithValue("@dateFrom", date1.Text);
            else
                cmd.Parameters.AddWithValue("@dateFrom", null);

            if (!string.IsNullOrEmpty(date2.Text))
                cmd.Parameters.AddWithValue("@dateTill", date2.Text);
            else
                cmd.Parameters.AddWithValue("@dateTill", null);

            if (!string.IsNullOrEmpty(txtMemberID.Text))
                cmd.Parameters.AddWithValue("@MemberId", txtMemberID.Text);
            else
                cmd.Parameters.AddWithValue("@MemberId", null);

            if (!string.IsNullOrEmpty(txtOrderID.Text))
                cmd.Parameters.AddWithValue("@OrderId", txtOrderID.Text);
            else
                cmd.Parameters.AddWithValue("@OrderId", null);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            // GridView2.DataSource = dt;
            GridView1.DataBind();
            //GridView2.DataBind();
            con.Close();
        }

        protected void LinkButto2_Click(object sender, EventArgs e)
        {

            LinkButton lbcancle = (LinkButton)sender;
            var id = (Label)lbcancle.FindControl("lblOid");
            int oid = int.Parse(id.Text.ToString());
            SqlCommand cmd = new SqlCommand("update ordermaster set status=2 where orderid='" + oid + "'", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                getorder();
                msgBox("Order delivered successfully");

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lbcancle = (LinkButton)sender;
            var id = (Label)lbcancle.FindControl("lblOid");
            int oid = int.Parse(id.Text.ToString());
            SqlCommand cmd = new SqlCommand("update ordermaster set status =3 where orderid='" + oid + "'", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                getorder();
                msgBox("Order cancelled successfully");

            }
        }



        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            //LinkButton ldispatch = (LinkButton)sender;
            //var id = (Label)ldispatch.FindControl("lblOid");
            //int oid = int.Parse(id.Text.ToString());


            LinkButton grd = (LinkButton)sender;
            var lblID = (Label)grd.FindControl("lblOid");
            int EID = int.Parse(lblID.Text.ToString());


            LinkButton grd1 = (LinkButton)sender;
            var lblID1 = (Label)grd1.FindControl("lblOid");
            int EID1 = int.Parse(lblID1.Text.ToString());

            //SqlCommand cmd = new SqlCommand("update ordermaster set status =1 where orderid='" + oid + "'", con);
            //con.Open();
            //int i = cmd.ExecuteNonQuery();
            //con.Close();
            //if (i > 0)
            //{
            //    //getorder(0);
            //    //msgBox("Order Dispached successfully");
            //    Response.Redirect("DispatchDetails.aspx?oId="+oid+"");


            //}

            //Response.Redirect("AddDispatchDetails.aspx?oId=" + oid + "");
            Response.Redirect("EditDispatchDetails.aspx?oId=" + EID1);
        }


        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("OrderList.xls", this.GridView1);
        }

        //protected void btnbystatus_Click(object sender, EventArgs e)
        //{
        //    txtMemberID.Text = "";
        //    txtOrderID.Text = "";
        //    getorder(int.Parse(DropDownList1.SelectedValue));
        //}

        protected void btnbymemberid_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "-1";
            date1.Text = "";
            date2.Text = "";
            txtOrderID.Text = "";
            SqlCommand cmd = new SqlCommand("SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails,[Date], [MemberID],case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts,case  when [status] = 0 or[status] = 1  then cast(1 as bit)else cast(0 as bit) End as stsvisible,case  when [status] = 0  then cast(1 as bit)  else cast(0 as bit) End as stsdisvisible, (select UserName from tblMemberMaster where UserCode =[MemberID]) [MemberName],'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where   (MemberID = @MemberID )  ORDER BY OrderId desc", con);

            cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            // GridView2.DataSource = dt;
            GridView1.DataBind();
            //GridView2.DataBind();
            con.Close();
        }

        protected void btnbyorderid_Click(object sender, EventArgs e)
        {

            DropDownList1.SelectedValue = "-1";
            date1.Text = "";
            date2.Text = "";
            txtMemberID.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201601'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails,[Date], [MemberID],case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts,case  when [status] = 0 or[status] = 1  then cast(1 as bit)else cast(0 as bit) End as stsvisible,case  when [status] = 0  then cast(1 as bit)  else cast(0 as bit) End as stsdisvisible, (select UserName from tblMemberMaster where UserCode =[MemberID]) [MemberName],'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where  (orderId = @OrderId ) and  MemberID in (select UserCode from tblMemberMaster where UserName!='Trail') ORDER BY OrderId desc", con);

            cmd.Parameters.AddWithValue("@OrderId", txtOrderID.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            //GridView2.DataSource = dt;
            GridView1.DataBind();
            //GridView2.DataBind();
            con.Close();
        }

        protected void btnstatus_Click(object sender, EventArgs e)
        {

            date1.Text = "";
            date2.Text = "";
            txtMemberID.Text = "";
            txtOrderID.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201601'  And InvoiceType='DP'  AND OrderId=@OrderId", con);
            SqlCommand cmd = new SqlCommand("", con);
            if (DropDownList1.SelectedValue == "10")
            {
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails,[Date], [MemberID],case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts,case  when [status] = 0 or[status] = 1  then cast(1 as bit)else cast(0 as bit) End as stsvisible,case  when [status] = 0  then cast(1 as bit)  else cast(0 as bit) End as stsdisvisible, (select UserName from tblMemberMaster where UserCode =[MemberID]) [MemberName],'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where MemberID in (select UserCode from tblMemberMaster where UserName!='Trail') ORDER BY OrderId desc";
            }
            else
            {
                cmd.CommandText = "SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails,[Date], [MemberID],case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts,case  when [status] = 0 or[status] = 1  then cast(1 as bit)else cast(0 as bit) End as stsvisible,case  when [status] = 0  then cast(1 as bit)  else cast(0 as bit) End as stsdisvisible, (select UserName from tblMemberMaster where UserCode =[MemberID]) [MemberName],'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where  (status = @status ) and  MemberID in (select UserCode from tblMemberMaster where UserName!='Trail')  ORDER BY OrderId desc";
                cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            // GridView2.DataSource = dt;
            GridView1.DataBind();
            // GridView2.DataBind();
            con.Close();
        }

        protected void btnbydate_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "-1";
            txtMemberID.Text = "";
            txtOrderID.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201601'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails,[Date], [MemberID],case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts,case  when [status] = 0 or[status] = 1  then cast(1 as bit)else cast(0 as bit) End as stsvisible,case  when [status] = 0  then cast(1 as bit)  else cast(0 as bit) End as stsdisvisible, (select UserName from tblMemberMaster where UserCode =[MemberID]) [MemberName],'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV FROM [OrderMaster] where  cast(Date as date)>=cast(@date1 as date) and cast(Date as date)<=cast(@date2 as date)  ORDER BY OrderId desc", con);

            cmd.Parameters.AddWithValue("@date1", date1.Text);
            cmd.Parameters.AddWithValue("@date2", date2.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            //GridView2.DataSource = dt;
            GridView1.DataBind();
            //GridView2.DataBind();
            con.Close();
        }


        protected void LinkButton1_Click2(object sender, EventArgs e)
        {

        }

        protected void linkdelete_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton11_Click1(object sender, EventArgs e)
        {
            //LinkButton grd = (LinkButton)sender;
            //var lblID = (Label)grd.FindControl("Label");
            //int EID = int.Parse(lblID.Text.ToString());


            //var frenchise = (Label)grd.FindControl("Label2");
            //String franchiseid = (frenchise.Text.ToString());

            LinkButton grd = (LinkButton)sender;
            var lblID = (Label)grd.FindControl("lblOid");
            int EID = int.Parse(lblID.Text.ToString());


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select [dbo].[Orderdate]('" + EID + "')";
            con.Open();
            int count = int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            if (count == 1)
            {
                Response.Redirect("AdminGstInvoice.aspx?ID=" + EID);
            }

            else
            {
                Response.Redirect("OrderDetails2.aspx?ID=" + EID);
            }


        }



        protected void btnproductcode_Click(object sender, EventArgs e)
        {
                     
            SqlCommand cmd = new SqlCommand("select [OrderID], ('OrderDetails2.aspx?ID='+cast(OrderID as nvarchar)) as ViewDetails, [Date], [MemberID], case [status] when 0 then 'Pending' when 1 then 'Dispatched' when 2 then 'Delivered' else 'Cancelled' End as sts, case when [status] = 0 or[status] = 1 then cast(1 as bit)else cast(0 as bit) End as stsvisible, case when [status] = 0 then cast(1 as bit) else cast(0 as bit) End as stsdisvisible, (select UserName from tblMemberMaster where UserCode =[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderId] as nvarchar) [UpdateOrder], (select isnull(sum(TotalDP),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalDP, (select isnull(sum(TotalBV),0) from orderdetails where orderdetails.orderid = OrderMaster.orderid) as TotalBV from ordermaster where OrderID in (select OrderID from OrderDetails where ProductID in (select ProductID from ProductRepurchase where ProductCode=@ProductCode))", con);

            cmd.Parameters.AddWithValue("@ProductCode", txtproductcode.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            con.Close();
        }

        protected void msgBox(string msg)
        {

            this.Page.Controls.Add(new LiteralControl("<script>alert('" + msg + "');</script>"));
        }
    }
}