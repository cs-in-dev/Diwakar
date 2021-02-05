using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using WGRL._240578;
using WGRL._03032003;
using System.Data;

namespace Rainsonglobal._240578
{
    public partial class OrderPayment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Order Payment Details") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            cmd = new SqlCommand("", con);

            if (!IsPostBack)
            {
                getorder("Cash");
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("OrderPaymentDetails.xls", this.GridView1);
        }

        protected void btnsearchbypaymentmode_Click(object sender, EventArgs e)
        {

            date1.Text = "";
            date2.Text = "";
            txtMemberID.Text = "";
            txtOrderID.Text = "";
            txtpaymentdatefrom.Text = "";
            txtpaymentdatetill.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201501'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            if (DropDownList1.SelectedValue == "All")
            {
                getorder("Cash");
            }

            else
            {
                SqlCommand cmd = new SqlCommand("SELECT OrderID,Date,MemberID,Paymentmode,Referencenumber,Impsdate,PaymentDate,case PayStatus when  1 then 'Paid' else 'Unpaid' end as PayStatus ,case  when ([PayStatus] = 0 and [status] !=3) then cast(1 as bit)  else cast(0 as bit) End as stsvisible,case  when ([PayStatus] = 0 and [status] !=3 ) then cast(1 as bit)  else cast(0 as bit) End as stsvisible1,case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts, ChequeNo,ChequeDate,(select username from tblmembermaster where usercode=MemberID) as Name,Amount  from ordermaster where paymentmode=@PaymentMode order by orderid desc ", con);

                cmd.Parameters.AddWithValue("@PaymentMode", DropDownList1.SelectedValue);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void btnbyDate_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Select";
            txtMemberID.Text = "";
            txtOrderID.Text = "";
            txtpaymentdatefrom.Text = "";
            txtpaymentdatetill.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201501'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT OrderMaster.OrderID,OrderMaster.Date,OrderMaster.MemberID,OrderMaster.Paymentmode,OrderMaster.Referencenumber,OrderMaster.Impsdate,OrderMaster.PaymentDate,OrderMaster.PaymentDate, case OrderMaster.PayStatus when 1 then 'Paid' else 'Unpaid' end as PayStatus ,case when (PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible,case when (OrderMaster.PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible1,case OrderMaster.[status] when 0 then 'Pending' when 1 then 'Dispatched' when 2 then 'Delivered' else 'Cancelled' End as sts, OrderMaster.Amount ,OrderMaster.ChequeNo,OrderMaster.ChequeDate, tblMemberMaster.UserName from tblMemberMaster inner join OrderMaster on OrderMaster.MemberID=tblMemberMaster.UserCode where tblMemberMaster.UserName!='Trail' and cast(Date as date)>=cast(@date1 as date) and cast(Date as date)<=cast(@date2 as date) order by OrderMaster.OrderID desc", con);

            cmd.Parameters.AddWithValue("@date1", date1.Text);
            cmd.Parameters.AddWithValue("@date2", date2.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void btnbymemberid_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Select";
            date1.Text = "";
            date2.Text = "";
            txtOrderID.Text = "";
            txtpaymentdatefrom.Text = "";
            txtpaymentdatetill.Text = "";
           
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201501'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT OrderMaster.OrderID,OrderMaster.Date,OrderMaster.MemberID,OrderMaster.Paymentmode,OrderMaster.Referencenumber,OrderMaster.Impsdate,OrderMaster.PaymentDate,OrderMaster.PaymentDate, case OrderMaster.PayStatus when 1 then 'Paid' else 'Unpaid' end as PayStatus ,case when (PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible,case when (OrderMaster.PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible1,case OrderMaster.[status] when 0 then 'Pending' when 1 then 'Dispatched' when 2 then 'Delivered' else 'Cancelled' End as sts, OrderMaster.Amount ,OrderMaster.ChequeNo,OrderMaster.ChequeDate, tblMemberMaster.UserName from tblMemberMaster inner join OrderMaster on OrderMaster.MemberID=tblMemberMaster.UserCode where tblMemberMaster.UserName!='Trail' and memberid=@MemberID order by OrderMaster.OrderID desc  ", con);

            cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void getorder(string dropdownvalue)
        {
            SqlCommand cmd = new SqlCommand("SELECT OrderMaster.OrderID,OrderMaster.Date,OrderMaster.MemberID,OrderMaster.Paymentmode,OrderMaster.Referencenumber,OrderMaster.Impsdate,OrderMaster.PaymentDate,OrderMaster.PaymentDate, case OrderMaster.PayStatus when 1 then 'Paid' else 'Unpaid' end as PayStatus ,case when (PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible,case when (OrderMaster.PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible1,case OrderMaster.[status] when 0 then 'Pending' when 1 then 'Dispatched' when 2 then 'Delivered' else 'Cancelled' End as sts, OrderMaster.Amount ,OrderMaster.ChequeNo,OrderMaster.ChequeDate, tblMemberMaster.UserName from tblMemberMaster inner join OrderMaster on OrderMaster.MemberID=tblMemberMaster.UserCode where tblMemberMaster.UserName!='Trail' order by OrderMaster.OrderID desc ", con);
           
            cmd.Parameters.AddWithValue("@PaymentMode", dropdownvalue);
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void btnbyorderid_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Select";
            date1.Text = "";
            date2.Text = "";
            txtMemberID.Text = "";
            txtpaymentdatefrom.Text = "";
            txtpaymentdatetill.Text = "";

            SqlCommand cmd = new SqlCommand("SELECT OrderMaster.OrderID,OrderMaster.Date,OrderMaster.MemberID,OrderMaster.Paymentmode,OrderMaster.Referencenumber,OrderMaster.Impsdate,OrderMaster.PaymentDate,OrderMaster.PaymentDate, case OrderMaster.PayStatus when 1 then 'Paid' else 'Unpaid' end as PayStatus ,case when (PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible,case when (OrderMaster.PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible1,case OrderMaster.[status] when 0 then 'Pending' when 1 then 'Dispatched' when 2 then 'Delivered' else 'Cancelled' End as sts, OrderMaster.Amount ,OrderMaster.ChequeNo,OrderMaster.ChequeDate, tblMemberMaster.UserName from tblMemberMaster inner join OrderMaster on OrderMaster.MemberID=tblMemberMaster.UserCode where tblMemberMaster.UserName!='Trail' and OrderID=@OrderId order by OrderMaster.OrderID desc ", con);

            cmd.Parameters.AddWithValue("@OrderId", txtOrderID.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    getorder("Cash");
        //}


        protected void msgBox(string msg)
        {

            this.Page.Controls.Add(new LiteralControl("<script>alert('" + msg + "');</script>"));
        }

        protected void LinkButto2_Click(object sender, EventArgs e)
        {
            LinkButton lbcancle = (LinkButton)sender;
            var id = (Label)lbcancle.FindControl("lblOid");
            var usercode = (Label)lbcancle.FindControl("lblMemberID");
            string urcode = usercode.Text.ToString();
            int oid = int.Parse(id.Text.ToString());
            //SqlCommand cmd = new SqlCommand("update ordermaster set Paystatus=1 where orderid='" + oid + "'", con);
            SqlCommand cmd = new SqlCommand("[dbo].[DistributeIncomes_OrderPaid]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usercode", urcode);
            cmd.Parameters.AddWithValue("@OrderID", oid);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                getorder("cash");
                DropDownList1.SelectedValue = "Select";
                msgBox("Payment has been done successfully.");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Select";
            txtMemberID.Text = "";
            txtOrderID.Text = "";
            date1.Text = "";
            date2.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201501'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT OrderMaster.OrderID,OrderMaster.Date,OrderMaster.MemberID,OrderMaster.Paymentmode,OrderMaster.Referencenumber,OrderMaster.Impsdate,OrderMaster.PaymentDate,OrderMaster.PaymentDate, case OrderMaster.PayStatus when 1 then 'Paid' else 'Unpaid' end as PayStatus ,case when (PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible,case when (OrderMaster.PayStatus = 0 and OrderMaster.[status] !=3 ) then cast(1 as bit) else cast(0 as bit) End as stsvisible1,case OrderMaster.[status] when 0 then 'Pending' when 1 then 'Dispatched' when 2 then 'Delivered' else 'Cancelled' End as sts, OrderMaster.Amount ,OrderMaster.ChequeNo,OrderMaster.ChequeDate, tblMemberMaster.UserName from tblMemberMaster inner join OrderMaster on OrderMaster.MemberID=tblMemberMaster.UserCode where tblMemberMaster.UserName!='Trail' and cast(PaymentDate as date)>=cast(@date1 as date) and cast(PaymentDate as date)<=cast(@date2 as date) order by OrderMaster.OrderID desc", con);

            cmd.Parameters.AddWithValue("@date1", txtpaymentdatefrom.Text);
            cmd.Parameters.AddWithValue("@date2", txtpaymentdatetill.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void LinkButto3_Click(object sender, EventArgs e)
        {
            LinkButton lbcancle = (LinkButton)sender;
            var id = (Label)lbcancle.FindControl("lblOid");
            int oid = int.Parse(id.Text.ToString());
            SqlCommand cmd = new SqlCommand("Delete from ordermaster where orderid='" + oid + "'", con);
            cmd.Parameters.AddWithValue("@OrderID", oid);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            cmd.CommandText = "delete from AccountMaster  where Particulars like '%Order ID#" + oid + "%' and TxnType=51 ";
            i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                msgBox("Delete Order successfully.");
                getorder("Cash");
            }
        }
    }
}