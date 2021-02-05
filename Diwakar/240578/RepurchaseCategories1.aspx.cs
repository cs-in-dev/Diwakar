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
    public partial class RepurchaseCategories1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
           // {

                if (User.Identity.IsAuthenticated == false)
                    Response.Redirect("~/240578/Default.aspx");
                if (User.IsInRole("Admin") == false && User.IsInRole("Categories") == false)
                    Response.Redirect("~/240578/AdminHome.aspx");

                //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
                //SqlCommand cmd = new SqlCommand("select  * from  CategoryMaster", con);
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //DataSet ds = new DataSet();
                //da.Fill(ds);
                ////GridView1.DataSource = ds;
                ////GridView1.DataBind();
           // }

        }

        protected void sbmtbtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd = new SqlCommand("insert into CategoryMaster(CategoryName) values(@CategoryName)", con);
                cmd.Parameters.AddWithValue("@CategoryName", catnametxt.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Redirect("RepurchaseCategories.aspx");
            }
            catch (Exception ex)
            {

                throw;
            }


        }
    }
    
}