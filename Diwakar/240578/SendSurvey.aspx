<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="SendSurvey.aspx.cs" Inherits="NationalSurvey.Admin.SendSurvey" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 244px;
        }
        .style2
        {
            text-align: right;
        }
        .style3
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Paneldisplaymessage" runat="server">
    <table>
        
    <tr>
    <td align="center" class="style3" colspan="2"><strong>Send Task</strong></td>
        <tr>
            <td align="center" class="style3" colspan="2">
                &nbsp;</td>
            <tr>
                <td align="right" class="style2">
                    Select Task Type</td>
                <td align="left">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        DataSourceID="TaskTypes" DataTextField="Type" DataValueField="Type" 
                        onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="TaskTypes" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        SelectCommand="SELECT DISTINCT [Type] FROM [tblsurvey]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Select Task</td>
                <td align="left">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Details" DataValueField="SurveyId" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        
                        SelectCommand="SELECT [Details], [SurveyId] FROM [tblsurvey] where StartDate&lt;=getdate() AND Type=@Type">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" Name="Type" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <tr>
                    <td class="style2">
                        Select Members Type:-</td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="Debit" DataValueField="Debit" 
                            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:conn %>" 
                            SelectCommand="SELECT Distinct [Debit] FROM [AccountMaster] WHERE ([TxnType] = @TxnType)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="TxnType" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td style="text-align: left">
                        <asp:Button ID="btnsend" runat="server" onclick="btnsend_Click" 
                            style="height: 26px" Text="Send" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" 
                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" 
                            PageSize="25">
                            <PagerSettings FirstPageText="First" LastPageText="Last" 
                                NextPageImageUrl="~/Images/next.gif" PreviousPageImageUrl="~/Images/prev.gif" />
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                                            oncheckedchanged="CheckBox1_CheckedChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserCode" HeaderText="UserCode" 
                                    SortExpression="UserCode" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                                    SortExpression="UserName" />
                                <asp:BoundField DataField="DOJ" HeaderText="Date Of joining" 
                                    SortExpression="DOJ" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <EmptyDataTemplate>
                                No Rows Found!
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblSuccess" runat="server" EnableViewState="False" 
                            ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    &nbsp;</td>
            </tr>
        </tr>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>
