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

namespace tradeasia.user
{
    public partial class LevelReport : System.Web.UI.Page
    {

        decimal credit = 0;
        decimal debit = 0;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Select isnull(sum(credit),0) from AccountMaster where TxnType = 3 and memberid = '" + Session["UserCode"] + "' and dateoftransaction<=getdate()", con);
                con.Open();
                Label1.Text = "Total :" + System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString().Replace(".0000", ".00") + " " + cmd.ExecuteScalar().ToString().Replace(".0000", ".00");
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                credit = credit + Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "credit"));
                debit = debit + Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "debit"));
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Text = "Total";
                e.Row.Cells[2].Text = Convert.ToDouble((credit - debit)).ToString().Replace(".00","");

            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            SqlDataSource1.DataBind();
        }
    }
}