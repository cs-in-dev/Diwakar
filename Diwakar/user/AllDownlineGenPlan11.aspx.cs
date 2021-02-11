using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.UI.HtmlControls;
using DataAccessLayer;
using WGRL._03032003;

namespace sarvodaya.user
{
    public partial class AllDownlineGenPlan11 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usercode"] == null)
            {
                Response.Write("default.aspx");
            }

        }

        protected void showdata()
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Select tblmembermaster.pinamount,tblmatrixmaster.level,tblmembermaster.Usercode, tblmembermaster.username, tblMemberMaster.SponsorID as SPID, Convert(Varchar,tblmembermaster.DOJ,103)as DOJ, tblmembermaster.MobileNo,convert(varchar,tblmembermaster.confirmdate,103)as confirmdate,case tblmembermaster.myrank when 1 then cast(0 as bit) else cast(1 as bit) end as sts from tblmembermaster with (nolock) Inner Join tblmatrixmaster with (nolock) on tblmembermaster.usercode=tblmatrixmaster.memberiD where tblmatrixmaster.sponserID =@spid and tblmembermaster.DOJ>=@date1 and tblmembermaster.DOJ<=@date2  order by tblmembermaster.DOJ", con);
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@date1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@date2", TextBox2.Text);
                cmd.Parameters.AddWithValue("@spid", Session["Usercode"].ToString());
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Open();
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                Repeater1.Visible = true;

            }
            catch { }
            con.Close();
        }


        //protected void btnrank_Click(object sender, EventArgs e)
        //{
        //    Button abc = (Button)sender;
        //    var uc = (Label)abc.FindControl("lblusercode");
        //    string usercode = uc.Text.ToString();
        //    Response.Redirect("~/user/ViewRankUpgradedetails.aspx?uc=" + usercode);
        //}

    }
}