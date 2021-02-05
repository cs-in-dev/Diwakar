using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace sewspariwar._03032003
{
    public partial class ExcutePayout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Refresh Payouts") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            lblmessage.Visible = false;
           // SqlParameter op = new SqlParameter("@Result", SqlDbType.VarChar, 200);
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("dbo.ExecutePayouts", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblmessage.Visible = true;
            lblmessage.Text = "Payouts Executed";
        }
    }
}