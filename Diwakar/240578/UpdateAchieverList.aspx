<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="UpdateAchieverList.aspx.cs" Inherits="CyraShop._240578.UpdateAchieverList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Particulars"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>&nbsp &nbsp&nbsp&nbsp&nbsp
           
        </div>
        <div style="margin-top:20px;">
            <asp:Button ID="btnUpdate" runat="server" Text="Update " OnClick="btnUpdate_Click" />
        </div>
    </center>
</asp:Content>
