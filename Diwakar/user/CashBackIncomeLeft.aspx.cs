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

namespace Viratfuture.user
{
    public partial class CashBackIncomeLeft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("SELECT isnull((Sum(isNull(Credit,0))-Sum(isNull(Debit,0))),0) Amount from  [esc].[MyLeftDownLine](@MemberID) inner join AccountMaster on MemberID=@MemberID Where AccountMaster.Particulars like '%'+UserCode+'%' and TxnType=3 ", con);
                cmd.Parameters.AddWithValue("@MemberID", Session["UserCode"].ToString());
                con.Open();
                Label1.Text = "Total :" + System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString() + " " + cmd.ExecuteScalar().ToString();
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
