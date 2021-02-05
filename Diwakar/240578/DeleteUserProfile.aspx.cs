using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Wojok._240578
{
    public partial class DeleteUserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Delete User") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            if (!IsPostBack)
            {
                DropDownList1.DataSource = Membership.GetAllUsers();
                DropDownList1.DataBind();
            }      
       
                  
        }
              
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "admin" || DropDownList1.SelectedValue == "admin")
            {
                MsgBox("Sorry ! admin Can not be delete !");
            }
            else
            {
               if (Roles.GetRolesForUser(DropDownList1.SelectedValue).Length>0)
                Roles.RemoveUserFromRoles(DropDownList1.SelectedValue, Roles.GetRolesForUser(DropDownList1.SelectedValue));
              
                
                Membership.DeleteUser(DropDownList1.SelectedValue);
                MsgBox("User Account Deleted !");
                DropDownList1.DataSource = Membership.GetAllUsers();
                DropDownList1.DataBind();
            }
        }

        protected void MsgBox(string Msg)
        {
            this.Page.Controls.Add(new LiteralControl("<Script>alert('" + Msg + "');window.history.back();</Script>"));
        }
       
    }
}