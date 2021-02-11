using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WGRL._03032003;


namespace Bvirodh._240578
{
    public partial class SponsorSubordinate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("DownLine List") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            BindGridView();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }


        public void BindGridView()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select tblmembermaster.Usercode, tblmembermaster.username,tblMemberMaster.Email, tblMemberMaster.SponsorID , [dbo].[MySponsorName](tblmembermaster.Usercode) as Spname,tblMemberMaster.Address+''+ tblMemberMaster.City+' '+tblMemberMaster.State +' '+tblMemberMaster.District as address, Convert(Varchar,tblmembermaster.DOJ,103)as DOJ, tblmembermaster.MobileNo,tblmatrixmaster.level,convert(varchar,tblmembermaster.confirmdate,103)as confirmdate from tblmembermaster with (nolock) Inner Join tblmatrixmaster with (nolock) on tblmembermaster.usercode=tblmatrixmaster.memberiD where tblmatrixmaster.sponserID =@Sponsor and tblmembermaster.DOJ>=@dojfrom and tblmembermaster.DOJ<=@dojto  order by tblmembermaster.DOJ", con);
            cmd.Parameters.AddWithValue("@Sponsor", SponsorId.Text);
            cmd.Parameters.AddWithValue("@dojfrom", DateFrom.Text);
            cmd.Parameters.AddWithValue("@dojto", DateTo.Text);

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("TotalDownline.xls", this.GridView1);
        }


    }
}