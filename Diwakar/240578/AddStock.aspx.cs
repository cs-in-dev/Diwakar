using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace GWG
{
    public partial class AddStock : System.Web.UI.Page
    {
        static List<string> productCodeList = GetProductId();
        static List<string> productNameList = GetProductNames();
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Add Stock") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            ProductCode.Focus();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_StockAdd", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("StoreID", "Admin");
            cmd.Parameters.AddWithValue("ProductQty", txtQty.Text);
            cmd.Parameters.AddWithValue("ProductID", PID.Value);
            cmd.Parameters.AddWithValue("InwardNo", txtInwardNo.Text);//BillNo
            cmd.Parameters.AddWithValue("TimeIn", txtTimeIn.Text);
            cmd.Parameters.AddWithValue("VehicleNo", txtVehicleNo.Text);//VAT
            cmd.Parameters.AddWithValue("CompanyName", txtCompanyName.Text);
            cmd.Parameters.AddWithValue("DCNo", txtDCNo.Text);//Invoice No
            cmd.Parameters.AddWithValue("DriversName", txtDriversName.Text);//ADD VAT

            cmd.Parameters.AddWithValue("InwardDate", txtdates.Text);
            cmd.Parameters.AddWithValue("Amount", ((Double.Parse(txtrate.Text.ToString()) *(Double.Parse (txtQty.Text.ToString()))))); //PRICE
            Double Amts=(Double.Parse(txtrate.Text.ToString()) *(Double.Parse (txtQty.Text.ToString())));
            TextBox1.Text=Amts.ToString();

            con.Open();
            int cnt = int.Parse(cmd.ExecuteNonQuery().ToString());
           // int stc = int.Parse(cnt);
            if (cnt > 0)
            {
                lblMessage.Text = "" + txtQty.Text + " Product  Added Successfully";
            }
            else
            {
                lblMessage.Text = "No Item Found";

            }


            ProductCode.Text = "";
            ProductName.Text = "";
            txtTimeIn.Text = "";
            txtDriversName.Text = "";
            txtQty.Text = "";
            txtCompanyName.Text = "";
            txtInwardNo.Text = "";
            txtDCNo.Text = "";
            txtVehicleNo.Text = "";
            TextBox1.Text = "";
            txtrate.Text = "";
            con.Close();
            Show();
        }

        //protected void drpStock_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    while (drpProduct.Items.Count != 0)
        //        drpProduct.Items.RemoveAt(0);
        //    if (drpStock.SelectedValue == "Product") 
        //    {
        //        drpCategory.Visible = false;
        //        lblCategory.Visible = false;
        //        SqlCommand cmd = new SqlCommand("Select * From ProductMaster", con);
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        drpProduct.DataSource = reader;
        //        drpProduct.DataBind();
        //        con.Close();

        //    }
        //    if (drpStock.SelectedValue=="Purchase")
        //    {

        //        drpCategory.Visible = true;
        //        lblCategory.Visible = true;


        //    }

        //}

        //protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    while (drpProduct.Items.Count != 0)
        //        drpProduct.Items.RemoveAt(0);
        //    DataSet ds = new DataSet();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "Select ProductID,ProductName  From ProductRepurchase  Where CategoryId='" + Convert.ToInt32(drpCategory.SelectedValue) + "'";
        //    SqlDataAdapter adp = new SqlDataAdapter(cmd.CommandText, con);
        //    con.Open();
        //    adp.Fill(ds);
        //    drpProduct.DataSource = ds.Tables[0];    
        //             drpProduct.DataBind();
        //            con.Close();
        //            drpCategory.Visible = true;
        //            lblCategory.Visible = true;

        //        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] GetProductIdList(string prefixText, int count)
        {
            // Get the Products From Data Source. Change this method to use Database


            // Find All Matching Products
            var list = from p in productCodeList
                       where p.Contains(prefixText)
                       select p;

            //Convert to Array as We need to return Array
            string[] prefixTextArray = list.ToArray<string>();

            //Return Selected Products
            return prefixTextArray;
        }



        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] GetProductNameList(string prefixText, int count)
        {
            // Get the Products From Data Source. Change this method to use Database


            // Find All Matching Products
            var list = from p in productNameList
                       where p.Contains(prefixText)
                       select p;

            //Convert to Array as We need to return Array
            string[] prefixTextArray = list.ToArray<string>();

            //Return Selected Products
            return prefixTextArray;
        }

        private static List<string> GetProductNames()
        {
            List<string> tagsList = new List<string>();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select ProductName from ProductRepurchase where Status!=1", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                tagsList.Add(dr[0].ToString());
            }
            con.Close();
            return tagsList;
        }
        private static List<string> GetProductId()
        {
            List<string> tagsList = new List<string>();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select ProductCode from ProductRepurchase where Status!=1", con);
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
            SqlCommand cmd = new SqlCommand("Select ProductCode,ProductName,ProductID from ProductRepurchase where ProductName='" + ProductName.Text + "'", con);
            
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                PID.Value = rd["ProductID"].ToString();
                ProductCode.Text = rd["ProductCode"].ToString();

            }
            else
            {
                con.Close();
                lblMessage.Text = "Sorry! Invalid Product Name.";
                Response.Redirect("AddStock.aspx");
                return;
            }
            con.Close();
            Show();
            txtQty.Focus();
        }
        protected void MsgBoxRedirect(string Msg, string Url)
        {
            this.Page.Controls.Add(new LiteralControl("<Script>alert('" + Msg + "');window.location='" + Url + "';</Script>"));
        }
        protected void ProductCode_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select ProductID,ProductName from ProductRepurchase where ProductCode='" + ProductCode.Text + "'", con);
            
            con.Open();
            lblClossingQty.Text = "";
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                PID.Value = rd["ProductID"].ToString();
                ProductName.Text = rd["ProductName"].ToString();
            }
            else
            {

                lblClossingQty.Text = "Sorry! Invalid Product Code.";
                
             
            }
            con.Close();
         
            
            Show();
            txtQty.Focus();
        }


        private void Show()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Select isnull(sum(RecievedQty)-sum(TransferQty),0) from Inventory where ProductId IN (Select ProductID from ProductRepurchase where ProductCode ='" + ProductCode.Text + "') ", con);
                con.Open();
                //txtQty.Text = cmd.ExecuteScalar().ToString();
                lblClossingQty.Text = cmd.ExecuteScalar().ToString();


                con.Close();
            }
            catch
            {
                txtQty.Text = "0";

            }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            //String Amt = TextBox1.Text;
            //Double Amts = double.Parse(Amt.ToString());

            //Double Vat = (Amts * 0.04);
            //txtVehicleNo.Text = Vat.ToString();
            //Double AVat = (Amts * 0.01);
            //txtDriversName.Text = AVat.ToString();
        }




    }



}


