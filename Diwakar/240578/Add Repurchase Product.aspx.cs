using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace WGRL._240578
{
    public partial class Add_Repurchase_Product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            cmd = new SqlCommand("",con);
        }

           

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuImage.HasFile)
                    {
                        string ImageUrl = "~/uploads/" + fuImage.FileName;
                       ViewState["ImageURL"] = ImageUrl;
                       fuImage.SaveAs(Server.MapPath(ImageUrl));
                        Image1.ImageUrl = ImageUrl;
                   }
        }
            
       
        protected void txtProductCode_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlDataAdapter da = new SqlDataAdapter("select ProductCode from ProductRepurchase where ProductCode = '" + txtProductCode.Text + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Label2.Text = "ProductCode Already Exists";
                btnSave.Enabled = false;
            }
            else
            {
                btnSave.Enabled = true;
            }
            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (productcodetxt.Text.Trim() == "")
            {
                Label1.Visible = true;
                Label1.Text = "Please Enter Product Code";
                return;
            }
            if (DropDownList1.SelectedIndex == 0)
            {
                Label1.Visible = true;
                Label1.Text = "Please Select Category ID.";
                return;
            }

            Double amount = Double.Parse(TextBox4.Text);
            float gst = float.Parse(txtIGST.Text);
            Double total = (amount * 100) / (gst + 100);
            Double total2 = total;

            Double CGST = total2;
            Double CGST1 = Double.Parse(txtCGST.Text);
            Double SubCGST = (CGST * CGST1) / 100;
            Double totalCGST = SubCGST;


            Double SGST = total2;
            Double SGST1 = Double.Parse(txtSGST.Text);
            Double SubSGST = (SGST * SGST1) / 100;
            Double totalSGST = SubSGST;

            Double IGST = total2;
            Double IGST1 = Double.Parse(txtIGST.Text);
            Double SubIGST = (IGST * IGST1) / 100;
            Double totalIGST = SubIGST;


            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("sp_InsertnewRepuchaseProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductCode", productcodetxt.Text);
            cmd.Parameters.AddWithValue("@ProductName", productnametxt.Text);
            cmd.Parameters.AddWithValue("@DistriPrice", TextBox3.Text);
            cmd.Parameters.AddWithValue("@BV", TextBox1.Text);
            cmd.Parameters.AddWithValue("@ImageUrl", Image1.ImageUrl);
            cmd.Parameters.AddWithValue("@CategoryID ", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@Detail", ProductEditor.Content);
            cmd.Parameters.AddWithValue("@salesamount", TextBox4.Text);
            cmd.Parameters.AddWithValue("@vat", TextBox5.Text);
            cmd.Parameters.AddWithValue("@TaxRate", TextBox5.Text);
            cmd.Parameters.AddWithValue("@CashBack", txtcashback.Text);
            cmd.Parameters.AddWithValue("@CashBackMonth", txtmonth.Text);
            cmd.Parameters.AddWithValue("@RedemptionPoints", txtredemption.Text);
            cmd.Parameters.AddWithValue("@SelfCashBack", txtselfcashback.Text);
            cmd.Parameters.AddWithValue("@SelfCashBackMonth", txtselefcashbackmonth.Text);
            cmd.Parameters.AddWithValue("@Discount", txtdiscount.Text);
            cmd.Parameters.AddWithValue("@CGST", txtCGST.Text);
            cmd.Parameters.AddWithValue("@SGST", txtSGST.Text);
            cmd.Parameters.AddWithValue("@IGST", txtIGST.Text);
            cmd.Parameters.AddWithValue("@CGSTAmount", totalCGST);
            cmd.Parameters.AddWithValue("@SGSTAmount", totalSGST);
            cmd.Parameters.AddWithValue("@IGSTAmount", totalIGST);
            con.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Label1.Text = "Product Saved Successfully";
                MsgBox("Product Saved Successfully");
            }
            catch (Exception ex)
            {
                Label1.Text = "Sorry! Something went Wrong.";
                MsgBox("Sorry! Something went Wrong.");
            }

            con.Close();
            TextBox txt = new TextBox();
            txt.Text = "";
            Label1.Visible = true;

            productcodetxt.Text = "";
            productnametxt.Text = "";
            TextBox3.Text = "";
            TextBox1.Text = "";
            //Response.Redirect("Add Repurchase Product.aspx");

            DropDownList1.SelectedIndex = 0;

        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }

        protected void ClearText()
        {
            txtProductCode.Text = "";
            txtProductName.Text = "";
            //txtPV.Text = "";
            txtDP.Text = "";
            txtBV.Text = "";
            //txtTax.Text = "";
            txtWeight.Text = "";
            txtDetails.Text = "";
            txtMRP.Text = "";
            txtaddvat.Text = "";
            txtvat.Text = "";
            CheckBox1.Checked = false;
        }

        protected void ddlmaincategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlDataAdapter da = new SqlDataAdapter("Select categoryId,categoryname from categorymaster where PID = '" + ddlmaincategory.SelectedValue + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlCategoryID.DataSource = ds;
            ddlCategoryID.DataTextField = "categoryname";
            ddlCategoryID.DataValueField = "categoryId";
            ddlCategoryID.DataBind();
            ddlCategoryID.Items.Insert(0, new ListItem("Select ", "0"));
            getlastusedproductcode();

        }
        
        protected void getlastusedproductcode()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());

            try
            {
                SqlCommand cmd = new SqlCommand("Select productcode from productrepurchase where ProductID in (Select max(productID) from productrepurchase where categoryId in(Select categoryId from categorymaster where PID = '" + ddlmaincategory.SelectedValue + "'))", con);
                con.Open();


                if (!string.IsNullOrEmpty(cmd.ExecuteScalar().ToString()))
                {
                    txtlastproductcode.Text = cmd.ExecuteScalar().ToString();
                }
                else
                {
                    txtlastproductcode.Text = "Not Used";
                }
                con.Close();

            }
            catch 
            {
                txtlastproductcode.Text = "Not Used";
            }
            

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            getlastusedproductcode();
        }

      
        }
    }

