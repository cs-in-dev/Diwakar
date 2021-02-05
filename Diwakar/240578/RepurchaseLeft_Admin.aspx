<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="RepurchaseLeft_Admin.aspx.cs" Inherits="CyraShop._240578.RepurchaseLeft" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Repurcahse Left Business</h1>
        <table>
           <tr>
            <td class="style5" align="right">Date From
            </td>
            <td style="text-align: left" class="auto-style1">
                <asp:TextBox ID="date1" runat="server" CssClass="style7"></asp:TextBox>
                <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1"></asp:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="vg4" ForeColor="red" ControlToValidate="date1"></asp:RequiredFieldValidator>
            </td>
            </tr>
        <tr>
            <td class="style5" align="right">Date Till</td>
            <td style="text-align: left" class="auto-style1">
                <asp:TextBox ID="date2" runat="server" CssClass="style7"></asp:TextBox>

                <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2"></asp:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="vg4" ForeColor="red" ControlToValidate="date2"></asp:RequiredFieldValidator>
            </td>
           <%-- <td>
              
                <asp:Button ID="btnbydate" runat="server" Text="Search by Date" ValidationGroup="vg4" OnClick="btnbydate_Click" />
            </td>--%>
        </tr>
            <tr>
                <td class="style5" align="right">Member Id</td>
                <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="txtMemberID" runat="server" CssClass="style7"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="vg2" ForeColor="red" ControlToValidate="txtMemberID"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnbymemberid" runat="server" Text="Search by MemberID" OnClick="btnbymemberid_Click" ValidationGroup="vg2" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">Select OrderType</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem>First Purchase</asp:ListItem>
                        <asp:ListItem>Repurchase</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="style6">
                <td class="style3">&nbsp;</td>
                <td style="text-align: left">
                    <asp:ImageButton ID="ImageButton1" runat="server"
                        ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
        <%--    <div style="height: 1100px; width: 700px" class="divgrid">--%>
        <table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" Width="697px" ShowHeaderWhenEmpty="True" EmptyDataText="No Rows Found !" ForeColor="#333333" Style="margin-top: 20px;" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="500">
                <RowStyle BackColor="#F7F6F3" HorizontalAlign="Center"
                    VerticalAlign="Middle" ForeColor="#333333" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MemberID" HeaderText="Member ID"
                        SortExpression="MemberID" />
                    <asp:BoundField DataField="Date" HeaderText="Date"
                        SortExpression="Date" />
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID"
                        SortExpression="OrderID" />
                    <asp:BoundField DataField="TotalDp" HeaderText="TotalDp"
                        SortExpression="TotalDp" />
                    <asp:BoundField DataField="TotalBV" HeaderText="TotalBV"
                        SortExpression="TotalBV" />

                    <%-- <asp:TemplateField HeaderText="Top Up Now">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("Upgrade") %>' Text="Top Up"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#d35400" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </table>

    </asp:Content>

