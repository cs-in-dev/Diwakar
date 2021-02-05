<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="MyPayouts.aspx.cs" Inherits="WGRL.User.MyPayouts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center style="font-size: x-large;"><strong>Payout Summary</strong></center>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
GridLines="None" Width="700px" DataKeyNames="TrackID" 
    onselectedindexchanged="GridView1_SelectedIndexChanged" style="float:left; margin-top: 0px;"  OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" AllowSorting="true" PageSize="50"
        onrowdatabound="GridView1_RowDataBound" 
        ShowHeaderWhenEmpty="True">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="SrNo.">
            <ItemTemplate>
                <%#Container.DataItemIndex+1%>
            </ItemTemplate>
            <ItemStyle Width="8%" />
        </asp:TemplateField>
        <asp:BoundField DataField="TrackID" HeaderText="Track ID" SortExpression="TrackID" />
        <asp:BoundField DataField="DateFrom" HeaderText="From" SortExpression="DateFrom" />
        <asp:BoundField DataField="DateTo" HeaderText="To" SortExpression="DateTo" />
        <asp:TemplateField HeaderText="Total" SortExpression="TotalPayout">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TotalPayout") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TotalPayout") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="Total1Payout" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="TDS 5%" SortExpression="TDS">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("TDS") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TDS") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="TotalTDS" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="AdminCharges 7%" SortExpression="AdminCharges">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("AdminCharges") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AdminCharges") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="admincharges" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="GrossPayable" SortExpression="GrossPayable">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("GrossPayable") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GrossPayable") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="GrossPayable" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>
        <%--<asp:TemplateField HeaderText="Previous Balance" SortExpression="AdminCharges">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("PreviousBalance") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PreviousBalance") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="PreviousBalance" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Payments" SortExpression="Payments">
            <ItemTemplate>
                <asp:Label ID="LabelPayments" runat="server" Text='<%# Bind("Payments") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Payments") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="Payments" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Net Payable" SortExpression="Net Pay">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("NetPayable") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NetPayable") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="NetPayable" runat="server"></asp:Label>
            </FooterTemplate>
        </asp:TemplateField>--%>
        <asp:CommandField SelectText="View" ShowSelectButton="True" />
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <EmptyDataTemplate>
        No Rows Found!
    </EmptyDataTemplate>
    <FooterStyle BackColor="#1C5E55" 
        HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#d35400" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" 
        HorizontalAlign="Center" />
<RowStyle 
    HorizontalAlign="Center" BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:conn %>" 
    
            
        
        SelectCommand="SELECT TrackId, Convert(varchar,DateFrom,103) DateFrom, Convert(varchar,DateTo,103)DateTo,TotalPayout,TDS,AdminCharges,GrossPayable,PreviousBalance,Payments,NetPayable  FROM [Payouts] WHERE ([UserCode] = @UserCode) order by TrackId desc " 
        >
<SelectParameters>
    <asp:SessionParameter Name="UserCode" SessionField="UserCode" Type="String" />
</SelectParameters>
</asp:SqlDataSource>


</asp:Content>
