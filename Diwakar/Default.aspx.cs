using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CyraShop
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string UserCode = null;
        string UserName = null;
        string Mobile = null;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void Autentication()

        {
            SqlParameter[] sqlParam = new SqlParameter[2];
            sqlParam[0] = new SqlParameter("@UserCode", SqlDbType.VarChar, 50);
            sqlParam[0].Value = TextBox1.Text;

            sqlParam[1] = new SqlParameter("@LoginPassword", SqlDbType.VarChar, 50);
            sqlParam[1].Value = TextBox2.Text;

            con.Open();
            con.Close();
            SqlDataReader dr = SqlHelper.ExecuteReader(con, "SP_UserMemberidinfo", sqlParam);

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    UserCode = dr["UserCode"].ToString();
                    UserName = dr["UserName"].ToString();
                    Session["userType"] = dr["UserType"].ToString();
                }
                dr.Close();

                Session["UserCode"] = UserCode;
                Session["UserName"] = UserName;
                Session["MobileNo"] = Mobile;
                con.Close();
                Response.Redirect("~/USER/UserHome.aspx");
            }
            else
            {

                Page.Controls.Add(new LiteralControl("<script> alert('Invalid UserCode / Password');</script>"));
            }
            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Autentication();
        }
    }
}