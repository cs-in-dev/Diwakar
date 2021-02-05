<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WGRL.Admin.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
    /*{
        text-align:center;
        width: 55%;
        margin-left:200px;
    }*/
    .style6
    {
        text-align: center;
        height: 31px;
    }
                
        </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<center style="font-size: x-large;"><strong>Change Login Password</strong></center>--%>
 <center>
    <table class="style2">
   <tr>
       <h3>Change Login Password</h3>
   </tr><tr></tr><br />
    <tr>
        <td align="left">
            Old Password</td>
        <td align="left">
            <asp:TextBox ID="txtExistingPassword" runat="server" TextMode="Password" 
                MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtExistingPassword" ErrorMessage="Enter old Password" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            New Password</td>
        <td align="left">
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" 
                MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtNewPassword" ErrorMessage="Enter new Password" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            Confirm New Password</td>
        <td align="left">
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" 
                MaxLength="50"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtConfirmPassword" ControlToValidate="txtNewPassword" 
                ErrorMessage="Confirm Password Mismatch" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
    <td></td>
        <td align="left">
           
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Change Password" />
        </td>
    </tr>
    <tr>
        <td class="style6" colspan="2">
            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
</table></center>
</asp:Content>
