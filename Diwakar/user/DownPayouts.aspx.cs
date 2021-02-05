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

namespace WGRL.User
{
    public partial class MyDownPayouts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

      
        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

     

        protected void Grid1_Select(object sender, Obout.Grid.GridRecordEventArgs e)
        {
            foreach (Hashtable item in e.RecordsCollection)
            {
                Response.Redirect("~/User/PrintPayouts.aspx?ID=" + item["TrackID"].ToString());
                break;
            }
            
        }


        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

       

    }

}
