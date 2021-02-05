using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace GrowTogether.user
{
    public partial class GrowIcard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select username,mobileno,UploadPhoto from tblmembermaster where usercode=@usercode", con);
            cmd.Parameters.AddWithValue("@usercode", Session["UserCode"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                llbname.Text = dr["UserName"].ToString();
                llbmobile.Text = dr["MobileNo"].ToString();
                MyImage.ImageUrl = dr["UploadPhoto"].ToString();
            }
            if (MyImage.ImageUrl == "")
            {
                MyImage.ImageUrl = "~/user/images/NoImage.png"; 
            }
            con.Close();
        }
    }
}