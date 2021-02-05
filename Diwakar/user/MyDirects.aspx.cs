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
using System.Drawing;

namespace WGRL.User
{
    public partial class MyDirects : System.Web.UI.Page
    {
        //SqlConnection con, con1;
        SqlCommand cmd, subcmd;
        System.Drawing.Color[] LevelColors = new System.Drawing.Color[35];


        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            if (Session["Usercode"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                   
                    TreeNode root = new TreeNode();
                    root.Text = Session["UserCode"].ToString();
                    root.Value = Session["UserCode"].ToString();
                  
                    TreeView1.Nodes.Add(root);
                    TreeView1.ExpandAll();
                    return;

                }
            }
            LevelColors[0] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[1] = (Color)System.Drawing.ColorTranslator.FromHtml("#f81300");
            LevelColors[2] = (Color)System.Drawing.ColorTranslator.FromHtml("#90d7f3");
            LevelColors[3] = (Color)System.Drawing.ColorTranslator.FromHtml("#fabd0a");
            LevelColors[4] = (Color)System.Drawing.ColorTranslator.FromHtml("#9cb9bf");
            LevelColors[5] = (Color)System.Drawing.ColorTranslator.FromHtml("#801d5e");
            LevelColors[6] = (Color)System.Drawing.ColorTranslator.FromHtml("#5d5d5d");
            LevelColors[7] = (Color)System.Drawing.ColorTranslator.FromHtml("#3f74ff");
            LevelColors[8] = (Color)System.Drawing.ColorTranslator.FromHtml("#ffea00");
            LevelColors[9] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[10] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[11] = (Color)System.Drawing.ColorTranslator.FromHtml("#f81300");
            LevelColors[12] = (Color)System.Drawing.ColorTranslator.FromHtml("#90d7f3");
            LevelColors[13] = (Color)System.Drawing.ColorTranslator.FromHtml("#fabd0a");
            LevelColors[14] = (Color)System.Drawing.ColorTranslator.FromHtml("#9cb9bf");
            LevelColors[15] = (Color)System.Drawing.ColorTranslator.FromHtml("#801d5e");
            LevelColors[16] = (Color)System.Drawing.ColorTranslator.FromHtml("#5d5d5d");
            LevelColors[17] = (Color)System.Drawing.ColorTranslator.FromHtml("#3f74ff");
            LevelColors[18] = (Color)System.Drawing.ColorTranslator.FromHtml("#ffea00");
            LevelColors[19] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[20] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[21] = (Color)System.Drawing.ColorTranslator.FromHtml("#f81300");
            LevelColors[22] = (Color)System.Drawing.ColorTranslator.FromHtml("#90d7f3");
            LevelColors[23] = (Color)System.Drawing.ColorTranslator.FromHtml("#fabd0a");
            LevelColors[24] = (Color)System.Drawing.ColorTranslator.FromHtml("#9cb9bf");
            LevelColors[25] = (Color)System.Drawing.ColorTranslator.FromHtml("#801d5e");
            LevelColors[26] = (Color)System.Drawing.ColorTranslator.FromHtml("#5d5d5d");
            LevelColors[27] = (Color)System.Drawing.ColorTranslator.FromHtml("#3f74ff");
            LevelColors[28] = (Color)System.Drawing.ColorTranslator.FromHtml("#ffea00");
            LevelColors[29] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[30] = (Color)System.Drawing.ColorTranslator.FromHtml("#37cf1c");
            LevelColors[31] = (Color)System.Drawing.ColorTranslator.FromHtml("#f81300");
            LevelColors[32] = (Color)System.Drawing.ColorTranslator.FromHtml("#90d7f3");
            LevelColors[33] = (Color)System.Drawing.ColorTranslator.FromHtml("#fabd0a");
            LevelColors[34] = (Color)System.Drawing.ColorTranslator.FromHtml("#9cb9bf");
                    
        }

        protected TreeNode BuildMyTree(ref TreeNode Node, int x)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("Select t.MemberId,m.Username from tblTreeMaster t,tblMemberMaster m where t.memberid = m.usercode and t.sponserid!=t.memberid  and t.SponserId = '" + Node.Value + "' ORDER By DOj", con1);

            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.HasRows)
            {
                x = x + 1;
                while (dr1.Read())
                {

                    TreeNode t = new TreeNode(dr1[0].ToString() + " (" + dr1[1].ToString() + ")", dr1[0].ToString());
                    t.ImageUrl = "~/user/images/" + x + ".png";
                    Node.ChildNodes.Add(BuildMyTree(ref t, x));
                }
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
                
                SqlCommand cmd1 = new SqlCommand("Select t.MemberId,m.Username,m.status+' - '+m.Cadre+ ' - '+cast(m.PinAmount as nvarchar) from tblTreeMaster t,tblMemberMaster m where t.memberid = m.usercode and t.SponserId = '" + TreeView1.SelectedNode.Value + "' AND t.SponserId!=t.Memberid", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                while (dr.Read())
                {
                    TreeView1.SelectedNode.ChildNodes.Add(new TreeNode(dr[0].ToString() + " (" + dr[1].ToString() + ") - " + dr[2].ToString()  , dr[0].ToString()));
                }
                TreeView1.SelectedNode.Expand();

                con.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }  
    }

}
