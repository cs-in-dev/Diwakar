using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using WGRL._03032003;
using System.Globalization; 

namespace GOG.Admin
{
    public partial class ViewPayoutsNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("View Payouts") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
        }
        SqlCommand cmd;
        protected void Button1_Click(object sender, EventArgs e)
        {
            //DateTime dateTimeVal1;
            //string newFormat1 = null;
            //if (DateTime.TryParseExact(TextBox4.Text, "yyyy/MM/dd HH:mm:ss", null, DateTimeStyles.None, out dateTimeVal1))
            //{
            //    //newFormat1 = dateTimeVal1.ToString("MM/dd/yyyy");
            //    newFormat1 = dateTimeVal1.ToString("yyyy/MM/dd HH:mm:ss");
            //}
            //DateTime dateTimeVal;
            //string newFormat = null;
            //if (DateTime.TryParseExact(TextBox3.Text, "yyyy/MM/dd HH:mm:ss", null, DateTimeStyles.None, out dateTimeVal))
            //{
            //    newFormat = dateTimeVal.ToString("yyyy/MM/dd HH:mm:ss");
            //}
           
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlDataAdapter da = new SqlDataAdapter("SELECT Payouts.UserCode,tblMemberMaster.UserName, cast(Payouts.DateFrom as date) DateFrom, cast(Payouts.DateTo as date) DateTo, Payouts.TrackID,Payouts.GrossPayable,CASE when cast([dbo].[APayPayment](Payouts.UserCode,Payouts.DateTo) as decimal(18,0))<cast(Payouts.GrossPayable as decimal(18,0)) then '~/240578/payments.aspx?Ucode='+Payouts.UserCode + '&dt=' + cast(cast((Payouts.DateTo)as date) as nvarchar)+ '&amt='+cast(Payouts.GrossPayable as nvarchar) else '~/240578/ViewPayouts.aspx' End AS Clickhere, tblMemberMaster.PanNo,tblMemberMaster.AccountNo,tblMemberMaster.BankName,tblMemberMaster.MobileNo,tblMemberMaster.IFSCCode,Payouts.BinaryIncome,Payouts.ZoneIncome as PerformanceBonus,Payouts.SingleLegIncome as RepurchasIncome,Payouts.PinCharges as DirectIncome,Payouts.stateIncome as RedemptionIncome,Payouts.SalaryIncome as CashBackInCome,Payouts.SelfCashBackIncome,Payouts.TotalPayout, Payouts.TDS,Payouts.Admincharges as ServiceTax FROM tblMemberMaster INNER JOIN Payouts ON tblMemberMaster.UserCode = Payouts.UserCode where TrackID IS NOT NULL AND Payouts.GrossPayable > 0 and CONVERT(VARCHAR(11),GenratedOn,111) = '" + DropDownList1.SelectedValue + "'", con);
            //cmd.Parameters.AddWithValue("@DOJ", TextBox3.Text);
            //cmd.Parameters.AddWithValue("@DOJ2", TextBox4.Text);
            //if (TextBox3.Text != "" && TextBox4.Text != "")
            //    da.SelectCommand.CommandText += " and cast(DateTo as date) >= cast('" + Convert.ToDateTime(TextBox4.Text).Date + "' as date) and Cast(DateTo as date) <= cast('" + Convert.ToDateTime(TextBox3.Text).Date + "' as date)";



            if (TextBox2.Text != "")
                da.SelectCommand.CommandText += da.SelectCommand.CommandText.Contains("where") == false ? " where Payouts.UserCode='" + TextBox2.Text + "'" : " and Payouts.UserCode='" + TextBox2.Text + "'";
            if (TextBox5.Text != "")
                da.SelectCommand.CommandText += da.SelectCommand.CommandText.Contains("where") == false ? " where Payouts.TrackID='" + TextBox5.Text + "'" : " and Payouts.TrackID='" + TextBox5.Text + "'";
            da.SelectCommand.CommandText += "order by TrackID DESC";
            con.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "table");
            con.Close();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("ViewPayouts.xls", this.GridView1);
        }

       
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType== DataControlRowType.DataRow)
            {
                HyperLink h1 = new HyperLink();
                h1.NavigateUrl = e.Row.Cells[9].Text.Replace("&amp;", "&");
                if (h1.NavigateUrl != "~/240578/ViewPayouts.aspx")
                {
                    h1.Text = "Pay Now";
                    e.Row.Cells[9].Controls.Add(h1);
                    h1.Target = "_Blank";
                }
                else
                {
                    //h1.Visible = false;
                
                    h1.ImageUrl= "~/240578/images/tick_ok_sign.png";
                    //h1.Text = "All Ready Pay ";
                    e.Row.Cells[9].Controls.Add(h1);
                }
                
            }
        }
    }
}