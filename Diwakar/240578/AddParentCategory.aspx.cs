using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace SSRPPL._19111973
{
    public partial class AddParentCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
           

            if(!IsPostBack)
            {
                    SqlCommand cmd = new SqlCommand("SELECT * [CategoryName] FROM [Categorymaster] where PID=-1", con);
                    con.Open();
                    SqlDataSource1.DataBind();
                    GridView1.DataBind();
                    con.Close();
                    Label6.Text = "";
            }

        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {

        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Insert into CategoryMaster values( '" + txtCatgry.Text.ToString() + "',-1)", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataSource1.DataBind();
           GridView1.DataBind();
           MsgBox("Category Added Successfully!!");
           txtCatgry.Text = "";
        }
    }
}