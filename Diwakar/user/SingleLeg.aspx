<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="SingleLeg.aspx.cs" Inherits="WGRL.User.SingleLeg" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label runat="server" ID="Label1" Text="" ForeColor="Red"></asp:Label><br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" 
    GridLines="None" style="text-align: center" Width="782px" 
    ForeColor="#333333">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="Date" HeaderText="Date" 
                    SortExpression="Date" />
        <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                    SortExpression="Particulars" />
        <asp:BoundField DataField="Amount" HeaderText="Amount"
                    SortExpression="Amount" ReadOnly="True" />
    </Columns>
    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT DateofTransaction AS Date, Particulars, Credit AS Amount FROM AccountMaster WHERE (MemberID = @MemberID) AND (TxnType = 26) AND (debit = 0)">
    <SelectParameters>
        <asp:SessionParameter Name="MemberID" SessionField="UserCode" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
