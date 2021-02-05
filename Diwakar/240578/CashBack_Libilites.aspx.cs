using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CyraShop._240578
{
    public partial class CashBack_Libilites : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        decimal total = 0,Remaining = 0,Paid=0;


        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select AccountMaster.MemberID ,tblmembermaster.UserName,Sum(case when dateoftransaction>=getdate()then isnull(Credit,0) else 0 end) as Remaining, Sum(case when dateoftransaction<getdate()then isnull(Credit,0) else 0 end) as Paid,Sum(Credit) as Total from AccountMaster Inner Join tblMemberMaster on AccountMaster.MemberID=tblMemberMaster.UserCode WHERE TxnType=3 Group by AccountMaster.MemberID,tblmembermaster.UserName", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            using (DataTable dt = new DataTable())
            {
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                total= dt.AsEnumerable().Sum(row => row.Field<decimal>("Total"));
                Paid = dt.AsEnumerable().Sum(row => row.Field<decimal>("Paid"));
                Remaining = dt.AsEnumerable().Sum(row => row.Field<decimal>("Remaining"));
                GridView1.FooterRow.Cells[2].Text = "Total";
                GridView1.FooterRow.Cells[3].Text = total.ToString();
                GridView1.FooterRow.Cells[4].Text = Paid.ToString();
                GridView1.FooterRow.Cells[5].Text = Remaining.ToString();
            }

               
           
           
        }
    }
}