<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="IncomeBinary.aspx.cs" Inherits="WGRL.IncomeBinary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center style="font-size: x-large;"><strong>BINARY</strong></center>
    <table id="Table1" border="0" runat="server" width="100%" align="center">
   <tr>
       <td>
           <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
               AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
               ForeColor="#333333" GridLines="None" Width="100%" 
               ShowHeaderWhenEmpty="True" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
               <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %></ItemTemplate>
                        </asp:TemplateField>
              <%--     <asp:BoundField DataField="Sno" HeaderText="Sno" SortExpression="Sno" />--%>
                   <%--<asp:BoundField DataField="DateFrom" DataFormatString="{0:d}" 
                       HeaderText="DateFrom" SortExpression="DateFrom" />--%>
                   <asp:BoundField DataField="DateOFTransaction" HeaderText="DateTo" 
                       SortExpression="DateOFTransaction" />
                   <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                       SortExpression="Particulars" />
                   <asp:BoundField DataField="Credit" HeaderText="Credit" 
                       SortExpression="Credit" DataFormatString="{0:f2}" />
                 <%--  <asp:BoundField DataField="TotalLeft" HeaderText="TotalLeft" 
                       SortExpression="TotalLeft" />
                   <asp:BoundField DataField="TotalRight" HeaderText="TotalRight" 
                       SortExpression="TotalRight" />
                   <asp:BoundField DataField="CurrPair" HeaderText="CurrPair" 
                       SortExpression="CurrPair" />
                   <asp:BoundField DataField="CurrBinary" HeaderText="CurrBinary" 
                       SortExpression="CurrBinary" />--%>
                   <%--<asp:BoundField DataField="LeftCarry" HeaderText="LeftCarry" 
                       SortExpression="LeftCarry" />
                   <asp:BoundField DataField="RightCarry" HeaderText="RightCarry" 
                       SortExpression="RightCarry" />--%>
               </Columns>
               <EditRowStyle BackColor="#7C6F57" />
               <EmptyDataTemplate>
                   No Rows Found!
               </EmptyDataTemplate>
               <FooterStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#47D9BF" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
               <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F8FAFA" />
               <SortedAscendingHeaderStyle BackColor="#246B61" />
               <SortedDescendingCellStyle BackColor="#D4DFE1" />
               <SortedDescendingHeaderStyle BackColor="#15524A" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:conn %>" 
               SelectCommand="select DateOFTransaction, Particulars, Credit from accountmaster where txntype=4 and memberid=@usercode ORDER BY DateOFTransaction desc ">
               <SelectParameters>
                   <asp:SessionParameter Name="UserCode" SessionField="UserCode" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>
       </td>
   </tr>
   </table>
   
    </asp:Content>
