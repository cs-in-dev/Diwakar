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

namespace Amazewellness.user
{
    public partial class Downline : System.Web.UI.Page
    {
        decimal totalPayout = 0;
        decimal totalBV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalBV += decimal.Parse(e.Row.Cells[3].Text);
                totalPayout += decimal.Parse(e.Row.Cells[2].Text);
             
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Text = "Grand Total:";
                e.Row.Cells[2].Text = totalPayout.ToString();
                e.Row.Cells[3].Text = totalBV.ToString();
               
            }
        }
    }
}