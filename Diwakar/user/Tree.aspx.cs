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

namespace WGRL.User
{
    public partial class UserTree : System.Web.UI.Page
    {
        public string strid1;
        public string strid2;
        public string strid3;
        public string strid4;
        public string strid5;
        public string strid6;
        public string strid7;
        public string strid8;
        public string strid9;
        public string strid10;
        public string strid11;
        public string strid12;
        public string strid13;
        public string strid14;
        public string strid15;
        public string strid17;
        public string strid18;
        public string strid19;
        public SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usercode"] == null)
                Response.Redirect("~/login.aspx");

             
             

            if (!IsPostBack)
            {
                if (Session["Mid"] == null)
                    Session["Mid"] = Session["UserCode"].ToString();
                Session["Mid"] = Session["UserCode"].ToString();
                HomeData();
                Button3_Click();

           

            }
            SqlCommand cmd;
            cmd = new SqlCommand("select isnull(sum(myinvestment),0) from tblMemberMaster where usercode in(select usercode from [esc].[MyLeftDownLine]('" + Session["UserCode"].ToString() + "'))", conn);
            conn.Open();
            //totalleftpv.Text = cmd.ExecuteScalar().ToString().Replace(".0000", "");
            conn.Close();

            cmd = new SqlCommand("select isnull(sum(myinvestment),0) from tblMemberMaster where usercode in(select usercode from [esc].[MyRightDownLine]('" + Session["UserCode"].ToString() + "'))", conn);
            conn.Open();
            //totalrightpv.Text = cmd.ExecuteScalar().ToString().Replace(".0000", "");
            conn.Close();
        }

        private string GetCDMemberCount(string UserCode, string Side)
        {
            long x = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("select ISNULL(Count(*),0) from esc.My" + Side + "Downline('" + UserCode + "')", con);
            con.Open();
            try { x = long.Parse(cmd.ExecuteScalar().ToString()); }
            catch { }
            con.Close();
            return x.ToString();
        }
        private void MyGoldLeg(ref string C, ref string D, string UserCode)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
            SqlCommand cmd = new SqlCommand("select ISNULL(MyC,''),ISNULL(MyD,'') from TblMemberMaster where UserCode='" + UserCode + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                C = dr[0].ToString();
                D = dr[1].ToString();
                break;
            }
            dr.Close();
            con.Close();
        }
        void HomeData()
        {
            DataTable mytable = new DataTable();
            mytable.Columns.Add("Memberid", System.Type.GetType("System.String")); //0
            mytable.Columns.Add("Name", System.Type.GetType("System.String")); //1
            mytable.Columns.Add("LhId", System.Type.GetType("System.String")); //2
            mytable.Columns.Add("RhId", System.Type.GetType("System.String")); //3
            mytable.Columns.Add("Status", System.Type.GetType("System.String")); //4
            mytable.Columns.Add("LeftCount", System.Type.GetType("System.String")); //5
            mytable.Columns.Add("RightCount", System.Type.GetType("System.String")); //6
            mytable.Columns.Add("LeftPV", System.Type.GetType("System.String")); //7
            mytable.Columns.Add("RightPV", System.Type.GetType("System.String")); //8
            mytable.Columns.Add("TopupDate", System.Type.GetType("System.String")); //9
            mytable.Columns.Add("SponsorCode", System.Type.GetType("System.String")); //10
            mytable.Columns.Add("JoiningType", System.Type.GetType("System.String")); //11
            mytable.Columns.Add("TopupAmount", System.Type.GetType("System.String")); //12
            mytable.Columns.Add("LeftStar", System.Type.GetType("System.String")); //13
            mytable.Columns.Add("RightStar", System.Type.GetType("System.String")); //14
            mytable.Columns.Add("LoginName", System.Type.GetType("System.String")); //15
            mytable.Columns.Add("St", System.Type.GetType("System.String")); //16
            mytable.Columns.Add("Leftfistpurchase", System.Type.GetType("System.String")); //17
            mytable.Columns.Add("Rightfistpurchase", System.Type.GetType("System.String")); //18
            mytable.Columns.Add("ConfirmDate", System.Type.GetType("System.String")); //19
            //mytable.Columns.Add("SponsorName", System.Type.GetType("System.String"));

            //SqlDataAdapter da = new SqlDataAdapter("SELECT     tblTreeMaster.MemberID, tblMemberMaster.UserName, tblTreeMaster.LeftChild, tblTreeMaster.RightChild, tblTreeMaster.SponserID, tblMemberMaster_1.UserName AS SponsorName, tblMemberMaster.PinAmount AS MyInvestment, dbo.MyInvestmentDate(tblTreeMaster.MemberID) AS MyInvestmentDate, tblMemberMaster.MyLeftBusiness, tblMemberMaster.MyRightBusiness, tblMemberMaster.Status, tblMemberMaster.MyLeft AS LeftCount, tblMemberMaster.MyRight AS RightCount, TblMemberMaster.MyC, TblMemberMaster.MyD, tblMemberMaster.LoginName,tblMemberMaster.Status FROM         tblTreeMaster INNER JOIN tblMemberMaster ON tblTreeMaster.MemberID = tblMemberMaster.UserCode INNER JOIN tblMemberMaster AS tblMemberMaster_1 ON tblTreeMaster.SponserID = tblMemberMaster_1.UserCode where tblMemberMaster.UserCode in (select UserCode from esc.MyDownlineTop15('" + Session["Mid"].ToString() + "'))", conn);
            SqlDataAdapter da = new SqlDataAdapter("SELECT     tblTreeMaster.MemberID, tblMemberMaster.UserName, tblTreeMaster.LeftChild, tblTreeMaster.RightChild, tblTreeMaster.SponserID, tblMemberMaster_1.UserName AS SponsorName, tblMembermaster.PinAmount AS MyInvestment, tblmembermaster.DOJ AS MyInvestmentDate, tblMemberMaster.MyLeftBusiness, tblMemberMaster.MyRightBusiness, tblMemberMaster.Status, tblMemberMaster.MyLeft AS LeftCount, tblMemberMaster.MyRight AS RightCount, TblMemberMaster.MobileNo, tblMemberMaster.LoginName,tblMemberMaster.Status,tblMemberMaster.MyLeftGreen,tblMemberMaster.myRightGreen, tblMemberMaster.ConfirmDate FROM         tblTreeMaster INNER JOIN tblMemberMaster ON tblTreeMaster.MemberID = tblMemberMaster.UserCode INNER JOIN tblMemberMaster AS tblMemberMaster_1 ON tblTreeMaster.SponserID = tblMemberMaster_1.UserCode where tblMemberMaster.UserCode in (select UserCode from esc.MyDownlineTop15('" + Session["Mid"].ToString() + "'))", conn);
            da.SelectCommand.CommandTimeout = 0;
            conn.Open();
            DataSet ds = new DataSet();
            da.Fill(ds, "tblTreeMaster");
            conn.Close();

            Queue a = new Queue();
            if (Session["Mid"] == null)
            {
                a.Enqueue("Blank");
            }
            else
            {
                a.Enqueue(Session["Mid"].ToString());
            }

            while (a.Count != 0)
            {
                if (mytable.Rows.Count == 15)
                {
                    break;
                }

                String cid = a.Dequeue().ToString();
                if (cid.StartsWith("Blank"))
                {
                    DataRow myrow = mytable.NewRow();
                    if (cid.Contains("JoinNow"))
                    {
                        myrow[0] = cid;
                        myrow[1] = "";
                        myrow[2] = "";
                        myrow[3] = "";
                    }
                    else
                    {

                        myrow[0] = "";
                        myrow[1] = "";
                        myrow[2] = "";
                        myrow[3] = "";

                    }
                    //myrow[4] = "";
                    mytable.Rows.Add(myrow);
                    a.Enqueue("Blank");
                    a.Enqueue("Blank");
                    continue;
                }
                DataRow[] fr = ds.Tables[0].Select("MemberId = '" + cid + "'");
                for (int i = 0; i < fr.Length; i++)
                {
                    DataRow myrow = mytable.NewRow();
                    myrow[0] = cid;
                    myrow[1] = fr[0][1].ToString();
                    myrow[2] = 0;//calc_business(fr[0][2].ToString());
                    myrow[3] = 0;//calc_business(fr[0][3].ToString());
                  //  myrow[4] = fr[0][16].ToString();
                    myrow[5] = fr[0][11].ToString();
                    myrow[6] = fr[0][12].ToString();
                    myrow[7] = fr[0][8].ToString();
                    myrow[8] = fr[0][9].ToString();
                    myrow[9] = fr[0][7].ToString();
                    myrow[10] = fr[0][4].ToString() +"-" + fr[0][5].ToString();
                    myrow[11] = fr[0][6].ToString();
                    myrow[12] = fr[0][6].ToString();
                    myrow[13] = fr[0][13].ToString();
                    myrow[14] = fr[0][14].ToString();
                    myrow[15] = fr[0][1].ToString();
                    myrow[16] = "";
                    myrow[17] = fr[0][16].ToString();//leftgreen
                    myrow[18] = fr[0][17].ToString();//rightgreen
                   myrow[19] = fr[0][18].ToString();


                    mytable.Rows.Add(myrow);

                    if (fr[0][2].ToString() != "" && fr[0][2].ToString() != null)
                    {
                        a.Enqueue(fr[0][2].ToString());
                    }
                    else
                    {
                        a.Enqueue("Blank-JoinNow#sid=" + Session["UserCode"].ToString() + "#pid=" + cid + "#Side=Left");
                    }

                    if (fr[0][3].ToString() != "" && fr[0][3].ToString() != null)
                    {
                        a.Enqueue(fr[0][3].ToString());
                    }
                    else
                    {
                        a.Enqueue("Blank-JoinNow#sid=" + Session["UserCode"].ToString() + "#pid=" + cid + "#Side=Right");
                    }


                }
            }
            //DateTime ddlj;
            int status;

            string[] xx;
            string yy;
            string MYSTR;
            int ZZ;
            string spnsrid;
            int ZZ1;
            string Prntid;
            string side;
            String lblInvestmentdata = "";
            String lbljuicyclub = "";
            String txtMember = "";
            if (mytable.Rows.Count > 0)
            {

                id1.Text = mytable.Rows[0][0].ToString();
                txtMember = id1.Text;
                name1.Text = mytable.Rows[0][1].ToString();
                name1.ToolTip = mytable.Rows[0][12].ToString();

                lblInvestmentdata = name1.ToolTip;
            
               
                GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[0][16].ToString(), ref img1);
                if (txtMember != "")
                {
                    img1.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[0][1].ToString(), mytable.Rows[0][10].ToString(), mytable.Rows[0][9].ToString(), mytable.Rows[0][7].ToString(), mytable.Rows[0][8].ToString(), mytable.Rows[0][5].ToString(), mytable.Rows[0][6].ToString(), mytable.Rows[0][11].ToString(), mytable.Rows[0][4].ToString(), mytable.Rows[0][13].ToString(), mytable.Rows[0][14].ToString(), mytable.Rows[0][17].ToString(), mytable.Rows[0][18].ToString(), mytable.Rows[0][19].ToString()) + "')");
                    img1.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                //MyLeft.Text = mytable.Rows[0][5].ToString();
                //MyRight.Text = mytable.Rows[0][6].ToString();
                String C = "", D = "";
                MyGoldLeg(ref C, ref D, id1.Text);
                //MyC.Text = C;
                //MyD.Text = D;
                long x = long.Parse(GetCDMemberCount(id1.Text, "C"));
                long y = long.Parse(GetCDMemberCount(id1.Text, "D"));
                //MyCLeft.Text = x.ToString();
                //MyDRight.Text = y.ToString();

                //SqlCommand cmd = new SqlCommand();
                //SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
                //cmd.Connection = con1;
                //con1.Open();
                //cmd.CommandText = "SELECT     ISNULL(Count(*),0) FROM         tblMemberMaster INNER JOIN (SELECT     UserCode FROM          esc.MyLeftDownLine('" + Session["mid"].ToString() + "') AS MyLeftDownLine_1) AS derivedtbl_1 ON tblMemberMaster.UserCode = derivedtbl_1.UserCode AND tblMemberMaster.DOJ >= dbo.LastSaturday()";
                //CWLeft.Text = cmd.ExecuteScalar().ToString();
                //cmd.CommandText = "SELECT     ISNULL(Count(*),0) FROM         tblMemberMaster INNER JOIN (SELECT     UserCode FROM          esc.MyRightDownLine('" + Session["mid"].ToString() + "') AS MyLeftDownLine_1) AS derivedtbl_1 ON tblMemberMaster.UserCode = derivedtbl_1.UserCode AND tblMemberMaster.DOJ >= dbo.LastSaturday()";
                //CWRight.Text = cmd.ExecuteScalar().ToString();
                //con1.Close();

                //if (MyC.Text.Trim() == "" || MyD.Text.Trim() == "")
                //{
                //    //long TotalBinaryPairs = GetTotalPairs(id1.Text);
                //    if (long.Parse(MyLeft.Text) >= 40 && long.Parse(MyRight.Text) >= 40)
                //    {
                //        if (MyC.Text.Trim() == "")
                //        {
                //            MyC.Text = "<a href=\"Joinnow.aspx?SSide=C&ID=" + id1.Text + "\" target=\"_blank\">Join C</a>";
                //            //Session["MYGoldTree"] = "C";
                //        }
                //        if (MyD.Text.Trim() == "")
                //        {
                //            MyD.Text = "<a href=\"Joinnow.aspx?SSide=D&ID=" + id1.Text + "\" target=\"_blank\">Join D</a>";
                //            //Session["MYGoldTree"] = "D";
                //        }

                //    }
                //}
            }

            if (mytable.Rows.Count > 1)
            {
                if (mytable.Rows[1][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img2.Src = "~/user/images/Empty1.gif";
                    name2.Text = "";
                    //name2.Text = mytable.Rows[1][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[1][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[1][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb2.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img2.Attributes.Remove("onMouseover");
                    img2.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[1][0].ToString() != "")
                {
                    lb2.Text = mytable.Rows[1][0].ToString();
                    txtMember = lb2.Text;
                    name2.Text = mytable.Rows[1][1].ToString();
                    name2.ToolTip = mytable.Rows[1][12].ToString();

                    lblInvestmentdata = name2.ToolTip;

                    GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[1][16].ToString(), ref img2);
                    if (txtMember != "")
                    {

                        img2.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[1][1].ToString(), mytable.Rows[1][10].ToString(), mytable.Rows[1][9].ToString(), mytable.Rows[1][7].ToString(), mytable.Rows[1][8].ToString(), mytable.Rows[1][5].ToString(), mytable.Rows[1][6].ToString(), mytable.Rows[1][11].ToString(), mytable.Rows[1][4].ToString(), mytable.Rows[1][13].ToString(), mytable.Rows[1][14].ToString(), mytable.Rows[1][17].ToString(), mytable.Rows[1][18].ToString(), mytable.Rows[1][19].ToString()) + "')");
                        img2.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img2.Attributes.Remove("onMouseover");
                        img2.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img2.Src = "~/user/images/Empty1.gif";
                    lb2.Text = "";
                    name2.Text = "";
                    img2.Attributes.Remove("onMouseover");
                    img2.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 2)
            {
                if (mytable.Rows[2][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img3.Src = "~/user/images/Empty1.gif";
                    name3.Text = "";
                    //name3.Text = mytable.Rows[2][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[2][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[2][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb3.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img3.Attributes.Remove("onMouseover");
                    img3.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[2][0].ToString() != "")
                {
                    lb3.Text = mytable.Rows[2][0].ToString();
                    txtMember = lb3.Text;
                    name3.Text = mytable.Rows[2][1].ToString();
                    name3.ToolTip = mytable.Rows[2][12].ToString();

                    lblInvestmentdata = name3.ToolTip;

                   GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[2][16].ToString(), ref img3);
                    if (txtMember != "")
                    {
                        img3.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[2][1].ToString(), mytable.Rows[2][10].ToString(), mytable.Rows[2][9].ToString(), mytable.Rows[2][7].ToString(), mytable.Rows[2][8].ToString(), mytable.Rows[2][5].ToString(), mytable.Rows[2][6].ToString(), mytable.Rows[2][11].ToString(), mytable.Rows[2][4].ToString(), mytable.Rows[2][13].ToString(), mytable.Rows[2][14].ToString(), mytable.Rows[2][17].ToString(), mytable.Rows[2][18].ToString(), mytable.Rows[2][19].ToString()) + "')");
                        img3.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img3.Attributes.Remove("onMouseover");
                        img3.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img3.Src = "~/user/images/Empty1.gif";
                    lb3.Text = "";
                    name3.Text = "";
                    img3.Attributes.Remove("onMouseover");
                    img3.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");

                }
            }

            if (mytable.Rows.Count > 3)
            {
                if (mytable.Rows[3][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img4.Src = "~/user/images/Empty1.gif";
                    name4.Text = "";
                    //lb4.Text = "Join Now";
                    //name4.Text = mytable.Rows[3][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[3][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[3][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb4.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img4.Attributes.Remove("onMouseover");
                    img4.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[3][0].ToString() != "")
                {
                    lb4.Text = mytable.Rows[3][0].ToString();
                    txtMember = lb4.Text;
                    name4.Text = mytable.Rows[3][1].ToString();
                    name4.ToolTip = mytable.Rows[3][12].ToString();

                    lblInvestmentdata = name4.ToolTip;

                   GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[3][16].ToString(), ref img4);
                    if (txtMember != "")
                    {
                        img4.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[3][1].ToString(), mytable.Rows[3][10].ToString(), mytable.Rows[3][9].ToString(), mytable.Rows[3][7].ToString(), mytable.Rows[3][8].ToString(), mytable.Rows[3][5].ToString(), mytable.Rows[3][6].ToString(), mytable.Rows[3][11].ToString(), mytable.Rows[3][4].ToString(), mytable.Rows[3][13].ToString(), mytable.Rows[3][14].ToString(), mytable.Rows[3][17].ToString(), mytable.Rows[3][18].ToString(), mytable.Rows[3][19].ToString()) + "')");
                        img4.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img4.Attributes.Remove("onMouseover");
                        img4.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img4.Src = "~/user/images/Empty1.gif";
                    lb4.Text = "";
                    name4.Text = "";
                    img4.Attributes.Remove("onMouseover");
                    img4.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 4)
            {
                if (mytable.Rows[4][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img5.Src = "~/user/images/Empty1.gif";
                    name5.Text = "";
                    //name5.Text = mytable.Rows[4][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[4][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[4][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb5.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img5.Attributes.Remove("onMouseover");
                    img5.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[4][0].ToString() != "")
                {

                    lb5.Text = mytable.Rows[4][0].ToString();
                    txtMember = lb5.Text;
                    name5.Text = mytable.Rows[4][1].ToString();
                    name5.ToolTip = mytable.Rows[4][12].ToString();

                    lblInvestmentdata = name5.ToolTip;

                   GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[4][16].ToString(), ref img5);
                    if (txtMember != "")
                    {
                        img5.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[4][1].ToString(), mytable.Rows[4][10].ToString(), mytable.Rows[4][9].ToString(), mytable.Rows[4][7].ToString(), mytable.Rows[4][8].ToString(), mytable.Rows[4][5].ToString(), mytable.Rows[4][6].ToString(), mytable.Rows[4][11].ToString(), mytable.Rows[4][4].ToString(), mytable.Rows[4][13].ToString(), mytable.Rows[4][14].ToString(), mytable.Rows[4][17].ToString(), mytable.Rows[4][18].ToString(), mytable.Rows[4][19].ToString()) + "')");
                        img5.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img5.Attributes.Remove("onMouseover");
                        img5.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img5.Src = "~/user/images/Empty1.gif";
                    lb5.Text = "";
                    name5.Text = "";
                    img5.Attributes.Remove("onMouseover");
                    img5.Attributes.Remove("onMouseout");
                    //img5.ResolveUrl("<div><a href=../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "' &ParentID='" + txtMember +"'></div>");
                    //img5.GetRouteUrl("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 5)
            {
                if (mytable.Rows[5][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img6.Src = "~/user/images/Empty1.gif";
                    name6.Text = "";
                    //lb6.Text = "Join Now";
                    //name6.Text = mytable.Rows[5][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[5][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[5][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb6.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img6.Attributes.Remove("onMouseover");
                    img6.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[5][0].ToString() != "")
                {
                    lb6.Text = mytable.Rows[5][0].ToString();
                    txtMember = lb6.Text;
                    name6.Text = mytable.Rows[5][1].ToString();
                    name6.ToolTip = mytable.Rows[5][12].ToString();

                    lblInvestmentdata = name6.ToolTip;

                   GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[5][16].ToString(), ref img6);
                    if (txtMember != "")
                    {
                        img6.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[5][1].ToString(), mytable.Rows[5][10].ToString(), mytable.Rows[5][9].ToString(), mytable.Rows[5][7].ToString(), mytable.Rows[5][8].ToString(), mytable.Rows[5][5].ToString(), mytable.Rows[5][6].ToString(), mytable.Rows[5][11].ToString(), mytable.Rows[5][4].ToString(), mytable.Rows[5][13].ToString(), mytable.Rows[5][14].ToString(), mytable.Rows[5][17].ToString(), mytable.Rows[5][18].ToString(), mytable.Rows[5][19].ToString()) + "')");
                        img6.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img6.Attributes.Remove("onMouseover");
                        img6.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img6.Src = "~/user/images/Empty1.gif";
                    lb6.Text = "";
                    name6.Text = "";
                    img6.Attributes.Remove("onMouseover");
                    img6.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 6)
            {
                if (mytable.Rows[6][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img7.Src = "~/user/images/Empty1.gif";
                    name7.Text = "";
                    //lb7.Text = "Join Now";
                    //name7.Text = mytable.Rows[6][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[6][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[6][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb7.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img7.Attributes.Remove("onMouseover");
                    img7.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[6][0].ToString() != "")
                {
                    lb7.Text = mytable.Rows[6][0].ToString();
                    txtMember = lb7.Text;
                    name7.Text = mytable.Rows[6][1].ToString();
                    name7.ToolTip = mytable.Rows[6][12].ToString();

                    lblInvestmentdata = name7.ToolTip;

                    GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[6][16].ToString(), ref img7);
                    if (txtMember != "")
                    {
                        img7.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[6][1].ToString(), mytable.Rows[6][10].ToString(), mytable.Rows[6][9].ToString(), mytable.Rows[6][7].ToString(), mytable.Rows[6][8].ToString(), mytable.Rows[6][5].ToString(), mytable.Rows[6][6].ToString(), mytable.Rows[6][11].ToString(), mytable.Rows[6][4].ToString(), mytable.Rows[6][13].ToString(), mytable.Rows[6][14].ToString(), mytable.Rows[6][17].ToString(), mytable.Rows[6][18].ToString(), mytable.Rows[6][19].ToString()) + "')");
                        img7.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img7.Attributes.Remove("onMouseover");
                        img7.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img7.Src = "~/user/images/Empty1.gif";
                    lb7.Text = "";
                    name7.Text = "";
                    img7.Attributes.Remove("onMouseover");
                    img7.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 7)
            {
                if (mytable.Rows[7][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img8.Src = "~/user/images/Empty1.gif";
                    name8.Text = "";
                    //lb8.Text = "Join Now";
                    //name8.Text = mytable.Rows[7][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[7][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[7][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb8.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img8.Attributes.Remove("onMouseover");
                    img8.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[7][0].ToString() != "")
                {
                    lb8.Text = mytable.Rows[7][0].ToString();
                    txtMember = lb8.Text;
                    name8.Text = mytable.Rows[7][1].ToString();
                    name8.ToolTip = mytable.Rows[7][12].ToString();

                    lblInvestmentdata = name8.ToolTip;

                   GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[7][16].ToString(), ref img8);
                    if (txtMember != "")
                    {
                        img8.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[7][1].ToString(), mytable.Rows[7][10].ToString(), mytable.Rows[7][9].ToString(), mytable.Rows[7][7].ToString(), mytable.Rows[7][8].ToString(), mytable.Rows[7][5].ToString(), mytable.Rows[7][6].ToString(), mytable.Rows[7][11].ToString(), mytable.Rows[7][4].ToString(), mytable.Rows[7][13].ToString(), mytable.Rows[7][14].ToString(), mytable.Rows[7][17].ToString(), mytable.Rows[7][18].ToString(), mytable.Rows[7][19].ToString()) + "')");
                        img8.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img8.Attributes.Remove("onMouseover");
                        img8.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img8.Src = "~/user/images/Empty1.gif";
                    lb8.Text = "";
                    name8.Text = "";
                    img8.Attributes.Remove("onMouseover");
                    img8.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 8)
            {
                if (mytable.Rows[8][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img9.Src = "~/user/images/Empty1.gif";
                    name9.Text = "";
                    //lb9.Text = "Join Now";
                    //name9.Text = mytable.Rows[8][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[8][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[8][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb9.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img9.Attributes.Remove("onMouseover");
                    img9.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[8][0].ToString() != "")
                {
                    lb9.Text = mytable.Rows[8][0].ToString();
                    txtMember = lb9.Text;
                    name9.Text = mytable.Rows[8][1].ToString();
                    name9.ToolTip = mytable.Rows[8][12].ToString();

                    lblInvestmentdata = name9.ToolTip;

                    GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[8][16].ToString(), ref img9);
                    if (txtMember != "")
                    {
                        img9.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[8][1].ToString(), mytable.Rows[8][10].ToString(), mytable.Rows[8][9].ToString(), mytable.Rows[8][7].ToString(), mytable.Rows[8][8].ToString(), mytable.Rows[8][5].ToString(), mytable.Rows[8][6].ToString(), mytable.Rows[8][11].ToString(), mytable.Rows[8][4].ToString(), mytable.Rows[8][13].ToString(), mytable.Rows[8][14].ToString(), mytable.Rows[8][17].ToString(), mytable.Rows[8][18].ToString(), mytable.Rows[8][19].ToString()) + "')");
                        img9.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img9.Attributes.Remove("onMouseover");
                        img9.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img9.Src = "~/user/images/Empty1.gif";
                    lb9.Text = "";
                    name9.Text = "";
                    img9.Attributes.Remove("onMouseover");
                    img9.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 9)
            {
                if (mytable.Rows[9][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img10.Src = "~/user/images/Empty1.gif";
                    name10.Text = "";
                    //lb10.Text = "Join Now";
                    //name10.Text = mytable.Rows[9][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[9][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[9][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb10.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img10.Attributes.Remove("onMouseover");
                    img10.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[9][0].ToString() != "")
                {
                    lb10.Text = mytable.Rows[9][0].ToString();
                    txtMember = lb10.Text;
                    name10.Text = mytable.Rows[9][1].ToString();
                    name10.ToolTip = mytable.Rows[9][12].ToString();

                    lblInvestmentdata = name10.ToolTip;

                    GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[9][16].ToString(), ref img10);
                    if (txtMember != "")
                    {
                        img10.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[9][1].ToString(), mytable.Rows[9][10].ToString(), mytable.Rows[9][9].ToString(), mytable.Rows[9][7].ToString(), mytable.Rows[9][8].ToString(), mytable.Rows[9][5].ToString(), mytable.Rows[9][6].ToString(), mytable.Rows[9][11].ToString(), mytable.Rows[9][4].ToString(), mytable.Rows[9][13].ToString(), mytable.Rows[9][14].ToString(), mytable.Rows[9][17].ToString(), mytable.Rows[9][18].ToString(), mytable.Rows[9][19].ToString()) + "')");
                        img10.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img10.Attributes.Remove("onMouseover");
                        img10.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img10.Src = "~/user/images/Empty1.gif";
                    lb10.Text = "";
                    name10.Text = "";
                    img10.Attributes.Remove("onMouseover");
                    img10.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 10)
            {
                if (mytable.Rows[10][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img11.Src = "~/user/images/Empty1.gif";
                    name11.Text = "";
                    //lb11.Text = "Join Now";
                    //name11.Text = mytable.Rows[10][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[10][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[10][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb11.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img11.Attributes.Remove("onMouseover");
                    img11.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[10][0].ToString() != "")
                {
                    lb11.Text = mytable.Rows[10][0].ToString();
                    txtMember = lb11.Text;
                    name11.Text = mytable.Rows[10][1].ToString();
                    name11.ToolTip = mytable.Rows[10][12].ToString();

                    lblInvestmentdata = name11.ToolTip;

                  GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[10][16].ToString(), ref img11);
                    if (txtMember != "")
                    {
                        img11.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[10][1].ToString(), mytable.Rows[10][10].ToString(), mytable.Rows[10][9].ToString(), mytable.Rows[10][7].ToString(), mytable.Rows[10][8].ToString(), mytable.Rows[10][5].ToString(), mytable.Rows[10][6].ToString(), mytable.Rows[10][11].ToString(), mytable.Rows[10][4].ToString(), mytable.Rows[10][13].ToString(), mytable.Rows[10][14].ToString(), mytable.Rows[10][17].ToString(), mytable.Rows[10][18].ToString(), mytable.Rows[10][19].ToString()) + "')");
                        img11.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img11.Attributes.Remove("onMouseover");
                        img11.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img11.Src = "~/user/images/Empty1.gif";
                    lb11.Text = "";
                    name11.Text = "";
                    img11.Attributes.Remove("onMouseover");
                    img11.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 11)
            {
                if (mytable.Rows[11][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img12.Src = "~/user/images/Empty1.gif";
                    name12.Text = "";
                    //lb12.Text = "Join Now";
                    //name12.Text = mytable.Rows[11][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[11][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[11][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb12.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img12.Attributes.Remove("onMouseover");
                    img12.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[11][0].ToString() != "")
                {
                    lb12.Text = mytable.Rows[11][0].ToString();
                    txtMember = lb12.Text;
                    name12.Text = mytable.Rows[11][1].ToString();
                    name12.ToolTip = mytable.Rows[11][12].ToString();

                    lblInvestmentdata = name12.ToolTip;

                    GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[11][16].ToString(), ref img12);
                    if (txtMember != "")
                    {
                        img12.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[11][1].ToString(), mytable.Rows[11][10].ToString(), mytable.Rows[11][9].ToString(), mytable.Rows[11][7].ToString(), mytable.Rows[11][8].ToString(), mytable.Rows[11][5].ToString(), mytable.Rows[11][6].ToString(), mytable.Rows[11][11].ToString(), mytable.Rows[11][4].ToString(), mytable.Rows[11][13].ToString(), mytable.Rows[11][14].ToString(), mytable.Rows[11][17].ToString(), mytable.Rows[11][18].ToString(), mytable.Rows[11][19].ToString()) + "')");
                        img12.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img12.Attributes.Remove("onMouseover");
                        img12.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img12.Src = "~/user/images/Empty1.gif";
                    lb12.Text = "";
                    name12.Text = "";
                    img12.Attributes.Remove("onMouseover");
                    img12.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 12)
            {
                if (mytable.Rows[12][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img13.Src = "~/user/images/Empty1.gif";
                    name13.Text = "";
                    //lb13.Text = "Join Now";
                    //name13.Text = mytable.Rows[12][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[12][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[12][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb13.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img13.Attributes.Remove("onMouseover");
                    img13.Attributes.Remove("onMouseout");

                }
                else
                    if (mytable.Rows[12][0].ToString() != "")
                    {
                        lb13.Text = mytable.Rows[12][0].ToString();
                        txtMember = lb13.Text;
                        name13.Text = mytable.Rows[12][1].ToString();
                        name13.ToolTip = mytable.Rows[12][12].ToString();

                        lblInvestmentdata = name13.ToolTip;

                       GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[12][16].ToString(), ref img13);
                        if (txtMember != "")
                        {
                            img13.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[12][1].ToString(), mytable.Rows[12][10].ToString(), mytable.Rows[12][9].ToString(), mytable.Rows[12][7].ToString(), mytable.Rows[12][8].ToString(), mytable.Rows[12][5].ToString(), mytable.Rows[12][6].ToString(), mytable.Rows[12][11].ToString(), mytable.Rows[12][4].ToString(), mytable.Rows[12][13].ToString(), mytable.Rows[12][14].ToString(), mytable.Rows[12][17].ToString(), mytable.Rows[12][18].ToString(), mytable.Rows[12][19].ToString()) + "')");
                            img13.Attributes.Add("onMouseout", "hideddrivetip()");
                        }
                        else
                        {
                            img13.Attributes.Remove("onMouseover");
                            img13.Attributes.Remove("onMouseout");
                        }
                    }
                    else
                    {
                        img13.Src = "~/user/images/Empty1.gif";
                        lb13.Text = "";
                        name13.Text = "";
                        img13.Attributes.Remove("onMouseover");
                        img13.Attributes.Remove("onMouseout");
                        //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                    }
            }

            if (mytable.Rows.Count > 13)
            {
                if (mytable.Rows[13][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img14.Src = "~/user/images/Empty1.gif";
                    name14.Text = "";
                    //lb14.Text = "Join Now";
                    //name14.Text = mytable.Rows[13][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[13][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[13][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb14.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img14.Attributes.Remove("onMouseover");
                    img14.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[13][0].ToString() != "")
                {
                    lb14.Text = mytable.Rows[13][0].ToString();
                    txtMember = lb14.Text;
                    name14.Text = mytable.Rows[13][1].ToString();
                    name14.ToolTip = mytable.Rows[13][12].ToString();

                    lblInvestmentdata = name14.ToolTip;

                    GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[13][16].ToString(), ref img14);
                    if (txtMember != "")
                    {
                        img14.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[13][1].ToString(), mytable.Rows[13][10].ToString(), mytable.Rows[13][9].ToString(), mytable.Rows[13][7].ToString(), mytable.Rows[13][8].ToString(), mytable.Rows[13][5].ToString(), mytable.Rows[13][6].ToString(), mytable.Rows[13][11].ToString(), mytable.Rows[13][4].ToString(), mytable.Rows[13][13].ToString(), mytable.Rows[13][14].ToString(), mytable.Rows[13][17].ToString(), mytable.Rows[13][18].ToString(), mytable.Rows[13][19].ToString()) + "')");
                        img14.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img14.Attributes.Remove("onMouseover");
                        img14.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img14.Src = "~/user/images/Empty1.gif";
                    lb14.Text = "";
                    name14.Text = "";
                    img14.Attributes.Remove("onMouseover");
                    img14.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }

            if (mytable.Rows.Count > 14)
            {
                if (mytable.Rows[14][0].ToString().StartsWith("Blank-JoinNow"))
                {
                    img15.Src = "~/user/images/Empty1.gif";
                    name15.Text = "";
                    //lb15.Text = "Join Now";
                    //name15.Text = mytable.Rows[14][0].ToString().Replace("Blank-JoinNow", "");
                    xx = mytable.Rows[14][0].ToString().Replace("Blank-JoinNow", "").Substring(5, mytable.Rows[14][0].ToString().Replace("Blank-JoinNow", "").Length - 5).Split('=');
                    yy = xx[0] + " - " + xx[1] + " - " + xx[2];
                    MYSTR = "#";
                    ZZ = xx[0].IndexOf(MYSTR);
                    spnsrid = xx[0].Substring(0, ZZ);
                    ZZ1 = xx[1].IndexOf(MYSTR);
                    Prntid = xx[1].Substring(0, ZZ1);
                    side = xx[2].ToString();
                    lb15.Text = "<div> <a href =../Registration.aspx?sid=" + spnsrid + "&Pid=" + Prntid + "&side=" + side + " Target='_blank' >" + "Join Now" + "</a>  <div>";
                    img15.Attributes.Remove("onMouseover");
                    img15.Attributes.Remove("onMouseout");

                }
                else if (mytable.Rows[14][0].ToString() != "")
                {
                    lb15.Text = mytable.Rows[14][0].ToString();
                    txtMember = lb15.Text;
                    name15.Text = mytable.Rows[14][1].ToString();
                    name15.ToolTip = mytable.Rows[14][12].ToString();

                    lblInvestmentdata = name15.ToolTip;

                   GetStatuspay(lblInvestmentdata, lbljuicyclub, txtMember, mytable.Rows[14][16].ToString(), ref img15);
                    if (txtMember != "")
                    {
                        img15.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[14][1].ToString(), mytable.Rows[14][10].ToString(), mytable.Rows[14][9].ToString(), mytable.Rows[14][7].ToString(), mytable.Rows[14][8].ToString(), mytable.Rows[14][5].ToString(), mytable.Rows[14][6].ToString(), mytable.Rows[14][11].ToString(), mytable.Rows[14][4].ToString(), mytable.Rows[14][13].ToString(), mytable.Rows[14][14].ToString(), mytable.Rows[14][17].ToString(), mytable.Rows[14][18].ToString(), mytable.Rows[14][19].ToString()) + "')");
                        img15.Attributes.Add("onMouseout", "hideddrivetip()");
                    }
                    else
                    {
                        img15.Attributes.Remove("onMouseover");
                        img15.Attributes.Remove("onMouseout");
                    }
                }
                else
                {
                    img15.Src = "~/user/images/Empty1.gif";
                    lb15.Text = "";
                    name15.Text = "";
                    img15.Attributes.Remove("onMouseover");
                    img15.Attributes.Remove("onMouseout");
                    //Response.Redirect("../Registration.aspx?sponserid='" + Session["UserCode"].ToString() + "'&ParentID='" + txtMember + "'");
                }
            }



           
        }

        private string getString(String MemberName, String IntroducerCode, String TopUpDate, String LeftPV, String RightPV, String LeftCount, String RIghtCount, String JoiningType, String ActiveStatus, String MyC, String MyD, String Leftfistpurchase, String Rightfistpurchase, String ConfirmDate)
        {
            //<tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>PV</strong></font></td><td width=180px height=10px>LEFT :" + LeftPV + ", RIGHT :" + RightPV + " </td></tr>
            String x = "<table width=300 border=0 cellpadding=5 cellspacing=1 bgcolor=#CCCCCC><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>Member Name</strong></font></td><td width=180px height=10px>" + MemberName + "</td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>Introducer ID</strong></font></td><td width=180px height=10px>" + IntroducerCode + "</td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>Joining BV</strong></font></td><td width=180px height=10px>" + JoiningType.Replace(".0000", "") + "</td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>TopUp Date</strong></font></td><td width=180px height=10px>" + (Convert.ToString(TopUpDate)) + "&nbsp;</td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>Leg Count</strong></font></td><td width=180px height=10px>LEFT :" + LeftCount + ", RIGHT :" + RIghtCount + " </td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>First Purchase</strong></font></td><td width=180px height=10px>LEFT :" + Leftfistpurchase + ", RIGHT :" + Rightfistpurchase + " </td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>RePurchase</strong></font></td><td width=180px height=10px>LEFT :" + LeftPV + ", RIGHT :" + RightPV + " </td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>Activation Date</strong></font></td><td width=180px height=10px>" + (Convert.ToString(ConfirmDate)) + "&nbsp;</td></tr></TABLE>";//<td width=180px height=10px>" + JoiningType + "&nbsp;</td></tr><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>ActiveStatus</strong></font></td><td width=180px height=10px>" + ActiveStatus + "&nbsp;</td></tr></table>";<tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>Mobile No</strong></font></td><td>" + MyD + "</td></TR><tr><td width=120px height=10px bgcolor=#d38dc3><font color=#FFFFFF><strong>PV</strong></font></td><td width=180px height=10px>LEFT :" + LeftPV + ", RIGHT :" + RightPV + " </td></tr>
            return x;
        }
        public void GetStatuspay(String lblInvestmentdata, String lbljuicyclub, String txtMember, String Status, ref HtmlImage img)
        {
          
            Int64 lblinvestment = lblInvestmentdata ==""?0:long.Parse(lblInvestmentdata.Replace(".00",""));
            if (lblinvestment == 0 && txtMember != "")
            {
                img.Src = "~/user/images/user2.png"; /*11a.gif*/
            }
           
            else if (lblinvestment > 0 && txtMember != "")
            {
                img.Src = "~/user/images/user3.png"; /*11a.gif*/
            }
           

          
            else
            {
                img.Src = "~/user/images/Empty1.gif";
                img.Attributes.Remove("onMouseover");
                img.Attributes.Remove("onMouseout");
            }

            if (Status == "Deactivate" && img.Src != "~/user/images/Empty1.gif")
            {
                img.Src = "~/user/images/11a.gif";
            }
          
        }



        protected void id1_Click1(object sender, EventArgs e)
        {
            if (id1.Text == Session["UserCode"].ToString())
            {
                //Response.Redirect("Tree.aspx?mid=" + id1.Text);
                return;
            }
            SqlCommand cmd = new SqlCommand("select MemberId from tblTreeMaster where LeftChild = @lc or RightChild = @lc", conn);
            cmd.Parameters.AddWithValue("lc", id1.Text);
            try
            {
                conn.Open();
                String pmid = cmd.ExecuteScalar().ToString();
                conn.Close();
                //Response.Redirect("Tree.aspx?mid=" + pmid);
                Session["mid"] = pmid.ToString();
            }
            catch (Exception)
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    //Response.Redirect("Tree.aspx?mid=" + id1.Text);
                    return;
                }

            }
            HomeData();
        }


        
        protected void lb2_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb2.Text;
            HomeData();
          
        }

        protected void lb3_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb3.Text;
            HomeData();
         
        }

        protected void lb4_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb4.Text;
            HomeData();
           
        }

        protected void lb5_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb5.Text;
            HomeData();
            
        }

        protected void lb6_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb6.Text;
            HomeData();
            
        }

        protected void lb7_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb7.Text;
            HomeData();
            
        }

        protected void lb8_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb8.Text;
            HomeData();
         
        }

        protected void lb9_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb9.Text;
            HomeData();
       
        }

        protected void lb10_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb10.Text;
            HomeData(); 
            
        }

        protected void lb11_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb11.Text;
            HomeData();
           
        }

        protected void lb12_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb12.Text;
            HomeData();
            
        }

        protected void lb13_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb13.Text;
            HomeData();
            
        }

        protected void lb14_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb14.Text;
            HomeData();
          
        }

        protected void lb15_Click(object sender, EventArgs e)
        {
            Session["mid"] = lb15.Text;
            HomeData();
             
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select isnull(count(*),0) from esc.MyDownline('" + Session["UserCode"].ToString() + "') where UserCode='" + TextBox1.Text + "';", conn);
            conn.Open();
            int x = int.Parse(cmd.ExecuteScalar().ToString());
            conn.Close();
            if (x > 0)
            {
                    Session["Mid"] = TextBox1.Text.ToString();
                    HomeData();
                    Label2.Text = "";
            }
            else
            {
                Label2.Text = "Invalid Membership ID";
            }
            conn.Close();

        }

        
        protected void Button3_Click()
        {
        }
                
        
    }
}