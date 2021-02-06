<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMasterPage.master" CodeBehind="AddStoreInvoiceOLD.aspx.cs" Inherits="totalfuturcare.User.AddStoreInvoiceOLD" EnableEventValidation="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>


    <style type="text/css">
        table#table1 th, td {
            padding: 6px;
        }
         #ContentPlaceHolder1_GridView1 > tbody > tr > td:nth-child(13), th:nth-child(13)
         {
            display:none;
        }
          #ContentPlaceHolder1_GridView1 > tbody > tr > td:nth-child(9), th:nth-child(9)
         {
            display:none;
        }
          #ContentPlaceHolder1_GridView1 > tbody > tr > td:nth-child(10), th:nth-child(10)
         {
            display:none;
        }
           #ContentPlaceHolder1_GridView1 > tbody > tr > td:nth-child(14), th:nth-child(14)
         {
            display:none;
        }
         /*#ContentPlaceHolder1_GridView1 > tbody > tr > td:nth-child(4), th:nth-child(13)
         {
            display:none;
        }*/

                 #ContentPlaceHolder1_autoCompleteExtender1_completionListElem{
font-size: 12px!important;
min-width:200px;
max-height: 300px;
overflow:auto;
}
    </style>

  <%--  <script type="text/javascript">
        function checkDate(sender, args) {
            var toDate = new Date();
            toDate.setMinutes(0);
            toDate.setSeconds(0);
            toDate.setHours(0);
            toDate.setMilliseconds(0);

            //Check if the date selected is less than todays date
            if (sender._selectedDate != toDate) {
                //show the alert message
                alert("You Can Not Select The Future or Past Date");
                //set the selected date to todays date in calendar extender control
                sender._selectedDate = toDate;

                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))

            }

        }
    </script>--%>
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="css/Extension.min.js" type="text/javascript"></script>
    <%-- <table id="table1">
            <tr>
                <td style="text-align: right; font-size: small; font-family: Verdana;">
                    <asp:Label ID="Label1" runat="server" style="font-size: 12px" 
                        Text="User Code :"></asp:Label>
                </td>
                <td style="text-align: left; font-size: small; font-family: Verdana;">
                    <asp:TextBox ID="txtUserCode" runat="server" AutoPostBack="True" 
                        ontextchanged="txtUserCode_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Size="12px" ForeColor="Red" ControlToValidate="txtUserCode" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label2" runat="server" style="font-size: 12px" Text="Name :"></asp:Label>
                </td>
                <td class="style35">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Font-Size="15px" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-family: Verdana;" class="style39">
                    Remaining BV Points :</td>
                <td style="text-align: left; font-size: small; font-family: Verdana;">
                    
                    <asp:TextBox ID="txtRemBvpoints" runat="server" Enabled="false" ></asp:TextBox>
                </td>
            </tr>

        </table>--%>


    <table>
        <tr>
            <td>Usercode 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBox1" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox ID="TextBox1" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
            </td>
            <td>Username 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBox2" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox ID="TextBox2" AutoPostBack="true" Enabled="false" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>User Mobileno 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="TextBox4" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox ID="TextBox4" AutoPostBack="true" Enabled="false" runat="server"></asp:TextBox>
            </td>
            <td>Balance 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="TextBox5" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox ID="TextBox5" AutoPostBack="true" Enabled="false" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table>
        
        <tr>
            <td>Product Name
            </td>
            <td align="left" colspan="8">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="ProductName" runat="server"
                            Width="450px" AutoPostBack="True" OnTextChanged="ProductName_TextChanged" Font-Size="12px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ProductName" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg2"></asp:RequiredFieldValidator>
                        <cc1:AutoCompleteExtender ServiceMethod="GetProductNameList"
                            MinimumPrefixLength="1"
                            CompletionInterval="0" EnableCaching="true" CompletionSetCount="10"
                            TargetControlID="ProductName"
                            ID="autoCompleteExtender2" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <a id="imageload" runat="server" target="_blank">
                            <asp:Image ID="Image1" ImageUrl="~/user/images/s-logo.png" Width="40px" runat="server" /></a>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <tr>
            <td>Product Code</td>
            <td class="style20">MRP</td>
            <td class="style20">DP</td>
            <td class="style20">BV</td>
            <td class="style20">CGST</td>
            <td class="style20">SGST</td>
          <%--  <td class="style20">IGST</td>--%>


        </tr>

        <tr>
            <td class="style17" style="text-align: left">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="ProductCode" runat="server" Style="margin-top: 20px; width: 60px;"
                            AutoPostBack="True" OnTextChanged="ProductCode_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ProductCode" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg2"></asp:RequiredFieldValidator>
                       
                        <asp:HiddenField ID="PID" runat="server" />
                        <cc1:AutoCompleteExtender ServiceMethod="GetProductCodeList"
                            MinimumPrefixLength="1"
                            CompletionInterval="0" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="ProductCode"
                            ID="autoCompleteExtender1" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

            <td class="style17" style="text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="MRP" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

            <td class="style17" style="text-align: center">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="DP" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

            <td class="style17">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="BV" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style17">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="CGST" runat="server" Width="60px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style17">
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="SGST" runat="server" Width="60px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style17">
                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="IGST" runat="server" Width="60px" ReadOnly="True" style="display:none"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>



            <%--     <td class="style18">
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtAVLQTY" runat="server" Width="35px" Enabled="false"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                      
                    </Triggers>
                </asp:UpdatePanel>
            </td>--%>
        </tr>

        <tr>
           <%-- <td class="style20">Tax</td>--%>
            <td class="style20">Qty</td>
            <%--<td class="style20">Special Discount</td>--%>
            <td class="style20">Amount</td>
           <%-- <td class="style20">CashBack</td>--%>
            <td class="style17" style="text-align: left">&nbsp;</td>
            <td class="style17" style="text-align: center">&nbsp;</td>
            <td class="style17">&nbsp;</td>
            <td class="style17">&nbsp;</td>
            <td class="style18">&nbsp;</td>
            <td class="style18">&nbsp;</td>

        </tr>
        <tr>
            <td class="style17" style="display:none">
                <asp:UpdatePanel ID="UpdatePanel8" runat="server" style="display:none">
                    <ContentTemplate>
                        <asp:TextBox ID="Tax" runat="server" Width="45px" ReadOnly="True" style="display:none"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

            <td class="style18">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="Qty" runat="server" AutoPostBack="True" Style="width: 45px;"
                            OnTextChanged="Qty_TextChanged"></asp:TextBox>
                        <cc1:FilteredTextBoxExtender ID="Qty_FilteredTextBoxExtender"
                            runat="server" Enabled="True" FilterType="Numbers" TargetControlID="Qty">
                        </cc1:FilteredTextBoxExtender>
                        <asp:RegularExpressionValidator ID="revQty" runat="server"
                            ControlToValidate="Qty" ErrorMessage="*" ForeColor="#CC0000"
                            ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style18" style="display:none">
                <asp:UpdatePanel ID="UpdatePanel14" runat="server" style="display:none">
                    <ContentTemplate>
                        <asp:TextBox ID="SPDiscount" runat="server" Width="80px" ReadOnly="True" style="display:none"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="Qty" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

            <td class="style18">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="Amount" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="Qty" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style18">
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click"
                    Text="Add To Cart" ValidationGroup="vg2" Style="width: 100px" />
            </td>
            <td class="style18">
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="CashBack" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="Qty" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>


             <td class="style18">
                <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtselcashback" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="Qty" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
           
        </tr>

        <asp:Panel ID="Panel1" runat="server">
            <tr>
                <td colspan="12">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" DataKeyNames="ID"
                        GridLines="None" OnRowDeleting="GridView1_RowDeleting" PageSize="100" Font-Size="Medium" Font-Bold="true"
                        Width="40%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />

                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#47d9bf" Font-Bold="True" Font-Size="Medium" ForeColor="White" />
                        <HeaderStyle BackColor="#47d9bf" Font-Bold="True" Font-Size="Medium" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" Font-Bold="True" Font-Size="Medium" />
                        <RowStyle BackColor="#F7F6F3" Font-Bold="True" Font-Size="Medium" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" Font-Size="Medium" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style17">&nbsp;</td>
                <td class="style18">&nbsp;</td>
                <td class="style18">&nbsp;</td>
                <td class="style18">&nbsp;</td>
                <td class="style18">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="12"></td>
            </tr>
            <table style="width: 95%; font-size: 14px; font-weight: bold;">
                <tr>
                    <td align="center">Total DP</td>
                    <td align="center">TOTAL BV</td>
                   <%-- <td align="center">COURIER CHARGES</td>--%>
                    <td align="center">TOTAL AMOUNT</td>
                    <td align="center">TOTAL QTY</td>
                   <%-- <td align="center">TOTAL CASH BACK</td>--%>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="TotalDP" runat="server" Style="font-size: 14px; font-weight: bold;"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="TotalBV" runat="server" Style="font-size: 14px; font-weight: bold;"></asp:Label>
                    </td>
                    <td align="center" style="display:none">
                        <asp:Label ID="CourierCharges" runat="server" Style="font-size: 14px; font-weight: bold; display:none"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="TotalAmount" runat="server" Style="font-size: 14px; font-weight: bold;"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="TotalQty" runat="server" Style="font-size: 14px; font-weight: bold;"></asp:Label>
                    </td>
                  <%--  <td align="center">
                        <asp:Label ID="TotalCashBack" runat="server" Style="font-size: 14px; font-weight: bold;"></asp:Label>
                    </td>--%>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4"></td>
                </tr>
            </table>
        </asp:Panel>
    </table>
    <table>
        <tr>
            <td><strong>Your Final Order Details are above and Products will be delivered subject to selection of Payment Mode and after payment is securely credited to  cyrashine Private Limited Account.
            </strong></td>
        </tr>
    </table>
    <table class="style31">
        <tr>
            <td>Payment Date:
            </td>
            <td>
                <asp:TextBox ID="txtpaymentdate" runat="server" CssClass="disable_future_dates" AutoComplete="Off"></asp:TextBox>
                <cc1:CalendarExtender runat="server" ID="CalendarExtender2" TargetControlID="txtpaymentdate"></cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ValidationGroup="vg1" ForeColor="red" ControlToValidate="txtpaymentdate"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>

            <td>Payment Mode:</td>
            <td>

                <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                    <asp:ListItem Value="Select Payment Mode">Select Payment Mode</asp:ListItem>
                    <asp:ListItem Value="DD">DD</asp:ListItem>
                    <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                    <asp:ListItem Value="Debit/Credit Card">Debit/Credit Card</asp:ListItem>
                    <asp:ListItem Value="IMPS">IMPS</asp:ListItem>
                    <asp:ListItem Value="NEFT">NEFT</asp:ListItem>
                    <asp:ListItem Value="Repurchase Wallet">Repurchase Wallet</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownList1" InitialValue="Select Payment Mode" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator>

            </td>
            <td>
                <%--  
                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" OnClick="btnSubmit_Click"
                            style="font-size: small; font-family: Verdana;" 
                            Text="Submit" ValidationGroup="vg1"/>
                            <asp:Label ID="Label7" runat="server" Text=""></asp:Label>--%>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Request OTP" ValidationGroup="vg1" />

            </td>
        </tr>
    </table>
    <asp:Panel ID="panelcheque" runat="server">
        <table class="style31" style="margin-left:27%">
            <tr>
                <td>
                    <asp:Label ID="lblChecqueNo" runat="server" Text="Checque No :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtChecqueNo" />
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="*" ControlToValidate="txtChecqueNo" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Checque Date :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="ChecqueDate" autocomplete="off"/></td>
                <cc1:CalendarExtender runat="server" ID="CE1" TargetControlID="ChecqueDate"></cc1:CalendarExtender>

                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="ChecqueDate" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Bank Name :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtBankName" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtBankName" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label3" ForeColor="Red" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="panel5" runat="server">
        <table class="style31" style="margin-left:27%">
            <tr>
                <td>
                    <asp:Label ID="lblDDNO" runat="server" Text="DD No :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtddno" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtddno" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="DD Date :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtdddate" autocomplete="off" /></td>
                <cc1:CalendarExtender runat="server" ID="CalendarExtender4" TargetControlID="txtdddate"></cc1:CalendarExtender>

                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="txtdddate" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="DD Bank Name :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtddbankname" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="txtddbankname" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label15" ForeColor="Red" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>


    <asp:Panel ID="panel2" runat="server">
        <table class="style31" style="margin-left:27%">

            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Reference No. :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtrefno" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtBankName" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="IMPS Date :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtdate" autocomplete="off"/></td>
                <cc1:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="txtdate"></cc1:CalendarExtender>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtdate" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <%-- <tr><td><asp:Label ID="Label11" runat="server" Text="IMPS Amount"></asp:Label></td>
                        <td><asp:TextBox runat="server" ID="txtAmount" inputype="Number" /></td>
                          <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtAmount" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
                        </tr>--%>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label12" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="panel4" runat="server">
        <table class="style31" style="margin-left:27%">

            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Reference No. :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtneftrefNo" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtneftrefNo" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="NEFT Date :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtnNeftdate" autocomplete="off"/></td>
                <cc1:CalendarExtender runat="server" ID="CalendarExtender3" TargetControlID="txtnNeftdate"></cc1:CalendarExtender>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtnNeftdate" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <%-- <tr><td><asp:Label ID="Label11" runat="server" Text="IMPS Amount"></asp:Label></td>
                        <td><asp:TextBox runat="server" ID="txtAmount" inputype="Number" /></td>
                          <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtAmount" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
                        </tr>--%>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="panel6" runat="server">
        <table class="style31" style="margin-left:27%">

            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Reference No. :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtreffno" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ControlToValidate="txtreffno" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" Text="Transation Date :"></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txttransationsdate" autocomplete="off"/></td>
                <cc1:CalendarExtender runat="server" ID="CalendarExtender5" TargetControlID="txttransationsdate"></cc1:CalendarExtender>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ControlToValidate="txttransationsdate" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
            </tr>
            <%-- <tr><td><asp:Label ID="Label11" runat="server" Text="IMPS Amount"></asp:Label></td>
                        <td><asp:TextBox runat="server" ID="txtAmount" inputype="Number" /></td>
                          <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtAmount" ForeColor="Red" Font-Size="16px" ValidationGroup="vg1"></asp:RequiredFieldValidator></td>
                        </tr>--%>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label17" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <table class="style31" style="margin-left:27%">
        <tr>
            <td></td>

            <td>
                <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" OnClick="Button2_Click"
                    Style="font-size: small; font-family: Verdana;"
                    Text="Submit" ValidationGroup="vg1" />
                <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
            <td></td>
        </tr>
    </table>
    <asp:Panel ID="Panel3" runat="server">
        <table style="margin-left: 27%;">
            <tr>
                <td>Enter OTP Number</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button3" OnClick="Button3_Click" runat="server" Text="Submit" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />


    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField3" runat="server" Value="-1" />
    <asp:HiddenField ID="HiddenField4" runat="server" />
    <asp:HiddenField ID="HiddenField5" runat="server" />
    <asp:HiddenField ID="HiddenField6" runat="server" />
    <asp:HiddenField ID="HiddenField7" runat="server" />
    <asp:HiddenField ID="HiddenField8" runat="server" />
    <asp:HiddenField ID="HiddenField9" runat="server" />
    <asp:HiddenField ID="HiddenField10" runat="server" />

</asp:Content>

