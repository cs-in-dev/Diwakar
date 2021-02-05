<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/240578/AdminMasterPage.master" CodeBehind="FreeRegistration.aspx.cs" Inherits="RealSecureLife.FreeRegistration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <title></title>

    <meta id="viewport" name="viewport" />
<script>
    (function (doc) {
        var viewport = document.getElementById('viewport');
        if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i)) {
            doc.getElementById("viewport").setAttribute("content", "initial-scale=0.3");
        } else if (navigator.userAgent.match(/iPad/i)) {
            doc.getElementById("viewport").setAttribute("content", "initial-scale=0.7");
        }
    } (document));
</script>

    <meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <script type="text/javascript" language="JavaScript1.2">

        if (document.all) {
            document.onkeydown = function () {
                var key_f5 = 116; // 116 = F5 

                if (key_f5 == event.keyCode) {
                    event.keyCode = 27;

                    return false;
                }
            }
        }

    </script>
    <script type="text/javascript">
        function DisableButtons() {
            var inputs = document.getElementsByTagName("INPUT");
            for (var i in inputs) {
                if (inputs[i].type == "button" || inputs[i].type == "submit") {
                    inputs[i].disabled = true;
                    inputs[i].value = "processing..";
                }
            }
        }
        window.onbeforeunload = DisableButtons; //uncomment to use this script.
    </script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {        
        $('input[type=text]').filter('.UpperCase').change(function () {
            var val = $(this).val();
            $(this).val(val.toUpperCase());
        });
    });
</script>
   
    <style type="text/css">
        table
        {
            width:95%;
        }
        .style28
        {
            font-family: "Century Gothic";
        }
        .style29
        {
            text-align: left;
            vertical-align: baseline;
        }
        .style31
        {
            width: 220px;
            text-align: left;
            vertical-align: baseline;
        }
        .style32
        {
            text-align: right;
            width: 405px;
        }
        .style33
        {
            width: 405px;
            text-align: left;
            color: #993333;
            font-weight: 700;
        }
        .button
        {
            height: 26px;
        }
        .style38
        {
            width: 247px;
            text-align: left;
            vertical-align: baseline;
        }
        .style39
        {
            width: 159px;
            text-align: left;
        }
        </style>
</asp:Content>
 <asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1" ID="bodyContent">

    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
			<div class="content">
		<div class="container">
			<div class="container-inner">
				
				<div class="content-column-content">
   <h1>Join Now</h1>
   


 <center>
                <asp:Panel ID="Panel2" runat="server" Width="100%"   CssClass="style28">
              
             <%--<asp:Panel ID="PinPannel" runat="server" Width="100%" CssClass="style28">
                   
                    <table class="style13">
                        <tr>
                            <td class="style11" style="vertical-align:top;">
                                <asp:Label ID="lblSponserID0" runat="server" Text="Enter Pin * :"></asp:Label></td>
                            <td class="style36">
                                <asp:TextBox ID="txtYourPin" runat="server" ValidationGroup="vg1" ForeColor="Blue"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqYourPIN" runat="server" ControlToValidate="txtYourPin"
                                    ErrorMessage="Enter Your Pin" ForeColor="Red" ValidationGroup="vg1"></asp:RequiredFieldValidator>
                                &nbsp;<asp:RegularExpressionValidator ID="rfv2" 
                                    runat="server" ControlToValidate="txtYourPin" ErrorMessage="Invalid Pin" 
                                    ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z]{2}\d+$" 
                                    ValidationGroup="vg1"></asp:RegularExpressionValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="style35">
                                &nbsp;</td>
                            <td class="style34">
                                <asp:Button ID="btnCheckSponsorPin" runat="server" 
                                    OnClick="btnCheckSponsorPin_Click" Text="Proceed" ValidationGroup="vg1" style="background:#00a03b;color:black;"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                &nbsp;</td>
                            <td class="style34">
                                <asp:Label ID="PinVarificationMessage" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                      
                    </table>
                </asp:Panel>--%>
             
                    <asp:Panel ID="SponsorPanel" runat="server" Width="100%" CssClass="style28" Visible="false">
                            <table width="100%">
                                <tr>
                                    <td align="right" class="style32" style="vertical-align:top">
                                        <asp:Label ID="lblSponserID" runat="server" Text="Sponser ID * :"></asp:Label>
                                    </td>
                                    <td class="style33">
                                        <asp:TextBox ID="txtSponserID" runat="server" ValidationGroup="vg2" ForeColor="Blue"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSponserID"
                                            ErrorMessage="Enter Your Sponsor ID" ValidationGroup="vg2" 
                                            Font-Bold="False" style="color: #FF0000"></asp:RequiredFieldValidator>
                                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                                            runat="server" ControlToValidate="txtSponserID" ErrorMessage="Invalid ID" 
                                            Font-Bold="False" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationExpression="^[A-Za-z]{3}\d+$" ValidationGroup="vg2"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style32">
                                        &nbsp;</td>
                                    <td class="style33">
                                        <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" 
                                            Text="Verify Sponsor Id" ValidationGroup="vg2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style32" style="vertical-align:top">
                                        Sponsor Name</td>
                                    <td align="right" class="style33">
                                        <asp:TextBox ID="txtsponsoraddress" runat="server" Enabled="false" MaxLength="50" ForeColor="Blue"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                            ControlToValidate="txtsponsoraddress" ErrorMessage="Invalid Sponsor" 
                                            Font-Bold="False" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                 <tr>
                                    <td align="right" class="style32" style="vertical-align:top">
                                        <asp:Label ID="Label3" runat="server" Text="Parent ID * :"></asp:Label>
                                    </td>
                                    <td class="style33">
                                        <asp:TextBox ID="txtParentId" runat="server" ValidationGroup="vg5" ForeColor="Blue"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtParentId"
                                            ErrorMessage="Enter Your Parent ID" ValidationGroup="vg5" 
                                            Font-Bold="False" style="color: #FF0000"></asp:RequiredFieldValidator>
                                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                                            runat="server" ControlToValidate="txtParentId" ErrorMessage="Invalid ID" 
                                            Font-Bold="False" ForeColor="Red" SetFocusOnError="True" 
                                            ValidationExpression="^[A-Za-z]{3}\d+$" ValidationGroup="vg5"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>


                                <tr>
                                    <td align="right" class="style32">
                                        &nbsp;</td>
                                    <td class="style33">
                                        <asp:Button ID="btnparentname" runat="server" OnClick="btnparentname_Click"
                                            Text="Verify Parent Id" ValidationGroup="vg5" />
                                    </td>
                                </tr>

                                 <tr>
                                    <td align="right" class="style32" style="vertical-align:top">
                                        Parent Name</td>
                                    <td align="right" class="style33">
                                        <asp:TextBox ID="txtparentname" runat="server" Enabled="false" MaxLength="50" ForeColor="Blue"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="txtparentname" ErrorMessage="Invalid Parent Name" 
                                            Font-Bold="False" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" class="style32">
                                        Position * :
                                    </td>
                                    <td align="right" class="style33">
                                        <asp:DropDownList ID="ddlConnectingSide" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddlConnectingSide_SelectedIndexChanged">
                                            <asp:ListItem>Please Select</asp:ListItem>
                                           <%-- <asp:ListItem>Left</asp:ListItem>
                                            <asp:ListItem>Right</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                            ControlToValidate="ddlConnectingSide" ErrorMessage="Please Select a Side" 
                                            InitialValue="Please Select" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />                                        
                                        <asp:Label ID="lbllefthighlight" runat="server" Text="" ForeColor="Red"></asp:Label>
                                         <br />                                        
                                        <asp:Label ID="lblrighthighlight" runat="server" Text=""  ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                <asp:Label ID="lblspnrid" runat="server"></asp:Label>
                                </td>
                                </tr>
                            </table>
                        </asp:Panel>
          
             <asp:Panel ID="InformationPanel" runat="server" Style="margin-top: 0px" 
                    Width="100%" CssClass="style28">
                            <table width="100%">
                                <tr>
                                    <td align="center" colspan="4" style="text-align: left">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="4" style="text-align: left; color: Red;">
                                        All the * Fields are Mandatory
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="4">
                                        <asp:Label ID="lblAccountDetail" runat="server" Style="color: Red; font-weight: 700"
                                            Text="Account Detail"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="lblPassword" runat="server"  Text="Login Password * :"></asp:Label>
                                   
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtLoginPass" runat="server" Height="30px" TextMode="Password" 
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLoginPass"
                                            ErrorMessage="*"  ValidationGroup="vg3" ForeColor="Red" Font-Size="19px">
                                            </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style38" style="vertical-align:top">
                                        Re-enter Login Password * :
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtLoginPass0" runat="server" Height="30px" TextMode="Password"
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>

                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtLoginPass0"
                                            ControlToValidate="txtLoginPass" ErrorMessage="Login password does not match" ValidationGroup="vg3" ForeColor="Red"></asp:CompareValidator>
                                    </td>
                                </tr>
                               
                               <%-- <tr>
                                    <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="Label3" runat="server"  Text="Txn Password * :"></asp:Label>
                                   
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtTXANPassword" runat="server" Height="30px" TextMode="Password" 
                                            ValidationGroup="vg3" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTXANPassword"
                                            ErrorMessage="*"  ValidationGroup="vg3" ForeColor="Red" Font-Size="19px">
                                            </asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="txtLoginPass" Operator="NotEqual" Type="String"
                                            ControlToValidate="txtTXANPassword" ErrorMessage="Txn Password can not be same as Login Password" ValidationGroup="vg3" ForeColor="Red"></asp:CompareValidator>

                                    </td>
                                    <td class="style38" style="vertical-align:top">
                                        Re-enter Txn Password * :
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtReenterTXANPassword" runat="server" Height="30px" TextMode="Password"
                                            ValidationGroup="vg3"></asp:TextBox>

                                        

                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtReenterTXANPassword"
                                            ControlToValidate="txtTXANPassword" ErrorMessage="Txn Password does not match" ValidationGroup="vg3" ForeColor="Red"></asp:CompareValidator>
                                    </td>
                                </tr>--%>

                                <tr>
                                    <td align="left" colspan="4">
                                        <asp:Label ID="lblPersonalDetails" runat="server" Style="color: Red; font-weight: 700"
                                            Text="Personal Details"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="lblname" runat="server" Text="Name * :" ></asp:Label>
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtname" runat="server" ValidationGroup="vg3" Height="30px" 
                                            MaxLength="50" ForeColor="Blue"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtname"
                                            ErrorMessage="*" ValidationGroup="vg3" ForeColor="Red" Font-Size="19px"></asp:RequiredFieldValidator>
                                    </td>
                                     <td class="style38" style="vertical-align:top">
                                        <asp:Label ID="lblDateOfBirth0" runat="server" Text="Date of Birth * :"
                                            ></asp:Label>
                                        
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:DropDownList ID="DOB_DD" runat="server" ForeColor="Blue">
                                            <asp:ListItem>DD</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                            <asp:ListItem>24</asp:ListItem>
                                            <asp:ListItem>25</asp:ListItem>
                                            <asp:ListItem>26</asp:ListItem>
                                            <asp:ListItem>27</asp:ListItem>
                                            <asp:ListItem>28</asp:ListItem>
                                            <asp:ListItem>29</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>31</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="DOB_DD" ErrorMessage="Enter your DOB Day" ForeColor="Red" 
                                            InitialValue="DD" ValidationGroup="vg3" Font-Size="19px">*</asp:RequiredFieldValidator>

                                        <asp:DropDownList ID="DOB_MM" runat="server" ForeColor="Blue">
                                            <asp:ListItem>MM</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                            ControlToValidate="DOB_MM" ErrorMessage="Enter DOB Month" ForeColor="Red" 
                                            InitialValue="MM" ValidationGroup="vg3" Font-Size="19px">*</asp:RequiredFieldValidator>

                                        <asp:DropDownList ID="DOB_YYYY" runat="server" ForeColor="Blue">
                                            <asp:ListItem>YYYY</asp:ListItem>
                                        </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="DOB_YYYY" ErrorMessage="Enter your DOB Year" ForeColor="Red" 
                                            InitialValue="YYYY" ValidationGroup="vg3" Font-Size="19px">*</asp:RequiredFieldValidator>
                                    </td>

                                    </tr>
                                   <tr>
                                   <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="Label2" runat="server" Text="Father/Husband Name :" ></asp:Label>
                                        
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtfname" runat="server" ValidationGroup="vg3" Height="30px" 
                                            MaxLength="50" ForeColor="Blue" ></asp:TextBox>
                                       
                                    </td>

                                       <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address:" ></asp:Label>
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtAddress" runat="server" Height="30px" MaxLength="50" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                    


                                   
                               </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="lblCity" runat="server" Text="City:" ></asp:Label>
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtCity" runat="server" ValidationGroup="vg3" Height="30px" MaxLength="30" ForeColor="Blue"></asp:TextBox>
                                    </td>


                                    <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="lblState" runat="server" Text="State:" ></asp:Label>
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtState" runat="server" ValidationGroup="vg3" Height="30px" MaxLength="30" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                    
                                   
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        <asp:Label ID="lblcountry0" runat="server" Text="Country:" ></asp:Label>
                                    </td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtCountry" runat="server" ValidationGroup="vg3" Height="30px" MaxLength="25" ForeColor="Blue"></asp:TextBox>
                                    </td>

                                     <td class="style38" style="vertical-align:top">
                                        <asp:Label ID="lblPinCode" runat="server" Text="Pin Code:" ></asp:Label>
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtPinCode" runat="server" Height="30px" MaxLength="10" ForeColor="Blue"></asp:TextBox>
                                    </td>

                                    
                                </tr>
                                <tr>
                                    <td class="style38" style="vertical-align:top">
                                        <asp:Label ID="lblMobileNo" runat="server" Text="Mobile No * :" ></asp:Label>
                                        
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtMobileNo" runat="server" ValidationGroup="vg3" 
                                            MaxLength="10" ForeColor="Blue"  Height="30px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtMobileNo"
                                            ErrorMessage="*" Text="*"  ForeColor="Red" ValidationGroup="vg3" Font-Size="19px"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Please enter valid Mobile No" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    </td>
                                    
                                    <td class="style38" style="vertical-align:top">
                                        <asp:Label ID="lblEmailID0" runat="server" Text="Email ID :" ></asp:Label>
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtEmailID" runat="server" Height="30px" ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                      <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailID" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                   <td class="style38" style="vertical-align:top">
                                        <asp:Label ID="lblpinamount" runat="server" Text="Pin Amouint * : "
                                            ></asp:Label>
                                    </td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtpinAmount" runat="server" MaxLength="10" Height="23px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpinAmount"
                                            ErrorMessage="*" Text="*"  ForeColor="Red" ValidationGroup="vg3" Font-Size="19px"></asp:RequiredFieldValidator>
                                    </td>
                                    
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                 <tr>
                                        <td class="style29" colspan="4" style="vertical-align:top">
                                            <asp:Label ID="Label1" runat="server" 
                                                Style="color: Red; font-weight: 700" Text="Bank Details"></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        Bank Name</td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="BankName" runat="server" Height="30px" MaxLength="30" 
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                    <td class="style38" style="vertical-align:top">
                                        Account No</td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="AccountNo" runat="server" Height="30px" 
                                            MaxLength="30" ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        IFS Code</td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="IFSCode" runat="server" Height="30px" MaxLength="30" 
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                    <td class="style38" style="vertical-align:top">
                                        PAN No</td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="PanNo" runat="server" Height="30px" MaxLength="30" 
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                        <td class="style29" colspan="4">
                                            <asp:Label ID="lblPersonalDetails0" runat="server" 
                                                Style="color: Red; font-weight: 700" Text="Nominee Details"></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        Nominee Name</td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtNomineeName" runat="server" Height="30px" MaxLength="30" 
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                    <td class="style38" style="vertical-align:top">
                                        Nominee Relation</td>
                                    <td class="style31" style="vertical-align:top">
                                        <asp:TextBox ID="txtNomineeRelation" runat="server" Height="30px" 
                                            MaxLength="30" ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29" style="vertical-align:top">
                                        &nbsp;Nominee Address</td>
                                    <td class="style39" style="vertical-align:top">
                                        <asp:TextBox ID="txtNomineeaddress" runat="server" Height="30px" MaxLength="30" 
                                            ValidationGroup="vg3" ForeColor="Blue"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        &nbsp;</td>
                                    <td class="style31">
                                        &nbsp;</td>
                                </tr>
                                    <tr>
    <td colspan="4">
    <asp:TextBox ID="TextBox1" runat="server" Height="156px" TextMode="MultiLine" 
                                Width="100%" BackColor="#CCCCCC" EnableTheming="True" 
            ReadOnly="True">                                                                          TERMS & CONDITIONS.
1. A person he or she has to sponsor one left and one right for any type of income.
2. A person can sponsor as many directs as he or she can sponsor.
3. Rewards scheme is applicable on the all packages.
4. To join VIRAT FUTURE MARKETING LIMITED business opportunity, a person (he/she) will have to deposit CASH/ DD/PAY ORDER in the bank account of VIRAT FUTURE MARKETING LIMITED as per the package he or she wants to join in.
5. VIRAT FUTURE MARKETING LIMITED will pay all benefits, earnings through net Banking at per day.
6. Deduction of TDS/SERVICE charges if any as per the government rules.
7. Any dispute between VIRAT FUTURE MARKETING LIMITED and any one will be the subject matter of jurisdiction at Meerut court.
8. Violation of terms and conditions will cause immediate termination of any promoter without any prier notice.
9. All the benefits or earnings if any, earned on promotional basis would be transferred in the name of the nominee as has been mentioned in the application form in the event of any promoter death.
10. VIRAT FUTURE MARKETING LIMITED doesn’t promise any income whatsoever, it isn’t any scheme. It is a pure business of selling and purchasing. Income depends upon the continuous process of business growth.
11. Any change in terms and conditions or in promotional plan is under the right of VIRAT FUTURE MARKETING LIMITED. (CHANGE) will have to be abided by every individual.
   TERMS AND CONDITIONS READ CAREFULLY AND ACCEPTED.
                                                                                                                
                                                                                                                Signature of Applicant


 </asp:TextBox></td>
    </tr>
                                <tr>
                                    <td align="center" colspan="4" style="text-align: center">
                                        <asp:CheckBox ID="txtcheckbox" runat="server" Text=" I Accept Terms and conditions" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="4">
                                        
                                        <asp:Label ID="lblMessage" runat="server" 
                                            Style="color: #FF3300; font-weight: 700;"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="4">
                                        
                                        <asp:Button ID="btnLogIn" runat="server" OnClick="btnLogIn_Click" Text="Submit" ValidationGroup="vg3"
                                            CssClass="button"  Font-Bold="true" ForeColor="#660033"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="4">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            style="color: #FF0000; font-weight: 700" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </asp:Panel>
            
            <asp:Panel ID="Panel1" runat="server" Height="100%" Width="635px">
               <span style="font-size:medium;"><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder></span>
                           <asp:HiddenField ID="JoinSide" runat="server" />
                           <br />
                <br />
                           <br />
                           <asp:HiddenField ID="ParentID" runat="server" />
            </asp:Panel>
           
 </asp:Panel>
 </center>




 </div>
 </div>
 </div>
 </div>



 </asp:Content>



