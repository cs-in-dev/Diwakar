<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="LevelReport.aspx.cs" Inherits="tradeasia.user.LevelReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <center style="font-size: x-large;"><strong>Level Income</strong></center>

<asp:Label runat="server" ID="Label1" Text="" ForeColor="Red"></asp:Label><br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        Width="100%" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" AllowSorting="true"
        onrowdatabound="GridView1_RowDataBound" ShowFooter="True" AllowPaging="True" PageSize="50" ShowHeaderWhenEmpty="true">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
    
    <asp:BoundField DataField="dateoftransaction" HeaderText="Date of Transaction" />
    <asp:BoundField DataField="particulars" HeaderText="Particulars" />
    <asp:BoundField DataField="credit" HeaderText="Credit Amount" DataFormatString="{0:F2}" />
   <%-- <asp:BoundField DataField="debit" HeaderText="Debit Amount" DataFormatString="{0:F2}" />--%>

    
    </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" 
            HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#47D9BF" Font-Bold="True" 
            HorizontalAlign="Center" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="select txntype,memberid,dateoftransaction,particulars,credit,Debit from accountmaster where txntype=3 and memberid=@usercode">
        <SelectParameters>
            <asp:SessionParameter Name="userCode" SessionField="UserCode" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
