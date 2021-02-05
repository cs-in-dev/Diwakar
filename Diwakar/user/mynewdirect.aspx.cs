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
using System.Web.UI.HtmlControls;
using DataAccessLayer;
using WGRL;


    public partial class mynewdirect : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            name1.Text = "";
            name2.Text = "";
            name3.Text = "";
            name4.Text = "";
            name5.Text = "";
            name6.Text = "";
            name7.Text = "";
            name8.Text = "";
            name9.Text = "";
            name10.Text = "";
            name11.Text = "";
            name12.Text = "";
            name13.Text = "";

            name14.Text = "";
            name15.Text = "";
            name16.Text = "";
            name17.Text = "";
            name18.Text = "";
            name19.Text = "";
            name20.Text = "";
            name21.Text = "";
            name22.Text = "";
            name23.Text = "";
            name24.Text = "";
            name25.Text = "";
            name26.Text = "";
            name27.Text = "";
            name28.Text = "";
            name29.Text = "";
            name30.Text = "";
            name31.Text = "";
            img1.Attributes.Clear();
            img2.Attributes.Clear();
            img3.Attributes.Clear();
            img4.Attributes.Clear();
            img5.Attributes.Clear();
            img6.Attributes.Clear();
            img7.Attributes.Clear();
            img8.Attributes.Clear();
            img9.Attributes.Clear();
            img10.Attributes.Clear();
            img11.Attributes.Clear();
            img12.Attributes.Clear();
            img13.Attributes.Clear();
            img14.Attributes.Clear();
            img15.Attributes.Clear();
            img16.Attributes.Clear();
            img17.Attributes.Clear();
            img18.Attributes.Clear();
            img19.Attributes.Clear();
            img20.Attributes.Clear();
            img21.Attributes.Clear();
            img22.Attributes.Clear();
            img23.Attributes.Clear();
            img24.Attributes.Clear();
            img25.Attributes.Clear();
            img26.Attributes.Clear();
            img27.Attributes.Clear();
            img28.Attributes.Clear();
            img29.Attributes.Clear();
            img30.Attributes.Clear();
            img31.Attributes.Clear();
            

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            if (!IsPostBack)
            {
                CurrentPage.Value = "1";
                if (Session["Usercode"] == null)
                {
                    Response.Redirect("~/User/default.aspx");
                }
                HomeData(Session["Usercode"].ToString());

            }


        }
        void BuildDownline(ref DataTable mytable, ref DataSet ds, string MemberID)
        {
            DataRow r;
            DataRow[] rows = ds.Tables["Tree"].Select("SPID='" + MemberID + "'");
            int Count = 1;
            foreach (DataRow item in rows)
            {
                r = mytable.NewRow();
                r[0] = item["UserCode"].ToString();
                r[1] = item["UserName"].ToString();
                r[2] = item["PinAmount"];
                r[3] = item["DOJ"].ToString();
                r[4] = item["SPID"].ToString(); // sn
                r[5] = item["TotalDownline"].ToString(); // sn
                mytable.Rows.Add(r);
                Count++;
                
            }
            while (Count < 6)
            {
                r = mytable.NewRow();
                r[0] = "";
                r[1] = "";
                r[2] = "";
                r[3] = "";
                r[4] = "";
                r[5] = "";
                mytable.Rows.Add(r);
                Count++;
            }
        }


        void HomeData(String MemberID)
        {
            if (MemberID == "")
                return;
            DataTable mytable = new DataTable();
            mytable.Columns.Add("UserCode", System.Type.GetType("System.String")); // UserCode
            mytable.Columns.Add("Name", System.Type.GetType("System.String")); // MemberName
            mytable.Columns.Add("PinAmount", System.Type.GetType("System.String")); // MyInvestment for GiftPackage
            mytable.Columns.Add("DOJ", System.Type.GetType("System.String")); // DOJ
            mytable.Columns.Add("Direct", System.Type.GetType("System.String"));   // SponsorID
            mytable.Columns.Add("TotalDownline", System.Type.GetType("System.String")); // Status          
            mytable.Columns.Add("Gender", System.Type.GetType("System.String"));
        mytable.Columns.Add("ConfirmDate", System.Type.GetType("System.String"));// Gender          

        //           Gender
        SqlDataAdapter da = new SqlDataAdapter("SELECT  UserCode,UserName,dbo.MyDownlineCount(tblMemberMaster.UserCode) TotalDownline,DOJ, dbo.MySponsor(UserCode) SPID, PinAmount,ConfirmDate from TblMemberMaster", conn);
            conn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "Tree");
            conn.Close();

            if (CurrentPage.Value == "1")
                LinkButton2.Visible = false;
            else
                LinkButton2.Visible = true;

            DataRow r = mytable.NewRow();
            r[0] = MemberID;


            //Gender
            SqlCommand cd = new SqlCommand("select UserCode,UserName,dbo.MyDownlineCount(tblMemberMaster.UserCode) TotalDownline,DOJ, dbo.MySponsor(UserCode) SPID, PinAmount from tblMemberMaster where UserCode ='" + MemberID + "';", conn);
            conn.Open();
            SqlDataReader dr = cd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    r[0] = dr["UserCode"].ToString();
                    r[1] = dr["UserName"].ToString();
                    r[2] = dr["PinAmount"].ToString();
                    r[3] = dr["DOJ"].ToString();
                    r[4] = dr["SPID"].ToString();
                    r[5] = dr["TotalDownline"].ToString();
                    //r[6] = dr["Gender"].ToString();                   


                }
            }
            
            
            conn.Close();
            //DataRow[] rmak = ds.Tables["Tree"].Select("MemberId='" + MemberID + "'");

            
            mytable.Rows.Add(r);
            DataRow[] rows = ds.Tables["Tree"].Select("SPID='" + MemberID + "'");

            int Count = 1, index = 0, CurrentFrameEnd = 0, CurrentFrameBeg = 0;
            CurrentFrameEnd = int.Parse(CurrentPage.Value) * 5;
            CurrentFrameBeg = CurrentFrameEnd - 5;

            if (rows.Count() > CurrentFrameEnd)
                LinkButton1.Visible = true;
            else
                LinkButton1.Visible = false;

            foreach (DataRow item in rows)
            {
                index++;
                if (index > CurrentFrameBeg && index <= CurrentFrameEnd)
                {
                    r = mytable.NewRow();
                    r[0] = item["UserCode"].ToString();
                    r[1] = item["UserName"].ToString();
                    r[2] = item["PinAmount"].ToString();
                    r[3] = item["DOJ"].ToString();
                    r[4] = item["SPID"].ToString();
                    r[5] = item["TotalDownline"].ToString();
                    //r[6] = item["Gender"].ToString();
                   
                    mytable.Rows.Add(r);
                    Count++;
                    
                }
                if (Count == 6)
                    break;
            }
            while (Count < 6)
            {
                r = mytable.NewRow();
                r[0] = "";
                r[1] = "";
                r[2] = "";
                r[3] = "";
                r[4] = "";
                r[5] = "";
                mytable.Rows.Add(r);
                Count++;
            }

            BuildDownline(ref mytable, ref ds, mytable.Rows[1][0].ToString());
            BuildDownline(ref mytable, ref ds, mytable.Rows[2][0].ToString());
            BuildDownline(ref mytable, ref ds, mytable.Rows[3][0].ToString());
            BuildDownline(ref mytable, ref ds, mytable.Rows[4][0].ToString());
            BuildDownline(ref mytable, ref ds, mytable.Rows[5][0].ToString());
                 
            String lblInvestmentdata = "";
            String lbljuicyclub = "";
          

            if (mytable.Rows.Count > 0)
            {

                id1.Text = mytable.Rows[0][0].ToString();
                MemberID = id1.Text;
                
                if (MemberID != "")
                {
                    name1.Text = mytable.Rows[0][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[0][2].ToString());
                    lblInvestmentdata = mytable.Rows[0][2].ToString();
                    lbljuicyclub = mytable.Rows[0][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img1);
                    img1.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[0][0].ToString(), mytable.Rows[0][1].ToString(), mytable.Rows[0][2].ToString(), mytable.Rows[0][3].ToString(), mytable.Rows[0][4].ToString(), mytable.Rows[0][5].ToString()) + "')");
                    img1.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img1.Src = "~/user/images/Empty1.gif";
                }
               

            }

            if (mytable.Rows.Count > 1)
            {


                lb2.Text = mytable.Rows[1][0].ToString();
                MemberID = lb2.Text;
                if (MemberID != "")
                {
                    name2.Text = mytable.Rows[1][1].ToString();
                    name2.ToolTip = "";
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[1][2].ToString());
                    lblInvestmentdata = mytable.Rows[1][2].ToString();
                    lbljuicyclub = mytable.Rows[1][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img2);
                    img2.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[1][0].ToString(), mytable.Rows[1][1].ToString(), mytable.Rows[1][2].ToString(), mytable.Rows[1][3].ToString(), mytable.Rows[1][4].ToString(), mytable.Rows[1][5].ToString()) + "')");
                    img2.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img2.Src = "~/user/images/Empty1.gif";
                }
            }

            if (mytable.Rows.Count > 2)
            {

                lb3.Text = mytable.Rows[2][0].ToString();
                MemberID = lb3.Text;
                if (MemberID != "")
                {
                    name3.Text = mytable.Rows[2][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[2][2].ToString());
                    lblInvestmentdata = mytable.Rows[2][2].ToString();
                    lbljuicyclub = mytable.Rows[2][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img3);
                    img3.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[2][0].ToString(), mytable.Rows[2][1].ToString(), mytable.Rows[2][2].ToString(), mytable.Rows[2][3].ToString(), mytable.Rows[2][4].ToString(), mytable.Rows[2][5].ToString()) + "')");
                    img3.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img3.Src = "~/user/images/Empty1.gif";
                }
            }

            if (mytable.Rows.Count > 3)
            {
                lb4.Text = mytable.Rows[3][0].ToString();
                MemberID = lb4.Text;
                if (MemberID != "")
                {
                    name4.Text = mytable.Rows[3][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[3][2].ToString());
                    lblInvestmentdata = mytable.Rows[3][2].ToString();
                    lbljuicyclub = mytable.Rows[3][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img4);
                    img4.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[3][0].ToString(), mytable.Rows[3][1].ToString(), mytable.Rows[3][2].ToString(), mytable.Rows[3][3].ToString(), mytable.Rows[3][4].ToString(), mytable.Rows[3][5].ToString()) + "')");
                    img4.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img4.Src = "~/user/images/Empty1.gif";
                }
               
            }

            if (mytable.Rows.Count > 4)
            {
                lb14.Text = mytable.Rows[4][0].ToString();
                MemberID = lb14.Text;
                if (MemberID != "")
                {
                    name14.Text = mytable.Rows[4][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[4][2].ToString());
                    lblInvestmentdata = mytable.Rows[4][2].ToString();
                    lbljuicyclub = mytable.Rows[4][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img14);
                    img14.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[4][0].ToString(), mytable.Rows[4][1].ToString(), mytable.Rows[4][2].ToString(), mytable.Rows[4][3].ToString(), mytable.Rows[4][4].ToString(), mytable.Rows[4][5].ToString()) + "')");
                    img14.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img14.Src = "~/user/images/Empty1.gif";
                }
               

            }

            if (mytable.Rows.Count > 5)
            {
                lb15.Text = mytable.Rows[5][0].ToString();
                MemberID = lb15.Text;
                if (MemberID != "")
                {
                    name15.Text = mytable.Rows[5][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[5][2].ToString());
                    lblInvestmentdata = mytable.Rows[5][2].ToString();
                    lbljuicyclub = mytable.Rows[5][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img15);
                    img15.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[5][0].ToString(), mytable.Rows[5][1].ToString(), mytable.Rows[5][2].ToString(), mytable.Rows[5][3].ToString(), mytable.Rows[5][4].ToString(), mytable.Rows[5][5].ToString()) + "')");
                    img15.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img15.Src = "~/user/images/Empty1.gif";
                }
                
            }

            if (mytable.Rows.Count > 6)
            {

                lb5.Text = mytable.Rows[6][0].ToString();
                MemberID = lb5.Text;
                if (MemberID != "")
                {
                    name5.Text = mytable.Rows[6][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[6][2].ToString());
                    lblInvestmentdata = mytable.Rows[6][2].ToString();
                    lbljuicyclub = mytable.Rows[6][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img5);
                    img5.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[6][0].ToString(), mytable.Rows[6][1].ToString(), mytable.Rows[6][2].ToString(), mytable.Rows[6][3].ToString(), mytable.Rows[6][4].ToString(), mytable.Rows[6][5].ToString()) + "')");
                    img5.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img5.Src = "~/user/images/Empty1.gif";
                    img5.Src = "~/user/images/empty.png";//Empty1
                    img5.Width= img1.Width;
                }
                

            }

            if (mytable.Rows.Count > 7)
            {

                lb6.Text = mytable.Rows[7][0].ToString();
                MemberID = lb6.Text;
                if (MemberID != "")
                {
                    name6.Text = mytable.Rows[7][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[7][2].ToString());
                    lblInvestmentdata = mytable.Rows[7][2].ToString();
                    lbljuicyclub = mytable.Rows[7][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img6);
                    img6.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[7][0].ToString(), mytable.Rows[7][1].ToString(), mytable.Rows[7][2].ToString(), mytable.Rows[7][3].ToString(), mytable.Rows[7][4].ToString(), mytable.Rows[7][5].ToString()) + "')");
                    img6.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img6.Src = "~/user/images/Empty1.gif";
                    img6.Src = "~/user/images/empty.png";//Empty1
                }
              
            }

            if (mytable.Rows.Count > 8)
            {
                lb7.Text = mytable.Rows[8][0].ToString();
                MemberID = lb7.Text;
                if (MemberID != "")
                {
                    name7.Text = mytable.Rows[8][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[8][2].ToString());
                    lblInvestmentdata = mytable.Rows[8][2].ToString();
                    lbljuicyclub = mytable.Rows[8][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img7);
                    img7.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[8][0].ToString(), mytable.Rows[8][1].ToString(), mytable.Rows[8][2].ToString(), mytable.Rows[8][3].ToString(), mytable.Rows[8][4].ToString(), mytable.Rows[8][5].ToString()) + "')");
                    img7.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img7.Src = "~/user/images/Empty1.gif";
                    img7.Src = "~/user/images/empty.png";//Empty1
                }
            }

            if (mytable.Rows.Count > 9)
            {
                lb16.Text = mytable.Rows[9][0].ToString();
                MemberID = lb16.Text;
                if (MemberID != "")
                {
                    name16.Text = mytable.Rows[9][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[9][2].ToString());
                    lblInvestmentdata = mytable.Rows[9][2].ToString();
                    lbljuicyclub = mytable.Rows[9][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img16);
                    img16.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[9][0].ToString(), mytable.Rows[9][1].ToString(), mytable.Rows[9][2].ToString(), mytable.Rows[9][3].ToString(), mytable.Rows[9][4].ToString(), mytable.Rows[9][5].ToString()) + "')");
                    img16.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img16.Src = "~/user/images/Empty1.gif";
                    img16.Src = "~/user/images/empty.png";//Empty1
                }
               
            }

            if (mytable.Rows.Count > 10)
            {
                lb17.Text = mytable.Rows[10][0].ToString();
                MemberID = lb17.Text;
                if (MemberID != "")
                {
                    name17.Text = mytable.Rows[10][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[10][2].ToString());
                    lblInvestmentdata = mytable.Rows[10][2].ToString();
                    lbljuicyclub = mytable.Rows[10][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img17);
                    img17.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[10][0].ToString(), mytable.Rows[10][1].ToString(), mytable.Rows[10][2].ToString(), mytable.Rows[10][3].ToString(), mytable.Rows[10][4].ToString(), mytable.Rows[10][5].ToString()) + "')");
                    img17.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img17.Src = "~/user/images/Empty1.gif";
                    img17.Src = "~/user/images/empty.png";//Empty1
                }
               
              
            }

            if (mytable.Rows.Count > 11)
            {
                lb8.Text = mytable.Rows[11][0].ToString();
                MemberID = lb8.Text;
                if (MemberID != "")
                {
                    name8.Text = mytable.Rows[11][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[11][2].ToString());
                    lblInvestmentdata = mytable.Rows[11][2].ToString();
                    lbljuicyclub = mytable.Rows[11][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img8);
                    img8.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[11][0].ToString(), mytable.Rows[11][1].ToString(), mytable.Rows[11][2].ToString(), mytable.Rows[11][3].ToString(), mytable.Rows[11][4].ToString(), mytable.Rows[11][5].ToString()) + "')");
                    img8.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img8.Src = "~/user/images/Empty1.gif";
                    img8.Src = "~/user/images/empty.png";//Empty1
                }
               
            }

            if (mytable.Rows.Count > 12)
            {
                lb9.Text = mytable.Rows[12][0].ToString();
                MemberID = lb9.Text;
                if (MemberID != "")
                {
                    name9.Text = mytable.Rows[12][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[12][2].ToString();
                    lbljuicyclub = mytable.Rows[12][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img9);
                    img9.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[12][0].ToString(), mytable.Rows[12][1].ToString(), mytable.Rows[12][2].ToString(), mytable.Rows[12][3].ToString(), mytable.Rows[12][4].ToString(), mytable.Rows[12][5].ToString()) + "')");
                    img9.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img9.Src = "~/user/images/Empty1.gif";
                    img9.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 13)
            {
                lb10.Text = mytable.Rows[13][0].ToString();
                MemberID = lb10.Text;
                if (MemberID != "")
                {
                    name10.Text = mytable.Rows[13][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[13][2].ToString();
                    lbljuicyclub = mytable.Rows[13][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img10);
                    img10.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[13][0].ToString(), mytable.Rows[13][1].ToString(), mytable.Rows[13][2].ToString(), mytable.Rows[13][3].ToString(), mytable.Rows[13][4].ToString(), mytable.Rows[13][5].ToString()) + "')");
                    img10.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img10.Src = "~/user/images/Empty1.gif";
                    img10.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 14)
            {
                lb18.Text = mytable.Rows[14][0].ToString();
                MemberID = lb18.Text;
                if (MemberID != "")
                {
                    name18.Text = mytable.Rows[14][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[14][2].ToString();
                    lbljuicyclub = mytable.Rows[14][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img18);
                    img18.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[14][0].ToString(), mytable.Rows[14][1].ToString(), mytable.Rows[14][2].ToString(), mytable.Rows[14][3].ToString(), mytable.Rows[14][4].ToString(), mytable.Rows[14][5].ToString()) + "')");
                    img18.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img18.Src = "~/user/images/Empty1.gif";
                    img18.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 15)
            {
                lb19.Text = mytable.Rows[15][0].ToString();
                MemberID = lb19.Text;
                if (MemberID != "")
                {
                    name19.Text = mytable.Rows[15][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[15][2].ToString();
                    lbljuicyclub = mytable.Rows[15][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img19);
                    img19.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[15][0].ToString(), mytable.Rows[15][1].ToString(), mytable.Rows[15][2].ToString(), mytable.Rows[15][3].ToString(), mytable.Rows[15][4].ToString(), mytable.Rows[15][5].ToString()) + "')");
                    img19.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img19.Src = "~/user/images/Empty1.gif";
                    img19.Src = "~/user/images/empty.png";//Empty1
                }
            }

            if (mytable.Rows.Count > 16)
            {
                lb11.Text = mytable.Rows[16][0].ToString();
                MemberID = lb11.Text;
                if (MemberID != "")
                {
                    name11.Text = mytable.Rows[16][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[16][2].ToString();
                    lbljuicyclub = mytable.Rows[16][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img11);
                    img11.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[16][0].ToString(), mytable.Rows[16][1].ToString(), mytable.Rows[16][2].ToString(), mytable.Rows[16][3].ToString(), mytable.Rows[16][4].ToString(), mytable.Rows[16][5].ToString()) + "')");
                    img11.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img11.Src = "~/user/images/Empty1.gif";
                    img11.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 17)
            {
                lb12.Text = mytable.Rows[17][0].ToString();
                MemberID = lb12.Text;
                if (MemberID != "")
                {
                    name12.Text = mytable.Rows[17][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[17][2].ToString();
                    lbljuicyclub = mytable.Rows[17][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img12);
                    img12.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[17][0].ToString(), mytable.Rows[17][1].ToString(), mytable.Rows[17][2].ToString(), mytable.Rows[17][3].ToString(), mytable.Rows[17][4].ToString(), mytable.Rows[17][5].ToString()) + "')");
                    img12.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img12.Src = "~/user/images/Empty1.gif";
                    img12.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 18)
            {
                lb13.Text = mytable.Rows[18][0].ToString();
                MemberID = lb13.Text;
                if (MemberID != "")
                {
                    name13.Text = mytable.Rows[18][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[18][2].ToString();
                    lbljuicyclub = mytable.Rows[18][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img13);
                    img13.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[18][0].ToString(), mytable.Rows[18][1].ToString(), mytable.Rows[18][2].ToString(), mytable.Rows[18][3].ToString(), mytable.Rows[18][4].ToString(), mytable.Rows[18][5].ToString()) + "')");
                    img13.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img13.Src = "~/user/images/Empty1.gif";
                    img13.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 19)
            {
                lb20.Text = mytable.Rows[19][0].ToString();
                MemberID = lb20.Text;
                if (MemberID != "")
                {
                    name20.Text = mytable.Rows[19][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[19][2].ToString();
                    lbljuicyclub = mytable.Rows[19][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img20);
                    img20.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[19][0].ToString(), mytable.Rows[19][1].ToString(), mytable.Rows[19][2].ToString(), mytable.Rows[19][3].ToString(), mytable.Rows[19][4].ToString(), mytable.Rows[19][5].ToString()) + "')");
                    img20.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img20.Src = "~/user/images/Empty1.gif";
                    img20.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 20)
            {
                lb21.Text = mytable.Rows[20][0].ToString();
                MemberID = lb21.Text;
                if (MemberID != "")
                {
                    name21.Text = mytable.Rows[20][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[20][2].ToString();
                    lbljuicyclub = mytable.Rows[20][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img21);
                    img21.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[20][0].ToString(), mytable.Rows[20][1].ToString(), mytable.Rows[20][2].ToString(), mytable.Rows[20][3].ToString(), mytable.Rows[20][4].ToString(), mytable.Rows[20][5].ToString()) + "')");
                    img21.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img21.Src = "~/user/images/Empty1.gif";
                    img21.Src = "~/user/images/empty.png";//Empty1
                }
            }


            if (mytable.Rows.Count > 21)
            {
                lb22.Text = mytable.Rows[21][0].ToString();
                MemberID = lb22.Text;
                if (MemberID != "")
                {
                    name22.Text = mytable.Rows[21][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[21][2].ToString();
                    lbljuicyclub = mytable.Rows[21][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img22);
                    img22.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[21][0].ToString(), mytable.Rows[21][1].ToString(), mytable.Rows[21][2].ToString(), mytable.Rows[21][3].ToString(), mytable.Rows[21][4].ToString(), mytable.Rows[21][5].ToString()) + "')");
                    img22.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img22.Src = "~/user/images/Empty1.gif";
                    img22.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 22)
            {
                lb23.Text = mytable.Rows[22][0].ToString();
                MemberID = lb23.Text;
                if (MemberID != "")
                {
                    name23.Text = mytable.Rows[22][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[22][2].ToString();
                    lbljuicyclub = mytable.Rows[22][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img23);
                    img23.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[22][0].ToString(), mytable.Rows[22][1].ToString(), mytable.Rows[22][2].ToString(), mytable.Rows[22][3].ToString(), mytable.Rows[22][4].ToString(), mytable.Rows[22][5].ToString()) + "')");
                    img23.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img23.Src = "~/user/images/Empty1.gif";
                    img23.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 23)
            {
                lb24.Text = mytable.Rows[23][0].ToString();
                MemberID = lb24.Text;
                if (MemberID != "")
                {
                    name24.Text = mytable.Rows[23][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[23][2].ToString();
                    lbljuicyclub = mytable.Rows[23][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img24);
                    img24.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[23][0].ToString(), mytable.Rows[23][1].ToString(), mytable.Rows[23][2].ToString(), mytable.Rows[23][3].ToString(), mytable.Rows[23][4].ToString(), mytable.Rows[23][5].ToString()) + "')");
                    img24.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img24.Src = "~/user/images/Empty1.gif";
                    img24.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 24)
            {
                lb25.Text = mytable.Rows[24][0].ToString();
                MemberID = lb25.Text;
                if (MemberID != "")
                {
                    name25.Text = mytable.Rows[24][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[24][2].ToString();
                    lbljuicyclub = mytable.Rows[24][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img25);
                    img25.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[24][0].ToString(), mytable.Rows[24][1].ToString(), mytable.Rows[24][2].ToString(), mytable.Rows[24][3].ToString(), mytable.Rows[24][4].ToString(), mytable.Rows[24][5].ToString()) + "')");
                    img25.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                  //  img25.Src = "~/user/images/Empty1.gif";
                    img25.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 25)
            {
                lb26.Text = mytable.Rows[25][0].ToString();
                MemberID = lb26.Text;
                if (MemberID != "")
                {
                    name26.Text = mytable.Rows[25][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[25][2].ToString();
                    lbljuicyclub = mytable.Rows[25][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img26);
                    img26.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[25][0].ToString(), mytable.Rows[25][1].ToString(), mytable.Rows[25][2].ToString(), mytable.Rows[25][3].ToString(), mytable.Rows[25][4].ToString(), mytable.Rows[25][5].ToString()) + "')");
                    img26.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img26.Src = "~/user/images/Empty1.gif";
                    img26.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 26)
            {
                lb27.Text = mytable.Rows[26][0].ToString();
                MemberID = lb27.Text;
                if (MemberID != "")
                {
                    name27.Text = mytable.Rows[26][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[26][2].ToString();
                    lbljuicyclub = mytable.Rows[26][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img27);
                    img27.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[26][0].ToString(), mytable.Rows[26][1].ToString(), mytable.Rows[26][2].ToString(), mytable.Rows[26][3].ToString(), mytable.Rows[26][4].ToString(), mytable.Rows[26][5].ToString()) + "')");
                    img27.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    //img27.Src = "~/user/images/Empty1.gif";
                    img27.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 27)
            {
                lb28.Text = mytable.Rows[27][0].ToString();
                MemberID = lb28.Text;
                if (MemberID != "")
                {
                    name28.Text = mytable.Rows[27][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[27][2].ToString();
                    lbljuicyclub = mytable.Rows[27][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img28);
                    img28.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[27][0].ToString(), mytable.Rows[27][1].ToString(), mytable.Rows[27][2].ToString(), mytable.Rows[27][3].ToString(), mytable.Rows[27][4].ToString(), mytable.Rows[27][5].ToString()) + "')");
                    img28.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img28.Src = "~/user/images/Empty1.gif";
                    img28.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 28)
            {
                lb29.Text = mytable.Rows[28][0].ToString();
                MemberID = lb29.Text;
                if (MemberID != "")
                {
                    name29.Text = mytable.Rows[28][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[28][2].ToString();
                    lbljuicyclub = mytable.Rows[28][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img29);
                    img29.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[28][0].ToString(), mytable.Rows[28][1].ToString(), mytable.Rows[28][2].ToString(), mytable.Rows[28][3].ToString(), mytable.Rows[28][4].ToString(), mytable.Rows[28][5].ToString()) + "')");
                    img29.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                   // img29.Src = "~/user/images/Empty1.gif";
                    img29.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 29)
            {
                lb30.Text = mytable.Rows[29][0].ToString();
                MemberID = lb30.Text;
                if (MemberID != "")
                {
                    name30.Text = mytable.Rows[29][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[29][2].ToString();
                    lbljuicyclub = mytable.Rows[29][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img30);
                    img30.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[29][0].ToString(), mytable.Rows[29][1].ToString(), mytable.Rows[29][2].ToString(), mytable.Rows[29][3].ToString(), mytable.Rows[29][4].ToString(), mytable.Rows[29][5].ToString()) + "')");
                    img30.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                  //  img30.Src = "~/user/images/Empty1.gif";
                    img30.Src = "~/user/images/empty.png";//Empty1
                }
            }
            if (mytable.Rows.Count > 30)
            {
                lb31.Text = mytable.Rows[30][0].ToString();
                MemberID = lb31.Text;
                if (MemberID != "")
                {
                    name31.Text = mytable.Rows[30][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[30][2].ToString();
                    lbljuicyclub = mytable.Rows[30][6].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img31);
                    img31.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[30][0].ToString(), mytable.Rows[30][1].ToString(), mytable.Rows[30][2].ToString(), mytable.Rows[30][3].ToString(), mytable.Rows[30][4].ToString(), mytable.Rows[30][5].ToString()) + "')");
                    img31.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                  //  img31.Src = "~/user/images/Empty1.gif";
                    img31.Src = "~/user/images/empty.png";//Empty1
                }
            }



        }
        private string getString(String IntroducerCode, String MemberName, String SelfTopup, String TopupDate, String Direct, String TotalDownline)
        {
            String x = "<table width=300 border=0 cellpadding=5 cellspacing=1 bgcolor=#e4e4e4><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Member ID</strong></font></td><td width=180px height=10px>" + IntroducerCode + "</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Member Name</strong></font></td><td width=180px height=10px>" + MemberName + "</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Package</strong></font></td><td width=180px height=10px>" + SelfTopup.Replace(".0000",".00") + "</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Date of Joining</strong></font></td><td width=180px height=10px>" + TopupDate.Replace(" 12:00:00 AM", "") + "&nbsp;</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Direct</strong></font></td><td width=180px height=10px>" + Direct + "</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>TotalDownline</strong></font></td><td width=180px height=10px>" + TotalDownline + "&nbsp;</td></tr></table>";
            return x;
        }
        public void GetStatuspay(String lblInvestmentdata, String lbljuicyclub, String MemberID, ref HtmlImage img)
        {
         
           // Int64 lblinvestment = lblInvestmentdata == "" ? 0 : long.Parse(lblInvestmentdata.Replace(".0000", ""));
           //if (lblinvestment == 0 && MemberID != "")
           // {
           //     img.Src = "~/user/images/red.gif";
           //

            if (lbljuicyclub == "Male")
          //  img.Src = "~/user/images/silver.png";
                img.Src = "~/user/images/green.png"; //11a
            else
               // img.Src = "~/user/images/silverf.png";
            img.Src = "~/user/images/green.png"; //11a
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select ISNULL(Count(*),0) from dbo.MyEndorseDownline('" + Session["UserCode"].ToString() + "') where MemberID='" + TextBox2.Text + "'", conn); //Session["UserCode"].ToString()
            conn.Open();
            int x = int.Parse(cmd.ExecuteScalar().ToString());
            conn.Close();
            if (x > 0)
            {
                Session["MidT"] = TextBox2.Text.Trim().ToString();
                HomeData(Session["MidT"].ToString());
                Label2.Text = "";
            }
            else
            {
                Label2.Text = "Invalid Membership ID";
            }
            conn.Close();

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            CurrentPage.Value = (int.Parse(CurrentPage.Value) - 1).ToString();
            HomeData(id1.Text);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            CurrentPage.Value = (int.Parse(CurrentPage.Value) + 1).ToString();
            HomeData(id1.Text);

        }

        protected void id1_Click(object sender, EventArgs e)
        {
            return;
        }

        protected void lb4_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb4.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb3_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb3.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb2_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb2.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb5_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb5.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb6_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb6.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb7_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb7.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb8_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb8.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb9_Click(object sender, EventArgs e)
        {
            CurrentPage.Value = "1";
            Session["midT"] = lb9.Text;
            HomeData(Session["midT"].ToString());
        }

        protected void lb10_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb10.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb11_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb11.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb12_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb12.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }

        protected void lb13_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb13.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb14_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb14.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb15_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb15.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb16_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb16.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb17_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb17.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb18_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb18.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb19_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb19.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb20_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb20.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb21_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb21.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb22_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb22.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb23_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb23.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb24_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb24.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb25_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb25.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb26_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb26.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb27_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb27.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb28_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb28.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb29_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb29.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb30_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb30.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
        protected void lb31_Click(object sender, EventArgs e)
        {
            Session["midT"] = lb31.Text;
            CurrentPage.Value = "1";
            HomeData(Session["midT"].ToString());
        }
    }

