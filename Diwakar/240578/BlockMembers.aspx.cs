using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Configuration;
using WGRL._03032003;

namespace GWG1
{
    public partial class BlockMembers : System.Web.UI.Page
    {
        public static List<string> GetMemberCodeList = GetMembersCode();
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Block Member") == false)
                Response.Redirect("~/240578/AdminHome.aspx");

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            cmd = new SqlCommand("", con);
            if (!Page.IsPostBack)
            {
              
            }

        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] GetMemberList(string prefixText, int count)
        {           
            var list = from p in GetMemberCodeList
                       where p.StartsWith(prefixText)
                       select p;
                      
            string[] prefixTextArray = list.ToArray<string>();                        
            return prefixTextArray;
        }

        public static List<string> GetMembersCode()
        {
            List<string> tagsList = new List<string>();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand("select UserCode+' ('+UserName+')' from tblMemberMaster", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                tagsList.Add(dr[0].ToString());
            }
            dr.Close();
            con.Close();
            return tagsList;
        }


        protected void btnBlock_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlStatus.SelectedIndex != 0 && txtMemberCode.Text != "" && txtMemberCode.Text.Trim() != "")
                {
                    cmd.CommandText = "update tblMemberMaster set Status='" + ddlStatus.SelectedItem.Text + "' where UserCode='"+ txtMemberCode.Text+ "'";
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Literal1.Text = "<br><span style='color:green;'>Member '"+ddlStatus.SelectedItem.Text+"' Successfully.</span>";
                    GridView1.DataBind();
                }
            }
            catch
            {  }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmd.CommandText = "update tblMemberMaster set Status='Active' where UserCode='" + GridView1.SelectedRow.Cells[1].Text + "'";
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            MsgBox(GridView1.SelectedRow.Cells[1].Text+" is Activated.");
            GridView1.DataBind();
            Literal1.Text = "";
        }

        protected void MsgBox(String msg)
        {
            this.Page.Controls.Add(new LiteralControl("<script>alert('"+msg+"')</script>"));
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            GridViewExportUtil.Export("BlockList.xls", this.GridView1);
        }
    }
}