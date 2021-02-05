<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="Productlist.aspx.cs" Inherits="GOG.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
    DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
    DataValueField="CategoryID" 
    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    
</asp:DropDownList>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
    ForeColor="#333333" GridLines="None" Width="100%" Font-Size="13px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
      <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                    <%#Container.DataItemIndex +1 %>
                    </ItemTemplate>
                    </asp:TemplateField>
        <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" 
            SortExpression="ProductCode" />
        <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
            SortExpression="ProductName" />
             <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
            SortExpression="CategoryId" />
        <asp:BoundField DataField="MRP" HeaderText="MRP" 
            SortExpression="MRP" />
         <asp:BoundField DataField="SalesAmount" HeaderText="DP" 
            SortExpression="SalesAmount" />
        <asp:BoundField DataField="BV" HeaderText="BV" SortExpression="BV" />
       <asp:templatefield HeaderText="Include in MRP Bill">
                    <itemtemplate>
                        <asp:checkbox ID="CheckBox1" runat="server"></asp:checkbox>
                    </itemtemplate>
                </asp:templatefield>
         
    </Columns>
    <EditRowStyle BackColor="#999999" />
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
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT [ProductCode], [ProductName],CategoryId, [MRP],[SalesAmount], [BV],[IncludeinMRPBill] FROM [ProductRepurchase] WHERE (([status] = @status) AND ([CategoryID] = @CategoryID))">
    <SelectParameters>
        <asp:Parameter DefaultValue="False" Name="status" Type="Boolean" />
        <asp:ControlParameter ControlID="DropDownList1" Name="CategoryID" 
            PropertyName="SelectedValue" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] ORDER BY [CategoryName]">
</asp:SqlDataSource>

</asp:Content>
