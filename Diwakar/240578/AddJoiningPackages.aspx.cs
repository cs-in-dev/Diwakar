using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace Amazewellness._240578
{
    public partial class AddJoiningPackages : System.Web.UI.Page
    {
       // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showdata();
                btnUpdate.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            cmd = new SqlCommand("Insert into JoiningPackages Values(@Code,@Amount,@Description,@JoiningPV,@Caplimit,@DirectIncome)", con);
            cmd.Parameters.AddWithValue("@Code", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Amount", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Description", TextBox3.Text);
            cmd.Parameters.AddWithValue("@JoiningPV", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Caplimit", TextBox5.Text);
            cmd.Parameters.AddWithValue("@DirectIncome", TextBox6.Text);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            lblerror.Text = "Your New Joining Package Inserted Successfully !";
            showdata();
        }

        protected void LinkBtnEdit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

            LinkButton grd = (LinkButton)sender;
            var lblID = (Label)grd.FindControl("lblAmount");
            Session["Amount"] = lblID.Text.ToString();

            cmd = new SqlCommand("Select * From JoiningPackages where Amount = '" + Session["Amount"].ToString() + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TextBox1.Text = dr["Code"].ToString();
                    TextBox2.Text = dr["Amount"].ToString();
                    TextBox3.Text = dr["Discription"].ToString();
                    TextBox4.Text = dr["JoiningPV"].ToString();
                    TextBox5.Text = dr["Caplimit"].ToString();
                    TextBox6.Text = dr["DirectIncome"].ToString();
                }

                dr.Close();
            }
            con.Close();
            TextBox2.Enabled = false;
            TextBox4.Enabled = false;
            btnUpdate.Visible = true;
            Button1.Visible = false;
            lblerror.Visible = false;

        }

        //protected void LinkBtnDelete_Click(object sender, EventArgs e)
        //{

        //    LinkButton grd = (LinkButton)sender;
        //    var Amt = (Label)grd.FindControl("lblAmount");
        //    String Amount = Amt.Text.ToString();

        //    cmd = new SqlCommand("Delete From JoiningPackages Where Amount = '" + Amount + "'", con);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    showdata();
        //    Label5.Visible = false;
        //}

        protected void showdata()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            cmd = new SqlCommand("Select * From JoiningPackages", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

            String AmountValue = Session["Amount"].ToString();

            cmd = new SqlCommand("Update JoiningPackages Set Code =@Code,Amount=@Amount,Discription=@Description,JoiningPV=@JoiningPV,Caplimit=@Caplimit,DirectIncome=@DirectIncome where Amount = '" + AmountValue + "' ", con);
            cmd.Parameters.AddWithValue("@Code", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Amount", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Description", TextBox3.Text);
            cmd.Parameters.AddWithValue("@JoiningPV", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Caplimit", TextBox5.Text);
            cmd.Parameters.AddWithValue("@DirectIncome", TextBox6.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            lblerror.Text = "Your Joining Package Updated Successfully !";
            showdata();

            btnUpdate.Visible = false;
            Button1.Visible = true;
            lblerror.Visible = true;
            TextBox2.Enabled = true;
            TextBox4.Enabled = true;



        }
    }
}