using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Drawing;
using System.Xml;
using System.Threading;
using System.Globalization;
using System.Data;
using System.Web.Services;
using System.Data.SqlClient;

namespace Sabaic
{
    public partial class updatekyc : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Update Kyc") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            if (!IsPostBack)
            {

            }

        }
        protected void Button0_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("", con);
            cmd.CommandText = "select * from tblMemberMaster where UserCode = '" + TextBox1.Text + "'";
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Image1.ImageUrl = dr["VoterCard"].ToString();
                    Image2.ImageUrl = dr["AdharCardBack"].ToString();
                    Image3.ImageUrl = dr["PanCardProof"].ToString();
                    Image4.ImageUrl = dr["UploadPhoto"].ToString();
                    Image5.ImageUrl = dr["Checkbook"].ToString();
                    //HyperLink1.NavigateUrl = dr["Link"].ToString();

                }

                dr.Close();
            }
            con.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string imagefile1 = "";
            if (AadharCardandVoter.HasFile)
            {
                imagefile1 = "~/upload/" + AadharCardandVoter.FileName;
                AadharCardandVoter.SaveAs(Server.MapPath(imagefile1));
                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set VoterCard='" + imagefile1 + "',votercardupdatedate=getdate() where usercode='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MsgBox("Uploaded Successfully");
            }

        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            string imagefile2 = "";


            if (AadharCrdBack.HasFile)
            {
                imagefile2 = "~/upload/" + AadharCrdBack.FileName;
                AadharCrdBack.SaveAs(Server.MapPath(imagefile2));


                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set AdharCardBack='" + imagefile2 + "' where usercode='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MsgBox("Uploaded Successfully");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string imagefile3 = "";

            if (PanCard.HasFile)
            {
                imagefile3 = "~/upload/" + PanCard.FileName;
                PanCard.SaveAs(Server.MapPath(imagefile3));


                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set pancardupdatedate=getdate(), PanCardProof='" + imagefile3 + "' where usercode='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MsgBox("Uploaded Successfully");

            }
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            string imagefile4 = "";


            if (PhotoUpload.HasFile)
            {
                imagefile4 = "~/upload/" + PhotoUpload.FileName;
                PhotoUpload.SaveAs(Server.MapPath(imagefile4));


                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set photoupdatedate=getdate(),UploadPhoto='" + imagefile4 + "' where usercode='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MsgBox("Uploaded Successfully");

            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string imagefile5 = "";


            if (BankDetails.HasFile)
            {
                imagefile5 = "~/upload/" + BankDetails.FileName;
                BankDetails.SaveAs(Server.MapPath(imagefile5));


                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set BankDetailUpdateDate=getdate(),Checkbook='" + imagefile5 + "' where usercode='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                MsgBox("Uploaded Successfully");

            }
        }


        //protected void Button4_Click(object sender, EventArgs e)
        //{
        //    con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set link='" + TextBox2.Text + "' where usercode='" + TextBox1.Text + "'", con);
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    MsgBox("Uploaded Successfully");
        //}
    }
}