using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace surveypowerasia.Admin
{
    public partial class SurveyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                RadioButtonList1.SelectedIndex = -1;
                GridView1.Visible = false;
                GridView3.Visible = false;
                GridView2.Visible = false;
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {       GridView1.Visible = false;
                GridView3.Visible = false;
                GridView2.Visible = false;
                if (RadioButtonList1.SelectedIndex == 0)
                    GridView1.Visible = true;
                if (RadioButtonList1.SelectedIndex == 1)
                    GridView2.Visible = true;
                if (RadioButtonList1.SelectedIndex == 2)
                    GridView3.Visible = true;
        }
    }
}