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
    public partial class SurveyQuestions : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            SqlCommand Idcmd= new SqlCommand("Select isnull(Max(QuesID),0)+1 from tblsurveyquestions where SurveyID = " + DropDownList1.SelectedValue,con);
            con.Open();
            int id = int.Parse(Idcmd.ExecuteScalar().ToString());
            con.Close();

            HiddenField1.Value=DropDownList1.SelectedValue;
            SqlCommand cmd = new SqlCommand("INSERT INTO tblSurveyQuestions(SurveyID, QuesId, Question, Answer1, Answer2, Answer3, Answer4) VALUES(@SurveyID, @QuesId, @Question, @Answer1, @Answer2, @Answer3, @Answer4)", con);
            cmd.Parameters.AddWithValue("@SurveyID", HiddenField1.Value);
            cmd.Parameters.AddWithValue("@QuesId", id);
            cmd.Parameters.AddWithValue("@Question", txtQusetion.Text);
            cmd.Parameters.AddWithValue("@Answer1", txtanswer1.Text);
            cmd.Parameters.AddWithValue("@Answer2", txtanswer2.Text);
            cmd.Parameters.AddWithValue("@Answer3", txtanswer3.Text);
            cmd.Parameters.AddWithValue("@Answer4", txtanswer4.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            txtQusetion.Text = "";
            txtanswer1.Text = "";
            txtanswer2.Text = "";
            txtanswer3.Text = "";
            txtanswer4.Text = "";
            label1.Text = "successfully Add";

            SqlDataSource1.DataBind();
            GridView1.DataBind();
            
        }

    }
}