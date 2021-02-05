<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="changeuserpassword.aspx.cs" Inherits="OpinionWorldGroup.Admin.changeuserpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .style34
    {
        text-align: center;
        font-size: small;
        font-family: Verdana;
    }
    .style36
    {
        text-align: left;
        font-size: small;
        font-family: Verdana;
    }
    
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table >
        <tr>
            <td colspan="2" align="center">
                <h2>Change User Password</h2></td>
        </tr>
        <tr>
        <td><br /></td>
        </tr>
        <tr>
            <td class="style36">
                Member Id</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36">
                &nbsp;</td>
            <td style="text-align: left; font-weight: 700;">
                <asp:Button ID="Button2" runat="server" 
                    Text="Get Password" Width="144px" onclick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td class="style34" colspan="2">
    <asp:Label ID="Label2" runat="server" Text="" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style36">
                Existing Login Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox5" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36">
                Existing Password</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36">
                New Login Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36">
                New Password</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36">
                Confirm New Password</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
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
