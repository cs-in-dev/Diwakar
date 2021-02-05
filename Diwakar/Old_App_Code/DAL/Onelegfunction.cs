using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;


    public class Onelegfunction
    {
        public Onelegfunction()
        { }

        public void LevelIncomeCalculation(String MemberId, Double Amt)
        {
            String SponsorID = "";
            while (true)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("Select SponserID from tblTreeMaster where MemberID='" + MemberId + "'", con);
                SponsorID = cmd.ExecuteScalar().ToString();
                con.Close();
                if (SponsorID == MemberId || Amt <= 0)
                {
                    break;
                }

                string st = "insert into Accountmaster(TxnType,MemberID,DateOfTransaction,Particulars,Credit,Debit) values(8,'" + SponsorID + "','" + DateTime.Now.ToString() + "','One Leg Income From " + MemberId + "','" + Amt * 0.2 + "',0)";
                SqlCommand cmd2 = new SqlCommand(st, con);
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();
                MemberId = SponsorID;
                Amt = Amt * 0.2;
            }
        }
    }

    
