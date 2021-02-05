using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WGRL._240578;
using WGRL._03032003;

namespace mmart2.Admin
{
    public partial class RepurchaseOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("View Transfer Order request") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("BranchOrderDetails.aspx?OrderID=" + GridView1.SelectedDataKey[0].ToString());
            Response.Redirect("EditMyOrderDetails.aspx?OrderID=" + GridView1.SelectedDataKey[0].ToString());
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("ViewPayouts.xls", this.GridView1);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

       
    }
}