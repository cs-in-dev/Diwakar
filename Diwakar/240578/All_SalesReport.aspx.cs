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
    public partial class All_SalesReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Total Sales Report") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

        }

        protected void btnbydate_Click(object sender, EventArgs e)
        {
            //SqlCommand cmd = new SqlCommand("SELECT t.UserCode CustomerCode,t.UserName as CustomerName, t.Address, om.Billstate,om.Date,od.OrderID,pr.ProductName,od.TotalMRP AS Price,od.Qty,od.IGST,od.CGST,od.SGST,od.TotalDP as Amount FROM tblmembermaster AS t INNER JOIN OrderMaster AS om ON t.UserCode = om.MemberID INNER JOIN OrderDetails AS od ON om.OrderID = od.OrderID INNER JOIN ProductRepurchase AS pr ON od.ProductID = pr.ProductID where  cast(om.date as date)>=cast(@date1 as date) and cast(om.date as date)<=cast(@date2 as date) order by date desc ", con);

            SqlCommand cmd = new SqlCommand("select t.UserCode CustomerCode,t.UserName as CustomerName,t.Address,om.date,od.OrderId,od.TotalMrp as Price,(od.iGST*od.Qty)as TotalIGST,od.Qty,od.CGST,od.SGST,od.IGST, (od.CGST*od.Qty) as TotalCGST,(od.SGST*od.Qty) as TotalSGST,(od.IGST*od.Qty) as TotalIGST,od.TotalDP as Amount FROM tblmembermaster AS t INNER JOIN OrderMaster AS om ON t.UserCode = om.MemberID INNER JOIN OrderDetails AS od ON om.OrderID = od.OrderID INNER JOIN ProductRepurchase AS pr ON od.ProductID = pr.ProductID where t.UserName!='Trail' and cast(om.date as date)>=cast(@date1 as date) and cast(om.date as date)<=cast(@date2 as date) order by date desc", con);
            cmd.Parameters.AddWithValue("@date1", date1.Text);
            cmd.Parameters.AddWithValue("@date2", date2.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
          //  GridView3.DataSource = dt;
           // GridView3.DataBind();

            con.Close();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("TotalSalesReport.xls", this.GridView1);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            btnbydate_Click(sender,e);
        }
    }
}