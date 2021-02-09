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
using System.IO;

namespace GrowTogether._240578
{
    public partial class EditRepurchaseProduct1 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Edit Product") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

         
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            String ImageUrl = "";
            if (imageedit.HasFile)
            {
                ImageUrl = "~/upload/" + imageedit.FileName;
                imageedit.SaveAs(Server.MapPath(ImageUrl));
            }
            else
                ImageUrl = Image1.ImageUrl;
            Double amount = Double.Parse(txtbv.Text);
            //float gst = float.Parse(txtIGST.Text);
           // Double total = (amount * 100) / (gst + 100);
           //Double total2 = total;

            Double total2 = amount;

            Double CGST = total2;
            Double CGST1 = Double.Parse(txtCGST.Text);
            Double SubCGST = (CGST * CGST1) / 100;
            Double totalCGST = SubCGST;


            Double SGST = total2;
            Double SGST1 = Double.Parse(txtSGST.Text);
            Double SubSGST = (SGST * SGST1) / 100;
            Double totalSGST = SubSGST;

            //Double IGST = total2;
            //Double IGST1 = Double.Parse(txtIGST.Text);
            //Double SubIGST = (IGST * IGST1) / 100;
            //Double totalIGST = SubIGST;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("Update ProductRepurchase set ProductName=@Productnametxt,ProductCode=@ProductCode,salesamount=@salesamount, MRP=@pricetxt,ImageUrl=@imageedit,CategoryID=@catid,BV=@BV, Detail=@detail,CGST=@CGST, SGST=@SGST,CGSTAmount=@CGSTAmount,SGSTAmount=@SGSTAmount WHERE ProductID=@Pid", con);
            cmd.Parameters.AddWithValue("@Productnametxt", productnametxt.Text);
            cmd.Parameters.AddWithValue("@pricetxt", pricetxt.Text);
            cmd.Parameters.AddWithValue("@imageedit", ImageUrl);
            cmd.Parameters.AddWithValue("@pid", ddlProductID.SelectedValue);
            cmd.Parameters.AddWithValue("@catid", ddlCategoryID.SelectedValue);
            cmd.Parameters.AddWithValue("@ProductCode", txtProductCode.Text);
            cmd.Parameters.AddWithValue("@BV", txtbv.Text);
            cmd.Parameters.AddWithValue("@detail", ProductEditor.Content);
            cmd.Parameters.AddWithValue("@salesamount", txtbv.Text);
            cmd.Parameters.AddWithValue("@CGST", txtCGST.Text);
            cmd.Parameters.AddWithValue("@SGST", txtSGST.Text);
            cmd.Parameters.AddWithValue("@CGSTAmount", totalCGST);
            cmd.Parameters.AddWithValue("@SGSTAmount", totalSGST);

            con.Open();
            try
            {
                cmd.ExecuteNonQuery();
                MsgBox("Product Updated"); 
            }
            catch(Exception ex)
            { MsgBox("Sorry! Something went Wrong."); }

            con.Close();
            Image1.ImageUrl = ImageUrl;
           
        }
        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</Script>"));
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
           // getlastusedproductcode();

        }
        protected void ddlProductID_SelectedIndexChanged(object sender, EventArgs e)
        {
            productnametxt.Text = "";
            txtProductCode.Text = "";
            pricetxt.Text = "";
            txtbv.Text = "";
            Image1.ImageUrl = "";
            if (ddlProductID.SelectedValue == "0")
                return;

            SqlCommand cmd = new SqlCommand("SELECT  *,[dbo].[CategoryNamebyCategoryID](categoryID) as CNAme from ProductRepurchase WHERE ProductID=@Pid and Status='0'", con);
            cmd.Parameters.AddWithValue("@pid", ddlProductID.SelectedValue);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtProductCode.Text = dr["ProductCode"].ToString();
                productnametxt.Text = dr["ProductName"].ToString();
                pricetxt.Text = dr["MRP"].ToString().Replace(".0000", " ");
                Image1.ImageUrl = dr["ImageURl"].ToString();
                txtbv.Text = dr["BV"].ToString();
                ProductEditor.Content = dr["Detail"].ToString();
                txtDP.Text = dr["salesamount"].ToString();
                txtSGST.Text = dr["SGST"].ToString();
                txtCGST.Text = dr["CGST"].ToString();
            }
            dr.Close();
            con.Close();
            
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            imageedit.Dispose();
            Image1.Dispose();
            Image1.ImageUrl = "";
        }

        protected void txtProductCode_TextChanged(object sender, EventArgs e)
        {
            try
            {
             SqlCommand cmd = new SqlCommand("SELECT  *,[dbo].[CategoryNamebyCategoryID](categoryID) as CNAme from ProductRepurchase WHERE ProductCode=@ProductCode and Status='0'", con);
            cmd.Parameters.AddWithValue("@ProductCode", txtProductCode.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
              
                productnametxt.Text = dr["ProductName"].ToString();
                pricetxt.Text = dr["MRP"].ToString().Replace(".0000", " ");
                Image1.ImageUrl = dr["ImageURl"].ToString();
                txtbv.Text = dr["BV"].ToString();
                ProductEditor.Content = dr["Detail"].ToString();
                txtDP.Text = dr["salesamount"].ToString();
                txtSGST.Text = dr["SGST"].ToString();
                txtCGST.Text = dr["CGST"].ToString();
               
            }
            dr.Close();
            con.Close();
            }
            catch (Exception ex)
            {
                
            }
        }
    }
    }