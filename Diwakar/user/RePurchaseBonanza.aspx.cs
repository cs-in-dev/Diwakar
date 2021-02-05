using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Amazewellness.user
{
    public partial class RePurchase : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select DateTo,CarryLeft,CarryRight,NewLeft,NewRight,Pair,LeftForward,RightForward from BinaryMaster   Where (CType='" + DropDownList1.SelectedValue + "') and (NewLeft>0 or NewRight>0 or Pair>0 or LeftForward>0 or RightForward>0 )and   UserCode=@Usercode  order by DateTo", con);
            cmd.Parameters.AddWithValue("@Usercode",Session["Usercode"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
         

        }
        protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}