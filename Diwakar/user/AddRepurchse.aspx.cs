using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Drawing;

namespace Amazewellness.user
{
    public partial class AddRepurchse : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        string sPinCode = "";
        string sPinCode1 = "";
        String returnValue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            sPinCode = Request.QueryString["pcode"].ToString();
            sPinCode1 = Request.QueryString["pcode1"].ToString();
            txtPin.Text = Request.QueryString["pcode"].ToString();

        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
            if (txtname.Text.Contains(" ") == true)
            {
                txtname.Text = "";
                lblchsusrnm.Text = "Sorry! Choose UserCode without Space";

                lblchsusrnm.ForeColor = Color.Red;
                lblchsusrnm.Font.Bold = true;
                return;
            }
            int x;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("select count(*) from tblmembermaster where UserCode='" + txtname.Text + "'", con);
            con.Open();
            x = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (x != 0)
            {
                lblchsusrnm.Text = " Congrats! Valid";
                lblchsusrnm.ForeColor = Color.Green;
                lblchsusrnm.Font.Bold = true;
                
                return;
            }
            else
            {
                lblchsusrnm.Text = "Congrats! Valid";
                lblchsusrnm.ForeColor = Color.Red;
                txtname.Text = "";
                lblchsusrnm.Font.Bold = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sPinAmount = "0";
            if (sPinCode != null && sPinCode1 == "txntype1") //Use Repurchase  10
            {
                con.Open();
                String ss = "select * from tblPinMaster where  pinCode ='" + sPinCode1 + "'";

                SqlDataAdapter da = new SqlDataAdapter(ss, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    sPinAmount = ds.Tables[0].Rows[0]["PinAmount"].ToString();
                }

                SqlCommand cmd = new SqlCommand("AddRepurchase", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@UserCode", txtname.Text));
                cmd.Parameters.Add(new SqlParameter("@Pin", sPinCode));
                cmd.Parameters.Add(new SqlParameter("@PinAmount", sPinAmount));

                SqlParameter op = new SqlParameter("@Result", SqlDbType.NVarChar, 100);
                op.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(op);

                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
                returnValue = op.Value.ToString();
                cmd.Dispose();
                con.Close();
                Label2.Text = returnValue;


                //String ss = "select * from tblPinMaster where  pinCode ='" + sPinCode1 + "'";
                //con.Open();
                //SqlDataAdapter da = new SqlDataAdapter(ss, con);
                //DataSet ds = new DataSet();
                //da.Fill(ds);
                //if (ds.Tables[0].Rows.Count > 0)
                //{
                //    string sPinAmount = "0";
                //    sPinAmount = ds.Tables[0].Rows[0]["PinAmount"].ToString();
                //    string ss2 = "Insert into accountmaster(TxnType,memberId,DateofTransaction,Particulars,Credit,Debit) Values(10,'" + Session["Usercode"].ToString() + "',getdate(),'Repurchase Sunscription'," + sPinAmount + ",0)";
                //    SqlCommand cmd1 = new SqlCommand(ss2, con);
                //    cmd1.ExecuteNonQuery();


                //    da.Dispose();
                //    ds.Dispose();

                //    ss2 = "Update tblPinMaster set Status =1 where pinCode ='" + sPinCode + "'";
                //    SqlCommand cmd = new SqlCommand(ss2, con);
                //    cmd.ExecuteNonQuery();
                //    con.Close();
                //}
            }
        }
    }
}