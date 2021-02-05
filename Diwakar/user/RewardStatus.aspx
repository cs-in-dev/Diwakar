<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="RewardStatus.aspx.cs" Inherits="WGRL.RewardStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center ><strong><h3>REWARDS</h3></strong></center>
    <table id="Table1" border="0" runat="server" width="100%" align="center">
   <tr>
       <td>
           <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
               AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
               ForeColor="#333333" GridLines="None" Width="100%" 
               ShowHeaderWhenEmpty="True">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                <asp:BoundField DataField="" HeaderText="" SortExpression="" />
                   <asp:TemplateField HeaderText="S.No">
                       <ItemTemplate>
                           <%# Container.DataItemIndex+1 %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:BoundField DataField="Pair" HeaderText="RP" SortExpression="RP" />
                    <asp:BoundField DataField="Rewards" HeaderText="Rewards" SortExpression="Rewards" />
                    <asp:BoundField DataField="DOA" HeaderText="Date of Achieved" SortExpression="DOA" />
                    <asp:BoundField DataField="DOR" HeaderText="Date of Received" SortExpression="DOR" />
                   
                   
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
               SelectCommand="SELECT RanksMaster.*,derivedtbl_1.DOA, derivedtbl_1.DOR FROM (SELECT id, UserCode, RewardID, DOA, DOR FROM RewardsAchieved WHERE (UserCode = @UserCode)) AS derivedtbl_1 RIGHT OUTER JOIN RanksMaster ON derivedtbl_1.RewardID = RanksMaster.RankID">
               <SelectParameters>
                   <asp:SessionParameter Name="UserCode" SessionField="UserCode" Type="String" />
               </SelectParameters>
           </asp:SqlDataSource>
       </td>
   </tr>
   </table>
   
    </asp:Content>
