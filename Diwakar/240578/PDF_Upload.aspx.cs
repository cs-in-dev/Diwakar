using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Net.Mail;

namespace CyraShop._240578
{
    public partial class PDF_Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!User.Identity.IsAuthenticated)
                    Response.Redirect("~/240578/default.aspx");
                if (User.IsInRole("Admin") == false && User.IsInRole("Photo Upload") == false)
                    Response.Redirect("~/240578/AdminHome.aspx");
                //UpdateNews_Click(sender, e);

            }
        }

        public void Show(String Msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Msg + "');</script>"));
        }

        protected void UpdateNews_Click(object sender, EventArgs e)
        {
            string img1 = "";
           
                if (FileUpload1.HasFile)
                {
                    img1 = "/upload/" + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath(img1));
                }

                string a = TextBox1.Text.Replace(" ", "");


                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
                SqlCommand cmd = new SqlCommand("insert into UploadPdf(Name,class,content,datafilter) values(UPPER(@Name),@class,@content,@datafilter)", con);
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@class", "col-sm-6 col-md-6 col-lg-4 " + a + "");
                cmd.Parameters.AddWithValue("@Content", img1);
                cmd.Parameters.AddWithValue("@datafilter", "." + a + "");
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Show("PDF Uploaded Successfully!");
            TextBox1.Text = "";
            a = "";
            img1 = "";


                //Response.Redirect("PDF_Upload.aspx");

        }
    }
}