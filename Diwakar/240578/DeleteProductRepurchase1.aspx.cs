using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GrowTogether._240578
{
    public partial class DeleteProductRepurchase1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Delete Product") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("update ProductRepurchase set status=1 WHERE ProductID=@Pid", con);
            cmd.Parameters.AddWithValue("@pid", d.SelectedValue);

            con.Open();
            int i = (int)cmd.ExecuteNonQuery();

            con.Close();
            if (i > 0)
            {
                Label1.Text = "Product Deleted";
            }

        }

        protected void dcatlist_SelectedIndexChanged(object sender, EventArgs e)
        {
             while (d.Items.Count != 0)
                d.Items.RemoveAt(0);
            SqlDataSource1.DataBind();
            d.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("update ProductRepurchase set status=1 WHERE ProductCode=@ProductCode", con);
            cmd.Parameters.AddWithValue("@ProductCode", txtproductcode.Text);

            con.Open();
            int i = (int)cmd.ExecuteNonQuery();

            con.Close();
            if (i > 0)
            {
                Label1.Text = "Product Deleted";
            }

        }
    }
    }
