using System;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WGRL.User
{
    public partial class ListView : System.Web.UI.Page
    {
        //SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string x = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            con=new SqlConnection(x);
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter("Select CONVERT(varchar(10), DOJ, 103) [JoinDate],ConfirmDate,UserCode [MemberID], [dbo].[MySponsor](usercode )as SponserId,UserName [MemberName],Pinamount,MobileNo,CurrentRank from tblMemberMaster where usercode in (select * from esc.MyLeftDownline('" + Session["UserCode"] + "')) ORDER BY ConfirmDate Desc", con);
                da.SelectCommand.CommandTimeout = 0;
                DataSet ds = new DataSet();
                da.Fill(ds);
                Grid1.DataSource = ds;
                Grid1.DataBind();
                SqlDataAdapter da1 = new SqlDataAdapter("Select CONVERT(varchar(10), DOJ, 103) [JoinDate],ConfirmDate,UserCode [MemberID],[dbo].[MySponsor](usercode )as SponserId,UserName [MemberName],Pinamount,MobileNo,CurrentRank from tblMemberMaster where UserCode in (select * from esc.MyRightDownline('" + Session["UserCode"] + "')) ORDER BY ConfirmDate Desc", con);
                da1.SelectCommand.CommandTimeout = 0;
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                Grid2.DataSource = ds1;
                Grid2.DataBind();
                if (Request.QueryString["Side"] == "Left")
                {
                    Label2.Text = ds.Tables[0].Rows.Count.ToString();
                }
                else if (Request.QueryString["Side"] == "Right")
                {
                    Label2.Text = ds1.Tables[0].Rows.Count.ToString();
                }

            }
            if (Request.QueryString["Side"] == "Left")
            {
                Grid1.Visible = true;
                Grid2.Visible = false;
                //Label2.Text = Grid1.Rows.Count.ToString();
            }
            else if (Request.QueryString["Side"] == "Right")
            {

                Grid2.Visible = true;
                Grid1.Visible = false;
                //Label2.Text = Grid1.Rows.Count.ToString();
            }
            else
            {
                Response.Redirect("~/user/userhome.aspx");           
            }  
            
        }

        protected void Left_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            Label2.Text = e.AffectedRows.ToString();
        }

        protected void Right_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            Label2.Text = e.AffectedRows.ToString();
            
               
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string x = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            con = new SqlConnection(x);

            if (Request.QueryString["Side"] == "Left")
            {
                Grid1.Visible = true;
                Grid2.Visible = false;
                SqlDataAdapter da = new SqlDataAdapter("Select CONVERT(varchar(10), DOJ, 103) [JoinDate],ConfirmDate,UserCode [MemberID],[dbo].[MySponsor](usercode )as SponserId,UserName [MemberName],Pinamount,MobileNo,CurrentRank,dbo.MyRankPercString(UserCode) [Cadre] from tblMemberMaster where UserCode in (SELECT MemberID FROM TblMatrixtreeMaster WHERE (SponserID = '" + Session["UserCode"] + "') and cast(DOJ as date)>=cast('" + txtfrom.Text + "' as date) and cast(DOJ as date)<=cast('" + txtTo.Text + "' as date) AND MemberID in (select * from esc.MyLeftDownline('" + Session["UserCode"] + "')))ORDER BY ConfirmDate Desc ", con);
                da.SelectCommand.CommandTimeout = 0;
                DataSet ds = new DataSet();
                da.Fill(ds);
                Grid1.DataSource = ds;
                Grid1.DataBind();
                Label2.Text = ds.Tables[0].Rows.Count.ToString();
            }
            else if (Request.QueryString["Side"] == "Right")
            {

                Grid2.Visible = true;
                Grid1.Visible = false;
                SqlDataAdapter da = new SqlDataAdapter("Select CONVERT(varchar(10), DOJ, 103) [JoinDate],ConfirmDate,UserCode [MemberID],[dbo].[MySponsor](usercode )as SponserId,UserName [MemberName],Pinamount,MobileNo,CurrentRank,dbo.MyRankPercString(UserCode) [Cadre] from tblMemberMaster where UserCode in (SELECT MemberID FROM TblMatrixtreeMaster WHERE (SponserID = '" + Session["UserCode"] + "')and cast(DOJ as date)>=cast('" + txtfrom.Text + "' as date) and cast(DOJ as date)<=cast('" + txtTo.Text + "' as date) AND MemberID in (select * from esc.MyRightDownline('" + Session["UserCode"] + "')))ORDER BY ConfirmDate Desc", con);
                da.SelectCommand.CommandTimeout = 0;
                DataSet ds = new DataSet();
                da.Fill(ds);
                Grid2.DataSource = ds;
                Grid2.DataBind();
                Label2.Text = ds.Tables[0].Rows.Count.ToString();
            }
            
        }

        protected void Grid1_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
        {
            //int[] a = new int[1000];
          
        }
    }
}