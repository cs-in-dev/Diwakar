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

namespace MoneyMagnet
{
    public partial class Super19111973TotalMembers : System.Web.UI.Page
    {
        Double TotalPackageAmount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/19111973/Default.aspx");
            if (User.IsInRole("Total Associates") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/19111973/AdminHome.aspx");

            if (!IsPostBack)
            {
                TextBox2.Text = DateTime.Now.Date.ToShortDateString();
                TextBox3.Text = DateTime.Now.Date.ToShortDateString();

            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("", con);



            cmd.CommandText = "SELECT *,[usercode],[dbo].[MySponsor](usercode )as SponserId, [dbo].[MySponsorName](UserCode) as SpName  from tblmembermaster where " + DropDownList1.SelectedValue + " LIKE'%'+'" + TextBox1.Text.Trim() + "'+'%'  ORDER BY [DOJ] desc";

            SqlDataAdapter dts1 = new SqlDataAdapter(cmd);
            cmd.CommandTimeout = 0;
            DataTable dt1 = new DataTable();
            dts1.Fill(dt1);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            TextBox2.Text = "";
            TextBox3.Text = "";



        }




        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandTimeout = 0;
            cmd.CommandText = "SELECT *, [dbo].[MySponsorName](UserCode) as SpName   FROM [tblMemberMaster]    WHERE ((cast(DOJ as date) >= cast(@DOJ as date)) and (cast(DOJ as date) <= cast(@DOJ2 as date))) ORDER BY [DOJ] desc";
            cmd.Parameters.AddWithValue("@DOJ", TextBox2.Text);
            cmd.Parameters.AddWithValue("@DOJ2", TextBox3.Text);
            SqlDataAdapter dts1 = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            dts1.Fill(dt1);
            cmd.CommandTimeout = 0;
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            TextBox1.Text = "";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {


            if (TextBox1.Text != "")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                SqlCommand cmd = new SqlCommand("", con);

                cmd.CommandText = "SELECT *,[usercode],[dbo].[MySponsor](usercode )as SponserId, [dbo].[MySponsorName](UserCode) as SpName from tblmembermaster where " + DropDownList1.SelectedValue + " LIKE'%'+'" + TextBox1.Text.Trim() + "'+'%'  ORDER BY [DOJ] desc";

                SqlDataAdapter dts1 = new SqlDataAdapter(cmd);
                cmd.CommandTimeout = 0;
                DataTable dt1 = new DataTable();
                dts1.Fill(dt1);
                GridView1.DataSource = dt1;
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandTimeout = 0;
                cmd.CommandText = "SELECT *,[usercode],[dbo].[MySponsor](usercode )as SponserId, [dbo].[MySponsorName](UserCode) as SpName   FROM [tblMemberMaster]    WHERE ((cast(DOJ as date) >= cast(@DOJ as date)) and (cast(DOJ as date) <= cast(@DOJ2 as date))) ORDER BY [DOJ] desc";
                cmd.Parameters.AddWithValue("@DOJ", TextBox2.Text);
                cmd.Parameters.AddWithValue("@DOJ2", TextBox3.Text);
                SqlDataAdapter dts1 = new SqlDataAdapter(cmd);
                DataTable dt1 = new DataTable();
                dts1.Fill(dt1);
                cmd.CommandTimeout = 0;
                GridView1.DataSource = dt1;
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("TotalMembers.xls", this.GridView1);

        }
    }

}
