<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="NonTopUpReport.aspx.cs" Inherits="MoneyMagnet.SuperAdmin.NonTopUpReport" %>
<%@ Register assembly="obout_Grid_NET" namespace="Obout.Grid" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" Width="950px" Height="100%" ScrollBars="Both">
    
   
        <cc1:Grid ID="Grid1" runat="server" AllowFiltering="True" 
        AllowGrouping="True" DataSourceID="SqlDataSource1">
    </cc1:Grid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=46.37.173.231;Initial Catalog=opinionworldgroup;User ID=owg;Password=1america@world" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="select UserCode, UserName, MobileNo, EMail, Country from tblMemberMaster where UserCode NOT IN (select MemberID from AccountMaster where TxnType=1)"></asp:SqlDataSource>
 </asp:Panel></asp:Content>
