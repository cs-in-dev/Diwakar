<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="EditDispatchDetails.aspx.cs" Inherits="Rainsonglobal._240578.EditDispatchDetails2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />
    <br />

    <b><span style="text-align: center; font-size: 18px;">Edit Dispatch Details</span></b>

    <br />
    <br />
    <center>
        <div>
            <table>
                <tr>
                    <td>Enter Order Id</td>
                    <td>
                        <asp:TextBox ID="txtOrderId" runat="server"></asp:TextBox></td>
                </tr>
                
            </table>
            <center>
                <table>
                <tr>
                    <td colspan="2" >
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="vg2"/>
                    </td>
                </tr></table>
            </center>
            
        </div>

        <br />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="false"> 
             <table>
            <tr>
                <td>Dispatch Date</td>
                <td>
                    <asp:TextBox ID="txtcalender" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"
                        TargetControlID="txtcalender" PopupButtonID="txtcalender">
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtcalender" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <%--<tr>
                <td>Courier Company Name
                </td>
                <td>
                    <asp:TextBox ID="txtcouriercomanyName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtcouriercomanyName" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Tracking Code
                </td>
                <td>
                    <asp:TextBox ID="txttrackingcode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttrackingcode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
            <tr>
                <td>Payment Mode
                </td>
                <td>
                    <asp:DropDownList ID="ddlpaymentmode" runat="server" AutoPostBack="true"  >
                        <asp:ListItem Value="Select">Select</asp:ListItem>
                        <asp:ListItem Value="Cash">Cash</asp:ListItem>
                        <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                       <%-- <asp:ListItem Value="Bank Deposit">Bank Deposit</asp:ListItem>--%>
                        <asp:ListItem Value="IMPS">IMPS</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="ddlpaymentmode" InitialValue="Select" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

        </table>

      
        <asp:Panel ID="panelcash" runat="server" Visible="false">
            <center>
                <table>
                    <tr>
                        <td>Payment Date&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp&nbsp</td>
                        <td>
                            <asp:TextBox ID="txtcashPaymentdate" runat="server" ></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy"
                                TargetControlID="txtcashPaymentdate" PopupButtonID="txtcashPaymentdate">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcashPaymentdate" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>
                            <asp:TextBox ID="txtcashAmount" runat="server"  TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtcashAmount" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers, Custom"
                                ValidChars="." TargetControlID="txtcashAmount" />
                        </td>
                    </tr>
                </table>
            </center>
        </asp:Panel>
        <asp:Panel ID="panelcheque" runat="server" Visible="false">
            <center>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblChecqueNo" runat="server" Text="ChecqueNo"></asp:Label>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp</td>
                        <td>
                            <asp:TextBox runat="server" ID="txtChecqueNo"  />
                          <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="*" ControlToValidate="txtChecqueNo" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="ChecqueDate/DDdate"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtChecqueDate" />
                            <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="txtChecqueDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtChecqueDate" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Amount"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtchequeamount"  TextMode="number"/>
                            <asp:CalendarExtender runat="server" ID="CalendarExtender5" TargetControlID="txtchequeamount"></asp:CalendarExtender>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtchequeamount" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Bank Name"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtBankName" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtBankName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </center>
        </asp:Panel>
        <%--<asp:Panel ID="panelbankdeposit" runat="server" Visible="false">
            <center>
                <table>

                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Deposit Date"></asp:Label>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp</td>
                        <td>
                            <asp:TextBox runat="server" ID="txtbankdepositdate" />
                            <asp:CalendarExtender runat="server" ID="CalendarExtender3" TargetControlID="txtbankdepositdate"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtbankdepositdate" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Amount"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtbankdepositAmount" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="txtbankdepositAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Bank Name"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtbankdepositbankname" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtbankdepositbankname" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Branch Name"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtbankdepositbranchname" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtbankdepositbranchname" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </center>
        </asp:Panel>--%>
        <asp:Panel ID="panelNeft" runat="server" Visible="false">
            <center>
                <table>

                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Payment Date"></asp:Label>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp  &nbsp  </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtneftpaymnetdate" />
                            <asp:CalendarExtender runat="server" ID="CalendarExtender4" TargetControlID="txtneftpaymnetdate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="txtneftpaymnetdate" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Amount"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtneftamount"  TextMode="Number"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtneftamount" ForeColor="Red"></asp:RequiredFieldValidator>
                            <%-- <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers, Custom"
    ValidChars="." TargetControlID="txtneftamount" />--%>
                           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ValidationExpression="^\d+(\.\d{2})?$" ControlToValidate="txtneftamount" ForeColor="red"></asp:RegularExpressionValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Refrence Number"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtnefRefrencennum" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtnefRefrencennum" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                </table>
            </center>
        </asp:Panel>
        <br />
        <br />

        <table>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnsave" runat="server" Text="Update" OnClick="btnsave_Click"/>
                </td>
            </tr>
        </table>
        <br />
        <br />
              </asp:Panel>
</asp:Content>
