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

namespace WGRL
{
    public partial class IncomeBinary : System.Web.UI.Page
    {
        SqlConnection conn;
        Double Income;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            Income = 0;
            if (Session["UserCode"] == null)
            {
                Response.Write("default.aspx");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Income = Income + Double.Parse(e.Row.Cells[3].Text);
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Total Income: ";
                e.Row.Cells[3].Text = string.Format("{0:f2}", Income);
            }
        }
    }
}