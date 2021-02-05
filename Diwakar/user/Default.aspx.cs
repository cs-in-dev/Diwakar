using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using DataAccessLayer;

namespace Starlinenetworking.User
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con;
        string UserCode = null;
        string UserName = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserCode"] != null)
                Response.Redirect("~/user/userhome.aspx");
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            DateTime dt = System.DateTime.Today;
            int year1 = dt.Year;
            int year2 = year1 - 18;
            
        }
        protected void Autentication()
        {
            SqlParameter[] sqlParam = new SqlParameter[2];
            sqlParam[0] = new SqlParameter("@UserCode", SqlDbType.VarChar, 50);
            sqlParam[0].Value = txtLoginName1.Text;

            sqlParam[1] = new SqlParameter("@LoginPassword", SqlDbType.VarChar, 50);
            sqlParam[1].Value = txtPassword1.Text;

            con.Open();
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
                Response.Redirect("~/USER/UserHome.aspx");
            }
            else
            {
                lblMessageBox1.Text = "Invalid UserCode / Password";
            }
            con.Close();



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Autentication();

        }
    }
}