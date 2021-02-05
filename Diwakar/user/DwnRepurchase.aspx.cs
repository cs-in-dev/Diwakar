using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

namespace Amazewellness.user
{
    public partial class DwnRepurchase : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);       

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ddlYear.Items.Insert(0, new ListItem("-Year-", "-1"));
                    for (var i = 2014; i <= 2020; i++)
                    {
                        ddlYear.Items.Add(i.ToString());
                    }
                    ddlYear.SelectedValue = DateTime.Now.Year.ToString();
                    ddlMonth.SelectedValue = DateTime.Now.Month.ToString();                    
                }              

            }
            catch { }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                FillGrid(Session["UserCode"].ToString());
            }
            catch
            { }
        }

        protected void FillGrid(String Sponsor)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select *,(SR+DR) Total, MemberID as Downline, dbo.MySponsor('" + Sponsor + "') as Upline from (select UserCode MemberID, [dbo].[Repurchase_By_MonthNYear](UserCode," + ddlMonth.SelectedValue + "," + ddlYear.SelectedValue + ") as SR, [dbo].[DownlineRepurchase](UserCode," + ddlMonth.SelectedValue + "," + ddlYear.SelectedValue + ") DR from tblMemberMaster where UserCode in (select MemberID from tblMatrixMaster where SponserID = '" + Sponsor + "' AND SponserID != MemberID AND [Level] = 1)) Sheshnath order by (SR+DR) desc", con);
                DataTable dt = new DataTable();
                da.SelectCommand.CommandTimeout = 0;
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
                if (Sponsor == Session["UserCode"].ToString())
                        lnk.Visible = false;
                if (dt.Rows.Count == 0)
                {
                    if (Sponsor == Session["UserCode"].ToString())
                        lnk.Visible = false;
                    else
                        lnk.Visible = true;
                }
            }
            catch
            { }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            FillGrid(btn.ToolTip);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            FillGrid(btn.ToolTip);
        }

    }
}