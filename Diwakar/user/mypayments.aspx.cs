using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

namespace WGRL.User
{
    public partial class mypayments : System.Web.UI.Page
    {
        //SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Select isnull(sum(debit),0) from AccountMaster where TxnType = 6 and memberid = '" + Session["UserCode"] + "' and dateoftransaction<=getdate()", con);
                con.Open();
                Label1.Text = "Total :" + System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString() + " " + cmd.ExecuteScalar().ToString().Replace(".0000",".00");
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            SqlDataSource1.DataBind();
        }
        }
    }

