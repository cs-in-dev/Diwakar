using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

namespace OpinionWorldGroup.Admin
{

    public partial class MatrixView : System.Web.UI.Page
    {
        //SqlConnection con,con1;
        SqlCommand cmd,subcmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Admin") == false && User.IsInRole("Sponsor Matrix") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (Session["Usercode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            //else if (Session["Usercode"].ToString() == "BI250241")
            //{

                if (Page.IsPostBack == false)
                {

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                    SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                    cmd = new SqlCommand("select UserCode,Username from tblMemberMaster where UserCode='" + ConfigurationManager.AppSettings["MainID"].ToString() + "'", con);
                    subcmd = new SqlCommand();
                    subcmd.Connection = con1;

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        TreeNode root = new TreeNode();
                        root.Text = dr[0] + " ( " + dr[1] + " )";
                        root.Value = dr[0].ToString();

                        subcmd.CommandText = "Select t.MemberId,m.Username from tblTreeMaster t,tblMemberMaster m where t.memberid = m.usercode and t.SponserId = '" + dr[0] + "'";
                        con1.Open();
                        SqlDataReader sdr = subcmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            TreeNode t = new TreeNode(sdr[0] + " ( " + sdr[1] + " )",sdr[0].ToString());
                            root.ChildNodes.Add(t);
                        }
                        con1.Close();
                        TreeView1.Nodes.Add(root);
                    }
                    con.Close();
                    TreeView1.CollapseAll();
                }

            
        }

        protected TreeNode BuildMyTree(ref TreeNode Node)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("Select t.MemberId,m.Username from tblTreeMaster t,tblMemberMaster m where t.memberid = m.usercode  and t.SponserId = '" + Node.Value + "'", con1);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            while (dr1.Read())
            {
                TreeNode t = new TreeNode(dr1[0].ToString() + " (" + dr1[1].ToString() + ")", dr1[0].ToString());
                //Node.ChildNodes.Add(BuildMyTree(ref t));
            }
            dr1.Close();
            con1.Close();
            con1.Dispose();
            return Node;
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            if (TreeView1.SelectedNode.ChildNodes.Count == 0)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                con.Open();
                SqlCommand cmd1 = new SqlCommand("Select t.MemberId,m.Username from tblTreeMaster t,tblMemberMaster m where t.memberid = m.usercode and t.SponserId = '" + TreeView1.SelectedNode.Value + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                while (dr.Read())
                {
                    TreeView1.SelectedNode.ChildNodes.Add(new TreeNode(dr[0].ToString() + " (" + dr[1].ToString() + ")", dr[0].ToString()));
                }
                TreeView1.SelectedNode.Expand();

                con.Close();
            }

        }

    }
}