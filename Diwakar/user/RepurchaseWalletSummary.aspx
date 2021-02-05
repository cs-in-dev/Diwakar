<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="RepurchaseWalletSummary.aspx.cs" Inherits="CyraShop.RepurchaseWalletSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <center><strong>Repurchase Wallet Summary </strong></center>
         <br />
     <table class="style2" style="margin-top: 20px;">
        
   
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"   Width="700px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="TxnID" style="float:left; margin-top: 0px;">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                <%-- <asp:BoundField DataField="TxnID" HeaderText="TxnID" InsertVisible="False" ReadOnly="True" SortExpression="TxnID" />--%>
               <%--  <asp:BoundField DataField="TxnType" HeaderText="TxnType" SortExpression="TxnType" />--%>
               <%--  <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID" />--%>
                 <asp:BoundField DataField="DateofTransaction" HeaderText="DateofTransaction" SortExpression="DateofTransaction" />
                 <asp:BoundField DataField="Particulars" HeaderText="Particulars" SortExpression="Particulars" />
                 <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
                 <asp:BoundField DataField="Debit" HeaderText="Debit" SortExpression="Debit" />
                <%-- <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                 <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />--%>
             </Columns>
             <EditRowStyle BackColor="#7C6F57" />
             <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#E3EAEB" />
             <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#F8FAFA" />
             <SortedAscendingHeaderStyle BackColor="#246B61" />
             <SortedDescendingCellStyle BackColor="#D4DFE1" />
             <SortedDescendingHeaderStyle BackColor="#15524A" />
         </asp:GridView>
         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conn %>' SelectCommand="SELECT [TxnID], [TxnType], [MemberID], [DateofTransaction], [Particulars], [Credit], [Debit], [level], [status] FROM [AccountMaster] WHERE (([TxnType] = @TxnType) AND ([MemberID] = @MemberID))">
             <SelectParameters>
                 <asp:Parameter DefaultValue="11" Name="TxnType" Type="Int64"></asp:Parameter>
                 <asp:SessionParameter SessionField="UserCode" Name="MemberID" Type="String"></asp:SessionParameter>
             </SelectParameters>
         </asp:SqlDataSource>
     </table>
</asp:Content>
