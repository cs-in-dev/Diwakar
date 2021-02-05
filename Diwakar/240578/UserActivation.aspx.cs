using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Admin_UserActivation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/240578/Default.aspx");
        if (User.IsInRole("Admin") == false && User.IsInRole("Change Member Status") == false)
            Response.Redirect("~/240578/AdminHome.aspx");

    }

    public void Show(String Msg)
    {
        this.Page.Controls.Add(new LiteralControl("<script>alert('" + Msg + "');</script>"));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Update tblMemberMaster SET Status='" + RadioButtonList1.SelectedValue + "' where UserCode = '" + UserID.Text + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        RadioButtonList1.SelectedIndex = -1;
        UserID.Text = "";
        Search0.Visible = false;
        Show("Status Updated");

    }

    protected void Search_Click(object sender, EventArgs e)
    {
        Search0.Visible = false;
        if (Search.Text.Trim() == "")
        {
            Show("Please enter User ID.");
            Search.Focus();
            return;
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select Status from tblMemberMaster where UserCode = '" + UserID.Text + "'", con);
            con.Open();
            try
            {
                int flag = 0;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    flag = 1;
                    RadioButtonList1.SelectedValue = dr["Status"].ToString().Trim();
                    Search0.Visible = true;
                    break;
                }
                dr.Close();
                if (flag == 0)
                    Show("Invalid User ID!");
            }
            catch(Exception ex)
            {
                Show(ex.Message);
            }
            con.Close();
        }
    }


}