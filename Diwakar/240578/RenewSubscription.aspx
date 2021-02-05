<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true"
    CodeBehind="RenewSubscription.aspx.cs" Inherits="FastMoneyMakers1.User.Investment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 75%; margin-left: 10%;">


        <table>
            <tr>

                <td>
                    <asp:Label ID="lbldate" runat="server" Text=""></asp:Label>
                </td>
                <td></td>
                <td style="text-align: left" class="style42">&nbsp;<asp:Label ID="lblsponsor" runat="server" Text=""></asp:Label>
                </td>
            </tr>

            <tr>
                <td align="left">Member ID
                </td>
                <td></td>
                <td style="text-align: left" class="style42">
                    <asp:TextBox ID="txtMemberID" runat="server" ValidationGroup="vg1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMemberID"
       ErrorMessage="Enter Your MemberID"
      Font-Bold="False" style="color: #FF0000" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                
            
                </td>
            </tr>
            <tr>
                <td class="style36"></td>
                <td></td>
            <td style="text-align: left" class="style42">
                    <asp:Button ID="btnVerify" runat="server" Text="Verify" OnClick="btnVerify_Click" ValidationGroup="vg1"/>
                        
                </td></tr>


            <tr>
                <td align="left"><asp:Label ID="Label2" runat="server" Text="Member Name"></asp:Label>
                </td>
                <td></td>
                <td style="text-align: left" class="style42">
                    <%--<asp:Label ID="lblName" runat="server" Enabled="false"></asp:Label>--%>
                    <asp:TextBox ID="TxtMemberName" runat="server" Enabled="false"></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td align="left">Desired Plan</td>
                <td><%=ConfigurationManager.AppSettings["Currency"].ToString()%></td>
                <td style="text-align: left" class="style42">
                   <%-- <asp:DropDownList ID="txtAmount" runat="server">
                    </asp:DropDownList>--%>
                    <asp:TextBox ID="txtAmount" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>

                </td>
            </tr>

            <%--<tr>
                <td align="left"><asp:Label ID="Label3" runat="server" Text="Joining Pv"></asp:Label>
                </td>
                <td></td>
                <td style="text-align: left" class="style42">
                    
                    <asp:TextBox ID="txtJoiningPV" runat="server" Enabled="false"></asp:TextBox>
                </td>
            </tr>--%>
          
            <tr>
                <td align="left">Voucher
                </td>
                <td></td>
                <td style="text-align: left" class="style42">
                    <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                </td>
            </tr>
           

            <%--<tr>
                <td align="left">Password
                </td>
                <td></td>
                <td style="text-align: left" class="style42">
                    <asp:TextBox ID="txtTxnpassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTxnpassword"
       ErrorMessage="Enter Your Password"
      Font-Bold="False" style="color: #FF0000"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
          
            <tr>
                <td class="style36"></td>
                <td></td>
                <td style="text-align: left" class="style42">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                        Text="Submit" ValidationGroup="vg1"/>
                </td>
            </tr>

            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" DataSourceID="SqlDataSource1" GridLines="None"
                        Width="495px" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Date" HeaderText="Date"
                                SortExpression="Date" />
                            <asp:BoundField DataField="Particulars" HeaderText="Particulars"
                                SortExpression="Particulars" />
                            <asp:BoundField DataField="Investment" HeaderText="Panel"
                                SortExpression="Investment" ReadOnly="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:conn %>"
                        SelectCommand="SELECT Convert(nvarchar,DateofTransaction,103) AS Date, Particulars, CAST(Debit AS Int) AS Investment FROM AccountMaster WHERE (MemberID = @MemberID) AND (TxnType = @TxnType) AND (Credit = 0)">
                        <SelectParameters>
                            <asp:SessionParameter Name="MemberID" SessionField="UserCode" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="TxnType" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>



    </div>
</asp:Content>
