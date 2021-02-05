using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WGRL._03032003;

namespace Sabaic._19111973
{
    public partial class Kycuploaduser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("KYC") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (!Page.IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandText = "select *,[dbo].[MySponsorName](UserCode) as SpName from tblmembermaster where VoterCard !='' and UploadPhoto !='' and CheckBook !='' and PanCardProof !=''";
                SqlDataAdapter dts = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dts.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            // SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("KycAprovedList.xls", this.GridView1);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select *,[dbo].[MySponsorName](UserCode) as SpName from tblmembermaster where VoterCard !='' and UploadPhoto !='' and CheckBook !='' and PanCardProof !='' and kycApprovedStatus=@kycApprovedStatus";
            cmd.Parameters.AddWithValue("@kycApprovedStatus", DropDownList1.SelectedValue);
            SqlDataAdapter dts = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dts.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</Script>"));
        }

        protected void chk_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chk = (CheckBox)sender;
                var uidd = (Label)chk.FindControl("Label1");
                string uids = uidd.Text.ToString();

                SqlCommand cmd = new SqlCommand("select isnull(kycApprovedDate,'1940/01/01')  as date from tblMemberMaster where UserCode=@id", con);
                cmd.Parameters.AddWithValue("@id", uids);
                con.Open();
                object date = cmd.ExecuteScalar();
                con.Close();
                var kycapprovedate = date == null ? new DateTime(1940, 01, 01) : Convert.ToDateTime(date);
                var todadate = DateTime.Now.ToString("MM-dd-yyyy");

                var kycapprovedate_string = kycapprovedate.ToString("MM-dd-yyyy");
                //SqlCommand cmd1 = new SqlCommand("select isnull(CONVERT(VARCHAR(19),getdate(),111),101)  as date", con);
                //con.Open();
                //string date1 = cmd1.ExecuteScalar().ToString();
                //con.Close();

                if (kycapprovedate_string == todadate)
                {
                    SqlCommand cmd6 = new SqlCommand("update [dbo].[tblMemberMaster] set kycApprovedStatus=0,kycApprovedDate=null where UserCode=@id ", con);
                    cmd6.Parameters.AddWithValue("@id", uids);
                    con.Open();
                    cmd6.ExecuteNonQuery();
                    con.Close();
                    MsgBox("Unapproved Successfully");
                }
                else if (kycapprovedate_string == "01-01-1940")
                {
                    SqlCommand cmd6 = new SqlCommand("update [dbo].[tblMemberMaster] set kycApprovedStatus=1,kycApprovedDate=getdate() where UserCode=@id ", con);
                    cmd6.Parameters.AddWithValue("@id", uids);
                    con.Open();
                    cmd6.ExecuteNonQuery();
                    con.Close();
                    MsgBox("Approved Successfully");
                }
                else
                {
                    MsgBox("You Cannot Approveded");
                }
            }
            catch (Exception ex)
            {

            }
         }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select *,[dbo].[MySponsorName](UserCode) as SpName from tblmembermaster where VoterCard !='' and UploadPhoto !='' and CheckBook !='' and PanCardProof !='' and usercode=@Memberid";
            cmd.Parameters.AddWithValue("@Memberid", txtmemberid.Text);
            SqlDataAdapter dts = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dts.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlCommand cmd1 = new SqlCommand("", con);
            cmd1.CommandText = "select *,[dbo].[MySponsorName](UserCode) as SpName from tblmembermaster where  VoterCard !='' and UploadPhoto !='' and CheckBook !='' and kycApprovedStatus=@kycApprovedStatus and PanCardProof !='' and cast(KycUploderDate as date) >= @DOJ AND cast(KycUploderDate as date) <=@DOJ2";
            cmd1.Parameters.AddWithValue("@DOJ", txtdatefrom.Text);
            cmd1.Parameters.AddWithValue("@DOJ2", txtdateto.Text);
            cmd1.Parameters.AddWithValue("@kycApprovedStatus", DropDownList1.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.Parameters.Clear();
            cmd.CommandText = "select *,[dbo].[MySponsorName](UserCode) as SpName from tblmembermaster where  kycApprovedStatus=@kycApprovedStatus";
            cmd.Parameters.AddWithValue("@kycApprovedStatus", DropDownList1.SelectedValue);
            SqlDataAdapter dts = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dts.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}