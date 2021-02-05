using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CyraShop.user
{
    public partial class RepurchaseLeft : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
         
                SqlCommand cmd = new SqlCommand("select MemberID,[Date], OrderID, TotalDp, TotalBV  from TotalOrders where ordertype='"+DropDownList1.SelectedValue+"' and memberid in (select UserCode from esc.myleftdownline('" + Session["usercode"]+"')) order by Date", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
           
        }

        //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    GridView1.DataBind();
        //}

        protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}