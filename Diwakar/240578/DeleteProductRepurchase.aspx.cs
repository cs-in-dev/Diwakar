using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WGRL._240578
{
    public partial class DeleteProductRepurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Delete Product") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("update ProductRepurchase set status=1 WHERE ProductID=@Pid", con);
            cmd.Parameters.AddWithValue("@pid", d.SelectedValue);

            con.Open();
           int i=(int) cmd.ExecuteNonQuery();
            
            con.Close();
            if (i > 0)
            {
                Label1.Text = "Product Deleted";
            }

        }

        protected void d_SelectedIndexChanged(object sender, EventArgs e)
        {



            //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            //SqlCommand cmd = new SqlCommand("SELECT  * from ProductRepurchase WHERE ProductID=@PID", con);
            //cmd.Parameters.AddWithValue("@pid", d.SelectedValue);
            //con.Open();

            //SqlDataReader dr = cmd.ExecuteReader();
            //while (dr.Read())
            //{
            //    prodnametxt.Text = dr["ProductName"].ToString();
            //    prctxt.Text = dr["PriceININr"].ToString();
            //    pvvtxt.Text = dr["PV"].ToString();
            //    Image1.ImageUrl = dr["ImageURl"].ToString();
            //    dcatlist.SelectedValue =dr["CategoryID"].ToString();
            //}
            //con.Close();
        }

        protected void dcatlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            while (d.Items.Count != 0)
                d.Items.RemoveAt(0);
            SqlDataSource1.DataBind();
            d.DataBind();

        }
        }
    }

