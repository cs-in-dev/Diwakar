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
using System.Globalization;

namespace CyraShop._240578
{
    public partial class RepurchaseWalletReport : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Repurchase Wallet Report") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            //SqlCommand cmd = new SqlCommand("select * from accountmaster where Memberid='COMPANY' and txntype=11", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //GridView1.DataSource = ds.Tables[0];
            //GridView1.DataBind();


        }

        protected void txtmemberid_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select *, [dbo].[MyEwallet](USERCODE) AS AMONUT from tblmembermaster where usercode='" + txtmemberid.Text + "'";
            con.Open();

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                txtusername.Text = rd["username"].ToString();
               

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select  Memberid,Dateoftransaction,Particulars,Credit,Debit from accountmaster where Memberid=@userid and cast(Dateoftransaction as date)>=cast(@date1 as date) and cast(Dateoftransaction as date)<=cast(@date2 as date)and txntype=11 ", con);
            cmd.Parameters.AddWithValue("@userid", txtmemberid.Text);
            cmd.Parameters.AddWithValue("@date1", date1.Text);
            cmd.Parameters.AddWithValue("@date2", date2.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            GridView3.DataSource = ds.Tables[0];
            GridView3.DataBind();


        }

        protected void btnbydate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select  Memberid,Dateoftransaction,Particulars,Credit,Debit from accountmaster where  cast(Dateoftransaction as date)>=cast(@date1 as date) and cast(Dateoftransaction as date)<=cast(@date2 as date) and txntype=11", con);

            cmd.Parameters.AddWithValue("@date1", date1.Text);
            cmd.Parameters.AddWithValue("@date2", date2.Text);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds.Tables[0];
            GridView2.DataBind();
            GridView3.DataSource = ds.Tables[0];
            GridView3.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
          
          
            Button1_Click(sender, e);
           
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("RepurchaseWalletReport.xls", this.GridView3);
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;

           btnbydate_Click(sender,e);


        }
    }
}