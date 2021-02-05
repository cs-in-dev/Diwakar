<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="IncomeRepurchase.aspx.cs" Inherits="WGRL.IncomeRepurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center style="font-size: x-large;"><strong>FLUSH OUT PAIR INCOME</strong></center>
<center>
    <table>
       <tr><td>Month:</td><td>               

                <asp:DropDownList ID="ddlMonth" runat="server">
                <asp:ListItem Value="">-Month-</asp:ListItem>
                <asp:ListItem Value="1">Jan</asp:ListItem>
                <asp:ListItem Value="2">Feb</asp:ListItem>
                <asp:ListItem Value="3">March</asp:ListItem>
                <asp:ListItem Value="4">April</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">Aug</asp:ListItem>
                <asp:ListItem Value="9">Sep</asp:ListItem>
                <asp:ListItem Value="10">Oct</asp:ListItem>
                <asp:ListItem Value="11">Nov</asp:ListItem>
                <asp:ListItem Value="12">Dec</asp:ListItem>
                </asp:DropDownList>
                              </td></tr>
            <tr><td>Year: </td><td> <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList></td></tr>
            <tr><td></td><td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td></tr>
    </table>
</center>
    <table id="Table1" border="0" runat="server" width="100%" align="center">
   <tr>
       <td>
          <%-- <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
               AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
               ForeColor="#333333" GridLines="None" Width="100%" 
               ShowHeaderWhenEmpty="True" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
               <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %></ItemTemplate>
                        </asp:TemplateField>            
                   <asp:BoundField DataField="DateOFTransaction" DataFormatString="{0:d}" HeaderText="DateTo" 
                       SortExpression="DateOFTransaction" />
                   <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                       SortExpression="Particulars" />
                   <asp:BoundField DataField="Credit" HeaderText="Credit" 
                       SortExpression="Credit" DataFormatString="{0:f2}" />               
               </Columns>
               <EditRowStyle BackColor="#7C6F57" />
               <EmptyDataTemplate>
                   No Rows Found!
               </EmptyDataTemplate>
               <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
               <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F8FAFA" />
               <SortedAscendingHeaderStyle BackColor="#246B61" />
               <SortedDescendingCellStyle BackColor="#D4DFE1" />
               <SortedDescendingHeaderStyle BackColor="#15524A" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
               ConnectionString="<%$ ConnectionStrings:conn %>" 
               SelectCommand="select DateOFTransaction, Particulars, Credit from accountmaster where txntype=24 and memberid=@usercode ORDER BY DateOFTransaction desc">
               <SelectParameters>
                   <asp:SessionParameter Name="UserCode" SessionField="UserCode" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>--%>

            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
               AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
               ForeColor="#333333" GridLines="None" Width="100%" 
               ShowHeaderWhenEmpty="True" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
               <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %></ItemTemplate>
                        </asp:TemplateField>            
                   <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="DateTo" 
                       SortExpression="Date" />
                   <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                       SortExpression="Particulars" />
                   <asp:BoundField DataField="Amount" HeaderText="Credit" 
                       SortExpression="Amount" DataFormatString="{0:f2}" />               
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
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
               ConnectionString="<%$ ConnectionStrings:conn %>" 
               SelectCommand="select MemberID,cast(DateofTransaction as date) [Date],Particulars, isnull(sum(Credit),0) Amount from AccountMaster where TxnType = 3 AND MemberID = @UserCode AND datepart(mm,DateofTransaction) = @Month AND datepart(yy,DateofTransaction) = @Year group by MemberID,Particulars,cast(DateofTransaction as date) order by cast(DateofTransaction as date),isnull(sum(Credit),0)  desc">
               <SelectParameters>
                   <asp:SessionParameter Name="UserCode" SessionField="UserCode" Type="String" />
                  <asp:ControlParameter Name="Month" DefaultValue="11" ControlID="ddlMonth" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter Name="Year" DefaultValue="2014" ControlID="ddlYear" PropertyName="SelectedValue" Type="Int32" />  
               </SelectParameters>
           </asp:SqlDataSource>


       </td>
   </tr>
   </table>
   
    </asp:Content>
