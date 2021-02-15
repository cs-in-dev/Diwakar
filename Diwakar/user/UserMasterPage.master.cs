using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_UserMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["Usercode"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
       
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT     [Content] from Contents WHERE Page='News'", con);
            con.Open();
            newsPlaceHolder.Controls.Add(new LiteralControl(cmd.ExecuteScalar().ToString()));
            if (Session["LastLogin"] == null)
            {
                cmd.CommandText = "select LastLogin from tblMemberMaster where UserCode = '" + Session["UserCode"].ToString() + "'";
                Session["LastLogin"] = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "update tblMemberMaster SET LastLogin=getdate() where UserCode = '" + Session["UserCode"].ToString() + "'";
                cmd.ExecuteNonQuery();
            }
        
            cmd.CommandText = "Select  [dbo].[MyEwallet]('" + Session["UserCode"].ToString() + "')";
               lblMyWellet.Text = cmd.ExecuteScalar().ToString().Replace("00","00");

            //cmd.CommandText = "Select [dbo].[MyRedemptionBalance]('" + Session["UserCode"].ToString() + "')";
            //lblMyRPWellet.Text = cmd.ExecuteScalar().ToString().Replace("00", "00");

            con.Close();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["UserCode"] = null;
        Response.Redirect("~/login.aspx");
    }
   
}
