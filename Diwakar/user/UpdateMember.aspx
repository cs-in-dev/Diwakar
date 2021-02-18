<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" Inherits="admin_UpdateMember" Codebehind="UpdateMember.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style26
        {
            text-align: left;
        }
        .style40
        {
           padding:0px 0px 0px 40px;
           text-align:left;
        }
        .text
        {
            font-size: 11px;
        }
        .auto-style1
        {
            height: 19px;
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
    <center style="font-size: x-large;"><strong>EDIT PROFILE</strong></center>
    <table style="width: 650px">
        <tr>
            <td>
                <asp:Panel ID="InformationPanel" runat="server" Style="margin-top: 0px">
                    <table align="center" style="width: 660px">
                        <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="lblPersonalDetails" runat="server" Style="color: #006600; font-weight: 700"
                                    Text="Personal Details"></asp:Label>
                            </td>
                        </tr>
                       <tr>
                            <td class="style40">
                                <asp:Label ID="Label1" runat="server" CssClass="text" Text="MEMBER ID :"></asp:Label>
                            </td>
                            <td class="style26">
                               <asp:TextBox ID="txtBAName" runat="server" Width="170px" CssClass="UpperCase" Enabled="false"></asp:TextBox>  
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" CssClass="text" Text="MEMBER NAME :"></asp:Label>
                            </td>
                            <td class="style26">
                               <asp:TextBox ID="txtName" runat="server"  CssClass="UpperCase" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style40">
                                <asp:Label ID="Label4" runat="server" Text="FATHER / HUSBAND NAME"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="Fname" runat="server" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                            </td>
                            <td>
                                <%--<asp:Label ID="Label3" runat="server" CssClass="text" Text="OWNER NAME :"></asp:Label>--%>
                            </td>
                            <td class="style26">
                                <%--<asp:TextBox ID="txtOwnerName" runat="server" Width="170px" CssClass="UpperCase"></asp:TextBox>--%>
                            </td>
                        </tr>
                        <%--<tr>
                            <td class="style40">
                                &nbsp;</td>
                            <td class="style26">
                                &nbsp;</td>
                        </tr>--%>
                        <tr>
                            <td class="style40">
                                <asp:Label ID="lblDateOfBirth" runat="server" CssClass="text" 
                                    Text="DATE OF BIRTH:"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtDateOfBirth" runat="server"></asp:TextBox>
                                 <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
            TargetControlID="txtDateOfBirth"
            Mask="99/99/9999"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"
            DisplayMoney="Left"
             CultureName="en-GB"
            AcceptNegative="Left"
            ErrorTooltipEnabled="True" />
                                <cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server" 
                                    ControlExtender="MaskedEditExtender2" ControlToValidate="txtDateOfBirth" 
                                    Display="Dynamic" EmptyValueBlurredText="*" 
                                    EmptyValueMessage="Date is required" InvalidValueBlurredMessage="*" 
                                    InvalidValueMessage="Date is invalid" TooltipMessage="Input a date" />
                               
                            </td>
                            <td>
                                <asp:Label ID="lblEmailID0" runat="server" CssClass="text" Text="EMAIL ID:"></asp:Label>                                
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailID" runat="server" Width="150px" ReadOnly="true"></asp:TextBox>                               
                            </td>

                            <td>
                                &nbsp;</td>
                            <td class="style26">
                               
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                               
                            </td>
                        </tr>
                        

                        <tr>
                            <td class="style40">
                                
                                <asp:Label ID="lblMobileNo" runat="server" CssClass="text" Text="MOBILE NO :"></asp:Label>
                                
                            </td>
                            <td class="style26">
                                
                                <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" ValidationGroup="vg3" ReadOnly="true" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="* " ValidationGroup="vg3"></asp:RequiredFieldValidator>
                                
                            </td>
                            <td>
                              
                                <asp:Label ID="lblTelephoneNo" runat="server" CssClass="text" Text="TELEPHONE NO :"></asp:Label>
                              
                            </td>
                            <td class="style26">
                                                             
                                <asp:TextBox ID="txtTelephoneNo" runat="server" MaxLength="10"></asp:TextBox>
                                                             
                            </td>
                        </tr>

                        <tr>
                            <td class="style40">
                                <asp:Label ID="lblAddress" runat="server" CssClass="text" Text="ADDRESS:"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtAddress" runat="server" MaxLength="1000" Height="100px" CssClass="UpperCase" 
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                 <asp:Label ID="Label5" runat="server" CssClass="text" Text="LANDMARK:"></asp:Label>
                            </td>
                            <td >
                                 <asp:TextBox ID="txtLandmark" runat="server" MaxLength="1000" Height="100px"  CssClass="UpperCase"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="Label6" runat="server" CssClass="text" Text="DISTRICT:" Style="margin-left: 39px;"></asp:Label>

                            </td>
                            <td class="style26">
                               <asp:TextBox ID="txtDistrict" runat="server" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                            </td>

                            <td class="style40">
                                <asp:Label ID="lblCity" runat="server" CssClass="text" Text="CITY:" Style="margin-left: -30px;"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtCity" runat="server" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="style40">
                                <asp:Label ID="lblState" runat="server" CssClass="text" Text="STATE :"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtState" runat="server" MaxLength="30" CssClass="UpperCase" Enabled="false"></asp:TextBox>
                            </td>
                            <td >
                                <asp:Label ID="lblcountry" runat="server" CssClass="text" Text="COUNTRY:"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtCountry" runat="server" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="style40">
                                <asp:Label ID="lblPinCode" runat="server" CssClass="text" Text="PIN CODE :"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtPinCode" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            
                        </tr>
                        <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="lblBankDetail" runat="server" Style="font-weight: 700; color: #006600"
                                    Text="Bank Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPanNo" runat="server" CssClass="text" Text="ACCOUNT NUMBER"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtAccountNo" runat="server"  MaxLength="30" CssClass="UpperCase" 
                                  ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtAccountNo" ErrorMessage="*" 
                                    style="color:red" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                   
                            </td>
                            <td>
                                <asp:Label ID="lblBankName" runat="server" CssClass="text" Text="BANK NAME" ></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtBankName" runat="server" MaxLength="30"  CssClass="UpperCase" 
                                   ReadOnly="true" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="lblBankName0" runat="server" CssClass="text" 
                                    Text="BRANCH NAME"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtBranchName" runat="server"  MaxLength="30" ReadOnly="true" CssClass="UpperCase"  
                                    
                                    ></asp:TextBox>
                            </td>
                            <td >
                                <asp:Label ID="Label3" runat="server" CssClass="text" 
                                    Text="AADHAR"></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtAadharnumber" runat="server"  MaxLength="16" ReadOnly="true" CssClass="UpperCase"  
                                    
                                    ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style40">
                                <asp:Label ID="lblAmount" runat="server" CssClass="text" Text="IFSC CODE" Style="  margin-left: -25px;" ></asp:Label>
                            </td>
                            <td class="style26">
                                <asp:TextBox ID="txtIFSCCode" runat="server"  CssClass="UpperCase"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtIFSCCode" ErrorMessage="*" 
                                    style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtIFSCCode" ErrorMessage="Invalid IFSC Code." 
                                    Font-Bold="False" ForeColor="Red" SetFocusOnError="True" 
                                    ValidationExpression="\w{4}\d{7}" ValidationGroup="vg2"></asp:RegularExpressionValidator>
                            </td>
                            <td style="font-size: 11px" >
                                PAN No.</td>
                            <td class="style26">
                                <asp:TextBox ID="txtPanNo" runat="server" MaxLength ="10" ReadOnly="true" CssClass="UpperCase" 
                                    ></asp:TextBox>
                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPanNo" ErrorMessage="Enter PAN No." 
                                    style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>--%>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtPanNo" ErrorMessage="Invalid Input." Font-Bold="False" 
                                    ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w{2}\d{16}" 
                                    ValidationGroup="vg2"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td align="right">
                                &nbsp;
                                <asp:HiddenField ID="Hiddenpassword" runat="server" />
                            </td>
                        </tr>

                         <tr>
                            <td align="left" colspan="4">
                                <asp:Label ID="KYCUpload" runat="server" Style="font-weight: 700; color: #006600"
                                    Text="KYC"></asp:Label>
                            </td>
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
                                <asp:HiddenField ID="status" runat="server" />
                                <asp:HiddenField ID="usertype" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update"  onclick="btnUpdate_Click" 
                                     />
                                
                            </td>
                        </tr>
                        
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
