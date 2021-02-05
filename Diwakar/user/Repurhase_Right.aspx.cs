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
    public partial class Repurhase_Right : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
           
            HiddenField1.Value = Session["UserCode"].ToString();
            //SqlCommand cmd = new SqlCommand("SELECT  ISNULL(derivedtbl_2.Date, derivedtbl_1.Date ) AS LeftDate, derivedtbl_2.Left_TotalDP, derivedtbl_2.Left_TotalBV, derivedtbl_1.Right_TotalDP, derivedtbl_1.Right_TotalBV FROM (SELECT CAST(Date AS date) AS Date, SUM(TotalDP) AS Right_TotalDP, SUM(TotalBV) AS Right_TotalBV FROM TotalOrders WHERE (OrderType='" + DropDownList1.SelectedValue + "') AND (MemberID IN (SELECT UserCode FROM esc.MyRightDownLine('"+ Session["UserCode"]+ "') AS MyRightDownLine_1)) GROUP BY [Date]) AS derivedtbl_1 Full Outer JOIN (SELECT CAST(Date AS date) AS Date, SUM(TotalDP) AS Left_TotalDP, SUM(TotalBV) AS Left_TotalBV FROM TotalOrders AS TotalOrders_1 WHERE (OrderType = '" + DropDownList1.SelectedValue + "') AND (MemberID IN (SELECT UserCode FROM esc.MyLeftDownLine('" +Session["UserCode"]+ "') AS MyLeftDownLine_1)) GROUP BY [Date]) AS derivedtbl_2  ON derivedtbl_1.Date = derivedtbl_2.Date order by LeftDate desc", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //GridView1.DataSource = ds;
            //GridView1.DataBind();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}