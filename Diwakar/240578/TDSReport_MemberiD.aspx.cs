using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

//namespace eSolutionsCurry
namespace WGRL._03032003
{
    public partial class TDSReport_MemberiD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Total TDS (Member ID)") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            if (!IsPostBack)
            {
                //TextBox2.Text = DateTime.Now.Date.ToString();
                //TextBox3.Text = DateTime.Now.Date.ToString();

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("TDSReport.xls", this.GridView1);
            
        }

    }
}