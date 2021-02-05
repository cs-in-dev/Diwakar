<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="AddTopUp.aspx.cs" Inherits="Amazewellness.user.AddTopUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="100%">
<tr><td> Enter User Code :</td><td><asp:TextBox ID="txtname" runat="server" AutoPostBack="true" 
        ontextchanged="txtname_TextChanged"></asp:TextBox></td></tr>
        <tr><td colspan="2" align="center">
            <asp:Label ID="lblchsusrnm" runat="server" Text=""></asp:Label></td></tr>

<tr><td> Your Pin :</td><td><asp:TextBox ID="txtPin" runat="server"></asp:TextBox></td></tr>


<tr><td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" /></td></tr>

     <tr><td colspan="2" align="center"><br />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td></tr>


</table>





</asp:Content>
