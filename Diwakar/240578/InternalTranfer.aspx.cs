using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace eSolutionsCurry
{
    public partial class InterWalletTranferadmin : System.Web.UI.Page
    {
        sms S1 = new sms();
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["UserCode"] == null)
            {
                Response.Redirect("default.aspx");
            }

            else
            {
                if (!IsPostBack)
                {
                    Panel1.Visible = false;
                }
            }
            
           

        }

        private void refreshblance()
        {
            while (DropDownList1.Items.Count != 0)
                DropDownList1.Items.RemoveAt(0);
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select isnull(sum(credit)-sum(debit),0) from AccountMaster where MemberID in (Select UserCode from tblMemberMaster where PanNo= '" + txtmember.Text + "') and DateofTransaction<=getdate() AND TxnType in (13,14,15)", con);
            con.Open();
            DropDownList1.Items.Add(new ListItem("Task E-Fund (Balance " + System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString() + "" + cmd.ExecuteScalar().ToString() + ")", cmd.ExecuteScalar().ToString()));
            cmd.CommandText = "select isnull(sum(credit)-sum(debit),0) from AccountMaster where MemberID in (Select UserCode from tblMemberMaster where PanNo= '" + txtmember.Text + "') and DateofTransaction<=getdate() and TxnType in (4,3,2,16,17,6,8)";
            DropDownList1.Items.Add(new ListItem("Reward Efund (Balance " + System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString() + "" + cmd.ExecuteScalar().ToString() + ")", cmd.ExecuteScalar().ToString()));
            con.Close();
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == -1)
            {
                Label2.Text = "Please Select an e-Fund";
                return;
            }

            if (double.Parse(TextBox4.Text) < 1)
            {
                Label2.Text = "Minimum Transfer Amount Should be " + System.Configuration.ConfigurationManager.AppSettings["Currency"].ToString() + "1.";
                return;
            }
            String DDval = DropDownList1.SelectedItem.Text.Substring(0, 1);
            if (DDval == "T")
            {
                String tp;
                SqlCommand cmd = new SqlCommand("Select TransectionPassword from tblMemberMaster where UserCode = '" + txtmember.Text + "'", con);
                con.Open();
                try
                {
                    tp = cmd.ExecuteScalar().ToString();
                    TextBox5.Text = tp.ToString();
                    con.Close();
                }
                catch (Exception)
                {
                    con.Close();
                    tp = "NULL";
                }
                if (tp == TextBox5.Text)
                {

                    DateTime date1 = DateTime.Parse(System.DateTime.Today.ToString());
                    Double balamount;
                    String WalletFrom = "";
                    String TxntypeString = "And txntype in (";
                    int DrTxnTpe = -1;
                    if (DropDownList1.SelectedIndex == 0)
                    {
                        TxntypeString = TxntypeString + "13,14,15)";
                        DrTxnTpe = 6;
                        WalletFrom = "Task E-Fund";
                    }
                    if (DropDownList1.SelectedIndex == 1)
                    {
                        TxntypeString = TxntypeString + "4,3,2,16,17,6,8)";
                        DrTxnTpe = 15;
                        WalletFrom = "Reward E-fund";
                    }
                    if (DropDownList1.SelectedIndex == -1)
                        return;

                    cmd.CommandText = "select isnull(sum(credit)-sum(debit),0) from AccountMaster where (MemberID in (Select UserCode from tblMemberMaster where PanNo= '" + txtmember.Text + "')) and DateofTransaction<=getdate() " + TxntypeString;
                    con.Open();
                    balamount = Double.Parse(cmd.ExecuteScalar().ToString());
                    con.Close();
                    if (balamount >= double.Parse(TextBox4.Text))
                    {
                        SqlTransaction t;
                        con.Open();
                        t = con.BeginTransaction("mytrans");
                        try
                        {
                            cmd.Transaction = t;
                            cmd.Connection = con;
                            cmd.CommandText = "insert into AccountMaster(txnType,Memberid,dateOfTransaction,Particulars,credit,Debit) values (15,'" + txtmember.Text + "',getdate(),'Transfer to  E-Fund',0," + double.Parse(TextBox4.Text) + ")";
                            cmd.ExecuteNonQuery();

                            cmd.CommandText = "insert into AccountMaster(txnType,memberid,dateOfTransaction,Particulars,credit,Debit) values (3,'" + txtmember.Text + "',getdate(),'Transfer From " + WalletFrom + "'," + Double.Parse(TextBox4.Text) + ",0)";
                            cmd.ExecuteNonQuery();
                            t.Commit();
                            con.Close();
                            t.Dispose();
                            con.Dispose();
                            cmd.Dispose();
                            Label1.Text = "Amount Transfered Successfully.";
                            refreshblance();
                            return;
                        }
                        catch (Exception)
                        {
                            t.Rollback();
                            con.Close();
                            Label1.Text = "Sorry! Some Problem Occured. Please Retry.";
                        }

                    }
                    else
                    {

                        Label1.Text = "Sorry! Insufficient Balance.";

                    }
                }
                else
                {
                    Label2.Visible = false;
                    Label1.Text = "Sorry! Wrong Transaction Password.";
                }
            }
            else
            {
                String tp;
                SqlCommand cmd = new SqlCommand("Select TransectionPassword from tblMemberMaster where UserCode = '" + txtmember.Text + "'", con);
                con.Open();
                try
                {
                    tp = cmd.ExecuteScalar().ToString();
                    TextBox5.Text = tp.ToString();
                    con.Close();
                }
                catch (Exception)
                {
                    con.Close();
                    tp = "NULL";
                }
                if (tp == TextBox5.Text)
                {

                    DateTime date1 = DateTime.Parse(System.DateTime.Today.ToString());
                    Double balamount;
                    String WalletFrom = "";
                    String TxntypeString = "And txntype in (";
                    int DrTxnTpe = -1;
                    if (DropDownList1.SelectedIndex == 0)
                    {
                        TxntypeString = TxntypeString + "13,14,15)";
                        DrTxnTpe = 6;
                        WalletFrom = "Task E-Fund";
                    }
                    if (DropDownList1.SelectedIndex == 1)
                    {
                        TxntypeString = TxntypeString + "4,3,8,6)";
                        DrTxnTpe = 15;
                        WalletFrom = "Reward E-fund";
                    }
                    if (DropDownList1.SelectedIndex == -1)
                        return;

                    cmd.CommandText = "select isnull(sum(credit)-sum(debit),0) from AccountMaster where (MemberID in (Select UserCode from tblMemberMaster where PanNo= '" + txtmember.Text + "')) and DateofTransaction<=getdate() " + TxntypeString;
                    con.Open();
                    balamount = Double.Parse(cmd.ExecuteScalar().ToString());
                    con.Close();
                    if (balamount >= double.Parse(TextBox4.Text))
                    {
                        SqlTransaction t;
                        con.Open();
                        t = con.BeginTransaction("mytrans");
                        try
                        {
                            cmd.Transaction = t;
                            cmd.Connection = con;
                            cmd.CommandText = "insert into AccountMaster(txnType,Memberid,dateOfTransaction,Particulars,credit,Debit) values (6,'" + txtmember.Text + "',getdate(),'Transfer to  E-Fund',0," + double.Parse(TextBox4.Text) + ")";
                            cmd.ExecuteNonQuery();

                            cmd.CommandText = "insert into AccountMaster(txnType,memberid,dateOfTransaction,Particulars,credit,Debit) values (13,'" + txtmember.Text + "',getdate(),'Transfer From " + WalletFrom + "'," + Double.Parse(TextBox4.Text) + ",0)";
                            cmd.ExecuteNonQuery();
                            t.Commit();
                            con.Close();
                            t.Dispose();
                            con.Dispose();
                            cmd.Dispose();
                            Label1.Text = "Amount Transfered Successfully.";
                            refreshblance();
                            return;
                        }
                        catch (Exception)
                        {
                            t.Rollback();
                            con.Close();
                            Label1.Text = "Sorry! Some Problem Occured. Please Retry.";
                        }

                    }
                    else
                    {

                        Label1.Text = "Sorry! Insufficient Balance.";

                    }
                }
                else
                {
                    Label2.Visible = false;
                    Label1.Text = "Sorry! Wrong Transaction Password.";
                }
            }
            Panel1.Visible = true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            refreshblance();
            Panel1.Visible = true;
        }
    }
}