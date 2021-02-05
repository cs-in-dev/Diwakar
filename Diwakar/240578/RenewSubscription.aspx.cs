using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FastMoneyMakers1.User
{
    public partial class Investment : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["Usercode"] == null)
                Response.Redirect("~/Default.aspx");
            else
            {
                GridView1.DataBind();
                if (!IsPostBack)
                {
                    if (Request.QueryString["pin"] != null)
                    {
                        TextBox2.Text = Request.QueryString["pin"].ToString();
                        TextBox2.Enabled = false;
                        txtAmount.Text = Request.QueryString["val"].ToString();
                        //getpindescription();
                    }
                    else
                    {
                        
                        //txtAmount.Items.Add("650");
                        //txtAmount.Items.Add("1250");
                        //txtAmount.Items.Add("1750");
                        //txtAmount.Items.Add("2550");
                       
                    }
                }
            }
        }

        protected void Goto(String URL)
        {
            this.Page.Controls.Add(new LiteralControl("<script type=\"text/javascript\">window.open ('"+URL+"','_self',false)</script>"));
        }
        protected void MsgBox(String message)
        {
           
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + message + "');</script>"));

        }

        protected void InvestmentFunc()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd = new SqlCommand("dbo.RenewSubscription", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("UserCode", Session["UserCode"].ToString());
                cmd.Parameters.AddWithValue("UserCode",txtMemberID.Text);
                cmd.Parameters.AddWithValue("DesiredPinAmount", txtAmount.Text);
                cmd.Parameters.AddWithValue("PinCode", TextBox2.Text);
                SqlParameter op = new SqlParameter("@Result", SqlDbType.VarChar, 200);
                op.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(op);
                cmd.CommandTimeout = 120;
                string res = "";
                cmd.CommandTimeout = 120;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                res = op.Value.ToString();
                TextBox2.Text="";
                txtMemberID.Text = "";
                TxtMemberName.Text = "";
                txtAmount.Text = "";
                if (res=="Success")
                    MsgBox("Success");
                else
                    MsgBox(res);
               // Goto("~/user/RenewSubscription.aspx");
                
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            InvestmentFunc();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Select UserName from TblMemberMaster where UserCode='" + txtMemberID.Text + "'", con);
            con.Open();
            try
            {
                TxtMemberName.Text = cmd.ExecuteScalar().ToString();
            }
            catch { }
            con.Close();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select pinamount from tblpinmaster where pincode='" + TextBox2.Text + "' and status=0", con);
            con.Open();
            try
            {
                txtAmount.Text = cmd.ExecuteScalar().ToString();
            }
            catch { }
            con.Close();

        }



        //protected void getpindescription()
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        //    SqlCommand cmd = new SqlCommand("Select JoiningPv from JoiningPackages where Amount='" + Request.QueryString["val"].ToString() + "'", con);
        //    con.Open();
        //    txtJoiningPV.Text= cmd.ExecuteScalar().ToString();
        //    con.Close();

        //}


    }


        
    }
