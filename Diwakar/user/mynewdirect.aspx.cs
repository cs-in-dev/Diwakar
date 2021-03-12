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
    String TopUpAmount = "";
    String lblInvestmentdata = "";
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
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        if (!IsPostBack)
        {
            CurrentPage.Value = "1";
            if (Session["Usercode"] == null)
            {
               Response.Write("default.aspx");
            }
            HomeData(Session["Usercode"].ToString());

        }
    }

    void BuildDownline(ref DataTable mytable, ref DataSet ds, string MemberID)
    {
        DataRow r;
        DataRow[] rows = ds.Tables["Tree"].Select("SponserID='" + MemberID + "'");
        int Count = 1;
        foreach (DataRow item in rows)
        {
            r = mytable.NewRow();
            r[0] = item["MemberID"].ToString();
            r[1] = item["UserName"].ToString();
            r[2] = item["MyTopupDate"].ToString();
            r[3] = item["TotalDownline"].ToString();
            //r[4] = item["DirectBusiness"].ToString();
            //r[5] = item["TotalDownlineBusiness"].ToString();
            r[4] = item["ConfirmDate"].ToString();
            r[5] = item["MyInvestment"].ToString();
            r[6] = item["MyInvestmentCM"].ToString();
            r[7] = item["TotalPairs"].ToString();
            r[8] = item["CMPV"].ToString();

            mytable.Rows.Add(r);
            Count++;
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
            mytable.Rows.Add(r);
            Count++;
        }
    }


    void HomeData(String MemberID)
    {
        if (MemberID == "")
            return;
        DataTable mytable = new DataTable();
        mytable.Columns.Add("Memberid", System.Type.GetType("System.String"));
        mytable.Columns.Add("UserName", System.Type.GetType("System.String"));
        mytable.Columns.Add("MyTopupDate", System.Type.GetType("System.String"));
        mytable.Columns.Add("TotalDownline", System.Type.GetType("System.String"));
        //mytable.Columns.Add("DirectBusiness", System.Type.GetType("System.String"));
        //mytable.Columns.Add("TotalDownlineBusiness", System.Type.GetType("System.String"));
        mytable.Columns.Add("Confirmdate", System.Type.GetType("System.String"));
        mytable.Columns.Add("MyInvestment", System.Type.GetType("System.String"));
        mytable.Columns.Add("MyInvestmentCM", System.Type.GetType("System.String"));
        mytable.Columns.Add("TotalPairs", System.Type.GetType("System.String"));
        mytable.Columns.Add("CMPV", System.Type.GetType("System.String"));

        //and TblTreeMaster.MemberID!=tblTreeMaster.SponserID
        SqlDataAdapter da = new SqlDataAdapter("SELECT TblTreeMaster.MemberID,TblMemberMaster.UserName,TblMemberMaster.SponsorId as SponserID ,Convert(Varchar,tblMemberMaster.DOJ,103) AS MyTopupDate,(cast(totaldirect as int)+cast(totalIndirect as int)) as TotalDownline,tblMemberMaster.Confirmdate,tblMemberMaster.MyInvestment,tblMemberMaster.MyInvestmentCM,tblMemberMaster.TotalPairs,tblMemberMaster.CMPV from TblTreeMaster with (nolock),TblMemberMaster with (nolock) where TblTreeMaster.MemberID=tblMemberMaster.UserCode AND TblTreeMaster.MemberID!=TblTreeMaster.SponserID ", conn);
        da.SelectCommand.CommandTimeout = 0;
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

        SqlCommand cd = new SqlCommand("select *,case when (tblMemberMaster.PinAmount) is null then '' else Convert(Varchar,tblMemberMaster.DOJ,103) end AS MyTopupDate,(select count(*) from tblmatrixmaster with (nolock) where SponserID ='" + MemberID + "' and SponserID!=MemberID )as TotalDownline from tblmembermaster with (nolock) where usercode = '" + MemberID + "'", conn);
        conn.Open();
        da.SelectCommand.CommandTimeout = 0;
        SqlDataReader dr = cd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string mak = dr["username"].ToString();
                string ddlj = (dr["MyTopupDate"].ToString());
                string TotalDownline = dr["TotalDownline"].ToString();
   
                string ConfirmDate = dr["ConfirmDate"].ToString();
                string MyInvestment = dr["MyInvestment"].ToString();
                string MyInvestmentCM = dr["MyInvestmentCM"].ToString();
                string TotalPairs = dr["TotalPairs"].ToString();
                string CMPV = dr["CMPV"].ToString();

                r[1] = mak.ToString();
                r[2] = ddlj;
                r[3] = TotalDownline.ToString();
                //r[4] = DirectBusiness.ToString();
                //r[5] = TotalDownlineBusiness.ToString();
                r[4] = ConfirmDate.ToString();
                r[5] = MyInvestment.ToString();
                r[6] = MyInvestmentCM.ToString();
                r[7] = TotalPairs.ToString();
                r[8] = CMPV.ToString();

            }
        }

        conn.Close();
        //DataRow[] rmak = ds.Tables["Tree"].Select("MemberId='" + MemberID + "'");


        mytable.Rows.Add(r);
        DataRow[] rows = ds.Tables["Tree"].Select("SponserID='" + MemberID + "'");

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
                r[0] = item["MemberID"].ToString();
                r[1] = item["UserName"].ToString();
                r[2] = item["MyTopupDate"].ToString();
                r[3] = item["TotalDownline"].ToString();
                //r[4] = item["DirectBusiness"].ToString();
                //r[5] = item["TotalDownlineBusiness"].ToString();
                r[4] = item["ConfirmDate"].ToString();
                r[5] = item["MyInvestment"].ToString();
                r[6] = item["MyInvestmentCM"].ToString();
                r[7] = item["TotalPairs"].ToString();
                r[8] = item["CMPV"].ToString();

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
            mytable.Rows.Add(r);
            Count++;
        }

        BuildDownline(ref mytable, ref ds, mytable.Rows[1][0].ToString());
        BuildDownline(ref mytable, ref ds, mytable.Rows[2][0].ToString());
        BuildDownline(ref mytable, ref ds, mytable.Rows[3][0].ToString());
        BuildDownline(ref mytable, ref ds, mytable.Rows[4][0].ToString());
        BuildDownline(ref mytable, ref ds, mytable.Rows[5][0].ToString());


        DateTime ddlj1;
       
        String lbljuicyclub = "";


        if (mytable.Rows.Count > 0)
        {

            id1.Text = mytable.Rows[0][0].ToString();
            MemberID = id1.Text;
            if (MemberID != "")
            {
                name1.Text = mytable.Rows[0][1].ToString();
                //ddlj1 = Convert.ToDateTime(mytable.Rows[0][2].ToString());
                lblInvestmentdata = mytable.Rows[0][5].ToString();
               // TopUpAmount = mytable.Rows[0][5].ToString();
                GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img1);
                img1.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[0][0].ToString(), mytable.Rows[0][1].ToString(), mytable.Rows[0][2].ToString(), mytable.Rows[0][3].ToString(), mytable.Rows[0][4].ToString(), mytable.Rows[0][5].ToString(), mytable.Rows[0][6].ToString(), mytable.Rows[0][7].ToString(), mytable.Rows[0][8].ToString()) + "')");
                img1.Attributes.Add("onMouseout", "hideddrivetip()");

            }
            else
            {
                img1.Src = "~/user/images/empty.png";
                name1.Text = "";
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
                lblInvestmentdata = mytable.Rows[1][5].ToString();
                //TopUpAmount = mytable.Rows[1][9].ToString();
                GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img2);
                img2.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[1][0].ToString(), mytable.Rows[1][1].ToString(), mytable.Rows[1][2].ToString(), mytable.Rows[1][3].ToString(), mytable.Rows[1][4].ToString(), mytable.Rows[1][5].ToString(), mytable.Rows[1][6].ToString(), mytable.Rows[1][7].ToString(), mytable.Rows[1][8].ToString()) + "')");
                img2.Attributes.Add("onMouseout", "hideddrivetip()");
            }
            else
            {
                img2.Attributes.Add("onMouseover", " ");
                img2.Src = "~/user/images/empty.png";
                name2.Text = "";
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
                lblInvestmentdata = mytable.Rows[2][5].ToString();
               // TopUpAmount = mytable.Rows[2][9].ToString();
                GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img3);
                img3.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[2][0].ToString(), mytable.Rows[2][1].ToString(), mytable.Rows[2][2].ToString(), mytable.Rows[2][3].ToString(), mytable.Rows[2][4].ToString(), mytable.Rows[2][5].ToString(), mytable.Rows[2][6].ToString(), mytable.Rows[2][7].ToString(), mytable.Rows[2][8].ToString()) + "')");
                img3.Attributes.Add("onMouseout", "hideddrivetip()");
            }
            else
            {
                img3.Attributes.Add("onMouseover", " ");
                img3.Src = "~/user/images/empty.png";
                name3.Text = "";
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
                lblInvestmentdata = mytable.Rows[3][5].ToString();
               // TopUpAmount = mytable.Rows[3][9].ToString();
                GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img4);
                img4.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[3][0].ToString(), mytable.Rows[3][1].ToString(), mytable.Rows[3][2].ToString(), mytable.Rows[3][3].ToString(), mytable.Rows[3][4].ToString(), mytable.Rows[3][5].ToString(), mytable.Rows[3][6].ToString(), mytable.Rows[3][7].ToString(), mytable.Rows[3][8].ToString()) + "')");
                img4.Attributes.Add("onMouseout", "hideddrivetip()");
            }
            else
            {
                img4.Attributes.Add("onMouseover", " ");
                img4.Src = "~/user/images/empty.png";
                name4.Text = "";
            }

        }

        if (mytable.Rows.Count > 4)
        {
            lb5.Text = mytable.Rows[4][0].ToString();
            MemberID = lb5.Text;
            if (MemberID != "")
            {
                name5.Text = mytable.Rows[4][1].ToString();
                //ddlj1 = Convert.ToDateTime(mytable.Rows[4][2].ToString());
                lblInvestmentdata = mytable.Rows[4][5].ToString();
               // TopUpAmount = mytable.Rows[4][9].ToString();
                GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img5);
                img5.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[4][0].ToString(), mytable.Rows[4][1].ToString(), mytable.Rows[4][2].ToString(), mytable.Rows[4][3].ToString(), mytable.Rows[4][4].ToString(), mytable.Rows[4][5].ToString(), mytable.Rows[4][6].ToString(), mytable.Rows[4][7].ToString(), mytable.Rows[4][8].ToString()) + "')");
                img5.Attributes.Add("onMouseout", "hideddrivetip()");
            }
            else
            {
                img5.Attributes.Add("onMouseover", " ");
                img5.Src = "~/user/images/empty.png";
                name5.Text = "";
            }


            if (mytable.Rows.Count > 5)
            {
                lb6.Text = mytable.Rows[5][0].ToString();
                MemberID = lb6.Text;
                if (MemberID != "")
                {
                    name6.Text = mytable.Rows[5][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[5][2].ToString());
                    lblInvestmentdata = mytable.Rows[5][5].ToString();
                   // TopUpAmount = mytable.Rows[5][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img6);
                    img6.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[5][0].ToString(), mytable.Rows[5][1].ToString(), mytable.Rows[5][2].ToString(), mytable.Rows[5][3].ToString(), mytable.Rows[5][4].ToString(), mytable.Rows[5][5].ToString(), mytable.Rows[5][6].ToString(), mytable.Rows[5][7].ToString(), mytable.Rows[5][8].ToString()) + "')");
                    img6.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img6.Attributes.Add("onMouseover", " ");
                    img6.Src = "~/user/images/empty.png";
                    name6.Text = "";
                }

            }

            if (mytable.Rows.Count > 6)
            {

                lb7.Text = mytable.Rows[6][0].ToString();
                MemberID = lb7.Text;
                if (MemberID != "")
                {
                    name7.Text = mytable.Rows[6][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[6][2].ToString());
                    lblInvestmentdata = mytable.Rows[6][5].ToString();
                   // TopUpAmount = mytable.Rows[6][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img7);
                    img7.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[6][0].ToString(), mytable.Rows[6][1].ToString(), mytable.Rows[6][2].ToString(), mytable.Rows[6][3].ToString(), mytable.Rows[6][4].ToString(), mytable.Rows[6][5].ToString(), mytable.Rows[6][6].ToString(), mytable.Rows[6][7].ToString(), mytable.Rows[6][8].ToString()) + "')");
                    img7.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img7.Attributes.Add("onMouseover", " ");
                    img7.Src = "~/user/images/empty.png";
                    name7.Text = "";
                }


            }

            if (mytable.Rows.Count > 7)
            {

                lb8.Text = mytable.Rows[7][0].ToString();
                MemberID = lb8.Text;
                if (MemberID != "")
                {
                    name8.Text = mytable.Rows[7][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[7][2].ToString());
                    lblInvestmentdata = mytable.Rows[7][5].ToString();
                   // TopUpAmount = mytable.Rows[7][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img8);
                    img8.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[7][0].ToString(), mytable.Rows[7][1].ToString(), mytable.Rows[7][2].ToString(), mytable.Rows[7][3].ToString(), mytable.Rows[7][4].ToString(), mytable.Rows[7][5].ToString(), mytable.Rows[7][6].ToString(), mytable.Rows[7][7].ToString(), mytable.Rows[7][8].ToString()) + "')");
                    img8.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img8.Attributes.Add("onMouseover", " ");
                    img8.Src = "~/user/images/empty.png";
                    name8.Text = "";
                }

            }

            if (mytable.Rows.Count > 8)
            {
                lb9.Text = mytable.Rows[8][0].ToString();
                MemberID = lb9.Text;
                if (MemberID != "")
                {
                    name9.Text = mytable.Rows[8][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[8][2].ToString());
                    lblInvestmentdata = mytable.Rows[8][5].ToString();
                  //  TopUpAmount = mytable.Rows[8][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img9);
                    img9.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[8][0].ToString(), mytable.Rows[8][1].ToString(), mytable.Rows[8][2].ToString(), mytable.Rows[8][3].ToString(), mytable.Rows[8][4].ToString(), mytable.Rows[8][5].ToString(), mytable.Rows[8][6].ToString(), mytable.Rows[8][7].ToString(), mytable.Rows[8][8].ToString()) + "')");
                    img9.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img9.Attributes.Add("onMouseover", " ");
                    img9.Src = "~/user/images/empty.png";
                    name9.Text = "";
                }
            }

            if (mytable.Rows.Count > 9)
            {
                lb10.Text = mytable.Rows[9][0].ToString();
                MemberID = lb10.Text;
                if (MemberID != "")
                {
                    name10.Text = mytable.Rows[9][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[9][2].ToString());
                    lblInvestmentdata = mytable.Rows[9][5].ToString();
                 //   TopUpAmount = mytable.Rows[9][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img10);
                    img10.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[9][0].ToString(), mytable.Rows[9][1].ToString(), mytable.Rows[9][2].ToString(), mytable.Rows[9][3].ToString(), mytable.Rows[9][4].ToString(), mytable.Rows[9][5].ToString(), mytable.Rows[9][6].ToString(), mytable.Rows[9][7].ToString(), mytable.Rows[9][8].ToString()) + "')");
                    img10.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img10.Attributes.Add("onMouseover", " ");
                    img10.Src = "~/user/images/empty.png";
                    name10.Text = "";
                }

            }

            if (mytable.Rows.Count > 10)
            {
                lb11.Text = mytable.Rows[10][0].ToString();
                MemberID = lb11.Text;
                if (MemberID != "")
                {
                    name11.Text = mytable.Rows[10][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[10][2].ToString());
                    lblInvestmentdata = mytable.Rows[10][5].ToString();
                   // TopUpAmount = mytable.Rows[10][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img11);
                    img11.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[10][0].ToString(), mytable.Rows[10][1].ToString(), mytable.Rows[10][2].ToString(), mytable.Rows[10][3].ToString(), mytable.Rows[10][4].ToString(), mytable.Rows[10][5].ToString(), mytable.Rows[10][6].ToString(), mytable.Rows[10][7].ToString(), mytable.Rows[10][8].ToString()) + "')");
                    img11.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img11.Attributes.Add("onMouseover", " ");
                    img11.Src = "~/user/images/empty.png";
                    name11.Text = "";
                }


            }

            if (mytable.Rows.Count > 11)
            {
                lb12.Text = mytable.Rows[11][0].ToString();
                MemberID = lb12.Text;
                if (MemberID != "")
                {
                    name12.Text = mytable.Rows[11][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[11][2].ToString());
                    lblInvestmentdata = mytable.Rows[11][5].ToString();
                   // TopUpAmount = mytable.Rows[11][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img12);
                    img12.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[11][0].ToString(), mytable.Rows[11][1].ToString(), mytable.Rows[11][2].ToString(), mytable.Rows[11][3].ToString(), mytable.Rows[11][4].ToString(), mytable.Rows[11][5].ToString(), mytable.Rows[11][6].ToString(), mytable.Rows[11][7].ToString(), mytable.Rows[11][8].ToString()) + "')");
                    img12.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img12.Attributes.Add("onMouseover", " ");
                    img12.Src = "~/user/images/empty.png";
                    name12.Text = "";
                }

            }

            if (mytable.Rows.Count > 12)
            {
                lb13.Text = mytable.Rows[12][0].ToString();
                MemberID = lb13.Text;
                if (MemberID != "")
                {
                    name13.Text = mytable.Rows[12][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[12][5].ToString();
                   // TopUpAmount = mytable.Rows[12][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img13);
                    img13.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[12][0].ToString(), mytable.Rows[12][1].ToString(), mytable.Rows[12][2].ToString(), mytable.Rows[12][3].ToString(), mytable.Rows[12][4].ToString(), mytable.Rows[12][5].ToString(), mytable.Rows[12][6].ToString(), mytable.Rows[12][7].ToString(), mytable.Rows[12][8].ToString()) + "')");
                    img13.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img13.Attributes.Add("onMouseover", " ");
                    img13.Src = "~/user/images/empty.png";
                    name13.Text = "";
                }


            }


            if (mytable.Rows.Count > 13)
            {
                lb14.Text = mytable.Rows[13][0].ToString();
                MemberID = lb14.Text;
                if (MemberID != "")
                {
                    name14.Text = mytable.Rows[13][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[13][5].ToString();
                  //  TopUpAmount = mytable.Rows[13][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img14);
                    img14.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[13][0].ToString(), mytable.Rows[13][1].ToString(), mytable.Rows[13][2].ToString(), mytable.Rows[13][3].ToString(), mytable.Rows[13][4].ToString(), mytable.Rows[13][5].ToString(), mytable.Rows[13][6].ToString(), mytable.Rows[13][7].ToString(), mytable.Rows[13][8].ToString()) + "')");
                    img14.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img14.Attributes.Add("onMouseover", " ");
                    img14.Src = "~/user/images/empty.png";
                    name14.Text = "";
                }
            }


            if (mytable.Rows.Count > 14)
            {
                lb15.Text = mytable.Rows[14][0].ToString();
                MemberID = lb15.Text;
                if (MemberID != "")
                {
                    name15.Text = mytable.Rows[14][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[14][5].ToString();
                  //  TopUpAmount = mytable.Rows[14][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img15);
                    img15.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[14][0].ToString(), mytable.Rows[14][1].ToString(), mytable.Rows[14][2].ToString(), mytable.Rows[14][3].ToString(), mytable.Rows[14][4].ToString(), mytable.Rows[14][5].ToString(), mytable.Rows[14][6].ToString(), mytable.Rows[14][7].ToString(), mytable.Rows[14][8].ToString()) + "')");
                    img15.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {

                    img15.Attributes.Add("onMouseover", " ");
                    img15.Src = "~/user/images/empty.png";
                    name15.Text = "";
                }

            }


            if (mytable.Rows.Count > 15)
            {
                lb16.Text = mytable.Rows[15][0].ToString();
                MemberID = lb16.Text;
                if (MemberID != "")
                {
                    name16.Text = mytable.Rows[15][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[15][5].ToString();
                  //  TopUpAmount = mytable.Rows[15][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img16);
                    img16.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[15][0].ToString(), mytable.Rows[15][1].ToString(), mytable.Rows[15][2].ToString(), mytable.Rows[15][3].ToString(), mytable.Rows[15][4].ToString(), mytable.Rows[15][5].ToString(), mytable.Rows[15][6].ToString(), mytable.Rows[15][7].ToString(), mytable.Rows[15][8].ToString()) + "')");
                    img16.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img16.Attributes.Add("onMouseover", " ");
                    img16.Src = "~/user/images/empty.png";
                    name16.Text = "";
                }


            }


            if (mytable.Rows.Count > 16)
            {
                lb17.Text = mytable.Rows[16][0].ToString();
                MemberID = lb17.Text;
                if (MemberID != "")
                {
                    name17.Text = mytable.Rows[16][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[16][5].ToString();
                  //  TopUpAmount = mytable.Rows[16][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img17);
                    img17.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[16][0].ToString(), mytable.Rows[16][1].ToString(), mytable.Rows[16][2].ToString(), mytable.Rows[16][3].ToString(), mytable.Rows[16][4].ToString(), mytable.Rows[16][5].ToString(), mytable.Rows[16][6].ToString(), mytable.Rows[16][7].ToString(), mytable.Rows[16][8].ToString()) + "')");
                    img17.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img17.Attributes.Add("onMouseover", " ");
                    img17.Src = "~/user/images/empty.png";
                    name17.Text = "";
                }


            }


            if (mytable.Rows.Count > 17)
            {
                lb18.Text = mytable.Rows[17][0].ToString();
                MemberID = lb18.Text;
                if (MemberID != "")
                {
                    name18.Text = mytable.Rows[17][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[17][5].ToString();
                   // TopUpAmount = mytable.Rows[17][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img18);
                    img18.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[17][0].ToString(), mytable.Rows[17][1].ToString(), mytable.Rows[17][2].ToString(), mytable.Rows[17][3].ToString(), mytable.Rows[17][4].ToString(), mytable.Rows[17][5].ToString(), mytable.Rows[17][6].ToString(), mytable.Rows[17][7].ToString(), mytable.Rows[17][8].ToString()) + "')");
                    img18.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img18.Attributes.Add("onMouseover", " ");
                    img18.Src = "~/user/images/empty.png";
                    name18.Text = "";
                }


            }

            if (mytable.Rows.Count > 18)
            {
                lb19.Text = mytable.Rows[18][0].ToString();
                MemberID = lb19.Text;
                if (MemberID != "")
                {
                    name19.Text = mytable.Rows[18][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[18][5].ToString();
                  //  TopUpAmount = mytable.Rows[18][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img19);
                    img19.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[18][0].ToString(), mytable.Rows[18][1].ToString(), mytable.Rows[18][2].ToString(), mytable.Rows[18][3].ToString(), mytable.Rows[18][4].ToString(), mytable.Rows[18][5].ToString(), mytable.Rows[18][6].ToString(), mytable.Rows[18][7].ToString(), mytable.Rows[18][8].ToString()) + "')");
                    img19.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img19.Attributes.Add("onMouseover", " ");
                    img19.Src = "~/user/images/empty.png";
                    name19.Text = "";
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
                    lblInvestmentdata = mytable.Rows[19][5].ToString();
                   // TopUpAmount = mytable.Rows[19][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img20);
                    img20.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[19][0].ToString(), mytable.Rows[19][1].ToString(), mytable.Rows[19][2].ToString(), mytable.Rows[19][3].ToString(), mytable.Rows[19][4].ToString(), mytable.Rows[19][5].ToString(), mytable.Rows[19][6].ToString(), mytable.Rows[19][7].ToString(), mytable.Rows[19][8].ToString()) + "')");
                    img20.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img20.Attributes.Add("onMouseover", " ");
                    img20.Src = "~/user/images/empty.png";
                    name20.Text = "";
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
                    lblInvestmentdata = mytable.Rows[20][5].ToString();
                 //   TopUpAmount = mytable.Rows[20][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img21);
                    img21.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[20][0].ToString(), mytable.Rows[20][1].ToString(), mytable.Rows[20][2].ToString(), mytable.Rows[20][3].ToString(), mytable.Rows[20][4].ToString(), mytable.Rows[20][5].ToString(), mytable.Rows[20][6].ToString(), mytable.Rows[20][7].ToString(), mytable.Rows[20][8].ToString()) + "')");
                    img21.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img21.Attributes.Add("onMouseover", " ");
                    img21.Src = "~/user/images/empty.png";
                    name21.Text = "";
                }


            }

            if (mytable.Rows.Count > 21)
            {
                LinkButton3.Text = mytable.Rows[21][0].ToString();
                MemberID = LinkButton3.Text;
                if (MemberID != "")
                {
                    Label3.Text = mytable.Rows[21][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[21][5].ToString();
                  //  TopUpAmount = mytable.Rows[21][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img22);
                    img22.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[21][0].ToString(), mytable.Rows[21][1].ToString(), mytable.Rows[21][2].ToString(), mytable.Rows[21][3].ToString(), mytable.Rows[21][4].ToString(), mytable.Rows[21][5].ToString(), mytable.Rows[21][6].ToString(), mytable.Rows[21][7].ToString(), mytable.Rows[21][8].ToString()) + "')");
                    img22.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img22.Attributes.Add("onMouseover", " ");
                    img22.Src = "~/user/images/empty.png";
                    Label3.Text = "";
                }


            }

            if (mytable.Rows.Count > 22)
            {
                LinkButton4.Text = mytable.Rows[22][0].ToString();
                MemberID = LinkButton4.Text;
                if (MemberID != "")
                {
                    Label4.Text = mytable.Rows[22][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[22][5].ToString();
                  //  TopUpAmount = mytable.Rows[22][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img23);
                    img23.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[22][0].ToString(), mytable.Rows[22][1].ToString(), mytable.Rows[22][2].ToString(), mytable.Rows[22][3].ToString(), mytable.Rows[22][4].ToString(), mytable.Rows[22][5].ToString(), mytable.Rows[22][6].ToString(), mytable.Rows[22][7].ToString(), mytable.Rows[22][8].ToString()) + "')");
                    img23.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img23.Attributes.Add("onMouseover", " ");
                    img23.Src = "~/user/images/empty.png";
                    Label4.Text = "";
                }


            }

            if (mytable.Rows.Count > 23)
            {
                LinkButton5.Text = mytable.Rows[23][0].ToString();
                MemberID = LinkButton5.Text;
                if (MemberID != "")
                {
                    Label5.Text = mytable.Rows[23][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[23][5].ToString();
                   // TopUpAmount = mytable.Rows[23][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img24);
                    img24.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[23][0].ToString(), mytable.Rows[23][1].ToString(), mytable.Rows[23][2].ToString(), mytable.Rows[23][3].ToString(), mytable.Rows[23][4].ToString(), mytable.Rows[23][5].ToString(), mytable.Rows[23][6].ToString(), mytable.Rows[23][7].ToString(), mytable.Rows[23][8].ToString()) + "')");
                    img24.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img24.Attributes.Add("onMouseover", " ");
                    img24.Src = "~/user/images/empty.png";
                    Label5.Text = "";
                }


            }

            if (mytable.Rows.Count > 24)
            {
                LinkButton6.Text = mytable.Rows[24][0].ToString();
                MemberID = LinkButton6.Text;
                if (MemberID != "")
                {
                    Label6.Text = mytable.Rows[24][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[24][5].ToString();
                   // TopUpAmount = mytable.Rows[24][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img25);
                    img25.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[24][0].ToString(), mytable.Rows[24][1].ToString(), mytable.Rows[24][2].ToString(), mytable.Rows[24][3].ToString(), mytable.Rows[24][4].ToString(), mytable.Rows[24][5].ToString(), mytable.Rows[24][6].ToString(), mytable.Rows[24][7].ToString(), mytable.Rows[24][8].ToString()) + "')");
                    img25.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img25.Attributes.Add("onMouseover", " ");
                    img25.Src = "~/user/images/empty.png";
                    Label6.Text = "";
                }


            }
            if (mytable.Rows.Count > 25)
            {
                LinkButton7.Text = mytable.Rows[25][0].ToString();
                MemberID = LinkButton7.Text;
                if (MemberID != "")
                {
                    Label7.Text = mytable.Rows[25][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[25][5].ToString();
                  //  TopUpAmount = mytable.Rows[25][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img26);
                    img26.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[25][0].ToString(), mytable.Rows[25][1].ToString(), mytable.Rows[25][2].ToString(), mytable.Rows[25][3].ToString(), mytable.Rows[25][4].ToString(), mytable.Rows[25][5].ToString(), mytable.Rows[25][6].ToString(), mytable.Rows[25][7].ToString(), mytable.Rows[25][8].ToString()) + "')");
                    img26.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img26.Attributes.Add("onMouseover", " ");
                    img26.Src = "~/user/images/empty.png";
                    Label7.Text = "";
                }


            }

            if (mytable.Rows.Count > 26)
            {
                LinkButton8.Text = mytable.Rows[26][0].ToString();
                MemberID = LinkButton8.Text;
                if (MemberID != "")
                {
                    Label8.Text = mytable.Rows[26][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[26][5].ToString();
                   // TopUpAmount = mytable.Rows[26][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img27);
                    img27.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[26][0].ToString(), mytable.Rows[26][1].ToString(), mytable.Rows[26][2].ToString(), mytable.Rows[26][3].ToString(), mytable.Rows[26][4].ToString(), mytable.Rows[26][5].ToString(), mytable.Rows[26][6].ToString(), mytable.Rows[26][7].ToString(), mytable.Rows[26][8].ToString()) + "')");
                    img27.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img27.Attributes.Add("onMouseover", " ");
                    img27.Src = "~/user/images/empty.png";
                    Label8.Text = "";
                }


            }

            if (mytable.Rows.Count > 27)
            {
                LinkButton9.Text = mytable.Rows[27][0].ToString();
                MemberID = LinkButton9.Text;
                if (MemberID != "")
                {
                    Label9.Text = mytable.Rows[27][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[27][5].ToString();
                  //  TopUpAmount = mytable.Rows[27][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img28);
                    img28.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[27][0].ToString(), mytable.Rows[27][1].ToString(), mytable.Rows[27][2].ToString(), mytable.Rows[27][3].ToString(), mytable.Rows[27][4].ToString(), mytable.Rows[27][5].ToString(), mytable.Rows[27][6].ToString(), mytable.Rows[27][7].ToString(), mytable.Rows[27][8].ToString()) + "')");
                    img28.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img28.Attributes.Add("onMouseover", " ");
                    img28.Src = "~/user/images/empty.png";
                    Label9.Text = "";
                }
            }

            if (mytable.Rows.Count > 28)
            {
                LinkButton10.Text = mytable.Rows[28][0].ToString();
                MemberID = LinkButton10.Text;
                if (MemberID != "")
                {
                    Label10.Text = mytable.Rows[28][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[28][5].ToString();
                //    TopUpAmount = mytable.Rows[28][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img29);
                    img29.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[28][0].ToString(), mytable.Rows[28][1].ToString(), mytable.Rows[28][2].ToString(), mytable.Rows[28][3].ToString(), mytable.Rows[28][4].ToString(), mytable.Rows[28][5].ToString(), mytable.Rows[28][6].ToString(), mytable.Rows[28][7].ToString(), mytable.Rows[28][8].ToString()) + "')");
                    img29.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img29.Attributes.Add("onMouseover", " ");
                    img29.Src = "~/user/images/empty.png";
                    Label10.Text = "";
                }

            }

            if (mytable.Rows.Count > 29)
            {
                LinkButton11.Text = mytable.Rows[29][0].ToString();
                MemberID = LinkButton3.Text;
                if (MemberID != "")
                {
                    Label11.Text = mytable.Rows[29][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[29][5].ToString();
                    TopUpAmount = mytable.Rows[29][9].ToString();
                  //  GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img30);
                    img30.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[29][0].ToString(), mytable.Rows[29][1].ToString(), mytable.Rows[29][2].ToString(), mytable.Rows[29][3].ToString(), mytable.Rows[29][4].ToString(), mytable.Rows[29][5].ToString(), mytable.Rows[29][6].ToString(), mytable.Rows[29][7].ToString(), mytable.Rows[29][8].ToString()) + "')");
                    img30.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img30.Attributes.Add("onMouseover", " ");
                    img30.Src = "~/user/images/empty.png";
                    Label11.Text = "";
                }
            }

            if (mytable.Rows.Count > 30)
            {
                LinkButton12.Text = mytable.Rows[30][0].ToString();
                MemberID = LinkButton12.Text;
                if (MemberID != "")
                {
                    Label12.Text = mytable.Rows[30][1].ToString();
                    //ddlj1 = Convert.ToDateTime(mytable.Rows[12][2].ToString());
                    lblInvestmentdata = mytable.Rows[30][5].ToString();
                   // TopUpAmount = mytable.Rows[30][9].ToString();
                    GetStatuspay(lblInvestmentdata, lbljuicyclub, MemberID, ref img31);
                    img31.Attributes.Add("onMouseover", "ddrivetip('" + getString(mytable.Rows[30][0].ToString(), mytable.Rows[30][1].ToString(), mytable.Rows[30][2].ToString(), mytable.Rows[30][3].ToString(), mytable.Rows[30][4].ToString(), mytable.Rows[30][5].ToString(), mytable.Rows[30][6].ToString(), mytable.Rows[30][7].ToString(), mytable.Rows[30][8].ToString()) + "')");
                    img31.Attributes.Add("onMouseout", "hideddrivetip()");
                }
                else
                {
                    img31.Attributes.Add("onMouseover", " ");
                    img31.Src = "~/user/images/empty.png";
                    Label12.Text = "";
                }
            }
        }
    }


    private string getString(String IntroducerCode, String MemberName, String DOJ, String TotalDownline, String Confirmationdate, String MyInvestment, String MyInvestmentCM, String TotalPairs, String CMPV)
    {
        String x = "<table width=300 border=0 cellpadding=5 cellspacing=1 bgcolor=#e4e4e4><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Member ID</strong></font></td><td width=180px height=10px>" + IntroducerCode + "</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Member Name</strong></font></td><td width=180px height=10px>" + MemberName + "</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>DOJ</strong></font></td><td width=180px height=10px>" + DOJ.Replace(" 12:00:00 AM", "") + "&nbsp;</td></tr><tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Total Downline</strong></font></td><td width=180px height=10px>" + TotalDownline + "&nbsp;</td>  <tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Self Purchase</strong></font></td><td width=180px height=10px>" + MyInvestment + "&nbsp;</td></tr></tr>  <tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Self Purchase CM</strong></font></td><td width=180px height=10px>" + MyInvestmentCM + "&nbsp;</td></tr></tr> <tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Downline Purchase</strong></font></td><td width=180px height=10px>" + TotalPairs + "&nbsp;</td></tr></tr> <tr><td width=120px height=10px bgcolor=#e4e4e4><font color=#333><strong>Downline Purchase CM</strong></font></td><td width=180px height=10px>" + CMPV + "&nbsp;</td></tr></tr></table>";
        return x;
    }
    public void GetStatuspay(String lblInvestmentdata, String lbljuicyclub, String MemberID, ref HtmlImage img)
    {

        // Int64 lblinvestment = lblInvestmentdata == "" ? 0 : long.Parse(lblInvestmentdata.Replace(".0000", ""));
         decimal lblinvestment = lblInvestmentdata == "" ? 0 : decimal.Parse(lblInvestmentdata.Replace(".0000", ""));
        if (lblinvestment > 0 && MemberID != "")
        {
            img.Src = "~/user/images/3.png"; 
        }
        else
        {
            img.Src = "~/user/images/11.png";
        }
         
        // img.Src = "~/user/images/green.png";


    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    SqlCommand cmd = new SqlCommand("select ISNULL(Count(*),0) from dbo.MyEndorseDownline('" + Session["UserCode"].ToString() + "') where MemberID='" + TextBox2.Text + "'", conn); //Session["UserCode"].ToString()
    //    conn.Open();
    //    int x = int.Parse(cmd.ExecuteScalar().ToString());
    //    conn.Close();
    //    if (x > 0)
    //    {
    //        Session["MidT"] = TextBox2.Text.Trim().ToString();
    //        HomeData(Session["MidT"].ToString());
    //        Label2.Text = "";
    //    }
    //    else
    //    {
    //        Label2.Text = "Invalid Membership ID";
    //    }
    //    conn.Close();

    //}

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

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton3.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton4.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton5.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton6.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton7.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton8.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton9.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton10.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton11.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Session["midT"] = LinkButton12.Text;
        CurrentPage.Value = "1";
        HomeData(Session["midT"].ToString());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select isnull(count(*),0) from tblmatrixmaster with (nolock) where memberId=@memberId and SponserID=@spid", conn);
        cmd.Parameters.AddWithValue("@memberId",TextBox1.Text);
        cmd.Parameters.AddWithValue("@spid", Session["Usercode"].ToString());
        conn.Open();
        int x = int.Parse(cmd.ExecuteScalar().ToString());
        conn.Close();
        if (x > 0)
        {
            Session["Mid"] = TextBox1.Text.ToString();
            HomeData(Session["Mid"].ToString());
            //  HomeData();
            Label220.Text = "";
        }
        else
        {
            Label220.Text = "Invalid Membership ID";
        }
        conn.Close();

    }

}

