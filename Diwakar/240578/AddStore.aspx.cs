using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mime;
using System.Net.Mail;
using System.Configuration;

namespace mmart2.Super19111973
{
    public partial class AddStore : System.Web.UI.Page
    {     
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        sms S1 = new sms();
        //string FrenchiseID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            

            cmd = new SqlCommand("",con);
            txtparent.Visible = false;
            lblparent.Visible = false;
            //ddldist.Visible = false;
            //ddlmaster.Visible = false;
            //ddlmini.Visible = false;
            //ddlLeader.Visible = false;
           // lblamount.Visible = false;

            
        }
       
        protected void MsgBox(String Message)
        {
             this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));

        }

        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            //if (ddlBranchtype.SelectedItem.Text == "Franchise" && txtparent.Text=="")
            //{
                
            //    MsgBox("Please Fill Parent");
            //    return;
                
            //}
             if (ddlBranchtype.SelectedItem.Text == "District Franchise" )
            {

                //if (ddldist.SelectedItem.Text == "Select")
                //{
                    
                //    MsgBox("Please Select Percentage");
                //    return;
                //}
                SuccessPanel.Visible = false;
                string FrenchiseID = "";
                SqlParameter sOut = new SqlParameter("@Result", SqlDbType.VarChar, 100);
                sOut.Direction = ParameterDirection.Output;

                cmd.CommandText = "[dbo].[SP_InsertFrenchise]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Name", ddlBranchtype.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@Parent", "");
                cmd.Parameters.AddWithValue("@FranchiseName", txtfname.Text);
                cmd.Parameters.AddWithValue("@ContactName", txtcname.Text);
                cmd.Parameters.AddWithValue("@PinAmount", "");

                cmd.Parameters.Add(sOut);
                con.Open();
                FrenchiseID = cmd.ExecuteScalar().ToString();
                con.Close();

           


                if (FrenchiseID != "" || FrenchiseID != null)
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Your Franchise ID : <b>" + FrenchiseID + "</b><br><br>Password : <b>" + txtPassword.Text + "</b>"));
                }
                else
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Sorry! Try again later."));
                }
                
            }


            else if (ddlBranchtype.SelectedItem.Text == "Master Franchise" && txtparent.Text != null)
            {

                //if (ddlmaster.SelectedItem.Text == "Select")
                //{

                //    MsgBox("Please Select Percentage");
                //    return;
                //}
                SuccessPanel.Visible = false;
                string FrenchiseID = "";
                SqlParameter sOut = new SqlParameter("@Result", SqlDbType.VarChar, 100);
                sOut.Direction = ParameterDirection.Output;

                cmd.CommandText = "[dbo].[SP_InsertFrenchise]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Name", ddlBranchtype.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@Parent", txtparent.Text);
                cmd.Parameters.AddWithValue("@FranchiseName", txtfname.Text);
                cmd.Parameters.AddWithValue("@ContactName", txtcname.Text);
                cmd.Parameters.AddWithValue("@PinAmount", "");

                cmd.Parameters.Add(sOut);
                con.Open();
                FrenchiseID = cmd.ExecuteScalar().ToString();
                con.Close();




                if (FrenchiseID != "" || FrenchiseID != null)
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Your Franchise ID : <b>" + FrenchiseID + "</b><br><br>Password : <b>" + txtPassword.Text + "</b>"));
                }
                else
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Sorry! Try again later."));
                }

            }


            else if (ddlBranchtype.SelectedItem.Text == "Mini Franchise" && txtparent.Text != null)
            {

                //if (ddlmini.SelectedItem.Text == "Select")
                //{

                //    MsgBox("Please Select Percentage");
                //    return;
                //}
                SuccessPanel.Visible = false;
                string FrenchiseID = "";
                SqlParameter sOut = new SqlParameter("@Result", SqlDbType.VarChar, 100);
                sOut.Direction = ParameterDirection.Output;

                cmd.CommandText = "[dbo].[SP_InsertFrenchise]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Name", ddlBranchtype.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@Parent", txtparent.Text);
                cmd.Parameters.AddWithValue("@FranchiseName", txtfname.Text);
                cmd.Parameters.AddWithValue("@ContactName", txtcname.Text);
                cmd.Parameters.AddWithValue("@PinAmount","");

                cmd.Parameters.Add(sOut);
                con.Open();
                FrenchiseID = cmd.ExecuteScalar().ToString();
                con.Close();




                if (FrenchiseID != "" || FrenchiseID != null)
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Your Franchise ID : <b>" + FrenchiseID + "</b><br><br>Password : <b>" + txtPassword.Text + "</b>"));
                }
                else
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Sorry! Try again later."));
                }

            }



            else
            {

                //if (ddlLeader.SelectedItem.Text == "Select")
                //{
                //    MsgBox("Please Select Percentage");
                //     return;
                    
                //}
                SuccessPanel.Visible = false;
                string FrenchiseID = "";
                SqlParameter sOut = new SqlParameter("@Result", SqlDbType.VarChar, 100);
                sOut.Direction = ParameterDirection.Output;

                cmd.CommandText = "[dbo].[SP_InsertFrenchise]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Name", ddlBranchtype.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@State", txtState.Text);
                cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@Parent", txtparent.Text);
                cmd.Parameters.AddWithValue("@FranchiseName", txtfname.Text);
                cmd.Parameters.AddWithValue("@ContactName", txtcname.Text);
                cmd.Parameters.AddWithValue("@PinAmount", "");
                cmd.Parameters.Add(sOut);
                con.Open();
                FrenchiseID = cmd.ExecuteScalar().ToString();
                con.Close();


                if (FrenchiseID != "" || FrenchiseID != null)
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Your Franchise ID : <b>" + FrenchiseID + "</b><br><br>Password : <b>" + txtPassword.Text + "</b>"));
                    string Msg="";
                    Msg = "Congratulation your Franchise ID is: " + FrenchiseID + " Password is: " + txtPassword.Text + " Please logon to " + System.Configuration.ConfigurationManager.AppSettings["URL"].ToString() + "";
                    if (txtMobileNo.Text != "" && txtMobileNo.Text.Length==10)
                    {

                        String status = S1.SendNormalSMS(txtMobileNo.Text, Msg);
                    }
                }
                else
                {
                    SuccessPanel.Visible = true;
                    InformationPanel.Visible = false;
                    PlaceHolder1.Controls.Add(new LiteralControl("<br><br>Sorry! Try again later."));
                }
                
            }
        }

        protected void ddlBranchtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBranchtype.SelectedItem.Text == "District Franchise")
            {
                    
            }
            else if (ddlBranchtype.SelectedItem.Text == "Master Franchise")
            {
                lblparent.Visible = true;
                txtparent.Visible = true;
                
            }

            else if (ddlBranchtype.SelectedItem.Text == "Mini Franchise")
            {
                lblparent.Visible = true;
                txtparent.Visible = true;
                
            }
            else
            {
                lblparent.Visible = true;
                txtparent.Visible = true;
              
            }
        }

        protected void txtparent_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmds = new SqlCommand("", con);
            cmd.CommandText = "Select ISNULL(count(FrenchiseID),0) from tblFrenchiseMaster where FrenchiseID='" + txtparent.Text + "'";
            con.Open();
            int cnt=int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            if (cnt.ToString() == "0")
            {
               // MsgBox("Please Enter Valid Parent ID");
                lblParenterror.Text = "Please Enter Valid Parent ID";
                lblparent.Visible = true;
                txtparent.Visible = true;
                //lblamount.Visible = true;
            }
            else
            {
                lblparent.Visible = true;
                txtparent.Visible = true;
              
               
            }


        }

        
    }
}
