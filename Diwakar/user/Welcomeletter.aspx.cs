using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WGRL.User;
using WGRL.user;

namespace WGRL.User
{
    public partial class Welcomeletter : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd, cmd1;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserCode"] != null)
            {
                 lblmemberid.Text = Session["UserCode"].ToString();
                //lbldate.Text = System.DateTime.Today.ToLongDateString();

                string x = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                con = new SqlConnection(x);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand("select UserName,LoginName,WelcomeLetterAddress,Address,City,State,MobileNo,LoginPassword,DOJ,PinAmount,PostalCode,Status,MyLeft,dbo.MySponsor('" + lblmemberid.Text + "') as sponser from tblMemberMaster where UserCode='" + lblmemberid.Text + "'", con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    //lblmobileno.Text = dr["MobileNo"].ToString();
                    lblusername3.Text = dr["UserName"].ToString();
                    lblBIname.Text = Session["UserCode"].ToString();
                    lblBIid.Text = dr["PinAmount"].ToString();
                   // lblpwd.Text = dr["LoginPassword"].ToString();
                    lblsponser.Text = dr["sponser"].ToString();
                  //  lblusername5.Text = dr["PostalCode"].ToString();
                   // lbladd.Text = dr["Address"].ToString();
                    lbladd.Text = dr["WelcomeLetterAddress"].ToString();
                  //  lblcity.Text = dr["City"].ToString() + " " + dr["State"].ToString();                
                    DateTime dt = DateTime.Parse(dr["DOJ"].ToString());
                    lbldate.Text = dt.ToString();
                    lblstatus.Text = dr["Status"].ToString();
                    //HyperLink1.Text = "http://www.viratfuture.com /" + dr["LoginName"].ToString();

                   
                }
                dr.Close();

                cmd1 = new SqlCommand("select MemberID,SponserID from tblTreeMaster where MemberID='" + lblmemberid.Text + "'", con);
                dr = cmd1.ExecuteReader();
                while (dr.Read())
                {
                    //lblsponsorid.Text = dr["SponserID"].ToString();
                }
                dr.Close();
                con.Close();

                try
                {
                    //cmd.CommandText = "select Discription  from joiningpackages where amount='" + lblBIid.Text + "'";
                    //con.Open();
                    //LabelPDiscription.Text = cmd.ExecuteScalar().ToString();
                    //con.Close();
                }
                catch { }
            }
        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = Panel1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
        }


    }
}