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
             #ContentPlaceHolder1_GridView1 > tbody > tr > td:nth-child(5), th:nth-child(5)
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
                            Width="384px" Height="24px" AutoPostBack="True" OnTextChanged="ProductName_TextChanged" Font-Size="12px"></asp:TextBox>
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
            <%--<td class="style20">DP</td>--%>
            <td class="style20">BV</td>
            <td class="style20">CGST %</td>
            <td class="style20">SGST %</td>
          <%--  <td class="style20">IGST</td>--%>


        </tr>

        <tr>
            <td class="style17" style="text-align: left">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="ProductCode" runat="server" Style="margin-top: 20px; width: 115px;"
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

            <td class="style17" style="text-align: center;display:none">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server" style="display:none">
                    <ContentTemplate>
                        <asp:TextBox ID="DP" runat="server" Width="80px" ReadOnly="True" style="display:none"></asp:TextBox>
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
            <td class="style18" style="display:none">
                <asp:UpdatePanel ID="UpdatePanel13" runat="server" style="display:none">
                    <ContentTemplate>
                        <asp:TextBox ID="CashBack" runat="server" Width="80px" ReadOnly="True" style="display:none"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="Qty" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>


             <td class="style18" style="display:none">
                <asp:UpdatePanel ID="UpdatePanel15" runat="server" style="display:none" >
                    <ContentTemplate>
                        <asp:TextBox ID="txtselcashback" runat="server" Width="80px" ReadOnly="True" style="display:none"></asp:TextBox>
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
            <table style="width: 56%; font-size: 14px; font-weight: bold;">
                <tr>
                    <%--<td align="center">Total DP</td>--%>
                    <td align="center">TOTAL BV</td>
                   <%-- <td align="center">COURIER CHARGES</td>--%>
                    <td align="center">TOTAL AMOUNT</td>
                    <td align="center">TOTAL QTY</td>
                   <%-- <td align="center">TOTAL CASH BACK</td>--%>
                </tr>
                <tr>
                    <td align="center" style="display:none">
                        <asp:Label ID="TotalDP" runat="server" Style="font-size: 14px; font-weight: bold;display:none"  ></asp:Label>
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
            <td><strong>Your Final Order Details are above and Products will be delivered subject to selection of Payment Mode and after payment is securely credited to  Diwakar Retail Ltd Account.
            </strong></td>
        </tr>
    </table>
    <table class="style31">
        <%--<tr>
            <td>Payment Date:
            </td>
            <td>
                <asp:TextBox ID="txtpaymentdate" runat="server" CssClass="disable_future_dates" AutoComplete="Off"></asp:TextBox>
                <cc1:CalendarExtender runat="server" ID="CalendarExtender2" TargetControlID="txtpaymentdate"></cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ValidationGroup="vg1" ForeColor="red" ControlToValidate="txtpaymentdate"></asp:RequiredFieldValidator>
            </td>
        </tr>--%>
        <tr>

            <td>Payment Mode:</td>
            <td>

                <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                    <asp:ListItem Value="Select Payment Mode">Select Payment Mode</asp:ListItem>
                      <asp:ListItem Value="Cash">Cash</asp:ListItem>
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

