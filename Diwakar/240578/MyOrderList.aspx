<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="MyOrderList.aspx.cs" Inherits="Bvirodh._240578.MyOrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
         <table>
             <tr><td>
                 <asp:Label ID="Label1" runat="server">User Code</asp:Label></td><td>
                     <asp:TextBox ID="TextBox1" runat="server" placeholder="enter usercode"></asp:TextBox></td></tr>
             <tr><td colspan="2">
                 <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click"/></td></tr>
         </table>
         <asp:Panel ID="panel1" runat="server">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
CellPadding="4"  ForeColor="#333333" 
GridLines="None" Width="100%" style="float:left; margin-top: 0px;" ShowFooter="True" 
             ShowHeaderWhenEmpty="True" EmptyDataText="No Payouts released." 
             BorderColor="#000333" BorderStyle="Solid" BorderWidth="1px" Font-Size="9px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
    
       <asp:TemplateField HeaderText="SNo" HeaderStyle-Width="5px">
    <ItemTemplate>
    <%#((GridViewRow)Container).RowIndex+1 %>
    </ItemTemplate>
    </asp:TemplateField>
        <asp:BoundField DataField="memberid" HeaderText="Member ID" SortExpression="memberid" HeaderStyle-Width="5px" />
    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" HeaderStyle-Width="5px" />
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" HeaderStyle-Width="5px" ControlStyle-Width="50px" ItemStyle-Width="50" />
              
        <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="MRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
         <asp:BoundField DataField="Unit Price" HeaderText="DP" SortExpression="Unit Price" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
        <asp:BoundField DataField="BV" HeaderText="BV" SortExpression="BV" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
          <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" HeaderStyle-Width="10px" />
         
        <asp:BoundField DataField="Dis." HeaderText="Dis." SortExpression="Dis." DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15" /> 
         <asp:BoundField DataField="VAT/CST%" HeaderText="VAT Amount" SortExpression="VAT/CST%" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
        <asp:BoundField DataField="VAT/Additional" HeaderText="Add VAT" SortExpression="VAT/Additional" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15" Visible="false"/>
       
       <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
        <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
         <asp:BoundField DataField="Total Price" HeaderText="Total DP" SortExpression="Total Price" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
       <asp:BoundField DataField="chequeNo" HeaderText="PayMode" SortExpression="chequeNo"  HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
       <%--<asp:TemplateField HeaderText="Status" HeaderStyle-Width="5px">--%>
         <%--<ItemTemplate>
        <asp:CheckBox ID="statuscheck" runat="server" Checked='<%#Eval("Status")%>' OnCheckedChanged="statuscheck_CheckedChanged" ToolTip='<%#Eval("OrderID")%>' AutoPostBack="true" />
         </ItemTemplate>--%>
       <%--</asp:TemplateField>--%>
        
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <EmptyDataTemplate>
        No Rows Found!
    </EmptyDataTemplate>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" 
        HorizontalAlign="Center" />
<HeaderStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="10px" 
    ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#E3EAEB" Font-Size="14px"
    HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
    
</asp:GridView>
         


      <%--   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:conn %>" 
             SelectCommand="SELECT     ProductRepurchase.ProductCode Code, ProductRepurchase.ProductName,ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, ((ProductRepurchase.MRP*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.',  
OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*((ProductRepurchase.Vat)/100))'VAT/CST%',(OrderDetails.TotalDP*(ProductRepurchase.AddVat/100)) AS 'VAT/Additional', 
                   (ProductRepurchase.MRP*OrderDetails.Qty)TotalMRP,    (OrderDetails.TotalDP ) 'Total Price'
FROM OrderDetails INNER JOIN
                      ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.memberid=@UserCode">
                      <SelectParameters>
                          <asp:ControlParameter Name="UserCode" ControlID="TextBox1" DbType="String" DefaultValue="KS000900"/>
                      </SelectParameters>
         </asp:SqlDataSource>--%>
             </asp:Panel>
    </div>
</asp:Content>
