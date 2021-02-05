using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


namespace totalfuturcare.User
{
    public partial class ActivateAccount : System.Web.UI.Page
    {
        SqlConnection con;
        public static string sPackages;
        static ArrayList YearArray = new ArrayList();
        public double sQtyTotal; //Label4
        public double sAmtQty;  // Label6
        public double sMRPTotal;  // Label6

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (!IsPostBack)
            {
                sQtyTotal = 0;
                sMRPTotal = 0;
                sAmtQty = 0;
                YearArray.Clear();
                YearArray = new ArrayList();
                HiddenField3.Value = "0";
                btnSubmit.Visible = false;
                SqlDataAdapter adt = new SqlDataAdapter("select * from categorymaster", con);
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
            if (Session["Usercode"] == null)
                Response.Redirect("/login.aspx");
            else if (Session["Usercode"].ToString() == "Administrator")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sorry! Admin Login Cannot have e Points as of now');", true);
                
            }
            else
            {
               // String mid = Session["UserCode"].ToString();
               // DateTime date1 = DateTime.Parse(System.DateTime.Today.ToString());
               // SqlCommand cmd = new SqlCommand("select isnull(sum(credit)-sum(debit),0) from AccountMaster where MemberID = '" + mid + "' and DateofTransaction<=getdate() AND txnType in (1,7,8,9)", con);
               // con.Open();
               //// Label5.Text = cmd.ExecuteScalar().ToString().Replace(".0000", ".00");
               // con.Close();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sOrderId = "";
            string sMemberId;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            //http://mrbool.com/working-with-arraylist-using-c-and-asp-net-basic-and-advance/24887
            
            int j = 0;
            int m1 = 0;
            for (int i1 = 0; i1 < YearArray.Count / 9; i1++)
            {

                string sCatg = ddlCategory.SelectedItem.Text;
                string sCatgId = ddlCategory.SelectedValue;

                string sProduct = YearArray[m1 + 1].ToString();

                con.Open();
                string sQryCatg = " SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] where [CategoryID] = (Select distinct  CategoryId from productrepurchase where ProductCode =  '" + sProduct + "')";

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
                sMemberId = Session["UserCode"].ToString();
                Session["sMemberId"] = sMemberId.ToString();
                string sBV = YearArray[m1 + 5].ToString();
                string sMRP = YearArray[m1 + 4].ToString();

                string sQuantity = YearArray[m1 + 6].ToString();
                string sTotalRowAmount = YearArray[m1 + 7].ToString();


                string sQtyTot = Label4.Text;
                string sQtyAmtTot = Label6.Text;
                


                if (i1 == 0)
                {
                    string z1 = " insert into MasterProdPurRequest(Categoryid,Category,MemberId,Status,sTotalQty, sTotalPrice) values('" + sCatgId + "','" + sCatg + "','" + sMemberId + "' ,'Pending','" + sQtyTot + "' ,'" + sQtyAmtTot + "' )";
                    SqlCommand cmd1 = new SqlCommand(z1, con);
                    cmd1.ExecuteNonQuery();
                    cmd1.Dispose();
                    cmd1.Parameters.Clear();
                    cmd1.CommandText = "select  SCOPE_IDENTITY()";
                    sOrderId = cmd1.ExecuteScalar().ToString();
                }


                SqlCommand cmd = new SqlCommand("sp_InsertMasterDetInv", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //Master Data

                cmd.Parameters.AddWithValue("@sOrderId", sOrderId);
                cmd.Parameters.AddWithValue("@CategoryId", sCatgId);
                cmd.Parameters.AddWithValue("@Category", sCatg);
                cmd.Parameters.AddWithValue("@MemberId", sMemberId);
                cmd.Parameters.AddWithValue("@AmountTot", sQtyAmtTot);
                cmd.Parameters.AddWithValue("@QtyTot", sQuantity);

                //Detail Data
                cmd.Parameters.AddWithValue("@ProductName", sProductName);
                cmd.Parameters.AddWithValue("@ProductCode", sProduct);
                cmd.Parameters.AddWithValue("@Qty", sQuantity);
                cmd.Parameters.AddWithValue("@Amount", sTotalRowAmount); //sTotalRowAmount
                cmd.Parameters.AddWithValue("@sMRP", sMRP);
                cmd.Parameters.AddWithValue("@sBV", sBV);


                cmd.ExecuteNonQuery();

                con.Close();
                cmd.Parameters.Clear();
                TextBox txt = new TextBox();
                txt.Text = "";
                Label7.Text = "Product Saved Successfully";
                TextBox1.Text = "";

                m1 = m1 + 9;
            }
            Label7.Text = "Data Updated";
            Label7.ForeColor = System.Drawing.Color.Blue;
            Response.Redirect("Generateinvoice.aspx?oid=" + sOrderId);
            return;
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
            SqlDataAdapter adt = new SqlDataAdapter("select * from productrepurchase where categoryid='" + ddlCategory.SelectedValue.ToString() + "' and Status !=1", con);
            DataSet ds = new DataSet();
            adt.Fill(ds, "table");

            string str = "  select (select CategoryName from categorymaster where CategoryID ='" + ddlCategory.SelectedValue.ToString() + "')  CategoryName,CategoryID ,Productid,productCode,ProductName,BV,MRP,sAmt,sQuantity,sAmt as sTotalAmount from productrepurchase  where CategoryID ='" + ddlCategory.SelectedValue.ToString() + "' and Status !=1";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds1 = new DataSet();
            da.Fill(ds1, "productrepurchase");
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

            adt.Dispose();
            da.Dispose();
            ds.Dispose();
            ds1.Dispose();
            con.Close();
        }
        protected void ddlCategory_SelectedIndexChanged1(object sender, EventArgs e)
        {
            bind();

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

        }
        protected void GivMon_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            TextBox txt = e.Row.FindControl("Label1") as TextBox;
            string z  = txt.Text;
            int i = 0;
            for (i = 0; i <= GivMon.Rows.Count - 1; i++)
            {
                if (((CheckBox)GivMon.Rows[i].FindControl("ChkIsService")).Checked)
                {
                    string catName = ((Label)GivMon.Rows[i].FindControl("sQuantity")).Text;
                    var subCatName = ((Label)GivMon.Rows[i-1].FindControl("sQuantity")).Text;
                }
            }
        }
        protected void Label1TextChanged(object sender, EventArgs e)
        {
         
        }
        protected void GivMonRowDataBound(object sender, GridViewRowEventArgs eventArgs)
        {
           
        }
        protected void GivMon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GivMon.EditIndex = -1;
             bind();
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["dt"];

            
            int cnt = 0;

            TextBox TextBox1 = (TextBox)sender;
            GridViewRow gvr = (GridViewRow)TextBox1.NamingContainer;
            String x = gvr.Cells[1].Text;


            //----------------------------------------------------------------------------
            if (TextBox1.Text.Trim() == "")
                return;
            //foreach (GridViewRow row in GivMon.Rows)
            //{
            //    if (row.Cells[1].Text == gvr.Cells[1].Text)
            //    {

            //        TextBox text1 = (TextBox)GivMon.Rows[gvr.RowIndex].FindControl("TextBox1");
            //        //    Label4.Text = text1.Text;
            //        if (Label4.Text == "")
            //        {
            //            double b = double.Parse(row.Cells[5].Text.ToString()) * double.Parse("0");
            //            double ta = double.Parse(row.Cells[4].Text.ToString()) * double.Parse("0");
            //            //lblTotalAmount.Text = ta.ToString();
            //            L//abel6.Text = b.ToString();
            //        }
            //        else
            //        {
            //            double b = double.Parse(row.Cells[5].Text.ToString()) * double.Parse(Label4.Text.ToString());
            //            double ta = double.Parse(row.Cells[4].Text.ToString()) * double.Parse(Label4.Text.ToString());
            //            lblTotalAmount.Text = ta.ToString();
            //            Label6.Text = b.ToString();
            //        }
            //    }
            //}
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
                            newrow[7] = double.Parse(gvr.Cells[5].Text) * double.Parse(newrow[6].ToString());
                            newrow[8] = double.Parse(gvr.Cells[4].Text) * double.Parse(newrow[6].ToString());
                            dt.Rows.Add(newrow);
                        }
                    }
                    catch { }
                    finally { }
                    Session["dt"] = dt;

                }
            }

            sMRPTotal = 0;
            sAmtQty = 0;

            foreach (GridViewRow row in GivMon.Rows)
            {
                if (row.RowType != DataControlRowType.DataRow)
                    continue;
                TextBox text1 = (TextBox)row.FindControl("TextBox1");
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

                    
                    if (text1.Text.Trim() != "")
                    {
                        if (text1.Text.Trim() == "")
                        {
                            YearArray.Add(0);
                            YearArray.Add(0);
                            YearArray.Add(0);
                        }
                        else
                        {
                            YearArray.Add(text1.Text);
                            double strQATemp = double.Parse(text1.Text) * double.Parse(gvr.Cells[5].Text); //GivMon.Rows[i].Cells[5].Text
                            gvr.Cells[7].Text = strQATemp.ToString();
                            YearArray.Add(strQATemp);
                            double strQA2Temp = double.Parse(text1.Text) * double.Parse(gvr.Cells[4].Text); //GivMon.Rows[i].Cells[5].Text
                            gvr.Cells[9].Text = strQA2Temp.ToString();
                            YearArray.Add(strQA2Temp);
                        
                        }
                    }
                }
                if (text1.Text == "")
                    text1.Text = "0";
                double strQA = double.Parse(text1.Text) * double.Parse(row.Cells[5].Text); //GivMon.Rows[i].Cells[5].Text
                double strQA2 = double.Parse(text1.Text) * double.Parse(row.Cells[4].Text); //GivMon.Rows[i].Cells[5].Text
                sAmtQty = sAmtQty + strQA; //gvr.Cells[5].Text
                sMRPTotal = strQA2 + sMRPTotal; //gvr.Cells[5].Text 
                sQtyTotal = sQtyTotal + double.Parse(text1.Text);
                Label4.Text = sQtyTotal.ToString();
              
            }

            Label6.Text = sAmtQty.ToString();
            lblTotalAmount.Text = sMRPTotal.ToString();



        }
        protected void GivMon_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GivMon.EditIndex = -1;
             bind();
        }
    }
}