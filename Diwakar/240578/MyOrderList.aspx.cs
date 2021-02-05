using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Bvirodh._240578
{
    public partial class MyOrderList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
          //  var i = 1;
            if (!IsPostBack)
            {
            SqlCommand cmd = new SqlCommand("SELECT  OrderMaster.OrderID,ProductRepurchase.ProductCode Code, ProductRepurchase.ProductName,ProductRepurchase.MRP,OrderDetails.OrderID,OrderMaster.memberid, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, ((ProductRepurchase.MRP*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.',OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*((ProductRepurchase.Vat)/100))'VAT/CST%',(OrderDetails.TotalDP*(ProductRepurchase.Vat/100)) AS 'VAT/Additional', (ProductRepurchase.MRP*OrderDetails.Qty)TotalMRP,    (OrderDetails.TotalDP ) 'Total Price',isnull(OrderMaster.chequeNo,'NF')chequeNo,OrderMaster.[status] FROM OrderDetails INNER JOIN ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID order by OrderMaster.[Date] desc ", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT  OrderMaster.memberid,OrderMaster.OrderID,ProductRepurchase.ProductCode Code, ProductRepurchase.ProductName,ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, ((ProductRepurchase.MRP*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.',OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*((ProductRepurchase.Vat)/100))'VAT/CST%',(OrderDetails.TotalDP*(ProductRepurchase.Vat/100)) AS 'VAT/Additional', (ProductRepurchase.MRP*OrderDetails.Qty)TotalMRP,    (OrderDetails.TotalDP ) 'Total Price',isnull(OrderMaster.chequeNo,'NF')chequeNo,OrderMaster.[status] FROM OrderDetails INNER JOIN ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.memberid='" + TextBox1.Text + "'order by OrderMaster.[Date] desc ", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
            //SqlCommand cmd1 = new SqlCommand("select [status] from OrderMaster  where memberid='" + TextBox1.Text + "'", con);
            //con.Open();
            //string c = cmd1.ExecuteScalar().ToString();
            //con.Close();
            //CheckBox chk1 = (CheckBox)Form.FindControl("statuscheck");
            //if (c == "1")
            //{
            //    chk1.Checked = true;
            //    chk1.Text = "";
            //}
            //else
            //{
            //    chk1.Checked = false;
            //    chk1.Text = "";
            //}
            TextBox1.Text = "";
        }

        //protected void statuscheck_CheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox chk = (CheckBox)sender;
        //    string order = chk.ToolTip;
        //    SqlCommand cmd = new SqlCommand("update OrderMaster set [status]=1 where orderid='" + order + "'", con);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //}
    }
}