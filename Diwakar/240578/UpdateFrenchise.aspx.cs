using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WGRL.Super19111973
{
    public partial class UpdateFranchise : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
           

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            cmd = new SqlCommand("",con);            

        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblTotalFranchise.Text = "Total Branch : " + e.AffectedRows.ToString();
        }

       
    }
}