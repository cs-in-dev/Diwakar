<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="RepurchaseOrders.aspx.cs" Inherits="mmart2.Admin.RepurchaseOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.png" onclick="ImageButton1_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Height="83px" Width="785px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
        AllowSorting="True" PageSize="100" onrowcommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" 
            ForeColor="#284775" />
        <Columns>
         
            <%--<asp:CommandField ShowEditButton="True"   />--%>
         
           
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" ReadOnly="True" 
                SortExpression="OrderDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Name" HeaderText="Branch Name" ReadOnly="True" 
                SortExpression="Name" />
         
            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" 
                SortExpression="Address" />
            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" ReadOnly="True" 
                SortExpression="MobileNo" />
        
            <asp:TemplateField HeaderText="Status" SortExpression="Status">                
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <%-- <asp:BoundField DataField="Shipper" HeaderText="Shipper" 
                SortExpression="Shipper" />
            <asp:BoundField DataField="ShipperRefNo" HeaderText="ShipperRefNo" 
                SortExpression="ShipperRefNo" />--%>
                 <asp:TemplateField>
            <ItemTemplate>
            <%--<asp:LinkButton ID="lnkSelect" CommandName="Select" runat="server" Text="View details" Width="120px" CausesValidation="True"></asp:LinkButton>--%>
                <asp:HyperLink ID="hlBilling" runat="server" NavigateUrl='<% #Eval("OrderID","BranchOrderDetails.aspx?OrderID={0}") %>' Target="_blank">View Billing</asp:HyperLink>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlUpdate" runat="server" NavigateUrl='<% #Eval("OrderID","EditMyOrderDetails.aspx?OrderID={0}") %>' Target="_blank">Update Billing</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" />
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
        
        SelectCommand="SELECT StockRequest.OrderID, StockRequest.OrderDate, StockRequest.Status, tblFrenchiseMaster.FrenchiseID, tblFrenchiseMaster.Name, tblFrenchiseMaster.Address, tblFrenchiseMaster.MobileNo  FROM StockRequest INNER JOIN tblFrenchiseMaster  ON StockRequest.FrenchiseID = tblFrenchiseMaster.FrenchiseID ORDER BY StockRequest.OrderDate desc" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="">
        <DeleteParameters>
           
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Shipper" Type="String" />
            <asp:Parameter Name="ShipperRefNo" Type="String" />
            <asp:Parameter Name="original_OrderID" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
     </asp:Content>