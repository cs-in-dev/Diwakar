using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpinionWorldGroup.SuperAdmin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserCode"] != "Company")
            {
                //Response.Redirect("~/240578/default.aspx");
            }
        }
    }
}