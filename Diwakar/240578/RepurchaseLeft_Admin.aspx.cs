using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WGRL._03032003;

namespace CyraShop._240578
{
    public partial class RepurchaseLeft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Repurchase Left Report") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        protected void btnbymemberid_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString()))
            {
                if (txtMemberID.Text != "" && DropDownList1.SelectedItem.Text != "" && date1.Text != "" && @date2.Text != "")
                {
                    SqlCommand cmd = new SqlCommand("select MemberID,[Date], OrderID, TotalDp, TotalBV  from TotalOrders where ordertype=@ordertype and memberid in (select UserCode from esc.myleftdownline(@UserCode)) and  cast(Date as date)>=cast(@date1 as date) and cast(Date as date)<=cast(@date2 as date) order by Date", con);
                    cmd.Parameters.AddWithValue("@UserCode", txtMemberID.Text);
                    cmd.Parameters.AddWithValue("@ordertype", DropDownList1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@date1", date1.Text);
                    cmd.Parameters.AddWithValue("@date2", date2.Text);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("RepurchaseLeftBusiness.xls", this.GridView1);
        }
    }
}