using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GrowTogether._240578
{
    public partial class Productlist1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("List Product") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //  SqlDataSource2.DataBind();
            // GridView1.DataBind();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT [ProductCode],SalesAmount, [ProductName],CategoryId, [MRP], [BV] FROM [ProductRepurchase] WHERE  (([status] =0) AND ([CategoryID] = @CategoryID))", con);
            cmd.Parameters.AddWithValue("@CategoryID", DropDownList1.SelectedValue);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //SqlDataSource3.DataBind();
           // GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT [ProductCode],SalesAmount, [ProductName],CategoryId, [MRP], [BV]  FROM [ProductRepurchase] WHERE  (([status] =0) AND ([ProductCode] = @ProductCode))", con);
            cmd.Parameters.AddWithValue("@ProductCode", txtproductcode.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
    }
}