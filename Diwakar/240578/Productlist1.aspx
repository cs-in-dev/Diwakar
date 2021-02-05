 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productlist1.aspx.cs" Inherits="GrowTogether._240578.Productlist1" MasterPageFile="~/240578/AdminMasterPage.master"%>

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

    <table>
        <tr>
             <td style="text-align: right">Product&nbsp; Code</td>
            <td>

                <asp:TextBox ID="txtproductcode" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search By Product Code" />
            </td>
        </tr>
    </table>
    <div>
        
    </div>
    
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#507CD1" HorizontalAlign="Center" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

        <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB"></RowStyle>

        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView>

<%--<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
    ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Left">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
      <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                    <%#Container.DataItemIndex +1 %>
                    </ItemTemplate>
                    </asp:TemplateField>
        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
            SortExpression="CategoryId" />
        <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" 
            SortExpression="ProductCode" />
        <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
            SortExpression="ProductName" />
             
        <asp:BoundField DataField="MRP" HeaderText="MRP" 
            SortExpression="MRP" />
        <asp:BoundField DataField="BV" HeaderText="BV" SortExpression="BV" />
         <asp:BoundField DataField="salesamount" HeaderText="DP" SortExpression="DP" />
             <asp:BoundField DataField="CashBack" HeaderText="CashBack" SortExpression="CashBack" />
          <asp:BoundField DataField="CashBackMonth" HeaderText="CashBackMonth" SortExpression="CashBackMonth" />
          <asp:BoundField DataField="SelfCashBack" HeaderText="Self CashBack " SortExpression="SelfCashBack" />
          <asp:BoundField DataField="SelfCashBackMonth" HeaderText="Self CashBackMonth" SortExpression="SelfCashBackMonth" />
          <asp:BoundField DataField="RedemptionPoints" HeaderText="RedemptionPoints" SortExpression="RedemptionPoints" />
     
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT [ProductCode],salesamount, [ProductName],CategoryId, [MRP], [BV],CashBack,CashBackMonth,SelfCashBack,SelfCashBackMonth,RedemptionPoints FROM [ProductRepurchase] WHERE  (([status] = @status) AND ([CategoryID] = @CategoryID))">
    <SelectParameters>
        <asp:Parameter DefaultValue="False" Name="status" Type="Boolean" />
        <asp:ControlParameter ControlID="DropDownList1" Name="CategoryID" 
            PropertyName="SelectedValue" Type="Int64" />
    </SelectParameters>
</asp:SqlDataSource>--%>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] ORDER BY [CategoryName]">
</asp:SqlDataSource>

</asp:Content>
