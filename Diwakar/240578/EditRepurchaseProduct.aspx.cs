using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WGRL._240578
{
    public partial class EditRepurchaseProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/19111973/Default.aspx");
            if (User.IsInRole("Update Profile") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/19111973/AdminHome.aspx");
            cmd = new SqlCommand("", con);
            if (!IsPostBack)
            {
                if (Request.QueryString["pid"] != null)
                {
                    SqlDataSource2.DataBind();
                    ddlmaincategory.DataBind();
                    cmd.CommandText = "select categoryid from [dbo].[CategoryMaster] where categoryid  in (select pid from CategoryMaster where categoryid in (select categoryid from ProductRepurchase where [status] <> 1 and ProductCode = '" + Request.QueryString["pid"] + "'))";
                    con.Open();
                    ddlmaincategory.SelectedValue = cmd.ExecuteScalar().ToString();
                    con.Close();
                    ddlmaincategory_SelectedIndexChanged(sender, e);
                    cmd.CommandText = "select categoryid from ProductRepurchase where [status] <> 1 and ProductCode = '" + Request.QueryString["pid"] + "'";
                    con.Open();
                    ddlCategoryID.SelectedValue = cmd.ExecuteScalar().ToString();
                    con.Close();
                    ddlCategoryID_SelectedIndexChanged(sender, e);
                    cmd.CommandText = "select productid from ProductRepurchase where [status] <> 1 and ProductCode = '" + Request.QueryString["pid"] + "'";
                    con.Open();
                    ddlProductID.SelectedValue = cmd.ExecuteScalar().ToString();
                    con.Close();
                    ddlProductID_SelectedIndexChanged(sender, e);

                }
            }
        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</Script>"));
        }

        protected void ddlCategoryID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategoryID.SelectedValue == "0")
                return;
            Image1.ImageUrl = "";
            SqlDataAdapter adt = new SqlDataAdapter("select * from ProductRepurchase where Status='0' and CategoryID=" + ddlCategoryID.SelectedValue, con);
            DataSet ds = new DataSet();
            adt.Fill(ds);
            ddlProductID.DataSource = ds.Tables[0];
            ddlProductID.DataTextField = "ProductName";
            ddlProductID.DataValueField = "ProductId";
            ddlProductID.DataBind();
            ddlProductID.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void ddlProductID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProductID.SelectedValue == "0")
                return;

            ClearText();
            Image1.ImageUrl = "";
            // cmd.CommandText = "SELECT  * from ProductRepurchase WHERE ProductID=@Pid and Status='0'";
            cmd.CommandText = "SELECT  *,[dbo].[CategoryNamebyCategoryID](categoryID) as CNAme from ProductRepurchase WHERE ProductID=@Pid and Status='0'";
            cmd.Parameters.AddWithValue("@pid", ddlProductID.SelectedValue);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtProductCode.Text = dr["ProductCode"].ToString();
                txtProductName.Text = dr["ProductName"].ToString();
                //txtPV.Text = dr["BV"].ToString();               
                Image1.ImageUrl = dr["ImageURl"].ToString();
                txtBV.Text = dr["BV"].ToString();
                txtDP.Text = dr["SalesAmount"].ToString();
                txtIGST.Text = dr["IGST"].ToString();
                txtSGST.Text = dr["SGST"].ToString();
                txtCGST.Text = dr["CGST"].ToString();

                txtWeight.Text = dr["Weight"].ToString();
                txtDetails.Text = dr["Detail"].ToString();
                txtMrp.Text = dr["MRP"].ToString();
                txtVat.Text = dr["AddQuantity"].ToString();
                txtaddvat.Text = dr["ADDML"].ToString();
                DropDownList1.SelectedValue = dr["IncludeInMRPBill"].ToString();
                dropdowncategory.SelectedValue = dr["categoryID"].ToString();
            }
            dr.Close();
            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Double MRP = Convert.ToDouble(txtMrp.Text);
            Double amount = 0;
            try
            {
                if (ddlmaincategory.SelectedValue == "0")
                    return;

                if (ddlCategoryID.SelectedValue == "0")
                    return;

                if (ddlProductID.SelectedValue == "0")
                    return;

                if (txtDP.Text.Trim() == "" || ddlProductID.SelectedValue == "" || txtMrp.Text.Trim() == "")
                    return;

                //if (ddlmaincategory.SelectedItem.Text.Trim().ToLower().Substring(0, 1) == txtProductCode.Text.Trim().ToLower().Substring(0, 1))
                if (ddlmaincategory.SelectedValue != "0")
                {
                    String ImageUrl = "";
                    if (imageedit.HasFile)
                    {
                        ImageUrl = "~/uploads/" + imageedit.FileName;
                        imageedit.SaveAs(Server.MapPath(ImageUrl));
                    }
                    else
                        ImageUrl = Image1.ImageUrl;

                    //float amount = float.Parse(txtDP.Text);
                    //float vat = float.Parse(txtTax.Text);
                    //float total = (amount * 100) / (vat + 100);
                    //float total2 = amount - total;

                    // if (DropDownList1.SelectedItem.Text == "Yes")
                    // {
                    //     amount = Double.Parse(txtMrp.Text);
                    // }
                    // else
                    // {
                    //     amount = Double.Parse(txtDP.Text);
                    // }

                    //// Double amount = Double.Parse(txtDP.Text);
                    // float gst = float.Parse(txtIGST.Text);
                    // Double total = (amount * 100) / (gst + 100);
                    // Double total2 = total;

                    // Double CGST = total2;
                    // Double CGST1 = Double.Parse(txtCGST.Text);
                    // Double SubCGST = (CGST * CGST1) / 100;
                    // Double totalCGST = SubCGST;


                    // Double SGST = total2;
                    // Double SGST1 = Double.Parse(txtSGST.Text);
                    // Double SubSGST = (SGST * SGST1) / 100;
                    // Double totalSGST = SubSGST;

                    // Double IGST = total2;
                    // Double IGST1 = Double.Parse(txtIGST.Text);
                    // Double SubIGST = (IGST * IGST1) / 100;
                    // Double totalIGST = SubIGST;



                    if (DropDownList1.SelectedItem.Text.ToUpper() == "NO")
                    {
                        MRP = 0;
                    }


                    float igst = float.Parse(txtIGST.Text);
                    Double igstAmount = (MRP * igst) / 100;


                    float cgst = float.Parse(txtCGST.Text);
                    Double cgstAmount = (MRP * cgst) / 100;


                    float sgst = float.Parse(txtSGST.Text);
                    Double sgstAmount = (MRP * sgst) / 100;
                    cmd.CommandText = "Update ProductRepurchase set PriceBeforeTax=@PriceBeforeTax,ProductName=@ProductName,AddQuantity=@AddQuantity,ADDML=@ADDML,CategoryId=@CategoryId,ProductCode=@ProductCode,MRP=@MRP,ImageUrl=@imageedit,BV=@BV,Weight=@Weight, Detail=@Desc,SalesAmount=@SalesAmount,IncludeInMRPBill=@IncludeInMRPBill,CGST=@CGST, SGST=@SGST, IGST=@IGST,CGSTAmount=@CGSTAmount,SGSTAmount=@SGSTAmount,IGSTAmount=@IGSTAmount WHERE ProductID=@Pid and Status='0'";
                    cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@ProductCode", txtProductCode.Text);
                    cmd.Parameters.AddWithValue("@CategoryId", dropdowncategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@imageedit", ImageUrl);
                    cmd.Parameters.AddWithValue("@BV", txtBV.Text);
                    cmd.Parameters.AddWithValue("@Weight", txtWeight.Text);
                    cmd.Parameters.AddWithValue("@PriceBeforeTax", "0");
                    cmd.Parameters.AddWithValue("@SalesAmount", txtDP.Text);
                    cmd.Parameters.AddWithValue("@Desc", txtDetails.Text);
                    cmd.Parameters.AddWithValue("@Pid", ddlProductID.SelectedValue);
                    cmd.Parameters.AddWithValue("@MRP", txtMrp.Text);
                    cmd.Parameters.AddWithValue("@AddQuantity", txtVat.Text);
                    cmd.Parameters.AddWithValue("@ADDML", txtaddvat.Text);
                    cmd.Parameters.AddWithValue("@IncludeInMRPBill", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@CGST", txtCGST.Text);
                    cmd.Parameters.AddWithValue("@SGST", txtSGST.Text);
                    cmd.Parameters.AddWithValue("@IGST", txtIGST.Text);
                    cmd.Parameters.AddWithValue("@CGSTAmount", cgstAmount);
                    cmd.Parameters.AddWithValue("@SGSTAmount", sgstAmount);
                    cmd.Parameters.AddWithValue("@IGSTAmount", igstAmount);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Image1.ImageUrl = ImageUrl;
                    ClearText();
                    //ddlmaincategory.SelectedValue = "0";
                    //ddlCategoryID.SelectedValue = "0";
                    //ddlProductID.SelectedValue = "0";
                    if (Request.QueryString["pid"] != null)
                        this.Page.Controls.Add(new LiteralControl("<Script>alert('Product updated successfully.');window.location='AddStock.aspx?pid=" + Request.QueryString["pid"].ToString() + "';</Script>"));
                    else
                        MsgBox("Product updated successfully.");
                }
                else
                    MsgBox("Invalid Product Code.");
            }
            catch (Exception ex)
            {
                MsgBox("Try Again.");
            }
        }

        protected void ClearText()
        {
            txtProductCode.Text = "";
            txtProductName.Text = "";
            //txtPV.Text = "";
            txtDP.Text = "";
            txtBV.Text = "";
            txtCGST.Text = "";
            txtIGST.Text = "";
            txtIGST.Text = "";
            txtWeight.Text = "";
            txtDetails.Text = "";
            txtMrp.Text = "";
            txtVat.Text = "";
            txtaddvat.Text = "";
            // CheckBox1.Checked = false;            

        }

        protected void ddlmaincategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlmaincategory.SelectedValue == "0")
                return;

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
            SqlCommand cmd = new SqlCommand("Select productcode from productrepurchase where ProductID in (Select max(productID) from productrepurchase where categoryId in(Select categoryId from categorymaster where PID = '" + ddlmaincategory.SelectedValue + "'))", con);
            con.Open();
            var checker = cmd.ExecuteScalar();
            if (checker == null)
                txtlastproductcode.Text = "Not Used";
            else
                txtlastproductcode.Text = checker.ToString();
            con.Close();

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            getlastusedproductcode();
        }
    }
}

