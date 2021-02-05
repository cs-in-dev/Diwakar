<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="changeadminPassword.aspx.cs" Inherits="OpinionWorldGroup.Admin.changeadminPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .style32
        {
            width: 50%;
        height: 139px;
    }
        .style34
    {
        text-align: left;
        font-size: small;
        font-family: Verdana;
    }
        
    .style26
        {
            color: #000000;
            font-weight: bold;
            text-decoration: underline;
          text-align: center;
            font-style: italic;
       
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table >
        <tr>
            <td align="center" colspan="2">
                <h3><b>Change Admin Password</b></h3></td>
        </tr>
        <tr><td><br /></td></tr>
        <tr>
            <td class="style34">
                Existing Password</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" MaxLength="200"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style34">
                New Password</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Can't Leave Blank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style34">
                Confirm New Password</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" MaxLength="200"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox3" ControlToValidate="TextBox2" 
                    ErrorMessage="Password doesn't match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
        <td></td>
            <td align="left">
                <asp:Button ID="Button1" runat="server" 
                    Text="Change Password" Width="144px" onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
        <td colspan="2" align="center">
    <asp:Label ID="Label1" runat="server" Text="" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
