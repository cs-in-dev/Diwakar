<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="BinayIncome.aspx.cs" Inherits="WGRL.User.BinayIncome" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2><center><strong>Binary Income</strong></center></h2><br />
<asp:Label runat="server" ID="Label1" Text="" ForeColor="Red"></asp:Label><br />
<asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1"  OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" AllowSorting="true" PageSize="50"
    GridLines="None" style="text-align: center" Width="100%" 
    ForeColor="#333333">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="Date" HeaderText="Date" 
                    SortExpression="Date" />
        <%--<asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                    SortExpression="Particulars" />--%>
        <asp:BoundField DataField="Credit" HeaderText="Amount"
            SortExpression="Credit" ReadOnly="True" />
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#d35400" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:conn %>"
        SelectCommand="SELECT cast(dateoftransaction as date)as date, SUM(Credit) as Credit FROM AccountMaster WHERE (MemberID =@MemberID) AND (TxnType in(4)) AND (debit = 0) group by cast(dateoftransaction as date)">

    <SelectParameters>
        <asp:SessionParameter Name="MemberID" SessionField="UserCode" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
