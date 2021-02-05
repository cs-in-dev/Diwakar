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


namespace totalfuturcare.User
{
    public partial class FrenStkTransfer : System.Web.UI.Page
    {
        SqlConnection con;
        public static string sPackages;
        static ArrayList YearArray = new ArrayList();
        public static float sQtyTotal; //Label4
        public static float sAmtQty;  // Label6

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated == false)
            //    Response.Redirect("~/19111973/Default.aspx");
            //if (User.IsInRole("Stock Transfer") == false && User.IsInRole("Admin") == false)
            //    Response.Redirect("~/19111973/AdminHome.aspx");

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

            if (!IsPostBack)
            {
                sQtyTotal = 0;
                sAmtQty = 0;
                YearArray.Clear();
                YearArray = new ArrayList();
                HiddenField3.Value = "0";               
                SqlDataAdapter adt = new SqlDataAdapter("SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] UNION select -1 [CategoryID],'All' [CategoryName] FROM [CategoryMaster]", con);
                DataSet ds = new DataSet();
                adt.Fill(ds, "table");
                ddlCategory.DataSource = ds.Tables[0];
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));
                TextBox2.Text = "2";

                DataTable dt = new DataTable();
                dt.Columns.Add("CategoryID");
                dt.Columns.Add("CategoryName");
                dt.Columns.Add("ProductCode");
                dt.Columns.Add("ProductName");
                dt.Columns.Add("BV");
                dt.Columns.Add("MRP");
                dt.Columns.Add("sQuantity");
                dt.Columns.Add("sAmt");
                dt.Columns.Add("TotalAmount");

                Session["DT"] = dt;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sOrderId = "";
            string sMemberId;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            //http://mrbool.com/working-with-arraylist-using-c-and-asp-net-basic-and-advance/24887
            if (txtUserCode.Text.Trim() == "")
            {
                Label7.Text = "Please Enter Frenchise ID.";
               
                return;
            }
            int j = 0;
            int m1 = 0;

            //----------Check Stock Availability---------------------------

            for (int i1 = 0; i1 < YearArray.Count / 7; i1++)
            {
                string sProduct = YearArray[m1 + 1].ToString();
                string sQuantity = YearArray[m1 + 6].ToString();

                SqlDataAdapter checkstock = new SqlDataAdapter("select dbo.GetStock((select ProductID from ProductRepurchase where ProductCode='" + sProduct + "'),'Admin')", con);
                DataTable dtavl = new DataTable();
                checkstock.Fill(dtavl);
                int avl = Int32.Parse(dtavl.Rows[0][0].ToString());
                int req = Int32.Parse(sQuantity);
                if (req > avl)
                {                    
                    this.Page.Controls.Add(new LiteralControl("<script>alert('Sorry! You have entered large quantity of stock that is not available.');</script>"));
                    return;
                }
                m1 = m1 + 8;
                if (m1 == YearArray.Count)
                    break;

            }

            //-------------------------------------------------------------

            j = 0;
            m1 = 0;
           
            for (int i1 = 0; i1 < YearArray.Count / 7; i1++)
            {

                string sCatg = ddlCategory.SelectedItem.Text;
                string sCatgId = ddlCategory.SelectedValue;

                string sProduct = YearArray[m1 + 1].ToString();

                con.Open();
                string sQryCatg = " SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] where [CategoryID] IN (Select CategoryId from ProductRepurchase where ProductCode  =  '" + sProduct + "')";
                
                SqlDataAdapter da = new SqlDataAdapter(sQryCatg, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    sCatg = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                    sCatgId = ds.Tables[0].Rows[0]["CategoryName"].ToString();
                }
                ds.Dispose();

                string sProductName = YearArray[m1 + 2].ToString();
                sMemberId = txtUserCode.Text;
                Session["sMemberId"] = sMemberId.ToString();
                string sBV = YearArray[m1 + 4].ToString();
                string sMRP = YearArray[m1 + 5].ToString();
                string sQuantity = YearArray[m1 + 6].ToString();
                string sTotalRowAmount = YearArray[m1 + 7].ToString();
                string sQtyTot = Label4.Text;
                string sQtyAmtTot = Label6.Text;

                SqlCommand cmd = new SqlCommand("SP_StockTransfer_byAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;               
                cmd.Parameters.AddWithValue("@PCode", sProduct);
                cmd.Parameters.AddWithValue("@Qty", sQuantity);
                cmd.Parameters.AddWithValue("@Branch", txtUserCode.Text);
                cmd.Parameters.AddWithValue("@Result", txtUserCode.Text);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();               
                con.Close();

                TextBox txt = new TextBox();
                txt.Text = "";
                Label7.Text = "Product Saved Successfully";
                TextBox1.Text = "";

                m1 = m1 + 8;
                if (m1 == YearArray.Count)
                    break;
            }
            this.Page.Controls.Add(new LiteralControl("<script>alert(' Product transferred successfully. ');</script>"));
            Label7.Text = "Product transferred successfully.";
            Label7.ForeColor = Color.Green;
            //Response.Redirect("FrenStkTransfer.aspx");
        }

        protected void bind()
        {
            if (ddlCategory.SelectedIndex == 0)
            {
                GivMon.Visible = false;
                btnSubmit.Visible = false;
                return;
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlDataAdapter adt = new SqlDataAdapter("select * from OrderDetails where categoryid='" + ddlCategory.SelectedValue.ToString() + "'", con);
            DataSet ds = new DataSet();
            adt.Fill(ds, "table");
            string str=null;
            if (ddlCategory.SelectedItem.Text=="All")
            {
                str = "SELECT CategoryMaster.CategoryName,ProductRepurchase.ProductCode,ProductRepurchase.ProductName,dbo.GetStock(ProductRepurchase.ProductID,'Admin') as Stock,ProductRepurchase.BV, ProductRepurchase.SalesAmount As MRP,0 AS Qty,0 as sAmt, ProductRepurchase.ProductID FROM ProductRepurchase INNER JOIN CategoryMaster ON ProductRepurchase.CategoryID = CategoryMaster.CategoryID where ProductRepurchase.status=0 and dbo.GetStock(ProductRepurchase.ProductID,'Admin') > 0";
            }
            else
                str = " SELECT CategoryMaster.CategoryName,ProductRepurchase.ProductCode,ProductRepurchase.ProductName,dbo.GetStock(ProductRepurchase.ProductID,'Admin') as Stock,ProductRepurchase.BV, ProductRepurchase.SalesAmount As MRP,0 AS Qty,0 as sAmt, ProductRepurchase.ProductID FROM ProductRepurchase INNER JOIN CategoryMaster ON ProductRepurchase.CategoryID = CategoryMaster.CategoryID where ProductRepurchase.status=0 and CategoryMaster.CategoryID ='" + ddlCategory.SelectedValue.ToString() + "' and dbo.GetStock(ProductRepurchase.ProductID,'Admin') > 0";
         
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds1 = new DataSet();
            da.Fill(ds1, "ProductRepurchase");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                GivMon.DataSource = ds1;
                GivMon.DataBind();
                GivMon.Visible = true;
                btnSubmit.Visible = true;
            }
            else
            {
                GivMon.Visible = false;
                btnSubmit.Visible = false;
            }
            if (Session["Test"] != null)
            {
                Label6.Text = Session["Test"].ToString();
            }
            Label6.Visible = true;
            adt.Dispose();
            da.Dispose();
            ds.Dispose();
            ds1.Dispose();
            con.Close();
        }
   
        protected void ddlCategory_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedIndex == 0)
            {
                GivMon.DataSource = "";
                GivMon.DataBind();
                return;
            }
            if (YearArray.Count == 0)
            {
                bind();
            }
            else
            {
                bind();
                int k = 1;
                int rowscount = GivMon.Rows.Count;
                int columnscount = GivMon.Columns.Count;
                int a1 = YearArray.Count / 8;
                int i = 0;

                int MyNo = 2;
                int MyNo1 = 2;
                for (int m1 = 0; m1 < YearArray.Count; m1++)
                {
                    for (int i1 = 0; i1 < GivMon.Rows.Count; i1++)
                    {
                        if (YearArray[m1].ToString() == GivMon.Rows[i1].Cells[1].Text)
                        {
                            TextBox text1 = (TextBox)GivMon.Rows[i1].FindControl("TextBox1");
                            if (i1 == 0)
                            {
                                text1.Text = YearArray[m1 + 5].ToString();
                                GivMon.Rows[i1].Cells[7].Text = YearArray[m1 + 5 + 1].ToString();
                            }
                            if (i1 == 1)
                            {
                                int zz = (((6 * MyNo)) + MyNo1);
                                text1.Text = YearArray[m1 + 5].ToString();
                                GivMon.Rows[i1].Cells[7].Text = YearArray[m1 + 5 + 1].ToString();
                                MyNo = MyNo + 1;
                                MyNo1 = MyNo1 + 2;
                            }
                        }
                    }
                }
            }
        }
      
        protected void txtquantity_TextChanged(object sender, EventArgs e)
        {
        }
       
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
       
        protected void GivMon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)GivMon.Rows[e.RowIndex];
            int id = Int32.Parse(GivMon.DataKeys[e.RowIndex].Value.ToString());
            string mySelectedCell1 = GivMon.Rows[1].FindControl("Label1").ToString();
            string mySelectedCell11 = mySelectedCell1.ToString();

            int h = 0;
            TextBox nt = (TextBox)GivMon.Rows[h].Cells[1].FindControl("TextBox1");
            string myVal = nt.Text;

        }

        protected void Label1TextChanged(object sender, EventArgs e)
        {
        }
       
        protected void GivMon_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txt = (TextBox)e.Row.FindControl("TextBox1");
                txt.Attributes.Add("onBlur", "JvfunonBlur(this,this.id);");
            }
        }
       
        protected void GivMon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GivMon.EditIndex = -1;
            bind();
        }
      
        protected void GivMon_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GivMon.EditIndex = -1;
            bind();
        }

        protected void txtUserCode_TextChanged(object sender, EventArgs e)
        {
            if (txtUserCode.Text.Trim() == "")
            {
                return;
            }
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                con.Open();
                string str = "select Name from tblfrenchisemaster where FrenchiseID ='" + txtUserCode.Text.Trim() + "'";
                SqlDataAdapter da = new SqlDataAdapter(str, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Label8.Text = "";
                    txtUserName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    if (GivMon.Rows.Count > 0)
                        btnSubmit.Visible = true;
                }
                else
                {
                    Label8.Text = "*";
                    btnSubmit.Visible = false;
                }
                con.Dispose();
            }
            catch
            {
                this.Page.Controls.Add(new LiteralControl("<script>alert('Sorry! Invalid ID.');</script>"));
                return;
            }
        }
     
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            DataRow dr;
            DataTable dt = (DataTable)Session["dt"];
            int cnt = 0;

            TextBox TextBox1 = (TextBox)sender;
            GridViewRow gvr = (GridViewRow)TextBox1.NamingContainer;
            String x = gvr.Cells[1].Text;


            //----------------------------------------------------------------------------
            if (TextBox1.Text.Trim() == "")
            {
                if (YearArray.Contains(x) == true)
                {
                    //   YearArray.RemoveAt(Int32.Parse(x));
                }
                return;
            }

            foreach (GridViewRow row in GivMon.Rows)
            {
                if (row.Cells[1].Text == gvr.Cells[1].Text)
                {
                    TextBox text1 = (TextBox)GivMon.Rows[gvr.RowIndex].FindControl("TextBox1");                  
                    if (Label4.Text == "")
                    {
                        float b = float.Parse(row.Cells[5].Text.ToString()) * float.Parse("0");
                        Label6.Text = b.ToString();
                    }
                    else
                    {
                        float b = float.Parse(row.Cells[5].Text.ToString()) * float.Parse(Label4.Text.ToString());
                        Label6.Text = row.Cells[5].Text.ToString();
                    }
                }
            }
          
            //----------------------------------------------------------------------------           
            if (cnt == 0)
            {

                DataRow newrow = dt.NewRow();
                newrow[0] = "";
                newrow[0] = gvr.Cells[0].Text;
                newrow[1] = gvr.Cells[1].Text;
                newrow[2] = gvr.Cells[2].Text;
                newrow[3] = gvr.Cells[3].Text;
                newrow[4] = gvr.Cells[4].Text;
                newrow[5] = gvr.Cells[5].Text;

                TextBox text1 = (TextBox)GivMon.Rows[gvr.RowIndex].FindControl("TextBox1");
                if (text1.Text.Trim() != "")
                {
                    newrow[6] = text1.Text;
                    try
                    {
                        if (newrow[6].ToString() == "")
                            newrow[6] = 0;
                        if (newrow[6].ToString() == "&nbsp;")
                        { }
                        else
                        {
                            newrow[7] = float.Parse(gvr.Cells[7].Text) * float.Parse(newrow[6].ToString());
                            dt.Rows.Add(newrow);
                        }
                    }
                    catch { }
                    finally { }
                    Session["dt"] = dt;

                }
            }

            foreach (GridViewRow row in GivMon.Rows)
            {

                if (row.Cells[1].Text == gvr.Cells[1].Text)
                {
                    //Item not Found
                    int i = 0;
                    //YearArray.Add(GivMon.Rows[i].Cells[0].Text);
                    YearArray.Add(gvr.Cells[0].Text);
                    YearArray.Add(gvr.Cells[1].Text);
                    YearArray.Add(gvr.Cells[2].Text);
                    YearArray.Add(gvr.Cells[3].Text);
                    YearArray.Add(gvr.Cells[4].Text);
                    YearArray.Add(gvr.Cells[5].Text);

                    TextBox text1 = (TextBox)GivMon.Rows[gvr.RowIndex].FindControl("TextBox1");
                    if (text1.Text.Trim() != "")
                    {
                        if (text1.Text.Trim() == "")
                        {
                            YearArray.Add(0);
                            YearArray.Add(0);
                        }
                        else
                        {
                            YearArray.Add(text1.Text);
                            float strQA = float.Parse(text1.Text) * float.Parse(gvr.Cells[5].Text); //GivMon.Rows[i].Cells[5].Text
                            gvr.Cells[7].Text = strQA.ToString();                           
                            YearArray.Add(strQA);
                            sAmtQty = float.Parse(sAmtQty.ToString()) + strQA; //gvr.Cells[5].Text
                            Label6.Text = sAmtQty.ToString();
                        }
                        if (text1.Text.Trim() != "")
                        {
                            sQtyTotal = float.Parse(sQtyTotal.ToString()) + float.Parse(text1.Text);
                            Label4.Text = sQtyTotal.ToString();
                        }
                    }
                }
            }
            
        }
    }
}