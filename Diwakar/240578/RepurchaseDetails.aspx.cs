using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WGRL._03032003;

namespace CyraShop._240578
{
    public partial class RepurchaseDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Repurchase Payment Details") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            //SqlCommand cmd = new SqlCommand("select * from accountmaster where txntype=11",con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //    GridView1.DataSource = ds;
            //GridView1.DataBind();

        }

        protected void btnbyorderid_Click(object sender, EventArgs e)
        {
           

            //SqlCommand cmd = new SqlCommand("SELECT OrderID,Date,MemberID,Paymentmode,PaymentDate,case PayStatus when  1 then 'Paid' else 'Unpaid' end as PayStatus ,case  when  ([PayStatus] = 0 and [status] !=3 ) then cast(1 as bit)  else cast(0 as bit) End as stsvisible,case [status] when 0 then 'Pending' when 1 then 'Dispatched'  when 2 then 'Delivered' else 'Cancelled' End as sts,ChequeNo,ChequeDate,(select username from tblmembermaster where usercode=MemberID) as Name,Amount  from ordermaster where orderid=@OrderId order by orderid desc   ", con);

            //cmd.Parameters.AddWithValue("@OrderId", txtOrderID.Text);

            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //GridView1.DataSource = dt;
            //GridView1.DataBind();
            //con.Close();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("RepurchaseDetails.xls", this.GridView1);
        }
    }
}