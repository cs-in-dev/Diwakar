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
using System.IO;
using System.Net.Mail;

public partial class User_UserHome : System.Web.UI.Page
{
    SqlConnection conn;
    SqlConnection con;
    SqlCommand cmd, cmd1;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblMemberMaster where  UserCode =@UserCode", conn);
            cmd.Parameters.AddWithValue("@UserCode",Session["UserCode"].ToString());
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Session["UserName"] = dr["UserName"].ToString();
                UserCode.Text = Session["UserCode"].ToString();
                UserName.Text = dr["UserName"].ToString();
                MemberSince.Text = DateTime.Parse(dr["DOJ"].ToString()).ToString("dd-MMM-yyyy");
                Spid.Text = dr["SponsorID"].ToString();
                lblStatus.Text = dr["Status"].ToString();
                WalletPoint.Text = dr["PinAmount"].ToString().Replace(".0000", "");
                lblactivation.Text = dr["confirmdate"].ToString();
              
                break;
            }
            dr.Close();

            //cmd.CommandText = "EXEC dbo.PreparePayouts '" + Session["UserCode"]+"'";
            //cmd.CommandTimeout = 0;
            //cmd.ExecuteNonQuery();
            conn.Close();
        }
        lblmemberid.Text = Session["UserCode"].ToString();
        welcome();

    }


    protected void welcome()
    {

        lblmemberid.Text = Session["UserCode"].ToString();
        //lbldate.Text = System.DateTime.Today.ToLongDateString();

        string x = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        con = new SqlConnection(x);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        cmd = new SqlCommand("select UserName,LoginName,WelcomeLetterAddress,Address,City,State,MobileNo,LoginPassword,DOJ,PinAmount,PostalCode,Status,MyLeft,dbo.MySponsor('" + lblmemberid.Text + "') as sponser from tblMemberMaster where UserCode=@usercode", con);
        cmd.Parameters.AddWithValue("@usercode", lblmemberid.Text);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {

            //lblmobileno.Text = dr["MobileNo"].ToString();
            lblusername3.Text = dr["UserName"].ToString();
            lblBIname.Text = Session["UserCode"].ToString();
            lblBIid.Text = dr["PinAmount"].ToString();
            lblpwd.Text = dr["LoginPassword"].ToString();
            lblsponser.Text = dr["sponser"].ToString();
            //  lblusername5.Text = dr["PostalCode"].ToString();
            // lbladd.Text = dr["Address"].ToString();
            lbladd.Text = dr["WelcomeLetterAddress"].ToString();
            //  lblcity.Text = dr["City"].ToString() + " " + dr["State"].ToString();                
            DateTime dt = DateTime.Parse(dr["DOJ"].ToString());
            lbldate.Text = dt.ToString();
            Label1.Text = dr["Status"].ToString();
            HyperLink1.Text = "http://www.diwakarretail2017@gmail.com /" + dr["LoginName"].ToString();


        }
        dr.Close();

        cmd1 = new SqlCommand("select MemberID,SponserID from tblTreeMaster where MemberID=@memberid", con);
        cmd1.Parameters.AddWithValue("@memberid", lblmemberid.Text);
        dr = cmd1.ExecuteReader();
        while (dr.Read())
        {
            //lblsponsorid.Text = dr["SponserID"].ToString();
        }
        dr.Close();

        cmd.CommandText = "SELECT ISNULL(sum(OrderMaster.Amount),0) as TotalSale FROM OrderDetails with(nolock) INNER JOIN OrderMaster ON OrderDetails.OrderID = OrderMaster.OrderID where (OrderMaster.MemberID in ( select RightChild from tblTreeMaster where MemberID=@UserCode1) or OrderMaster.MemberID in ( select LeftChild from tblTreeMaster where MemberID=@UserCode1)) and OrderMaster.InvoiceType='RP'";

        cmd.Parameters.AddWithValue("@UserCode1", Session["UserCode"].ToString());
       // lblredemption.Text = cmd.ExecuteScalar().ToString();


        try
        {
            //cmd.CommandText = "select Discription  from joiningpackages where amount=@Amount";
            //cmd.Parameters.AddWithValue("@Amount", lblBIid.Text);

            //LabelPDiscription.Text = cmd.ExecuteScalar().ToString();

        }
        catch (Exception ex)
        {

        }


        cmd = new SqlCommand("select FirstLogin from tblMemberMaster where UserCode='" + Session["UserCode"].ToString() + "'", con);
        string FirstLogin = cmd.ExecuteScalar().ToString();


        if (FirstLogin == "0")
        {
            try
            {
                cmd = new SqlCommand("select email from tblMemberMaster where UserCode='" + Session["UserCode"].ToString() + "'", con);
                string email = cmd.ExecuteScalar().ToString();

                if (email == "")
                {

                }

                else
                {
                    //    StringWriter sw = new StringWriter();
                    //    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    //    dvcon.RenderControl(hw);
                    //    string msg = sw.GetStringBuilder().ToString();
                    //    Gen obj = new Gen();

                    //    MailMessage n = new MailMessage();
                    //    SmtpClient client = new SmtpClient();
                    //    n.To.Add(email);
                    //    n.From = new MailAddress(ConfigurationManager.AppSettings["Email"].ToString());
                    //    n.Body = msg;
                    //    n.Subject = "Welcome letter for Joining Cyrashop";
                    //    client.EnableSsl = true;
                    //    client.Port = 587;
                    //    n.IsBodyHtml = true;
                    //    client.Send(n);
                    cmd = new SqlCommand("update tblMemberMaster set FirstLogin=1 where UserCode=@UserCode", con);
                    cmd.Parameters.AddWithValue("@UserCode", Session["UserCode"].ToString());
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
            catch (Exception ex)
            {

            }


        }
    }

}

