<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="TopUpReport.aspx.cs" Inherits="MoneyMagnet.SuperAdmin.TopUpReport" %>
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
        SelectCommand="SELECT dbo.AccountMaster.TxnID, dbo.AccountMaster.MemberID, dbo.tblMemberMaster.UserName, dbo.AccountMaster.DateofTransaction, dbo.AccountMaster.Particulars, dbo.AccountMaster.Debit FROM dbo.tblMemberMaster INNER JOIN dbo.AccountMaster ON dbo.tblMemberMaster.UserCode = dbo.AccountMaster.MemberID WHERE (dbo.AccountMaster.TxnType = 1)"></asp:SqlDataSource>
 </asp:Panel></asp:Content>
