<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="Repurhase_Right.aspx.cs" Inherits="CyraShop.user.Repurhase_Right" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <table style="width:100%!important;">
        <tr>
                      
            <td style="text-align: center">
                Select OrderType</td>
            <td>
           
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>First Purchase</asp:ListItem>
            <asp:ListItem>Repurchase</asp:ListItem>
        </asp:DropDownList>
               </td>  
               
        </tr>
       

        
    </table>
    <div style="width:100%;padding:15px">
    <div style="display: block; overflow: hidden; clear: both; margin-right: -15px; margin-left: -15px;">
    
        <div style="width: 46%; float: left; padding-left: 5px; padding-right: 15px;">
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"
                Style="text-align: left;" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" AllowPaging="true" PageSize="100" OnPageIndexChanging="GridView2_PageIndexChanging">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LeftDate" HeaderText="Date"
                        SortExpression="LeftDate" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Left_TotalDP" HeaderText="Left_TotalDP"
                        SortExpression="Left_TotalDP" />
                    <asp:BoundField DataField="Left_TotalBV" HeaderText="Left_TotalBV"
                        SortExpression="Left_TotalBV" />
                </Columns>
                <EditRowStyle BackColor="#2461BF"></EditRowStyle>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>
                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>
                <RowStyle BackColor="#EFF3FB"></RowStyle>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:conn %>"
                SelectCommand="SELECT  ISNULL(derivedtbl_2.Date,'') AS LeftDate, derivedtbl_2.Left_TotalDP, derivedtbl_2.Left_TotalBV FROM (SELECT CAST(Date AS date) AS Date, SUM(TotalDP) AS Left_TotalDP, SUM(TotalBV) AS Left_TotalBV FROM TotalOrders AS TotalOrders_1 WHERE (OrderType=@OrderType) AND (MemberID IN (SELECT UserCode FROM esc.MyLeftDownLine(@UserCode) AS MyLeftDownLine_1)) GROUP BY [Date]) AS derivedtbl_2 order by  derivedtbl_2.Date desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="OrderType" />
                    <asp:ControlParameter ControlID="HiddenField1" Name="UserCode" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="width: 46%; float: left; padding-left: 15px; padding-right: 5px;">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"
                Style="text-align: left;" AutoGenerateColumns="false" DataSourceID="SqlDataSource2" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LeftDate" HeaderText="Date"
                        SortExpression="LeftDate" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Right_TotalDP" HeaderText="Right_TotalDP"
                        SortExpression="Right_TotalDP" />
                    <asp:BoundField DataField="Right_TotalBV" HeaderText="Right_TotalBV"
                        SortExpression="Right_TotalBV" />
                </Columns>
                <EditRowStyle BackColor="#2461BF"></EditRowStyle>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>
                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>
                <RowStyle BackColor="#EFF3FB"></RowStyle>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:conn %>"
                SelectCommand="SELECT  ISNULL(derivedtbl_1.Date,'') AS LeftDate, derivedtbl_1.Right_TotalDP, derivedtbl_1.Right_TotalBV FROM (SELECT CAST(Date AS date) AS Date, SUM(TotalDP) AS Right_TotalDP, SUM(TotalBV) AS Right_TotalBV FROM TotalOrders WHERE (OrderType=@OrderType) AND (MemberID IN (SELECT UserCode FROM esc.MyRightDownLine(@UserCode) AS MyRightDownLine_1)) GROUP BY [Date]) AS derivedtbl_1 order by  derivedtbl_1.Date desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="OrderType" />
                    <asp:ControlParameter ControlID="HiddenField1" Name="UserCode" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </div>
</asp:Content>
