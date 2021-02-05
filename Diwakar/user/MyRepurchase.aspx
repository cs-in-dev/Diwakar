<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="MyRepurchase.aspx.cs" Inherits="Amazewellness.user.Downline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
    
    <strong style="font-size: large">MY REPURCHASE</strong><br /><br />
    </center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true"
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" 
        Width="100%" onrowdatabound="GridView1_RowDataBound" EmptyDataText="No records found." ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="DateofTransaction" HeaderText="Date" 
                SortExpression="DateofTransaction" />
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="MRP" HeaderText="DP" SortExpression="MRP" />
            <asp:BoundField DataField="BV" HeaderText="PV" SortExpression="BV" />
        </Columns>
        <FooterStyle BackColor="#47D9BF" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#47D9BF"  HorizontalAlign="Center"  Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#47D9BF" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="White"  HorizontalAlign="Center"  />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT    AccountMaster.DateofTransaction, ProductRepurchase.ProductName,  ProductRepurchase.MRP,  ProductRepurchase.BV  FROM    ProductRepurchase  INNER JOIN AccountMaster ON ProductRepurchase.BV = AccountMaster.Debit where AccountMaster.TxnType='11' 
 and MemberID = @UserCode ORDER BY AccountMaster.DateofTransaction desc">
        <SelectParameters>
            <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
