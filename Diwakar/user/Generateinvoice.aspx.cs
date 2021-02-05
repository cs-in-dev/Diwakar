using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WGRL.Franchise;

namespace peopleshop._User
{
    public partial class Generateinvoice : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        string Ordid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Panel2.Visible = false;
            }
            if (Request.QueryString["oid"] != null)
            {
                Ordid = Request.QueryString["oid"].ToString();
                Session["ordid"] = Ordid;
                SqlCommand cmd = new SqlCommand("select orderid from MasterProdPurRequest where orderid=" + Ordid + "", con);
                con.Open();
                int x = int.Parse(cmd.ExecuteScalar().ToString());
                if (x > 0)
                {
                    cmd.CommandText = "select Usercode,username,Address,dbo.MyRankPercString(UserCode) as Cadre1,dbo.MyRanks(UserCode) as Rank,dbo.GetStatus(UserCode) Status1 from tblmembermaster where usercode in (select Memberid from DetailProdPurRequest where orderid in (select orderid from MasterProdPurRequest where orderid=" + Ordid + "))";
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Panel2.Visible = true;
                        lblcode.Text = dr["UserCode"].ToString();
                        lblusername.Text = dr["UserName"].ToString();
                        lbladd.Text = dr["Address"].ToString();
                        //lblCadre.Text = dr["Cadre1"].ToString();
                        //lblRank.Text = dr["Rank"].ToString();
                        //lblStatusss.Text = dr["Status1"].ToString();
                        lblinvoice.Text = Ordid.ToString();
                    }

                    dr.Close();
                    cmd.CommandText = "select sorderdate,Status from MasterProdPurRequest where orderid=" + Ordid + "";

                    DateTime dt = DateTime.Parse(cmd.ExecuteScalar().ToString());
                    lbldate.Text = dt.ToLongDateString();
                    cmd.CommandText = "select Status from MasterProdPurRequest where orderid=" + Ordid + "";
                    lblStatus.Text = cmd.ExecuteScalar().ToString();
                    

                    //GridView1.DataSourceID = "SqlDataSource1";
                    //GridView1.DataBind();
                   
                    cmd.CommandText = "select sum(sAmount)  from DetailProdPurRequest where OrderID in(Select orderID from MasterProdPurRequest where orderid=" + Ordid + ")";
                    decimal a = decimal.Parse(cmd.ExecuteScalar().ToString());
                 
                    //lblnetamount.Text = System.Math.Round((a - 0), 2).ToString();
                    //NumberToEnglish ob = new NumberToEnglish();
                    //lbltextprice.Text = ob.changeNumericToWords(Convert.ToDouble(a - 0)).ToString();

                    cmd.CommandText = "select sum(sAmount) taxableAmount from DetailProdPurRequest where OrderID in(Select orderID from MasterProdPurRequest where orderid=" + Ordid + ")";
                    SqlDataReader dr1 = cmd.ExecuteReader();

                    while (dr1.Read())
                    {
                        
                    }
                    dr1.Close();
                    con.Close();
                }
            }
        }

       //protected void Button1_Click1(object sender, EventArgs e)
       // {
       //     SqlCommand cmd = new SqlCommand("select orderid from MasterProdPurRequest where orderid=" + Ordid + "", con);
       //     con.Open();
       //    int x=int.Parse( cmd.ExecuteScalar().ToString());
       //    if (x > 0)
       //    {
       //        cmd.CommandText = "select usercode,username,Address from tblmembermaster where usercode in (select Memberid from DetailProdPurRequest where orderid in (select orderid from MasterProdPurRequest where orderid=" + Ordid + "))";
       //        SqlDataReader dr = cmd.ExecuteReader();
       //        while (dr.Read())
       //        {
       //            Panel2.Visible = true;
       //            lblcode.Text = dr["UserCode"].ToString();
       //            lblusername.Text = dr["UserName"].ToString();
       //            lbladd.Text = dr["Address"].ToString();
       //            lblinvoice.Text = Ordid.ToString();


       //        }

       //        dr.Close();
       //        cmd.CommandText = "select sorderdate from MasterProdPurRequest where orderid=" + Ordid + "";
       //        DateTime dt = DateTime.Parse(cmd.ExecuteScalar().ToString());
       //        lbldate.Text = dt.ToString();

       //        //SqlDataAdapter da = new SqlDataAdapter(" SELECT ProductRepurchase.ProductName, Round(RepurchaseOrderDetails.Price,2) Price , RepurchaseOrderDetails.ProductQty, RepurchaseOrderDetails.TaxableAmount,ProductRepurchase.ProductCode, RepurchaseOrderDetails.PV as BV, RepurchaseOrderDetails.Discount, RepurchaseOrderDetails.Vat FROM RepurchaseOrderDetails INNER JOIN ProductRepurchase ON RepurchaseOrderDetails.ProductID = ProductRepurchase.ProductID where RepurchaseOrderDetails.orderid=" + x + "", con);
       //        //DataSet ds = new DataSet();
       //        //da.Fill(ds);

       //        //GridView1.DataSource = ds;
       //        //GridView1.DataBind();

       //        cmd.CommandText = "select sum(sAmount)  from DetailProdPurRequest where OrderID in(Select orderID from MasterProdPurRequest where orderid=" + Ordid + ")";
       //        decimal a = decimal.Parse(cmd.ExecuteScalar().ToString());
       //        // lblordamount.Text = System.Math.Round(a,2).ToString();
       //        //cmd.CommandText = " select sum(discount)  from DetailProdPurRequest where OrderID in(Select orderID from MasterProdPurRequest where orderid=" + Ordid + ")";
       //        //decimal b=decimal.Parse(cmd.ExecuteScalar().ToString());
       //        //lbldiscount.Text = System.Math.Round(b,2).ToString();
       //        //a = System.Math.Round(a, 2);
       //        //b = System.Math.Round(b, 2);
       //        lblnetamount.Text = System.Math.Round((a - 0), 2).ToString();
       //        NumberToEnglish ob = new NumberToEnglish();
       //        lbltextprice.Text = ob.changeNumericToWords(Convert.ToDouble(a - 0)).ToString();

       //        cmd.CommandText = "select sum(sAmount) taxableAmount from DetailProdPurRequest where OrderID in(Select orderID from MasterProdPurRequest where orderid=" + Ordid + ")";
       //        SqlDataReader dr1 = cmd.ExecuteReader();

       //        while (dr1.Read())
       //        {
       //        //    if (System.Math.Round((Convert.ToDecimal(dr1["vat"])), 0) == 13)
       //        //    {


       //        //        lbltax13.Text = System.Math.Round(decimal.Parse(dr1["taxableAmount"].ToString()), 2).ToString();
       //        //        lbltax5.Text = 0.ToString();
       //        //        lbltax4.Text = 0.ToString();




       //        //    }
       //        //    else if (System.Math.Round((Convert.ToDecimal(dr1["vat"])), 0) == 5)
       //        //    {
       //                //lbltax5.Text = System.Math.Round(decimal.Parse(dr1["taxableAmount"].ToString()), 2).ToString();
       //                //lbltax13.Text = 0.ToString();
       //                //lbltax4.Text = 0.ToString();
       //            //}
       //        }
       //        dr1.Close();
       //        //        cmd.CommandText = "select isnull(sum(taxableAmount),0)*Vat/100 as vatamount,Vat from RepurchaseOrderDetails  where  OrderID in (select orderid from invoicereport where invoiceno=" + Ordid + ") group by vat";
       //        //        SqlDataReader dr2 = cmd.ExecuteReader();

       //        //        while (dr2.Read())
       //        //        {
       //        //            if (System.Math.Round((Convert.ToDecimal(dr2["vat"])), 0) == 13)
       //        //            {


       //        //                lblvat13.Text = System.Math.Round(decimal.Parse(dr2["vatamount"].ToString()),2).ToString();
       //        //                lblvat5.Text = 0.ToString();
       //        //                lblvat4.Text = 0.ToString();




       //        //            }
       //        //            else if (System.Math.Round((Convert.ToDecimal(dr2["vat"])), 0) == 5)
       //        //            {
       //        //                lblvat5.Text = System.Math.Round(decimal.Parse(dr2["vatamount"].ToString()),2).ToString();
       //        //                lblvat13.Text = 0.ToString();
       //        //                lblvat4.Text = 0.ToString();

       //        //            }
       //        //        }

       //        //        dr2.Close();

       //        //}



       //        //        cmd.CommandText = "select isnull(sum(Price)-sum(Discount),0) as netprice,Vat from RepurchaseOrderDetails where OrderId in (select orderid from invoicereport where invoiceno=" + Ordid + ") group by vat";
       //        //        SqlDataReader dr3 = cmd.ExecuteReader();

       //        //        while (dr3.Read())
       //        //        {
       //        //            if (System.Math.Round((Convert.ToDecimal(dr3["vat"])), 0) == 13)
       //        //            {


       //        //                lblnetprice13.Text = System.Math.Round(decimal.Parse(dr3["netprice"].ToString()),2).ToString();
       //        //                lblnetprice5.Text = 0.ToString();
       //        //                netprice4.Text = 0.ToString();






       //        //            }
       //        //            else if (System.Math.Round((Convert.ToDecimal(dr3["vat"])), 0) == 5)
       //        //            {
       //        //                lblnetprice5.Text = System.Math.Round(decimal.Parse(dr3["netprice"].ToString()),2).ToString();
       //        //                lblnetprice13.Text = 0.ToString();
       //        //                netprice4.Text = 0.ToString();

       //        //            }
       //        //        }
       //        //        dr3.Close();
       //        con.Close();



       //    }

       // }

       protected void Button2_Click(object sender, EventArgs e)
       {
           Panel2.Visible = true;
           Session["ctrl"] = Panel2;
           ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=600px,width=800px,scrollbars=1');</script>");
       }
       decimal Price, Discont, qty, TotalPV,BV,netPrice;
       protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
       {
           if (e.Row.RowType == DataControlRowType.DataRow)
           {
               Label lblPrice = (Label)e.Row.FindControl("Label1");

               Label lblQty = (Label)e.Row.FindControl("Label2");
               Label lblAmount = (Label)e.Row.FindControl("Label3");
               Label lblBV = (Label)e.Row.FindControl("Label4");
               //Label lblDiscount = (Label)e.Row.FindControl("Label5");
               //Label lblVat = (Label)e.Row.FindControl("Label6");
               Label lblNetPrice = (Label)e.Row.FindControl("Label7");

               if (e.Row.RowType == DataControlRowType.DataRow)
               {
                   Price += decimal.Parse(e.Row.Cells[3].Text);
                   BV += decimal.Parse(e.Row.Cells[4].Text);
                   qty += decimal.Parse(e.Row.Cells[5].Text);
                   TotalPV += decimal.Parse(e.Row.Cells[6].Text);
                   netPrice += decimal.Parse(e.Row.Cells[7].Text);
               }
          //netPrice += Convert.ToDecimal(lblNetPrice.Text);
          //     Price+=Convert.ToDecimal(lblPrice.Text);
          //     qty+=Convert.ToDecimal(lblQty.Text);
          //   //  TaxabaleAmount+=Convert.ToDecimal(lblAmount.Text);
          //     BV+=Convert.ToDecimal(lblBV.Text);
          //     //Discont+=Convert.ToDecimal(lblDiscount.Text);
          //     //vat+=Convert.ToDecimal(lblVat.Text);
           }
           if (e.Row.RowType == DataControlRowType.Footer)
           {
               e.Row.Cells[2].Text = "Grand Total:";
               //e.Row.Cells[3].Text = Price.ToString();
               e.Row.Cells[5].Text = qty.ToString();
               //e.Row.Cells[4].Text = TaxabaleAmount.ToString();
               e.Row.Cells[6].Text = TotalPV.ToString();
               //e.Row.Cells[6].Text = Discont.ToString();
               //e.Row.Cells[7].Text = vat.ToString();
               e.Row.Cells[7].Text = netPrice.ToString();  
           }


       }
       
    }
}