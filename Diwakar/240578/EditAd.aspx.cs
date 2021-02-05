using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ukinvestorNEW.Admin
{
    public partial class EditAd : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Update tblSurvey SET Link=@Link Where SurveyID = " + DropDownList1.SelectedValue, con);
            cmd.Parameters.AddWithValue("@Link", EmailBody.Content);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            label1.Text = "Updated";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Select Link from tblSurvey where SurveyID=" + DropDownList1.SelectedValue,con);
            con.Open();
            EmailBody.Content = cmd.ExecuteScalar().ToString();
            con.Close();
        }

    }
}