using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;
using WGRL._03032003;

namespace OpinionWorldGroup.Admin
{
    public partial class AchieverStatus : System.Web.UI.Page
    {
        //SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Reward Achiever List") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/240578/AdminHome.aspx");



            //con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            //if (Session["Usercode"] == null)
            //{
            //    Response.Redirect("~/Default.aspx");
            //}


            if (!IsPostBack)
            {
                //con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                //SqlCommand cmd = new SqlCommand("Select Rank from RanksMaster order by RankId ", con);
                //SqlDataAdapter sda = new SqlDataAdapter(cmd);
                //DataSet ds = new DataSet();
                //sda.Fill(ds);
                //DropDownList1.DataSource = ds;
                //DropDownList1.DataTextField = "Rank";
                //DropDownList1.DataBind();
                showdata();
            }
        }



        protected void showdata()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT RanksMaster.Qualification, RanksMaster.Rewards,RewardsAchieved.Id, RewardsAchieved.DOA AS AchievedDate,  tblMemberMaster.UserCode, tblMemberMaster.UserName, RewardsAchieved.DOR AS ReceivedDate,RewardsAchieved.Remarks,CASE WHEN Remarks = '' or Remarks is null THEN cast(1 as bit) ELSE cast(0 as bit) END as visible FROM RanksMaster INNER JOIN RewardsAchieved ON RanksMaster.RankID = RewardsAchieved.RewardID INNER JOIN tblMemberMaster ON RewardsAchieved.UserCode = tblMemberMaster.UserCode   ORDER BY  RewardsAchieved.DOA desc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();


        }

       

        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        //    SqlCommand cmd = new SqlCommand("SELECT RanksMaster.Rank, RanksMaster.Rewards, RewardsAchieved.DOE AS AchievedDate, RewardsAchieved.DOR AS ReceivedDate, tblMemberMaster.UserCode, tblMemberMaster.UserName FROM RanksMaster INNER JOIN RewardsAchieved ON RanksMaster.RankID = RewardsAchieved.RewardID INNER JOIN tblMemberMaster ON RewardsAchieved.UserCode = tblMemberMaster.UserCode where RanksMaster.Rank = '" + DropDownList1.SelectedValue + "' ORDER BY RanksMaster.RankID", con);
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    sda.Fill(ds);
        //    GridView1.DataSource = ds;
        //    GridView1.DataBind();

        //}

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

      

        //protected void linkbtn_Click(object sender, EventArgs e)
        //{
        //    LinkButton linkbtn = (LinkButton)sender;
        //    var lblID = (Label)linkbtn.FindControl("Label1");
            
        //    Response.Redirect("AchieverstatusDateUpdate.aspx?RID=" + lblID.Text + "");
        //}

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select RanksMaster.Qualification, RanksMaster.Rewards,RewardsAchieved.Id, RewardsAchieved.DOA AS AchievedDate, tblMemberMaster.UserCode, tblMemberMaster.UserName, RewardsAchieved.DOR AS ReceivedDate,RewardsAchieved.Remarks,CASE WHEN Remarks = '' or Remarks is null THEN cast(1 as bit) ELSE cast(0 as bit) END as visible FROM RanksMaster INNER JOIN RewardsAchieved ON RanksMaster.RankID = RewardsAchieved.RewardID INNER JOIN tblMemberMaster ON RewardsAchieved.UserCode = tblMemberMaster.UserCode where cast(RewardsAchieved.DOA as date) >= cast('" + TextBox1.Text+" ' as date) and Cast(RewardsAchieved.DOA as date) <= cast('"+TextBox2.Text+ "' as date)ORDER BY RanksMaster.RankID", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("AchieverStatus.xls", this.GridView1);
        }

        protected void linkbtn1_Click(object sender, EventArgs e)
        {
           
        }

        protected void linkbtn1_Click1(object sender, EventArgs e)
        {
            LinkButton linkbtn1 = (LinkButton)sender;
            var lblID = (Label)linkbtn1.FindControl("Label1");
            Response.Redirect("UpdateAchieverList.aspx?RID=" + lblID.Text + "");
        }


        //protected void dropdownlist1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    showdata();

        //}


    }
}