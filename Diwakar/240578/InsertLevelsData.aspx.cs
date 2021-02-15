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
using System.Configuration;

namespace SSRPPL._19111973
{
    public partial class InsertLevelsData : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GetLevelData();
            }
        }

        public void GetLevelData()
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            string query = "SELECT  Levels, LevelIncomePercent FROM LevelIncomeData";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void MsgBox(string Message)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('" + Message + "');</script>"));
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());

                SqlCommand cmdd = new SqlCommand("select ISNULL(max(levels),0) from LevelIncomeData", con);
                con.Open();
                int MaxValue = Convert.ToInt32(cmdd.ExecuteScalar());
                con.Close();
                var val = Convert.ToInt32(txtlevel.Text);
                if (val - MaxValue > 1)
                {
                    lblresult.Text = "Please enter valid level !";
                    return;
                }

                    SqlCommand cmd = new SqlCommand("Insert into LevelIncomeData values(@levels,@IncomePercent)", con);
                    cmd.Parameters.AddWithValue("@levels", txtlevel.Text);
                    cmd.Parameters.AddWithValue("@IncomePercent", txtincomepercent.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    GridView1.DataBind();
                    //  MsgBox("Data Saved Successfully!!");
                    this.GetLevelData();
                    txtlevel.Text = "";
                    txtincomepercent.Text = "";
                    lblresult.Text = "";
                
            }
            catch (Exception ex)
            {
                lblresult.Text = "Duplicate level can't be inserted !";
                return;
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.GetLevelData();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.GetLevelData();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int level = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string levelpercent = (row.FindControl("grdtxtLevelIncomePercent") as TextBox).Text;
            string query = "UPDATE LevelIncomeData SET  LevelIncomePercent=@LevelIncomePercent WHERE levels=@level";
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@level", level);
                    cmd.Parameters.AddWithValue("@LevelIncomePercent", levelpercent);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.GetLevelData();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                //(e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int levelid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

                SqlCommand cmd1 = new SqlCommand("select count(levels) from LevelIncomeData where levels>@mylevel", con);
                cmd1.Parameters.AddWithValue("@mylevel", levelid);
                con.Open();
                int count = Convert.ToInt32(cmd1.ExecuteScalar());
                con.Close();
                if (count == 0)
                {
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("DELETE FROM LevelIncomeData WHERE levels = @level"))
                        {
                            cmd.Parameters.AddWithValue("@level", levelid);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            lblresult.Text = "";
                        }
                    }
                    this.GetLevelData();

                }
                else
                {
                    lblresult.Text = "Selected level can't be deleted before higher levels !";
                    return;
                }
            }
            catch (Exception)
            {
            }
        }
    }
}