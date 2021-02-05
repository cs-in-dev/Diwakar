using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace febify._240578
{
    public partial class AddE_Wallet : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Add E-Wallet") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
         
       }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (DropDownList1.SelectedItem.Text== "Credit")
            {
                 cmd = new SqlCommand("insert into accountmaster (Txntype,memberid,dateoftransaction,particulars,credit,debit,level,status) values(11,'" + txtmemberid.Text + "',getdate(),'Add by admin'," + txtaddamount.Text + ",0,NULL,0)", con);
               
            }
           else if (DropDownList1.SelectedItem.Text == "Debit")
            {
                   cmd = new SqlCommand("insert into accountmaster (Txntype,memberid,dateoftransaction,particulars,debit,credit,level,status) values(11,'" + txtmemberid.Text + "',getdate(),'Add by admin'," + txtaddamount.Text + ",0,NULL,0)", con);
               
            }

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            //GridView1.DataBind();
            MsgBox("Amount Rs." + txtaddamount.Text +" Successfully "+DropDownList1.SelectedItem.Text+"ed");
            txtaddamount.Text = "";
            txteexistingamount.Text = "";
            txtmemberid.Text = "";
            txtusername.Text = "";
            // MsgBox("E-Wallet Submit Successfully");
           

        }

        protected void txtmemberid_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select *, [dbo].[MyEwallet](USERCODE) AS AMONUT from tblmembermaster where usercode='" + txtmemberid.Text + "'";
            con.Open();

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                txtusername.Text = rd["username"].ToString();
               txteexistingamount.Text= rd["AMONUT"].ToString();
            
            }
        }
    }
}