<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="Kycuploaduser.aspx.cs" Inherits="Sabaic._19111973.Kycuploaduser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlContents" runat="server">

        <h1>Total Kyc Uploads Member</h1>

        <table>
            <tr>
                <td>Status</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" runat="server">

                        <asp:ListItem Value="0">Pending</asp:ListItem>
                        <asp:ListItem Value="1">Approved</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>Member ID</td>
                <td>
                    <asp:TextBox ID="txtmemberid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>

        <table>
            <tr>

                <td><strong>&nbsp;Date From : </strong></td>
                <td>
                    <asp:TextBox ID="txtdatefrom" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="calender1" TargetControlID="txtdatefrom" Format="yyyy-MM-dd"
                        runat="server">
                    </asp:CalendarExtender>
                </td>

            </tr>
            <tr>
                <td><strong>Date To : </strong></td>
                <td>
                    <asp:TextBox ID="txtdateto" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtdateto" Format="yyyy-MM-dd"
                        runat="server">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" />
                </td>
            </tr>


        </table>
        <table>
            <tr>
                <td colspan="2" class="style8">
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None"
                        PageSize="100" Width="954px" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User ID" SortExpression="UserCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="Name"
                                SortExpression="UserName" />

                            <asp:BoundField DataField="LoginPassword" HeaderText="Password"
                                SortExpression="LoginPassword" />
                            <asp:BoundField DataField="MobileNo" HeaderText="Mobile No"
                                SortExpression="MobileNo" />
                            <asp:BoundField DataField="SpName" HeaderText="Sponsor Name"
                                SortExpression="SpName" />
                            <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                            <asp:BoundField DataField="DOJ"
                                HeaderText="DOJ" SortExpression="DOJ" />
                            <asp:BoundField DataField="State" HeaderText="State"
                                SortExpression="State" />
                            <asp:BoundField DataField="City" HeaderText="City"
                                SortExpression="City" />
                            <asp:BoundField DataField="PinAmount" HeaderText="Package"
                                SortExpression="PinAmount" DataFormatString="{0:f2}" />
                            <asp:BoundField DataField="Votercardupdatedate"
                                HeaderText="VoterCardUpdateDate" SortExpression="Votercardupdatedate" />
                            <asp:BoundField DataField="Photoupdatedate"
                                HeaderText="PhotoUpdateDate" SortExpression="Photoupdatedate" />
                            <asp:BoundField DataField="PanCardUpdateDate"
                                HeaderText="PanCardUpdateDate" SortExpression="PanCardUpdateDate" />
                            <asp:BoundField DataField="BankDetailUpdateDate"
                                HeaderText="ChequeBook" SortExpression="BankDetailUpdateDate" />
                            <%-- <asp:BoundField DataField="AdharCardBack"
                                HeaderText="AdharCardBack" SortExpression="AdharCardBack" />--%>

                            <asp:TemplateField HeaderText="AdharCardBack" SortExpression="AdharCardBack">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AdharCardBack") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink5" runat="server" Target="_blank" NavigateUrl='<%# Bind("AdharCardBack") %>'>View</asp:HyperLink>

                                </ItemTemplate>
                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Voter Proof" SortExpression="VoterCard">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VoterCard") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Bind("VoterCard") %>'>View</asp:HyperLink>

                                </ItemTemplate>
                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo " SortExpression="UploadPhoto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UploadPhoto") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" NavigateUrl='<%# Bind("UploadPhoto") %>'>View</asp:HyperLink>

                                </ItemTemplate>
                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Bank Details" SortExpression="CheckBook">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CheckBook") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl='<%# Bind("CheckBook") %>'>View</asp:HyperLink>

                                </ItemTemplate>
                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Pan Card" SortExpression="UploadPhoto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtpancard" runat="server" Text='<%# Bind("PanCardProof") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" NavigateUrl='<%# Bind("PanCardProof") %>'>View</asp:HyperLink>

                                </ItemTemplate>
                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="0px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="Approved"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chk" runat="server" AutoPostBack="true" Checked='<%# Eval("kycApprovedStatus") %>' OnCheckedChanged="chk_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                            HorizontalAlign="Center" />
                        <PagerSettings PageButtonCount="50" />

                    </asp:GridView>


                </td>

            </tr>

        </table>



        <%-- <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="return PrintPanel();" />--%>
        <asp:ImageButton ID="ImageButton1" runat="server"
            ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click" />


    </asp:Panel>





</asp:Content>
