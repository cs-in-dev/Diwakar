using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using WGRL._03032003;

namespace GOG.Admin
{
  
    public partial class PaymentsReports : System.Web.UI.Page
    {
      
        //SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Payments Reports") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (!Page.IsPostBack)
            {
                
            }
        }
       

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            getdata();

        }
     
        protected void getdata()
        {
            //int datetime(int.Parse(ddlYear.SelectedValue), int.Parse(ddlMonth.SelectedValue), int.Parse(ddlDay.SelectedValue));
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            // SqlCommand cmd = new SqlCommand("SELECT a.MemberID,a.DateofTransaction AS Date, a.Particulars, a.Debit AS Amount,t.username AS Name FROM AccountMaster a inner join tblmembermaster t on a.memberid =t.usercode WHERE a.TxnType = 6 and cast(DateofTransaction as date) >= cast('" + DateTime.Parse(TextBox1.Text).Date + "' as date) and Cast(DateofTransaction as date) <= cast('" + DateTime.Parse(TextBox2.Text).Date + "' as date) ", con);
            SqlCommand cmd = new SqlCommand("SELECT a.MemberID,a.DateofTransaction AS Date, a.Particulars, a.Debit AS Amount,t.username AS Name FROM AccountMaster a inner join tblmembermaster t on a.memberid =t.usercode WHERE a.TxnType = 6 and  cast(DateofTransaction as date)= cast('" + ddlYear.SelectedValue +"' as date)", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getdata();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("paymentsreports.xls", this.GridView1);
        }
    }
    }

