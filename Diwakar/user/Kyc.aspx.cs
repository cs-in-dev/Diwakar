using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Globalization;

namespace helpurself.user
{
    public partial class Kyc : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandText = "select * from tblMemberMaster where UserCode = '" + Session["UserCode"].ToString() + "'";
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Image2.ImageUrl = dr["VoterCard"].ToString();
                        Image1.ImageUrl = dr["PanCardProof"].ToString();
                        Image3.ImageUrl = dr["UploadPhoto"].ToString();
                        Image4.ImageUrl = dr["Checkbook"].ToString();
                        Image5.ImageUrl = dr["AdharCardBack"].ToString();
                    }

                    dr.Close();
                }
                con.Close();

                SqlCommand cmd1 = new SqlCommand("select ISNULL(count(VoterCard),0) from tblmembermaster where usercode='" + Session["usercode"] + "'", con);
                con.Open();
                int count = int.Parse(cmd1.ExecuteScalar().ToString());
                con.Close();
                if (count == 0)
                {
                    Button1.Enabled = true;
                }
                else
                {
                    Button1.Enabled = false;

                }


                SqlCommand cmd2 = new SqlCommand("select ISNULL(count(AdharCardBack),0) from tblmembermaster where usercode='" + Session["usercode"] + "'", con);
                con.Open();
                int count1 = int.Parse(cmd2.ExecuteScalar().ToString());
                con.Close();
                if (count1 == 0)
                {
                    Button3.Enabled = true;
                }
                else
                {
                    Button3.Enabled = false;

                }


                SqlCommand cmd3 = new SqlCommand("select ISNULL(count(PanCardProof),0) from tblmembermaster where usercode='" + Session["usercode"] + "'", con);
                con.Open();
                int count2 = int.Parse(cmd3.ExecuteScalar().ToString());
                con.Close();
                if (count2 == 0)
                {
                    btnUpload.Enabled = true;
                }
                else
                {
                    btnUpload.Enabled = false;

                }


                SqlCommand cmd4 = new SqlCommand("select ISNULL(count(UploadPhoto),0) from tblmembermaster where usercode='" + Session["usercode"] + "'", con);
                con.Open();
                int count3 = int.Parse(cmd4.ExecuteScalar().ToString());
                con.Close();
                if (count3 == 0)
                {
                    Button2.Enabled = true;
                }
                else
                {
                    Button2.Enabled = false;

                }


                SqlCommand cmd5 = new SqlCommand("select ISNULL(count(Checkbook),0) from tblmembermaster where usercode='" + Session["usercode"] + "'", con);
                con.Open();
                int count4 = int.Parse(cmd5.ExecuteScalar().ToString());
                con.Close();
                if (count4 == 0)
                {
                    btnbankupload.Enabled = true;
                }
                else
                {
                    btnbankupload.Enabled = false;

                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string imagefile = "";


            if (fuImage1.HasFile)
            {
                imagefile = "~/Upload/" + Guid.NewGuid().ToString() + "" + fuImage1.FileName;

                fuImage1.SaveAs(Server.MapPath(imagefile));


                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set VoterCard='" + imagefile + "', votercardupdatedate=getdate() where usercode='" + Session["Usercode"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                updatedate();
                MsgBox("Uploaded Successfully");

            }


        }
        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string imagefilepan = "";
            if (fuImage.HasFile)
            {
                imagefilepan = "~/Upload/" + Guid.NewGuid().ToString() + "" + fuImage.FileName;
                fuImage.SaveAs(Server.MapPath(imagefilepan));

                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set PanCardProof='" + imagefilepan + "',pancardupdatedate=getdate() where usercode='" + Session["Usercode"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                updatedate();
                MsgBox("Uploaded Successfully");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string imagefilephoto = "";
            if (FileUpload1.HasFile)
            {
                imagefilephoto = "~/Upload/" + Guid.NewGuid().ToString() + "" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imagefilephoto));

                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set UploadPhoto='" + imagefilephoto + "',photoupdatedate=getdate() where usercode='" + Session["Usercode"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                updatedate();
                MsgBox("Uploaded Successfully");

            }
        }

        protected void btnbankupload_Click(object sender, EventArgs e)
        {


            string imagefilephoto1 = "";


            if (FileUpload2.HasFile)
            {
                imagefilephoto1 = "~/Upload/" + Guid.NewGuid().ToString() + "" + FileUpload2.FileName;
                FileUpload2.SaveAs(Server.MapPath(imagefilephoto1));
                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set Checkbook='" + imagefilephoto1 + "',BankDetailUpdateDate=getdate() where usercode='" + Session["Usercode"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                updatedate();
                MsgBox("Uploaded Successfully");

            }
        }
        public void updatedate()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set KycUploderDate=getdate()  where usercode='" + Session["Usercode"].ToString() + "'  and kycApprovedStatus=0 and VoterCard !='' and UploadPhoto !='' and CheckBook !='' and PanCardProof !=''", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string imagefile01 = "";
            if (FileUpload3.HasFile)
            {
                imagefile01 = "~/Upload/" + Guid.NewGuid().ToString() + "" + FileUpload3.FileName;
                FileUpload3.SaveAs(Server.MapPath(imagefile01));
                con.Open(); SqlCommand cmd = new SqlCommand("update [dbo].[tblMemberMaster] set AdharCardBack='" + imagefile01 + "' where usercode='" + Session["Usercode"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                updatedate();
                MsgBox("Uploaded Successfully");

            }
        }
    }
}