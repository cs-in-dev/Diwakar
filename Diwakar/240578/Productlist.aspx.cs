using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GOG
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Product Details") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataBind();
            GridView1.DataBind();
        }
    }
}
