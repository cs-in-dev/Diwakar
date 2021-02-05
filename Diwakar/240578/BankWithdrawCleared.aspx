<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/240578/AdminMasterPage.master"  CodeBehind="BankWithdrawCleared.aspx.cs" Inherits="MoneyMagnet.Admin.BankWithdrawClear" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
        PageSize="100" Width="864px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserCode" HeaderText="UserCode" 
                SortExpression="UserCode" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="LoginName" HeaderText="LoginName" 
                SortExpression="LoginName" />
            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" 
                SortExpression="MobileNo" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" 
                SortExpression="Amount" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="PaymentMode" HeaderText="PaymentMode" 
                SortExpression="PaymentMode" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" 
        ConnectionString="<%$ ConnectionStrings:conn %>" runat="server" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT tblMemberMaster.UserCode, tblMemberMaster.UserName, tblMemberMaster.LoginName, tblMemberMaster.MobileNo, tblBankWithdraw.Date, tblBankWithdraw.Amount, tblBankWithdraw.Status, tblBankWithdraw.PaymentMode FROM tblBankWithdraw INNER JOIN tblMemberMaster ON tblBankWithdraw.MemberId = tblMemberMaster.UserCode WHERE (tblBankWithdraw.Status = 'Cleared')"></asp:SqlDataSource>
</asp:Content>