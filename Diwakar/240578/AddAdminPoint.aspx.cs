using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace OpinionWorldGroup.SuperAdmin
{
    public partial class AddAdminPoint : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString()); ;
            SqlCommand cmd = new SqlCommand("insert into AccountMaster(txnType,memberid,dateOfTransaction,Particulars,credit,Debit) values (7,'" + ConfigurationManager.AppSettings["MainID"].ToString() + "','" + DateTime.Now.Date.ToShortDateString() + "','Amount Transfer From Admin'," + Double.Parse(TextBox4.Text) + ",0)", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            String txtMobileNo = "";
            String Msg = "";
            cmd.CommandText = "select MobileNo from tblMemberMaster where UserCode = '" + ConfigurationManager.AppSettings["MainID"].ToString() + "'";
            con.Open();
            txtMobileNo = cmd.ExecuteScalar().ToString();
            Msg = int.Parse((TextBox4.Text)).ToString() + " Points Recd. from Admin";
            Label1.Text = "Points Added Successfully";
            con.Close();
            return;
        }
    }
}