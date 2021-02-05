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
    public partial class ViewDispatchDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("View Dispatch Details") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            cmd = new SqlCommand("", con);

            if (!IsPostBack)
            {
                getorder(1);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("DispatchList.xls", this.GridView1);
        }

        protected void btnbyDate_Click(object sender, EventArgs e)
        {
           
            txtMemberID.Text = "";
            txtOrderID.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201501'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT *,(select username from tblmembermaster where usercode=MemberID) as Name  from ordermaster where cast(Date as date)>=cast(@date1 as date) and cast(Date as date)<=cast(@date2 as date) and status=0  order by DispatchDate desc", con);

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
           
            date1.Text = "";
            date2.Text = "";
            txtOrderID.Text = "";
            //SqlCommand cmd = new SqlCommand("SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName] FROM OrderMaster where FrenchiseID = 'RSG201501'  And InvoiceType='DP'  AND OrderId=@OrderId", con);

            SqlCommand cmd = new SqlCommand("SELECT *,(select username from tblmembermaster where usercode=MemberID) as Name  from ordermaster where memberid=@MemberID and status=0 order by DispatchDate desc  ", con);

            cmd.Parameters.AddWithValue("@MemberID", txtMemberID.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }


        protected void getorder(int dropdownvalue)
        {
            SqlCommand cmd = new SqlCommand("SELECT * ,(select username from tblmembermaster where usercode=MemberID) as Name from ordermaster where status=@status order by DispatchDate desc ", con);

            cmd.Parameters.AddWithValue("@status", dropdownvalue);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void btnbyorderid_Click(object sender, EventArgs e)
        {
            int oId = Int32.Parse(txtOrderID.Text);

            date1.Text = "";
            date2.Text = "";
            txtMemberID.Text = "";

            SqlCommand cmd = new SqlCommand("SELECT * ,(select username from tblmembermaster where usercode=MemberID) as Name  from ordermaster where orderid=@OrderId and status=0 order by DispatchDate desc   ", con);

            cmd.Parameters.AddWithValue("@OrderId", oId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }
    }
}