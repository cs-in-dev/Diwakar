using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Collections;
using System.Xml.Linq;
using System.Text.RegularExpressions;

namespace Rainsonglobal._240578
{
    public partial class EditDispatchDetails2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Edit Dispatch Details") == false)
                Response.Redirect("~/240578/AdminHome.aspx");


           // this.txtOrderId.Text = Request.QueryString["oId"];

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int oId = Int32.Parse(txtOrderId.Text);
            string paymentmode = "";
            string Amount = "";
            string bankname = "";
            string cashpaymentdate = "";
            string chequedate = "";
            string impsdate = "";
            string refrencenum = "";
            string DispatchDate = "";
            string CourierCompanyName = "";
            string TrackingCode = "";
            string chequenumber = "";
            panelcash.Visible = false;
            panelcheque.Visible = false;
            panelNeft.Visible = false;

            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString()))
            {

                SqlCommand cmd = new SqlCommand("Select * ,Convert(varchar(10),Date,103) as date2,Convert(varchar(10),ChequeDate,103) as date3, Convert(varchar(10),Impsdate,103) as date4,Convert(varchar(10),DispatchDate,103) as date5 from ordermaster where orderid=@orderid", con);

                cmd.Parameters.AddWithValue("@orderid", oId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

               if (dr.HasRows)
               {
                    while (dr.Read())
                    {
                        Panel1.Visible = true;
                        paymentmode = dr["Paymentmode"].ToString();
                        cashpaymentdate = dr["date2"].ToString();
                        Amount = dr["Amount"].ToString();
                        bankname = dr["BankName"].ToString();
                        chequedate = dr["date3"].ToString();
                        impsdate = dr["date4"].ToString();
                        refrencenum = dr["Referencenumber"].ToString();
                        DispatchDate = dr["date5"].ToString();
                      //  CourierCompanyName = dr["CourierCompanyName"].ToString();
                       // TrackingCode = dr["TrackingCode"].ToString();
                        chequenumber = dr["ChequeNo"].ToString();
                    }
               
               }
                else
                    MsgBox("No Record Found.");
              
                if (paymentmode == "Cash")
                {
                    ddlpaymentmode.SelectedValue = paymentmode;
                    txtcashAmount.Text = Amount;
                    txtcashPaymentdate.Text = cashpaymentdate;
                    panelcash.Visible = true;
                    txtcalender.Text = DispatchDate;
                  //  txtcouriercomanyName.Text = CourierCompanyName;
                   // txttrackingcode.Text = TrackingCode;



                    //ddlpaymentmode.SelectedValue = paymentmode;
                    //txtcashAmount.Text = Amount;
                    //txtcashPaymentdate.Text = cashpaymentdate;
                    //panelcash.Visible = true;
                }
                else if (paymentmode == "Cheque")
                {
                    ddlpaymentmode.SelectedValue = paymentmode;
                    txtchequeamount.Text = Amount;
                    txtChecqueDate.Text = chequedate;
                    txtChecqueNo.Text = chequenumber;
                    txtBankName.Text = bankname;
                    panelcheque.Visible = true;
                    txtcalender.Text = DispatchDate;
                 //   txtcouriercomanyName.Text = CourierCompanyName;
                  //  txttrackingcode.Text = TrackingCode;

                    //ddlpaymentmode.SelectedValue = paymentmode;
                    //txtchequeamount.Text = Amount;
                    //txtChecqueDate.Text = chequedate;
                    //txtBankName.Text = bankname;
                    //txtChecqueNo.Text = chequenumber;
                    //panelcheque.Visible = true;
                }
                else if (paymentmode == "IMPS")
                {
                    ddlpaymentmode.SelectedValue = paymentmode;
                    txtneftamount.Text = Amount;
                    txtneftpaymnetdate.Text = impsdate;
                    txtnefRefrencennum.Text = refrencenum;
                    panelNeft.Visible = true;
                    txtcalender.Text = DispatchDate;
                 //   txtcouriercomanyName.Text = CourierCompanyName;
                  //  txttrackingcode.Text = TrackingCode;

                    //ddlpaymentmode.SelectedValue = paymentmode;
                    //txtneftamount.Text = Amount;
                    //txtneftpaymnetdate.Text = impsdate;
                    //txtnefRefrencennum.Text = refrencenum;
                    //panelNeft.Visible = true;
                }
            }
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            int oId = Int32.Parse(txtOrderId.Text);

            if (ddlpaymentmode.SelectedValue == "Cash")
            {
                SqlCommand cmd = new SqlCommand("update  ordermaster set DispatchDate = @DispatchDate ,CourierCompanyName = @CourierCompanyName , TrackingCode = @TrackingCode,status=1,Date=@cashPaymentdate,Amount= @cashAmount,Paymentmode=@Paymentmode where orderid=@orderid", con);
                cmd.Parameters.AddWithValue("@orderid", oId);
                cmd.Parameters.AddWithValue("@DispatchDate", txtcalender.Text);
                cmd.Parameters.AddWithValue("@CourierCompanyName", "");
                cmd.Parameters.AddWithValue("@TrackingCode", "");
                cmd.Parameters.AddWithValue("@cashPaymentdate", txtcashPaymentdate.Text);
                cmd.Parameters.AddWithValue("@cashAmount", txtcashAmount.Text);
                cmd.Parameters.AddWithValue("@Paymentmode", ddlpaymentmode.SelectedValue);

                con.Open();
                int j = cmd.ExecuteNonQuery();
                con.Close();
                if (j > 0)
                {
                    clear();
                    Panel1.Visible = false;
                    panelcash.Visible = false;
                    panelcheque.Visible = false;
                    panelNeft.Visible = false;
                    MsgBox("Dispatch Details Updated Successfully.");
                }
            }


            else if (ddlpaymentmode.SelectedValue == "Cheque")
            {
                SqlCommand cmd = new SqlCommand("update  ordermaster set DispatchDate = @DispatchDate ,CourierCompanyName = @CourierCompanyName , TrackingCode = @TrackingCode,status=1,ChequeNo=@ChecqueNo,ChequeDate=@ChecqueDate,Amount=@chequeamount,BankName=@BankName,Paymentmode=@Paymentmode where orderid=@orderid", con);
                cmd.Parameters.AddWithValue("@orderid", oId);
                cmd.Parameters.AddWithValue("@DispatchDate", txtcalender.Text);
                cmd.Parameters.AddWithValue("@CourierCompanyName", "");
                cmd.Parameters.AddWithValue("@TrackingCode", "");
                cmd.Parameters.AddWithValue("@ChecqueNo", txtChecqueNo.Text);
                cmd.Parameters.AddWithValue("@ChecqueDate", txtChecqueDate.Text);
                cmd.Parameters.AddWithValue("@chequeamount", txtchequeamount.Text);
                cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmd.Parameters.AddWithValue("@Paymentmode", ddlpaymentmode.SelectedValue);

                con.Open();
                int j = cmd.ExecuteNonQuery();
                con.Close();
                if (j > 0)
                {
                    clear();
                    Panel1.Visible = false;
                    panelcash.Visible = false;
                    panelcheque.Visible = false;
                    panelNeft.Visible = false;
                    MsgBox("Dispatch Details Updated Successfully.");
                }
            }


            else if (ddlpaymentmode.SelectedValue == "IMPS")
            {
                SqlCommand cmd = new SqlCommand("update  ordermaster set DispatchDate = @DispatchDate ,CourierCompanyName = @CourierCompanyName , TrackingCode = @TrackingCode,status=1,Impsdate=@neftpaymnetdate ,Amount=@neftamount,Referencenumber= @nefRefrencennum,Paymentmode=@Paymentmode where orderid=@orderid", con);
                cmd.Parameters.AddWithValue("@orderid", oId);
                cmd.Parameters.AddWithValue("@DispatchDate", txtcalender.Text);
                cmd.Parameters.AddWithValue("@CourierCompanyName", "");
                cmd.Parameters.AddWithValue("@TrackingCode", "");
                cmd.Parameters.AddWithValue("@neftpaymnetdate", txtneftpaymnetdate.Text);
                cmd.Parameters.AddWithValue("@neftamount", txtneftamount.Text);
                cmd.Parameters.AddWithValue("@nefRefrencennum", txtnefRefrencennum.Text);
                cmd.Parameters.AddWithValue("@Paymentmode", ddlpaymentmode.SelectedValue);

                con.Open();
                int j = cmd.ExecuteNonQuery();
                con.Close();
                if (j > 0)
                {
                    clear();
                    Panel1.Visible = false;
                    panelcash.Visible = false;
                    panelcheque.Visible = false;
                    panelNeft.Visible = false;
                    MsgBox("Dispatch Details Updated Successfully.");
                }
            }

        }
        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "'); </script>"));
        }

        protected void clear()
        {
            txtOrderId.Text = "";
            txtcalender.Text = "";
            ddlpaymentmode.SelectedValue = "Select";
            txtcashPaymentdate.Text = "";
            txtcashAmount.Text = "";
            txtChecqueNo.Text = "";
            txtChecqueDate.Text = "";
            txtchequeamount.Text = "";
            txtBankName.Text = "";
            txtneftpaymnetdate.Text = "";
            txtneftamount.Text = "";
            txtnefRefrencennum.Text = "";
        }
    }
}