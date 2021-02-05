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
    public partial class FENRedirectoperator : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        string UserCode;
        protected void bttnsubmit_Click(object sender, EventArgs e)
        {
            //try
            //{

                if (txtusercode.Text!="")
                {
                    SqlCommand comm = new SqlCommand("select * from tblFrenchiseMaster where FrenchiseID='" + txtusercode.Text + "' ", conn);
                    conn.Open();
                    SqlDataReader dr = comm.ExecuteReader();
                    
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {

                            Session["FrenchiseID"] = dr["FrenchiseID"].ToString();
                            Session["LoginName"] = dr["Name"].ToString();
                            Session["Logpas"] = dr["Password"].ToString();
                            break;

                        }
                        dr.Close();
                        // Session["UC"] = UserCode;
                       //Session["FrenchiseID"] = txtusercode.Text;

                        //Response.Redirect("~/Franchise/UserHome.aspx");
                        Response.Redirect("~/Franchise/Default.aspx?fUserId=" + Session["FrenchiseID"] +"&FPass=" + Session["Logpas"]);

                    }
                    else
                    {
                        MsgBox("Franchise ID does not exist");
                    }
                    conn.Close();
                }
                else
                {
                    MsgBox("You are not authorized to access this account");
                }

           // }
            //catch
            //{
            //   // MsgBox("Try Again");
            //}

        }

        protected void MsgBox(String Msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Msg + "');</script>"));
        }
    }
}