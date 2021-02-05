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

public partial class NewsUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
            Response.Redirect("~/240578/Default.aspx");
        if (User.IsInRole("Admin") == false && User.IsInRole("News Update") == false)
            Response.Redirect("~/240578/AdminHome.aspx");

        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT     [Content] from Contents WHERE Page='News'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                NewsEditor.Content = dr[0].ToString();
            }
            dr.Close();
            con.Close();
        }
    }

    public void Show(String Msg)
    {
        this.Page.Controls.Add(new LiteralControl("<script>alert('" + Msg + "');</script>"));
    }

    protected void UpdateNews_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
        SqlCommand cmd = new SqlCommand("Update Contents SET Visibale=@Visibale, [Content] = @Content Where Page='" + DropDownList1.SelectedValue + "'", con);
        cmd.Parameters.AddWithValue("@Content", NewsEditor.Content);
        cmd.Parameters.AddWithValue("@Visibale", DropDownList2.SelectedValue);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Show("News Updated");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
        SqlCommand cmd = new SqlCommand("SELECT     [Content] from Contents WHERE Page='" + DropDownList1.SelectedValue + "'", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            NewsEditor.Content = dr[0].ToString();
        }
        dr.Close();
        con.Close();
    }

  
    

}