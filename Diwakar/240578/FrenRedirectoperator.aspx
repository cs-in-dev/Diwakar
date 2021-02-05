<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="FrenRedirectoperator.aspx.cs" Inherits="Starlinenetworking._240578.FENRedirectoperator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 50%;
        }
    .style3
    {
        color: #000000;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="style3"><strong>Redirect to Franchise Panel</strong></h2>
    <table class="style2">
        <tr>
            <td align="center">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Frenchise ID"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtusercode" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
            <td align="left">
                <asp:Button ID="bttnsubmit" runat="server" onclick="bttnsubmit_Click" 
                    Text="Submit" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
