using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CyraShop.user
{
    public partial class RewardList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
            SqlCommand cmd = new SqlCommand(" SELECT RanksMaster.Qualification, RanksMaster.Rewards, RewardsAchieved.DOA AS AchievedDate, RewardsAchieved.DOR AS ReceivedDate,RewardsAchieved.Remarks FROM RanksMaster INNER JOIN RewardsAchieved ON RanksMaster.RankID = RewardsAchieved.RewardID where Usercode='" + Session["Usercode"]+ "' ORDER BY RanksMaster.RankID", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
          
        }
    }
}