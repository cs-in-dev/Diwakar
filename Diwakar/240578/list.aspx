<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="GWG.list" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductCode" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        HorizontalAlign="Center" PageSize="100" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductCode" />
            <asp:BoundField DataField="Productname" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="Mrp" DataFormatString="{0:f}"/>
            <asp:BoundField DataField="SalesAmount" HeaderText="DP" SortExpression="SalesAmount" DataFormatString="{0:f}"/>
            <asp:BoundField DataField="TaxRate" HeaderText="Tax" SortExpression="TaxRate" DataFormatString="{0:f}" />
            <asp:BoundField DataField="BV" HeaderText="PV" SortExpression="BV" />
            <asp:BoundField DataField="IQty" HeaderText="Quantity" ReadOnly="True" 
                SortExpression="Qty" />
        </Columns>
        <EditRowStyle HorizontalAlign="Center" BackColor="#999999" />
        <EmptyDataTemplate>
            No rows found.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView> 
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="select ProductCode,Productname,MRP,BV,isnull(TaxRate,0) TaxRate, IQty,SalesAmount from ProductRepurchase INNER JOIN
                          (SELECT     ProductId, ISNULL(SUM(RecievedQty) - SUM(TransferQty), 0) AS IQty
                            FROM          Inventory
                            WHERE      (StoreID = 'Admin')
                            GROUP BY ProductId
                            HAVING      (ISNULL(SUM(RecievedQty) - SUM(TransferQty), 0) &gt; 0)) AS derivedtbl_1 ON ProductRepurchase.ProductID = derivedtbl_1.ProductId where ProductRepurchase.[Status]!=1">
    </asp:SqlDataSource>

<script type="text/javascript">
    (function () { jQuery('.fancybox').fancybox({ type: 'iframe', padding: 5, width: 727 }); })();
</script>
</asp:Content>
