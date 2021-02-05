using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Amazewellness._240578
{
    public partial class TotalDirectMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "SELECT Isnull(count(*),0) FROM tblTreeMaster INNER JOIN tblMemberMaster ON tblTreeMaster.MemberID = tblMemberMaster.UserCode WHERE (tblTreeMaster.SponserID ='" + TextBox1.Text + "') AND (tblTreeMaster.SponserID <> tblTreeMaster.MemberID) AND (cast(tblMemberMaster.DOJ as date) >= cast('" + TextBox2.Text + "' as Date) and cast(tblMemberMaster.DOJ as date) <= cast('" + TextBox3.Text + "' as Date)) ";
            con.Open();
           LabelCount.Text= cmd.ExecuteScalar().ToString();
            con.Close();
            Panel1.Visible = true;
            //cmd.CommandText = "select memberid,sponserid from tbltreemaster where sponserid='" + TextBox1.Text + "' and memberid!=sponserid and (cast(dateoftransaction as date) <= cast('" + TextBox2.Text + "' as Date) and cast(dateoftransaction as date) >= cast('" + TextBox3.Text + "' as Date))";
            cmd.CommandText = "SELECT tblMemberMaster.UserCode,tblMemberMaster.Username,tblMemberMaster.DOJ FROM tblMemberMaster INNER JOIN tblTreeMaster ON  tblMemberMaster.UserCode = tblTreeMaster.MemberID WHERE (tblTreeMaster.SponserID ='" + TextBox1.Text + "') AND (tblTreeMaster.SponserID <> tblTreeMaster.MemberID) AND (cast(tblMemberMaster.DOJ as date) >= cast('" + TextBox2.Text + "' as Date) and cast(tblMemberMaster.DOJ as date) <= cast('" + TextBox3.Text + "' as Date)) order by tblMemberMaster.DOJ ";
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }
    }
}