<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="AchieverstatusDateUpdate.aspx.cs" Inherits="Takeover._240578.AchieverstatusDateUpdate" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Particulars "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp &nbsp&nbsp&nbsp&nbsp
            <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="TextBox1"></asp:CalendarExtender>
        </div>
        <div style="margin-top:20px;">
            <asp:Button ID="btnUpdate" runat="server" Text="Update " OnClick="btnUpdate_Click" />
        </div>
    </center>
</asp:Content>
