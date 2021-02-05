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



namespace totalfuturcare.User
{
    public partial class AddStoreInvoiceOLD : System.Web.UI.Page
    {
        SqlConnection con;
        public static string sPackages;
        static ArrayList YearArray = new ArrayList();
        public static float sQtyTotal; //Label4
        public static float sAmtQty;  // Label6
        public static float Bvtotal;
        public static float finalamt;
        public static decimal SpecialDiscount;
        public static float bvpoints;
        private string SearchString = "";
        static List<string> productCodeList = GetProductCodes();
        static List<string> productNameList = GetProductNames();


        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            panelcheque.Visible = false;
            panel2.Visible = false;
            Button2.Visible = false;

            Panel3.Visible = false;
            panel5.Visible = false;
            panel4.Visible = false;
            panel6.Visible = false;
            if (!IsPostBack)
            {
                // ProductName.Focus();
                ProductName.Focus();
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Name");
                dt.Columns.Add("MRP");
                dt.Columns.Add("DP");
                dt.Columns.Add("BV");
                dt.Columns.Add("CGST");
                dt.Columns.Add("SGST");
                dt.Columns.Add("IGST");
                dt.Columns.Add("Tax");
                dt.Columns.Add("Qty");
                dt.Columns.Add("Amount");
                dt.Columns.Add("CashBack");
                dt.Columns.Add("Discount");
                ViewState["DT"] = dt;
                Button4.Visible = false;
                CashBack.Visible = false;
                txtselcashback.Visible = false;


            }

        }

        protected string GetMobileNo(string UserCode)
        {
            String result = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Select MobileNo from tblmembermaster where Usercode = '" + UserCode + "'", con);
            con.Open();
            result = cmd.ExecuteScalar().ToString();
            con.Close();
            return result;
        }

        //protected void txtUserCode_TextChanged(object sender, EventArgs e)
        //{
        //    if (Session["UserCode"].ToString().Trim() == "")
        //    {
        //        return;
        //    }
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        //    con.Open();
        //    string str = "select UserName from tblMemberMaster where UserCode ='" + Session["UserCode"].ToString().Trim() + "'";
        //    SqlDataAdapter da = new SqlDataAdapter(str, con);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        txtUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
        //        //if (GivMon.Rows.Count > 0)
        //        //    btnSubmit.Visible = true;
        //        RemainingBVpoints();
        //    }
        //    else
        //    {
        //        // btnSubmit.Visible = false;
        //    }
        //    con.Dispose();
        //}

        //protected void RemainingBVpoints()
        //{
        //    try
        //    {
        //        con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        //        SqlCommand cmd = new SqlCommand("select isnull(sum(credit)-sum(Debit),0) from accountmaster where txntype = 101 and memberid='" +  + "'", con);
        //        con.Open();
        //        txtRemBvpoints.Text = cmd.ExecuteScalar().ToString().Replace(".0000", ".00");
        //        con.Close();

        //    }
        //    catch { }
        //}

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] GetProductCodeList(string prefixText, int count)
        {
            // Get the ProductRepurchase From Data Source. Change this method to use Database
            // Find All Matching ProductRepurchase

            var list = from p in productCodeList where p.ToLower().Contains(prefixText.ToLower()) select p;
            //Convert to Array as We need to return Array
            string[] prefixTextArray = list.ToArray<string>();
            return prefixTextArray;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] GetProductNameList(string prefixText, int count)
        {
            // Get the ProductRepurchase From Data Source. Change this method to use Database
            // Find All Matching ProductRepurchase
            var list = from p in productNameList where p.ToLower().Contains(prefixText.ToLower()) select p;
            //Convert to Array as We need to return Array
            string[] prefixTextArray = list.ToArray<string>();
            return prefixTextArray;
        }


        private static List<string> GetProductNames()
        {
            List<string> tagsList = new List<string>();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());

            SqlCommand cmd = new SqlCommand("select ProductName from ProductRepurchase  Where Status != 1", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
                tagsList.Add(dr[0].ToString());

            con.Close();
            return tagsList;
        }

        private static List<string> GetProductCodes()
        {
            List<string> tagsList = new List<string>();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select ProductCode from ProductRepurchase where Status != 1", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                tagsList.Add(dr[0].ToString());
            }
            con.Close();
            return tagsList;
        }

        protected void ProductName_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("", con);
            if (ddlType.SelectedValue == "NONECB")
            {
                cmd.CommandText = "select *,dbo.GETAVLQTY(productId,@FrenchiseID)as AQTY from ProductRepurchase where ProductName = @ProductName and Status != 1 and CashBack=0";
            }
            else
            {
                cmd.CommandText = "select *,dbo.GETAVLQTY(productId,@FrenchiseID)as AQTY from ProductRepurchase where ProductName = @ProductName and Status != 1 and CashBack>0";
            }


            cmd.Parameters.AddWithValue("@productName", ProductName.Text);
            cmd.Parameters.AddWithValue("@FrenchiseID", ConfigurationManager.AppSettings["FrenchiseID"].ToString());
            con.Open();
            cmd.CommandTimeout = 0;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                PID.Value = dr["ProductID"].ToString();
                ProductCode.Text = dr["ProductCode"].ToString();
                MRP.Text = dr["MRP"].ToString().Replace(".0000", ".00");
                SpecialDiscount = Convert.ToDecimal(dr["DiscountAmount"].ToString().Replace(".0000", ".00"));
                SPDiscount.Text = SpecialDiscount.ToString();
                DP.Text = dr["SalesAmount"].ToString().Replace(".0000", ".00");
                BV.Text = dr["BV"].ToString();
                Tax.Text = dr["vat"].ToString();
                CashBack.Text = dr["CashBack"].ToString();
                txtselcashback.Text = dr["SelfCashBack"].ToString();
                CGST.Text = string.Format("{0:f2}", decimal.Parse(dr["CGST"].ToString()));
                SGST.Text = string.Format("{0:f2}", decimal.Parse(dr["SGST"].ToString()));
                IGST.Text = string.Format("{0:f2}", decimal.Parse(dr["IGST"].ToString()));
                Qty.Text = "1";
                // Amount.Text = string.Format("{0:f2}", (decimal.Parse(Qty.Text) * decimal.Parse(DP.Text)));
                //Amount.Text = string.Format("{0:f2}", (decimal.Parse(DP.Text) - decimal.Parse(SPDiscount.Text)));
                Amount.Text = string.Format("{0:f2}", (decimal.Parse(DP.Text) * (decimal.Parse(Qty.Text)) - decimal.Parse(SPDiscount.Text)));

                //   txtAVLQTY.Text = dr["AQTY"].ToString();
                imageload.HRef = dr["ImageUrl"].ToString();


            }

            dr.Close();
            con.Close();
            Qty.Focus();
        }

        protected void ProductCode_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("", con);
            if (ddlType.SelectedValue == "NONECB")
            {
                cmd.CommandText = "select *,dbo.GETAVLQTY(productId,@FrenchiseID)as AQTY from ProductRepurchase where ProductCode =@Pid and Status != 1 and CashBack=0";
            }
            else
            {
                cmd.CommandText = "select *,dbo.GETAVLQTY(productId,@FrenchiseID)as AQTY from ProductRepurchase where ProductCode =@Pid and Status != 1 and CashBack>0";
            }

            cmd.Parameters.AddWithValue("@Pid", ProductCode.Text);
            cmd.Parameters.AddWithValue("@FrenchiseID", ConfigurationManager.AppSettings["FrenchiseID"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                PID.Value = dr["ProductID"].ToString();
                ProductName.Text = dr["ProductName"].ToString();
                SpecialDiscount = Convert.ToDecimal(dr["DiscountAmount"].ToString().Replace(".0000", ".00"));
                SPDiscount.Text = SpecialDiscount.ToString();
                MRP.Text = string.Format("{0:f2}", decimal.Parse(dr["MRP"].ToString()));
                DP.Text = dr["SalesAmount"].ToString().Replace(".0000", ".00");
                BV.Text = dr["BV"].ToString();
                CashBack.Text = dr["CashBack"].ToString();
                txtselcashback.Text = dr["SelfCashBack"].ToString();
                Tax.Text = string.Format("{0:f2}", decimal.Parse(dr["Vat"].ToString()));
                CGST.Text = string.Format("{0:f2}", decimal.Parse(dr["CGST"].ToString()));
                SGST.Text = string.Format("{0:f2}", decimal.Parse(dr["SGST"].ToString()));
                IGST.Text = string.Format("{0:f2}", decimal.Parse(dr["IGST"].ToString()));
                Qty.Text = "1";
                // Amount.Text = string.Format("{0:f2}", (decimal.Parse(Qty.Text) * decimal.Parse(DP.Text)));
                //Amount.Text = string.Format("{0:f2}", (decimal.Parse(DP.Text) - decimal.Parse(SPDiscount.Text)));
                Amount.Text = string.Format("{0:f2}", (decimal.Parse(DP.Text) * (decimal.Parse(Qty.Text)) - decimal.Parse(SPDiscount.Text)));
                //  txtAVLQTY.Text = dr["AQTY"].ToString();
                imageload.HRef = dr["ImageUrl"].ToString();
            }
            dr.Close();
            con.Close();

            Button1.Focus();
            imageload.Focus();
        }

        protected void Qty_TextChanged(object sender, EventArgs e)
        {
            SPDiscount.Text = string.Format("{0:f2}", ((decimal.Parse(Qty.Text) * decimal.Parse(SpecialDiscount.ToString()))));
            //Amount.Text = string.Format("{0:f2}", (decimal.Parse(Qty.Text) * decimal.Parse(DP.Text)));
            Amount.Text = string.Format("{0:f2}", (decimal.Parse(DP.Text) * (decimal.Parse(Qty.Text)) - decimal.Parse(SPDiscount.Text)));
            Button1.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select AccountNo,IFSCCode,NomineeName,NomineeRelation,NomineeContact, VoterCard,AdharCardBack,PanCardProof,UploadPhoto,Checkbook from tblmembermaster where usercode=@usercode or usercode=@sessionusercode", con);
            con.Open();
            cmd.Parameters.AddWithValue("@usercode", TextBox1.Text);
            cmd.Parameters.AddWithValue("@sessionusercode", Session["UserCode"].ToString());

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var Account = (dr["AccountNo"] ?? "").ToString();
                var IFSC = (dr["IFSCCode"] ?? "").ToString();
                var Nominee = (dr["NomineeName"] ?? "").ToString();
                var NomineeR = (dr["NomineeRelation"] ?? "").ToString();
                var NomineeC = (dr["NomineeContact"] ?? "").ToString();
                var Voter = (dr["VoterCard"] ?? "").ToString();
                var Adhaar = (dr["AdharCardBack"] ?? "").ToString();
                var PanCard = (dr["PanCardProof"] ?? "").ToString();
                var Photo = (dr["UploadPhoto"] ?? "").ToString();
                var CheckB = (dr["Checkbook"] ?? "").ToString();

                if (string.IsNullOrWhiteSpace(Account) || string.IsNullOrWhiteSpace(IFSC) || string.IsNullOrWhiteSpace(Nominee) || string.IsNullOrWhiteSpace(NomineeR) || string.IsNullOrWhiteSpace(NomineeC) || string.IsNullOrWhiteSpace(Voter) || string.IsNullOrWhiteSpace(Adhaar) || string.IsNullOrWhiteSpace(PanCard) || string.IsNullOrWhiteSpace(Photo) || string.IsNullOrWhiteSpace(CheckB))
                {
                    MsgBox("Please complete your KYC and edit profile details");
                    return;
                }
            }
            dr.Close();
            con.Close();

            DataTable dt = (DataTable)ViewState["DT"];
            decimal Balance;
            foreach (DataRow item in dt.Rows)
            {
                // if (item[0].ToString() == PID.Value)
                if (item[0].ToString() == ProductCode.Text)
                {
                    item[0] = ProductCode.Text;
                    string abc = item[9].ToString();
                    string qty = Qty.Text;

                    string pqr = item[10].ToString();
                    string amount = Amount.Text;
                    item[9] = (decimal.Parse(abc) + decimal.Parse(qty)).ToString();
                    item[4] = Decimal.Parse(BV.Text);
                    item[10] = (decimal.Parse(pqr) + decimal.Parse(amount)).ToString();

                    dt.Rows[0].EndEdit();
                    dt.AcceptChanges();

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    CalcTotals();
                    ProductName.Text = "";
                    ProductCode.Text = "";
                    MRP.Text = "";
                    DP.Text = "";
                    BV.Text = "";
                    Qty.Text = "";
                    Tax.Text = "";
                    Amount.Text = "";
                    //ProductCode.Focus();
                    ProductName.Focus();
                    return;
                }
            }
            DataRow row = dt.NewRow();

            row[0] = ProductCode.Text;
            row[1] = ProductName.Text;
            row[2] = (Math.Round(decimal.Parse(MRP.Text), 2).ToString());
            row[3] = (Math.Round(decimal.Parse(DP.Text), 2).ToString());
            row[4] = (Math.Round(decimal.Parse(BV.Text), 2).ToString());
            row[5] = (Math.Round(decimal.Parse(CGST.Text), 2).ToString());
            row[6] = (Math.Round(decimal.Parse(SGST.Text), 2).ToString());
            row[7] = (Math.Round(decimal.Parse(IGST.Text), 2).ToString());
            row[8] = (Math.Round(decimal.Parse(Tax.Text), 2).ToString());

            row[9] = Qty.Text;
            row[10] = (Math.Round(decimal.Parse(DP.Text) * decimal.Parse(Qty.Text), 2).ToString());
            row[11] = (Math.Round(decimal.Parse(CashBack.Text), 2).ToString());
            row[12] = (Math.Round(decimal.Parse(SPDiscount.Text), 2).ToString());
            dt.Rows.Add(row);
            ProductName.Text = "";
            ProductCode.Text = "";
            MRP.Text = "";
            DP.Text = "";
            BV.Text = "";
            Qty.Text = "";
            Tax.Text = "";
            Amount.Text = "";
            PID.Value = "";
            GridView1.DataSource = dt;
            GridView1.DataBind();
            CalcTotals();
            // ProductCode.Focus();
            ProductName.Focus();
        }

        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    //foreach (DataRow item in dt.Rows)
        //    //{
        //    //    string Pid = item[0].ToString();
        //    //    string pname = item[1].ToString();
        //    //    string mrp = item[2].ToString();
        //    //    string Dp = item[3].ToString();
        //    //    string BV = item[4].ToString();
        //    //    string tax = item[5].ToString();
        //    //    string qty = item[6].ToString();
        //    //    string Amt = item[7].ToString();

        //    //    //if (insertquery.Length == 0)

        //    //    //    insertquery = "EXEC [dbo].[sp_InsertMasterDetInv] " + sOrderId + ",'" + Pid + "'," + qty + ",'DP'";
        //    //    //else
        //    //    //    insertquery += ";EXEC [dbo].[sp_InsertMasterDetInv] " + sOrderId + ",'" + Pid + "'," + qty + ",'DP'";

        //    //}

        //   // string insertquery = "";

        //    //DataTable dt = (DataTable)ViewState["DT"];
        //   // string sOrderId = "";
        //   // string bnchinvcid = "";
        //   // con.Open();

        //    //int PayStatus;

        //    //string z1 = "insert into OrderMaster([Date],MemberID,FrenchiseID,Status,PayStatus,PaymentDate,InvoiceType,Paymentmode,CourierCharges,Amount) values(getdate(),'" + Session["UserCode"].ToString() + "' ,'" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "',0,0,'" + txtpaymentdate.Text + "','DP','" + DropDownList1.SelectedValue + "',0.00,'" + TotalAmount.Text + "')";
        //    //SqlCommand cmd1 = new SqlCommand(z1, con);
        //    //cmd1.ExecuteNonQuery();
        //    //cmd1.Dispose();
        //    //cmd1.Parameters.Clear();
        //    //cmd1.CommandText = "select  SCOPE_IDENTITY()";
        //    //sOrderId = cmd1.ExecuteScalar().ToString();
        //    //cmd1.CommandText = "select dbo.GetNextBranchInvoiceNo('" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "')";
        //    //bnchinvcid = cmd1.ExecuteScalar().ToString();
        //    //cmd1.CommandText = "Update OrderMaster Set BranchInvoiceNo = " + bnchinvcid + " Where OrderID = " + sOrderId + " And FrenchiseID = '" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "'";
        //    //cmd1.ExecuteNonQuery();


        //    //cmd1 = new SqlCommand("EXEC [dbo].[SyncLeftRightBussiness] " + Session["UserCode"] + ",'" + TotalBV.Text + "' ", con);
        //    //  cmd1.ExecuteNonQuery();
        //    //con.Close();

        //    //foreach (DataRow item in dt.Rows)
        //    //{
        //    //    string Pid = item[0].ToString();
        //    //    string pname = item[1].ToString();
        //    //    string mrp = item[2].ToString();
        //    //    string Dp = item[3].ToString();
        //    //    string BV = item[4].ToString();
        //    //    string tax = item[5].ToString();
        //    //    string qty = item[6].ToString();
        //    //    string Amt = item[7].ToString();

        //    //    //if (insertquery.Length == 0)

        //    //    //    insertquery = "EXEC [dbo].[sp_InsertMasterDetInv] " + sOrderId + ",'" + Pid + "'," + qty + ",'DP'";
        //    //    //else
        //    //    //    insertquery += ";EXEC [dbo].[sp_InsertMasterDetInv] " + sOrderId + ",'" + Pid + "'," + qty + ",'DP'";

        //    //}
        //    //if (DropDownList1.SelectedValue == "Cheque")
        //    //{
        //    //    SqlCommand cmd = new SqlCommand("update OrderMaster set ChequeDate=@ChequeDate, BankName=@BankName, ChequeNo=@ChequeNo where orderid=@orderid", con);
        //    //    cmd.Parameters.AddWithValue("@orderid", sOrderId);
        //    //    cmd.Parameters.AddWithValue("@ChequeDate", ChecqueDate.Text);
        //    //    cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);
        //    //    cmd.Parameters.AddWithValue("@ChequeNo", txtChecqueNo.Text);
        //    //    con.Open();
        //    //    cmd.ExecuteNonQuery().ToString();
        //    //    con.Close();
        //    //}

        //    //else if (DropDownList1.SelectedValue == "IMPS")
        //    //{
        //    //    //SqlCommand cmd = new SqlCommand("update OrderMaster set Referencenumber=@Referencenumber,Impsdate=@Impsdate,Impsamount=@Impsamount where orderid=@orderid ", con);

        //    //    SqlCommand cmd = new SqlCommand("update OrderMaster set Referencenumber=@Referencenumber,Impsdate=@Impsdate where orderid=@orderid ", con);
        //    //    cmd.Parameters.AddWithValue("@orderid", sOrderId);
        //    //    cmd.Parameters.AddWithValue("@Referencenumber", txtrefno.Text);
        //    //    cmd.Parameters.AddWithValue("@Impsdate", txtdate.Text);
        //    //    // cmd.Parameters.AddWithValue("@Impsamount", txtAmount.Text);
        //    //    con.Open();
        //    //    cmd.ExecuteNonQuery().ToString();
        //    //    con.Close();
        //    //}

        //    //SqlCommand cmd2 = new SqlCommand(insertquery, con);
        //    //con.Open();
        //    //cmd2.ExecuteNonQuery();
        //    //con.Close();
        //    //SqlCommand cmdid = new SqlCommand("dbo.Distribute_Level_Repurchase", con);
        //    //cmdid.CommandType = CommandType.StoredProcedure;
        //    //cmdid.Parameters.AddWithValue("@OrderID", sOrderId);
        //    //con.Open();
        //    //cmdid.ExecuteNonQuery();
        //    //con.Close();
        //   // TextBox txt = new TextBox();
        //   // txt.Text = "";
        //    //Label7.Text = "Product Saved Successfully";

        //    /// end 
        //    /// 

        //    //string name = "";
        //    //string email = "";
        //    //SqlConnection con1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        //    //SqlCommand cmd3 = new SqlCommand("select * from tblmembermaster where usercode='"+Session["UserCode"]+"'", con1);

        //    //con1.Open();
        //    //SqlDataReader dr = cmd3.ExecuteReader();
        //    //while (dr.Read())
        //    //{
        //    //    name = dr["UserName"].ToString();
        //    //    email = dr["Email"].ToString();

        //    //}
        //    //dr.Close();
        //    //con1.Close();


        //    //string date1="";
        //    //string amount="";
        //    //string paymentmode = "";
        //    //SqlConnection con2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        //    //SqlCommand cmd4 = new SqlCommand("select * from ordermaster where orderid='" + sOrderId + "'", con2);

        //    //con2.Open();
        //    //SqlDataReader dr1 = cmd4.ExecuteReader();
        //    //while (dr1.Read())
        //    //{
        //    //    date1 = DateTime.Parse(dr1["Date"].ToString()).Date.ToString("dd MMM yyyy");
        //    //    amount = dr1["Amount"].ToString();
        //    //    paymentmode = dr1["PaymentMode"].ToString();
        //    //}
        //    //dr1.Close();
        //    //con2.Close();
        //    //string Msg = "";
        //    ////Msg = "Congratulation your Member ID is: " + Mid + " Password is: " + txtLoginPass.Text + " Please logon to " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "";

        //    //Msg = "Order details are as follow :<br /><br />OrderID :" + sOrderId + "<br />Date :" + date1 + "<br />Payment Mode :" + paymentmode + "<br />Amount :" + amount+ "<br /><br />You can login to view the invoice.<br /><br />Thanks,<br />With regards!<br /><br />RainSan Global Limited.";

        //    //string msgadmin = "";

        //    //msgadmin = "Order details are as follow :<br /><br />MemberID : "+ Session["UserCode"]+"<br/>Name : "+name+"<br />OrderID :"+sOrderId + "<br />Date :" +date1+ "<br />Payment Mode :" + paymentmode + "<br />Amount :" + amount ;

        //    //Gen obj1 = new Gen();
        //    //obj1.SendEmail("syedraiyan@gmail.com", msgadmin, Session["UserCode"]+"/"+name+ " Ordered Products with Order Id "+sOrderId, ConfigurationManager.AppSettings["Email"]);



        //    //if (email != "")
        //    //{
        //    //    obj1.SendEmail(email, Msg, Session["UserCode"] + "/" + name + " Ordered Products with Order Id " + sOrderId, ConfigurationManager.AppSettings["Email"]);

        //    //}

        //}

        protected void CalcTotals()
        {
            Decimal TV = 0, TM = 0, TA = 0, TQ = 0, CB = 0;
            DataTable dt = (DataTable)ViewState["DT"];
            foreach (DataRow item in dt.Rows)
            {
                TM += decimal.Parse(item[3].ToString()) * decimal.Parse(item[9].ToString());
                TV += decimal.Parse(item[4].ToString()) * decimal.Parse(item[9].ToString());
                TQ += decimal.Parse(item[9].ToString());
                TA += decimal.Parse(item[10].ToString());
                CB += decimal.Parse(item[11].ToString());
            }
            TotalDP.Text = Math.Round(TM, 2).ToString();
            // TotalAmount.Text = Math.Round(TA + 100, 2).ToString();
            TotalAmount.Text = Math.Round(TA, 2).ToString();
            TotalAmount.Text = string.Format("{0:f2}", (decimal.Parse(TotalDP.Text) - decimal.Parse(SPDiscount.Text)));
            // CourierCharges.Text = "100.00";
            CourierCharges.Text = "0";
            TotalQty.Text = TQ.ToString();
            TotalBV.Text = Math.Round(TV, 2).ToString();
            //TotalCashBack.Text = Math.Round(CB, 2).ToString();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["DT"];
            dt.Rows.RemoveAt(e.RowIndex);
            ViewState["DT"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            CalcTotals();
        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Select Payment Mode")

            {
                //MsgBox("Please Select Any One Payment Mode!");
                //return;

            }

            else if (DropDownList1.SelectedValue == "Cheque")
            {
                panelcheque.Visible = true;
                Button4.Visible = false;
                panel2.Visible = false;
                panel4.Visible = false;
                panel5.Visible = false;
                Panel3.Visible = false;
                panel6.Visible = false;
                Button2.Visible = true;

            }
            else if (DropDownList1.SelectedValue == "IMPS")
            {
                panel2.Visible = true;
                Button4.Visible = false;
                panelcheque.Visible = false;
                panel5.Visible = false;
                Panel3.Visible = false;
                Button2.Visible = true;
                panel6.Visible = false;

            }
            else if (DropDownList1.SelectedValue == "Repurchase Wallet")
            {
                Panel3.Visible = true;
                Button4.Visible = true;
                panel2.Visible = false;
                panel4.Visible = false;
                panelcheque.Visible = false;
                panel5.Visible = false;
                panel6.Visible = false;

            }
            else if (DropDownList1.SelectedValue == "Debit/Credit Card")
            {
                //panel5.Visible = true;
                panel4.Visible = false;
                Button4.Visible = false;
                panelcheque.Visible = false;
                //btnSubmit.Visible = true;
                panel5.Visible = false;
                Panel3.Visible = false;
                Button2.Visible = true;
                panel6.Visible = true;

            }
            else if (DropDownList1.SelectedValue == "NEFT")
            {
                //panel5.Visible = true;
                panel4.Visible = true;
                //btnSubmit.Visible = true;
                panelcheque.Visible = false;
                panel5.Visible = false;
                panel2.Visible = false;
                Panel3.Visible = false;
                Button2.Visible = true;
                panel6.Visible = false;
            }
            else if (DropDownList1.SelectedValue == "DD")
            {
                //panel5.Visible = true;
                panel4.Visible = false;
                Button4.Visible = false;
                //btnSubmit.Visible = true;
                panelcheque.Visible = false;
                panel5.Visible = true;
                Panel3.Visible = false;
                panel6.Visible = false;
                Button2.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string res = "";
            string sOrderId = "";

            try
            {


                if (!CheckValidProduct())
                {
                    MsgBox("Please Select All Cash Back Product or Non-Cash Back Product");
                    return;
                }

                SqlCommand cmdProc = new SqlCommand("CreateOrder", con);
                cmdProc.CommandType = CommandType.StoredProcedure;
                cmdProc.Parameters.AddWithValue("@Usercode", TextBox1.Text);
                cmdProc.Parameters.AddWithValue("@Usercode1", Session["usercode"]);
                cmdProc.Parameters.AddWithValue("@FrenchiseID", ConfigurationManager.AppSettings["FrenchiseID"].ToString());
                cmdProc.Parameters.AddWithValue("@UserPaymentDate", txtpaymentdate.Text);
                cmdProc.Parameters.AddWithValue("@PaymentMode", DropDownList1.SelectedValue);
                cmdProc.Parameters.AddWithValue("@Amount", TotalAmount.Text);
                cmdProc.Parameters.AddWithValue("@TotalBv", TotalBV.Text);
                cmdProc.Parameters.AddWithValue("@ChequeDate", ChecqueDate.Text);
                cmdProc.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmdProc.Parameters.AddWithValue("@DDBankName", txtddbankname.Text);
                cmdProc.Parameters.AddWithValue("@ChequeNo", txtChecqueNo.Text);
                cmdProc.Parameters.AddWithValue("@DDDate", txtdddate.Text);
                cmdProc.Parameters.AddWithValue("@DDNo", txtddno.Text);
                cmdProc.Parameters.AddWithValue("@Referencenumber", txtrefno.Text);
                cmdProc.Parameters.AddWithValue("@Impsdate", txtdate.Text);
                cmdProc.Parameters.AddWithValue("@InvoiceType", "DP");
                cmdProc.Parameters.AddWithValue("@Neftdate", txtnNeftdate.Text);
                cmdProc.Parameters.AddWithValue("@debitrefno", txtreffno.Text);
                cmdProc.Parameters.AddWithValue("@NeftRefNo", txtneftrefNo.Text);
                cmdProc.Parameters.AddWithValue("@debitrefdate", txttransationsdate.Text);
                cmdProc.Parameters.AddWithValue("@CashBack", CashBack.Text);
                cmdProc.Parameters.AddWithValue("@SelfCashBack", txtselcashback.Text);
                cmdProc.Parameters.AddWithValue("@RedemptionPoint", "0");
                cmdProc.Parameters.AddWithValue("@Details", (DataTable)ViewState["DT"]);
                SqlParameter result = new SqlParameter("@Result", SqlDbType.VarChar, 200);
                result.Direction = ParameterDirection.Output;
                cmdProc.Parameters.Add(result);
                SqlParameter orderid = new SqlParameter("@orderID", SqlDbType.VarChar, 200);
                orderid.Direction = ParameterDirection.Output;
                cmdProc.Parameters.Add(orderid);
                con.Open();
                cmdProc.ExecuteNonQuery();
                res = result.Value.ToString();
                sOrderId = orderid.Value.ToString();
                con.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }

            if (res == "Product Saved Successfully")
            {
                Label7.Text = "Product Saved Successfully";
                string email = ""; string name = "";
                SqlConnection con1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd3 = new SqlCommand("select * from tblmembermaster where usercode='" + TextBox1.Text + "'", con1);

                con1.Open();
                SqlDataReader dr = cmd3.ExecuteReader();
                while (dr.Read())
                {
                    name = dr["UserName"].ToString();
                    HiddenField5.Value = dr["Email"].ToString();

                }
                dr.Close();
                con1.Close();


                string date1 = "";
                string amount = "";
                string paymentmode = "";
                SqlConnection con2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd4 = new SqlCommand("select * from ordermaster where orderid='" + sOrderId + "'", con2);

                con2.Open();
                SqlDataReader dr1 = cmd4.ExecuteReader();
                while (dr1.Read())
                {
                    date1 = DateTime.Parse(dr1["Date"].ToString()).Date.ToString("dd MMM yyyy");
                    amount = dr1["Amount"].ToString();
                    paymentmode = dr1["PaymentMode"].ToString();
                }
                dr1.Close();
                con2.Close();
                string Msg = "";

                Msg = "Order details are as follow :<br /><br />OrderID :" + sOrderId + "<br />Date :" + date1 + "<br />Payment Mode :" + paymentmode + "<br />Amount :" + amount + "<br /><br />You can login to view the invoice.<br /><br />Thanks,<br />With regards!<br /><br /> Diwakar Retail Ltd.";

                string msgadmin = "";
                msgadmin = "Order details are as follow :<br /><br />MemberID : " + TextBox1.Text + "<br/>Name : " + name + "<br />OrderID :" + sOrderId + "<br />Date :" + date1 + "<br />Payment Mode :" + paymentmode + "<br />Amount :" + amount;
                // syedraiyan@gmail.com
                //   syedfaizanghani@gmail.com
                //Gen obj1 = new Gen();
                //obj1.SendEmail("syedraiyan@gmail.com", msgadmin, Session["UserCode"] + "/" + name + " Ordered Products with Order Id " + sOrderId, ConfigurationManager.AppSettings["Email"]);
                //obj1.SendEmail(" syedfaizanghani@gmail.com", msgadmin, Session["UserCode"] + "/" + name + " Ordered Products with Order Id " + sOrderId, ConfigurationManager.AppSettings["Email"]);
                //if (email != "")
                //{
                //    obj1.SendEmail(email, Msg, TextBox1.Text + "/" + name + " Ordered Products with Order Id " + sOrderId, ConfigurationManager.AppSettings["Email"]);

                //}

            }
            Response.Redirect("GSTInvoice.aspx?ID=" + sOrderId + "&BVpointsTotal=" + Bvtotal);


        }

        private bool CheckValidProduct()
        {
            bool Result = true;
            List<string> product = new List<string>();
            foreach (GridViewRow row in GridView1.Rows)
            {
                string ProductCode = row.Cells[1].Text;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select Count(CashBack) from ProductRepurchase Where ProductCode=@pc and CashBack>0";
                cmd.Parameters.AddWithValue("@pc", ProductCode);
                con.Open();
                int i = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                if (i > 0)
                {
                    product.Add("Cash Back");
                }
                else
                {
                    product.Add("Non Cash Back");
                }

            }
            if (product.Contains("Cash Back") && product.Contains("Non Cash Back"))
            {
                Result = false;
            }

            return Result;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            if (DropDownList1.SelectedValue == "Repurchase Wallet")
            {
                if (HiddenField6.Value != TextBox6.Text || HiddenField6.Value == "" || TextBox6.Text == "" || HiddenField6.Value == null || TextBox6.Text == null)
                {
                    MsgBox("Invaild OTP");
                    Button3.Visible = true;
                    TextBox6.Visible = true;
                    Panel3.Visible = true;
                    return;
                }
            }
            string res = "";
            string sOrderId = "";

            try
            {

                DataTable dt = new DataTable();
                dt.Columns.Add("ProductCode", typeof(string));
                dt.Columns.Add("QTY", typeof(string));
                dt.Columns.Add("DP", typeof(string));

                foreach (GridViewRow row in GridView1.Rows)
                {


                    string ProductCode = row.Cells[0].Text;
                    string DP = "DP";
                    string uqty = row.Cells[9].Text;
                    dt.Rows.Add(ProductCode, uqty, DP);
                }


                DataTable dt1 = GridView1.DataSource as DataTable;
                int count = dt.Rows.Count;
                if (count == 0)
                {
                    return;
                }

                SqlCommand cmdProc = new SqlCommand("CreateOrder", con);
                cmdProc.CommandType = CommandType.StoredProcedure;
                cmdProc.Parameters.AddWithValue("@Usercode", TextBox1.Text);
                cmdProc.Parameters.AddWithValue("@Usercode1", Session["usercode"]);
                cmdProc.Parameters.AddWithValue("@FrenchiseID", ConfigurationManager.AppSettings["FrenchiseID"].ToString());
                cmdProc.Parameters.AddWithValue("@UserPaymentDate", txtpaymentdate.Text);
                cmdProc.Parameters.AddWithValue("@PaymentMode", DropDownList1.SelectedValue);
                cmdProc.Parameters.AddWithValue("@Amount", TotalAmount.Text);
                cmdProc.Parameters.AddWithValue("@TotalBv", TotalBV.Text);
                cmdProc.Parameters.AddWithValue("@ChequeDate", ChecqueDate.Text);
                cmdProc.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmdProc.Parameters.AddWithValue("@DDBankName", txtddbankname.Text);
                cmdProc.Parameters.AddWithValue("@ChequeNo", txtChecqueNo.Text);
                cmdProc.Parameters.AddWithValue("@DDDate", txtdddate.Text);
                cmdProc.Parameters.AddWithValue("@DDNo", txtddno.Text);
                cmdProc.Parameters.AddWithValue("@Referencenumber", txtrefno.Text);
                cmdProc.Parameters.AddWithValue("@Impsdate", txtdate.Text);
                cmdProc.Parameters.AddWithValue("@InvoiceType", "DP");
                cmdProc.Parameters.AddWithValue("@Neftdate", txtnNeftdate.Text);
                cmdProc.Parameters.AddWithValue("@debitrefno", txtreffno.Text);
                cmdProc.Parameters.AddWithValue("@NeftRefNo", txtneftrefNo.Text);
                cmdProc.Parameters.AddWithValue("@debitrefdate", txttransationsdate.Text);
                cmdProc.Parameters.AddWithValue("@CashBack", CashBack.Text);
                cmdProc.Parameters.AddWithValue("@SelfCashBack", txtselcashback.Text);
                cmdProc.Parameters.AddWithValue("@RedemptionPoint", "0");
                cmdProc.Parameters.AddWithValue("@Details", (DataTable)ViewState["DT"]);
                SqlParameter result = new SqlParameter("@Result", SqlDbType.VarChar, 200);
                result.Direction = ParameterDirection.Output;
                cmdProc.Parameters.Add(result);
                SqlParameter orderid = new SqlParameter("@orderID", SqlDbType.VarChar, 200);
                orderid.Direction = ParameterDirection.Output;
                cmdProc.Parameters.Add(orderid);
                con.Open();
                cmdProc.ExecuteNonQuery();
                cmdProc.CommandTimeout = 0;
                res = result.Value.ToString();
                sOrderId = orderid.Value.ToString();
                con.Close();
            }
            catch (Exception ex)
            {
                Button3.Visible = true;
                TextBox6.Visible = true;
            }
            finally
            {
                con.Close();
            }

            if (res == "Product Saved Successfully")
            {
                Label7.Text = "Product Saved Successfully";

                try
                {
                    string Msg1 = "";
                    Gen obj = new Gen();
                    Msg1 = "Thanks for ordering Diwakar Retail Ltd. products.Your Invoice number is '" + sOrderId + "' of Rs '" + TotalAmount.Text + "'";


                    //SqlCommand cmdss = new SqlCommand("", con);
                    //cmdss.CommandText = "select MobileNo from  [dbo].[tblmembermaster] where usercode='" + Session["usercode"] + "' ";
                    //con.Open();
                    //string mobile = cmdss.ExecuteScalar().ToString();
                    //con.Close();
                    if (TextBox1.Text.Length > 9)
                    {
                        obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), TextBox1.Text, Msg1);
                    }
                }

                catch (Exception ex)
                {

                }


                string date1 = "";
                string amount = "";
                string paymentmode = "";
                SqlConnection con2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
                SqlCommand cmd4 = new SqlCommand("select * from ordermaster where orderid='" + sOrderId + "'", con2);

                con2.Open();
                SqlDataReader dr1 = cmd4.ExecuteReader();
                while (dr1.Read())
                {
                    date1 = DateTime.Parse(dr1["Date"].ToString()).Date.ToString("dd MMM yyyy");
                    amount = dr1["Amount"].ToString();
                    paymentmode = dr1["PaymentMode"].ToString();
                }
                dr1.Close();
                con2.Close();
                string Msg = "";
                Response.Redirect("GSTInvoice.aspx?ID=" + sOrderId + "&BVpointsTotal=" + Bvtotal);

            }
            else if (res == "Insufficient Wallet")
            {
                MsgBox("Insufficient Wallet");
                return;
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlCommand cmdss = new SqlCommand("", con);
            cmdss.CommandText = "select MobileNo from  [dbo].[tblmembermaster] where usercode='" + Session["UserCode"] + "' ";
            con.Open();
            string mobile = cmdss.ExecuteScalar().ToString();
            con.Close();


            SqlCommand cmd = new SqlCommand("", con);

            cmd.CommandText = "Select [dbo].[MyEwallet]('" + Session["usercode"] + "')";
            con.Open();
            float amount = float.Parse(cmd.ExecuteScalar().ToString());
            con.Close();

            float amount2 = float.Parse(TotalAmount.Text);
            if (amount2 > amount)
            {
                MsgBox("Insufficient Wallet");
                return;

            }

            string parent = "";
            string name = "";

            SqlCommand cmds1 = new SqlCommand("", con);
            cmds1.CommandText = "select username from  tblmembermaster where usercode='" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "' ";

            con.Open();
            string username = cmds1.ExecuteScalar().ToString();
            con.Close();

            Gen S1 = new Gen();
            Random rnd = new Random();
            int otp = rnd.Next(1000, 9999);
            Gen obj = new Gen();

            //string msg = "Your OTP '" + otp + "' for redemption of Rs'" + TotalAmount.Text + "' at Diwakar Retail Ltd.FRANCHISE '" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "'('" + name + "') for Order of RS '" + TotalAmount.Text + "'. Please share this code with operator for order payment.";
            string msg = "Your OTP '" + otp + "' for redemption of Rs'" + TotalAmount.Text + "' at  franchise '" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "' for Order of RS '" + TotalAmount.Text + "' and is valid for 10 minutes only";

            if (mobile != "")
            {

                obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), mobile, msg);

            }

            HiddenField6.Value = otp.ToString();
            Panel3.Visible = true;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select * from tblmembermaster where usercode='" + TextBox1.Text + "'";
            con.Open();

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                TextBox2.Text = rd["username"].ToString();
                TextBox4.Text = rd["mobileno"].ToString();
                HiddenField5.Value = rd["EMail"].ToString();
                HiddenField7.Value = rd["VoterCard"].ToString();

            }
            else
            { }

            rd.Close();
            con.Close();
            cmd.CommandText = "Select [dbo].[MyEwallet]('" + TextBox1.Text + "')";
            con.Open();
            double amount = Double.Parse(cmd.ExecuteScalar().ToString().Replace("00", "00"));
            TextBox5.Text = amount.ToString();

            DropDownList1.Items.Clear();
            DropDownList1.Items.Insert(0, new ListItem("Select", "Select"));
            DropDownList1.Items.Insert(1, new ListItem("Cheque", "Cheque"));
            DropDownList1.Items.Insert(2, new ListItem("IMPS", "IMPS"));
            DropDownList1.Items.Insert(3, new ListItem("NEFT", "NEFT"));
            DropDownList1.Items.Insert(4, new ListItem("Repurchase Wallet", "Repurchase Wallet"));
            DropDownList1.Items.Insert(5, new ListItem("Debit/Credit Card", "Debit/Credit Card"));
            DropDownList1.Items.Insert(6, new ListItem("DD", "DD"));

            con.Close();
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProductName.Text = "";
            ProductCode.Text = "";
            MRP.Text = "";
            DP.Text = "";
            BV.Text = "";
            Qty.Text = "";
            Tax.Text = "";
            Amount.Text = "";
            CGST.Text = "";
            SGST.Text = "";
            IGST.Text = "";
            PID.Value = "";
        }
    }
}
