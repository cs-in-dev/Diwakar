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
            //panelcheque.Visible = false;
          //  panel2.Visible = false;
            Button2.Visible = false;

            //Panel3.Visible = false;
          //  panel5.Visible = false;
         // panel4.Visible = false;
           // panel6.Visible = false;
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
            
                cmd.CommandText = "select *,dbo.GETAVLQTY(productId,@FrenchiseID)as AQTY from ProductRepurchase where ProductName = @ProductName and Status != 1 ";
            
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
            
                cmd.CommandText = "select *,dbo.GETAVLQTY(productId,@FrenchiseID)as AQTY from ProductRepurchase where ProductCode =@Pid and Status != 1";
           
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
            CGST.Text = "";
            SGST.Text = "";
            GridView1.DataSource = dt;
            GridView1.DataBind();
            CalcTotals();
            // ProductCode.Focus();
            ProductName.Focus();
        }

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
            if(DropDownList1.SelectedValue=="Cash")
            {
                   Button2.Visible = true;
            }

           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string res = "";
            string sOrderId = "";

            try
            {
                SqlCommand cmdProc = new SqlCommand("CreateOrder", con);
                cmdProc.CommandType = CommandType.StoredProcedure;
                cmdProc.Parameters.AddWithValue("@Usercode", TextBox1.Text);
                cmdProc.Parameters.AddWithValue("@Usercode1", Session["usercode"]);
                cmdProc.Parameters.AddWithValue("@FrenchiseID", ConfigurationManager.AppSettings["FrenchiseID"].ToString());
                cmdProc.Parameters.AddWithValue("@UserPaymentDate", DateTime.Now.ToString());
                cmdProc.Parameters.AddWithValue("@PaymentMode", DropDownList1.SelectedValue);
                cmdProc.Parameters.AddWithValue("@Amount", TotalAmount.Text);
                cmdProc.Parameters.AddWithValue("@TotalBv", TotalBV.Text);
                cmdProc.Parameters.AddWithValue("@ChequeDate", "");
                cmdProc.Parameters.AddWithValue("@BankName", "");
                cmdProc.Parameters.AddWithValue("@DDBankName", "");
                cmdProc.Parameters.AddWithValue("@ChequeNo", "");
                cmdProc.Parameters.AddWithValue("@DDDate", "");
                cmdProc.Parameters.AddWithValue("@DDNo", "");
                cmdProc.Parameters.AddWithValue("@Referencenumber", "");
                cmdProc.Parameters.AddWithValue("@Impsdate", "");
                cmdProc.Parameters.AddWithValue("@InvoiceType", "DP");
                cmdProc.Parameters.AddWithValue("@Neftdate", "");
                cmdProc.Parameters.AddWithValue("@debitrefno", "");
                cmdProc.Parameters.AddWithValue("@NeftRefNo", "");
                cmdProc.Parameters.AddWithValue("@debitrefdate", "");
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

                Msg = "Order details are as follow :<br /><br />OrderID :" + sOrderId + "<br />Date :" + date1 + "<br />Payment Mode :" + paymentmode + "<br />Amount :" + amount + "<br /><br />You can login to view the invoice.<br /><br />Thanks,<br />With regards!<br /><br /> Diwakar Retails Limited";

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

            //string msg = "Your OTP '" + otp + "' for redemption of Rs'" + TotalAmount.Text + "' at Diwakar Retails FRANCHISE '" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "'('" + name + "') for Order of RS '" + TotalAmount.Text + "'. Please share this code with operator for order payment.";
            string msg = "Your OTP '" + otp + "' for redemption of Rs'" + TotalAmount.Text + "' at  franchise '" + ConfigurationManager.AppSettings["FrenchiseID"].ToString() + "' for Order of RS '" + TotalAmount.Text + "' and is valid for 10 minutes only";

            if (mobile != "")
            {

                obj.SendNormalSMS(ConfigurationManager.AppSettings["SMSsenderID"].ToString(), mobile, msg);

            }

            HiddenField6.Value = otp.ToString();
           
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
            DropDownList1.Items.Insert(1, new ListItem("Cash", "Cash"));
            //DropDownList1.Items.Insert(2, new ListItem("IMPS", "IMPS"));
            //DropDownList1.Items.Insert(3, new ListItem("NEFT", "NEFT"));
            //DropDownList1.Items.Insert(4, new ListItem("Repurchase Wallet", "Repurchase Wallet"));
            //DropDownList1.Items.Insert(5, new ListItem("Debit/Credit Card", "Debit/Credit Card"));
            //DropDownList1.Items.Insert(6, new ListItem("DD", "DD"));

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
