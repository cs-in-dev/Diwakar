using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace GWG
{
    public partial class MyOrderDetailss : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        string orderID;
        Double totalPayout;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!User.Identity.IsAuthenticated)
            //    Response.Redirect("~/19111973/default.aspx");
            //if (User.IsInRole("19111973") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");
            
            if (!IsPostBack)
            {
                totalPayout = 0;
                if (Request.UrlReferrer == null)
                    Response.Redirect("~/240578/RepurchaseOrders.aspx");
                if (Request.UrlReferrer.ToString().EndsWith("RepurchaseOrders.aspx") == false)
                    Response.Redirect("~/240578/RepurchaseOrders.aspx");
                orderID = Request.QueryString["orderID"].ToString();
            }
                 
        }
        
        

        protected void btnprnt_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = Panel1;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox grd = (TextBox)sender;
            var lblMRP =(Label) grd.FindControl("lblMRP");
            var Mrp = Double.Parse(lblMRP.Text);
            var Qty = Double.Parse(grd.Text);
            var lblID =(Label) grd.FindControl("lbld");
            var ID = int.Parse(lblID.Text);
            cmd = new SqlCommand("", con);
            cmd.CommandText = "Update StockRequestDetails set Amount=(" + Mrp + ")*(" + Qty + "),Qty=" + Qty + " where ID=" + ID;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalPayout += Double.Parse(((Label)e.Row.FindControl("lblA")).Text);

                Label lbl = (Label)e.Row.FindControl("lblA");


            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Grand Total:";
                e.Row.Cells[8].Text = string.Format("{0:f2}",Double.Parse(totalPayout.ToString()));
             


            }

        }
       

        


        
    }
}