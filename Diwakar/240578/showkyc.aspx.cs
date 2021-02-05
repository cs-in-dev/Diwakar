using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Drawing;
using System.Xml;
using System.Threading;
using System.Globalization;
using System.Data;
using System.Web.Services;
using System.Data.SqlClient;


namespace Sabaic._19111973
{
    public partial class showkyc : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Show Kyc") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             
                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandText = "select * from tblmembermaster where usercode='" + TextBox1.Text + "'";
                SqlDataAdapter dts = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dts.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();


             
        }
    }
}