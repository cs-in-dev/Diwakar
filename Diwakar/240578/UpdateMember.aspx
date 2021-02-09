<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" Inherits="SuperAdminUpdateMember" Codebehind="UpdateMember.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style26
        {
            text-align: left;
        }
        .style27
        {
            text-align: left;
        }
    </style>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
 
    $(document).ready(function () {
        $('input[type=text]').filter('.UpperCase').change(function () {
            var val = $(this).val();
            $(this).val(val.toUpperCase());
        });
    });
</script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
     function showimagePanCard(input) {
        if (input.files && input.files[0]) {
            var filerdr = new FileReader();
            filerdr.onload = function (e) {
                $('#ContentPlaceHolder1_ImagePANCard').attr('src', e.target.result);
            }
            filerdr.readAsDataURL(input.files[0]);
        }
    }

    function showimageAddressProof(input) {
        if (input.files && input.files[0]) {
            var filerdr = new FileReader();
            filerdr.onload = function (e) {
                $('#ContentPlaceHolder1_ImageAddressProof').attr('src', e.target.result);
            }
            filerdr.readAsDataURL(input.files[0]);
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <table style="width: 600px" align="center">
        <tr>
            <td align ="center" valign = "middle">
                             
                                <asp:Label ID="lblUserCode" runat="server" CssClass="text" 
                    Text="Member ID:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtMemberCode" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMemberCode"
      ErrorMessage="Enter Your MemberID" ValidationGroup="vg2" 
       Font-Bold="False" style="color: #FF0000"></asp:RequiredFieldValidator>
         <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
       runat="server" ControlToValidate="txtMemberCode" ErrorMessage="Invalid Your MemberID" 
       Font-Bold="False" ForeColor="Red" SetFocusOnError="True" 
        ValidationExpression="^[A-Z]{9}\d+$"--  ></asp:RegularExpressionValidator>--%>
            </td>
        </tr>
        <tr>
            <td align ="center" valign = "middle">
                                <asp:Button ID="btnGetInfo" runat="server" onclick="btnGetInfo_Click" 
                                    Text="Get Profle" />
            </td>
        </tr>
        <tr>
            <td align ="center" valign = "middle">
                                <asp:Label ID="Label1" runat="server" style="color: #990000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="InformationPanel" runat="server" Style="margin-top: 0px">
                    <table align="center" style="width: 800px">
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Label ID="lblJoinUs" runat="server" Text="Update Profile" Font-Bold="True" 
                                    ForeColor="Blue"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="lblPersonalDetails0" runat="server" 
                                    Style="color: #006600; font-weight: 700" Text="Login Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Login Password</td>
                            <td class="style27">
                                <asp:TextBox ID="txtLoginPassword" runat="server" ValidationGroup="vg3" 
                                    MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="txtname" ErrorMessage="*" ValidationGroup="vg3"></asp:RequiredFieldValidator>
                            </td>
                            <td align="right">
                                Transaction Password</td>
                            <td class="style27">
                                <asp:TextBox ID="txtTransactionPassword" runat="server" ValidationGroup="vg3" 
                                    MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="lblPersonalDetails" runat="server" 
                                    Style="color: #006600; font-weight: 700" Text="Personal Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblname" runat="server" CssClass="text" Text="Name"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtname" runat="server" ValidationGroup="vg3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtname"
                                    ErrorMessage="*" ValidationGroup="vg3"></asp:RequiredFieldValidator>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblcountry" runat="server" CssClass="text" Text="Country:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtcountry" runat="server" ValidationGroup="vg3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblDateOfBirth" runat="server" CssClass="text" Text="Date Of Birth:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtDateOfBirth" runat="server"></asp:TextBox>
                               <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
            TargetControlID="txtDateOfBirth"
            Mask="99/99/9999"
             CultureName="en-GB"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"
            DisplayMoney="Left"
            AcceptNegative="Left"
            ErrorTooltipEnabled="True" />
        <cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
            ControlExtender="MaskedEditExtender2"
            ControlToValidate="txtDateOfBirth"
            EmptyValueMessage="Date is required"
            InvalidValueMessage="Date is invalid"
            Display="Dynamic"
            TooltipMessage="Input a date"
            EmptyValueBlurredText="*"
            InvalidValueBlurredMessage="*"
            />
                            </td>
                            <td align="right">
                                <asp:Label ID="lblPinCode" runat="server" CssClass="text" Text="Postal Code:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtPinCode" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblAddress" runat="server" CssClass="text" Text="Address:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblMobileNo" runat="server" CssClass="text" Text="Mobile No:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtMobileNo" runat="server" ValidationGroup="vg3" 
                                    MaxLength="10" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMobileNo"
                                    ErrorMessage="* " ValidationGroup="vg3"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblCity" runat="server" CssClass="text" Text="City:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtcity" runat="server" ValidationGroup="vg3"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblTelephoneNo" runat="server" CssClass="text" Text="Telephone No:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtTelephoneNo" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblState" runat="server" CssClass="text" Text="State:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtstate" runat="server" ValidationGroup="vg3"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblEmailID0" runat="server" CssClass="text" Text="Email ID:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>

                            <td>
                                <asp:Label ID="Label6" runat="server" CssClass="text" Text="District:" Style="margin-left: 39px;"></asp:Label>

                            </td>
                            <td class="style26">
                               <asp:TextBox ID="txtDistrict" runat="server" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                            </td>
                               <td>
                                <asp:Label ID="Label7" runat="server" CssClass="text" Text="Land Mark:" Style="margin-left: 39px;"></asp:Label>

                            </td>
                               <td class="style26">
                                 <asp:TextBox ID="txtLandmark" runat="server" MaxLength="30" CssClass="UpperCase"  TextMode="MultiLine"
                                    ></asp:TextBox>
                            </td>

                         </tr>
                         <tr>

                            <td>
                                <asp:Label ID="Label8" runat="server" CssClass="text" Text="Father Name:" Style="margin-left: 39px;"></asp:Label>

                            </td>
                             <td class="style26">
                                 <asp:TextBox ID="Fname" runat="server" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                             </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="lblBankDetail" runat="server" Style="font-weight: 700; color: #006600"
                                    Text="Account Detail"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblAmount" runat="server" CssClass="text" Text="Account No.:"></asp:Label>
                            </td>
                            <td class="style27">
                                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" CssClass="text" Text="Bank Name:"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtbankname" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><asp:Label ID="Label3" runat="server" CssClass="text" 
                                    Text="Branch Name"></asp:Label></td>
                            <td class="style27"><asp:TextBox ID="txtbranch" runat="server"></asp:TextBox></td>
                            <td align="right"><asp:Label ID="Label5" runat="server" CssClass="text" 
                                    Text="IFSCCode"></asp:Label></td>
                            <td class="style26"><asp:TextBox ID="txtifsc" runat="server"></asp:TextBox></td>
                        </tr>

                         <tr>
                            <td align="right"><asp:Label ID="Label4" runat="server" CssClass="text" 
                                    Text="PanNo"></asp:Label></td>
                            <td class="style27"><asp:TextBox ID="txtpanno" runat="server"></asp:TextBox></td>
                            <td align="right"><asp:Label ID="Label16" runat="server" CssClass="text" 
                                    Text="Aadhar No"></asp:Label></td>
                            <td class="style26"><asp:TextBox ID="txtAadharnumber" runat="server"></asp:TextBox></td>
                        </tr>
                         
                             <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td align="right">
                                &nbsp;
                                <asp:hiddenfield id="hiddenpassword" runat="server" />
                            </td>
                        </tr>
                       <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="KYCUpload" runat="server" Style="font-weight: 700; color: #006600"
                                    Text="KYC"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                &nbsp;</td>
                        </tr>
                         <tr>
                             <td align="right">PANCard</td>
                            <td class="style26">
                                <asp:FileUpload ID="FileUploadPANCard" runat="server"  onchange="showimagePanCard(this)"   />
                            </td>
                            <td class="style26"><asp:Image ID="ImagePANCard" runat="server" Width="100px" /></td>
                          
                            <td class="style27"> 
                                <a id="PanCard"  runat="server" target="_blank">Click to View</a></td>
                        </tr>
                        <tr>
                             <td align="right">AddressProof</td>
                            <td class="style26">
                                <asp:FileUpload ID="FileUploadAddressProof" runat="server"  onchange="showimageAddressProof(this)"   />
                            </td>
                            <td class="style26"><asp:Image ID="ImageAddressProof" runat="server" Width="100px" /></td>
                             
                            <td class="style27"><a id="AddressP"  runat="server" target="_blank">Click to View</a></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Label ID="lblMessage" runat="server" Style="color: #FF0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="vg3" onclick="btnUpdate_Click" 
                                     />
                            </td>
                        </tr>
                        
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
   </center>
</asp:Content>
