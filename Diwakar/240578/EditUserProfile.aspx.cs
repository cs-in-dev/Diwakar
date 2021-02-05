using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Wojok._240578
{
    public partial class EditUserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated == false)
                Response.Redirect("~/240578/Default.aspx");
            if (User.IsInRole("Manage User") == false && User.IsInRole("Admin") == false)
                Response.Redirect("~/240578/AdminHome.aspx");
            try
            {
                if (!IsPostBack)
                {
                    DropDownList1.DataSource = Membership.GetAllUsers();
                    DropDownList1.DataBind();
                    CheckBoxList1.DataSource = Roles.GetAllRoles();
                    CheckBoxList1.DataBind();
                   
                }
            }
            catch (Exception ex)
            {

            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            { 
	
            for(int i=0;i<=CheckBoxList1.Items.Count-1;i++)
            {
                if (CheckBoxList1.Items[i].Selected == true && !Roles.IsUserInRole(DropDownList1.SelectedValue, CheckBoxList1.Items[i].Value))
                {
                    Roles.AddUserToRole(DropDownList1.SelectedValue.ToString().Trim(), CheckBoxList1.Items[i].Value);
                }
                if (CheckBoxList1.Items[i].Selected == false && Roles.IsUserInRole(DropDownList1.SelectedValue, CheckBoxList1.Items[i].Value))
                {
                    Roles.RemoveUserFromRole(DropDownList1.SelectedValue.ToString().Trim(), CheckBoxList1.Items[i].Value);
                }            
            }
                
            }
           
            catch (Exception ex)
            {
               
            }
            MsgBox("Credentials Updated !");




        }

        protected void MsgBox(string Msg)
        {
            this.Page.Controls.Add(new LiteralControl("<Script>alert('" + Msg + "');</Script>"));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
            {
                if (Roles.IsUserInRole(DropDownList1.SelectedValue, CheckBoxList1.Items[i].Value))
                    CheckBoxList1.Items[i].Selected = true;
                else
                    CheckBoxList1.Items[i].Selected = false;
            }
        }
     
       
    }
}