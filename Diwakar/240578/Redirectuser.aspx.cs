using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Starlinenetworking._240578
{
    public partial class Redirectuser : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
         string UserCode;
        protected void bttnsubmit_Click(object sender, EventArgs e)
        {

            if (txtusercode.Text.Trim() != "")
            {
                SqlCommand comm = new SqlCommand("select * from tblmembermaster where UserCode='" + txtusercode.Text + "' ", conn);
                conn.Open();
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                       
                        Session["UserCode"] = dr["UserCode"].ToString();
                        String UserName = dr["UserName"].ToString();
                        Session["UserName"] = dr["UserName"].ToString();
                        Session["userType"] = dr["UserType"].ToString();
                        Session["MyRank"] = dr["MyRank"].ToString();
                        break;

                    }
                    dr.Close();
                   // Session["UC"] = UserCode;

                    Response.Redirect("~/USER/UserHome.aspx");

                }
                else
                {
                    MsgBox("User is not exist");
                }
                conn.Close();
            }
            else
            {
                MsgBox("UserCode is Blank !!!!");
            }
            
          
        }

        protected void MsgBox(String Msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Msg + "');</script>"));
        }
    }
}