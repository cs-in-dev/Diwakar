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

namespace WGRL.User
{
    public static class ResponseHelper
    {
        public static void Redirect(string url, string target, string windowFeatures)
        {
            HttpContext context = HttpContext.Current;

            if ((String.IsNullOrEmpty(target) ||
                target.Equals("_self", StringComparison.OrdinalIgnoreCase)) &&
                String.IsNullOrEmpty(windowFeatures))
            {

                context.Response.Redirect(url);
            }
            else
            {
                Page page = (Page)context.Handler;
                if (page == null)
                {
                    throw new InvalidOperationException(
                        "Cannot redirect to new window outside Page context.");
                }
                url = page.ResolveClientUrl(url);

                string script;
                if (!String.IsNullOrEmpty(windowFeatures))
                {
                    script = @"window.open(""{0}"", ""{1}"", ""{2}"");";
                }
                else
                {
                    script = @"window.open(""{0}"", ""{1}"");";
                }

                script = String.Format(script, url, target, windowFeatures);
                ScriptManager.RegisterStartupScript(page,
                    typeof(Page),
                    "Redirect",
                    script,
                    true);
            }
        }
    }
    public partial class MyPayouts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        decimal totalPayout, totalTds, totalprevs,totalpayments,TotalGrossPayout;
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           // ResponseHelper.Redirect("~/User/PrintPayouts.aspx?ID=" + GridView1.SelectedDataKey[0].ToString(), "_blank", "menubar=0");
            Response.Redirect("~/User/PrintPayouts.aspx?ID=" + GridView1.SelectedDataKey[0].ToString());
            //Response.Write("<script type='text/javascript'>window.open('PrintPayouts.aspx?ID=" + GridView1.SelectedDataKey[0].ToString() + "','_blank');</script>");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalPayout += decimal.Parse(((Label)e.Row.FindControl("Label1")).Text);
                totalTds += decimal.Parse(((Label)e.Row.FindControl("Label2")).Text);
                //totalprevs += decimal.Parse(((Label)e.Row.FindControl("Label3")).Text);
                //totalpayments += decimal.Parse(((Label)e.Row.FindControl("LabelPayments")).Text);
                //TotalGrossPayout += decimal.Parse(((Label)e.Row.FindControl("Label4")).Text);
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Grand Total:";
                Label Total1Payout = (Label)e.Row.FindControl("Total1Payout");
                Total1Payout.Text = totalPayout.ToString();
                Label TotalTDS = (Label)e.Row.FindControl("TotalTDS");
                TotalTDS.Text = totalTds.ToString();
                Label admincharges = (Label)e.Row.FindControl("AdminCharges");
                TotalTDS.Text = totalTds.ToString();
                Label GrossPayable = (Label)e.Row.FindControl("GrossPayable");
                TotalTDS.Text = totalTds.ToString();
                //Label PreviousBalance = (Label)e.Row.FindControl("PreviousBalance");
                //PreviousBalance.Text = totalprevs.ToString();
                //Label Payments = (Label)e.Row.FindControl("Payments");
                //Payments.Text = totalpayments.ToString();
                //Label TotalGrossPayable = (Label)e.Row.FindControl("NetPayable");
                //TotalGrossPayable.Text = TotalGrossPayout.ToString();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            SqlDataSource1.DataBind();
        }

    }

}
