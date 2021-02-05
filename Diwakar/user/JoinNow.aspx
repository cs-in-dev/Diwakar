<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMasterPage.master" CodeBehind="JoinNow.aspx.cs" Inherits="RealSecureLife.JoinNow" %>
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
        .style28
        {
            font-family: "Century Gothic";
        }
        .style29
        {
            text-align: left;
        }
        .style31
        {
            width: 220px;
            text-align: left;
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
        }
        .style39
        {
            width: 159px;
            text-align: left;
        }
        
* {
	outline:none;
}

        </style>
</asp:Content>
 <asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1" ID="bodyContent">

  
            <div class="content">
		<div class="container">
			<div class="container-inner">
				
				<div class="content-column-content">
   <h1>Join Now</h1>
   


 <center>
                <asp:Panel ID="Panel2" runat="server"  Width="100%" CssClass="style28">
               <br />
             <%--   <asp:Panel ID="PinPannel" runat="server" Width="100%" CssClass="style28">
                    
                    <table class="style13">
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style36">
                               
                            </td>
                        </tr>
                        <tr>
                            <td class="style35">
                                &nbsp;</td>
                            <td class="style34">
                                
                            </td>
                        </tr>
                        
                    </table>
                </asp:Panel>--%>
       
            
          
             <asp:Panel ID="InformationPanel" runat="server" Style="margin-top: 0px" 
                    Width="100%" CssClass="style28">
                            <table width="100%" style="overflow:scroll;">
                               <%-- <tr>--%>
                                    <%--<td align="center" colspan="4" style="text-align: left">
                                        &nbsp;</td>--%>
                               <%-- </tr>--%>
                                <tr>
                                    <td align="center" colspan="4" style="text-align: left; color: Red;">
                                        All the * Fields are Mandatory
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="4">
                                        <asp:Label ID="lblAccountDetail" runat="server" 
                                            Style="color: Red; font-weight: 700" Text="Account Detail"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:Label ID="lblSponserID" runat="server" Text="Sponser ID :"></asp:Label>
                                    </td>
                                    <td class="style39">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtSponserID" ErrorMessage="Enter Your Sponsor ID" 
                                            Font-Bold="False" style="color: #FF0000" ValidationGroup="vg2"></asp:RequiredFieldValidator>
                                       
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ControlToValidate="txtSponserID" ErrorMessage="Invalid ID" Font-Bold="False" 
                                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z]{2}\d+$" 
                                            ValidationGroup="vg2"></asp:RegularExpressionValidator>
                                        <table class="ls-thumbnail-inner">
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtSponserID" runat="server" ValidationGroup="vg2" CssClass="UpperCase"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" 
                                                        Text="Verify" ValidationGroup="vg2" width="110px"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="style38" valign="middle">
                                        Sponsor Name :</td>
                                    <td class="style31" valign="bottom">
                                          <asp:TextBox ID="txtsponsoraddress" runat="server" Enabled="false" MaxLength="50" CssClass="UpperCase"></asp:TextBox>
                                          <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                            ControlToValidate="txtsponsoraddress" ErrorMessage="Invalid Sponsor" 
                                            Font-Bold="False" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Position:
                                    </td>
                                    <td class="style39">
                                        <asp:DropDownList ID="ddlConnectingSide" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddlConnectingSide_SelectedIndexChanged">
                                            <asp:ListItem>Please Select</asp:ListItem>
                                            <asp:ListItem>Left</asp:ListItem>
                                            <asp:ListItem>Right</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"  ValidationGroup="vg3"
                                            ControlToValidate="ddlConnectingSide" ErrorMessage="Please Select a Side" 
                                            InitialValue="Please Select" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                    <td class="style38">
                                         </td>
                                    <td class="style31">
                                         </td>
                                </tr>
                                <%--<tr>
                                    <td class="style29">
                                        <asp:Label ID="lblPassword" runat="server" Text="Login Password:"></asp:Label>
                                        *
                                    </td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtLoginPass" runat="server" Height="23px" MaxLength="10" 
                                            TextMode="Password" ValidationGroup="vg3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtLoginPass" ErrorMessage="*" ForeColor="Red" 
                                            style="color: #CC0000" ValidationGroup="vg3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style38">
                                        Re-enter Login Password:*
                                    </td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtLoginPass0" runat="server" Height="23px" MaxLength="10" 
                                            TextMode="Password" ValidationGroup="vg3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="txtLoginPass0" ControlToValidate="txtLoginPass" 
                                            ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3"></asp:CompareValidator>
                                    </td>
                                </tr>--%>
                               <%-- <tr>
                                    <td class="style25">
                                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Transaction Password:"
                                            ></asp:Label>
                                        *
                                    </td>
                                    <td class="style26">
                                        <asp:TextBox ID="txtTransectionPassword" runat="server" ValidationGroup="vg3" TextMode="Password"
                                            Height="23px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTransectionPassword"
                                            ErrorMessage="*" ValidationGroup="vg3" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style27">
                                        Re-enter Trans Password:*</td>
                                    <td class="style25">
                                        <asp:TextBox ID="txtLoginPass1" runat="server" Height="23px" TextMode="Password"
                                            ValidationGroup="vg3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtLoginPass1"
                                            ControlToValidate="txtTransectionPassword" ErrorMessage="*" ValidationGroup="vg3"
                                            ForeColor="Red"></asp:CompareValidator>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td align="left" colspan="4">
                                        <asp:Label ID="lblPersonalDetails" runat="server" Style="color: Red; font-weight: 700"
                                            Text="Personal Details"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:Label ID="lblname" runat="server" Text="BA Name" ></asp:Label>
                                        :*
                                    </td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtname" runat="server" ValidationGroup="vg3" Height="23px" 
                                            MaxLength="50" ontextchanged="txtname_TextChanged" AutoPostBack="true" CssClass="UpperCase"></asp:TextBox>
                                        <%--<cc1:FilteredTextBoxExtender ID="dsf" runat="server" TargetControlID="txtname" FilterType="UppercaseLetters, Numbers"></cc1:FilteredTextBoxExtender>--%>
                                        <br />
                                       <asp:Label ID="lblchsusrnm" runat="server"></asp:Label>
                                    </td>
                                     <td class="style38">
                                         &nbsp;<asp:Label ID="lblname0" runat="server" Text="Owner Name"></asp:Label>
                                         &nbsp;:</td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtOwnername" runat="server" Height="23px" MaxLength="50"  CssClass="UpperCase"
                                            ValidationGroup="vg3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                            ControlToValidate="txtOwnername" ErrorMessage="*" ForeColor="Red" 
                                            ValidationGroup="vg3"></asp:RequiredFieldValidator>
                                    </td>

                                    </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:Label ID="lblPassword" runat="server" Text="Login Password:"></asp:Label>
                                        *
                                    </td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtLoginPass" runat="server" Height="23px" MaxLength="10" 
                                            TextMode="Password" ValidationGroup="vg3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtLoginPass" ErrorMessage="*" ForeColor="Red" 
                                            style="color: #CC0000" ValidationGroup="vg3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style38">
                                        Re-enter Login Password:*
                                    </td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtLoginPass0" runat="server" Height="23px" MaxLength="10" 
                                            TextMode="Password" ValidationGroup="vg3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="txtLoginPass0" ControlToValidate="txtLoginPass" 
                                            ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:Label ID="Label2" runat="server" Text="Father / Husband Name"></asp:Label>
                                        :* </td>
                                    <td class="style39">
                                           <asp:TextBox ID="txtfname" runat="server" Height="23px" MaxLength="50" ValidationGroup="vg3" CssClass="UpperCase"></asp:TextBox>
                                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname"
                                            ErrorMessage="*" ValidationGroup="vg3" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="style29">
                                        <asp:Label ID="lblDateOfBirth0" runat="server" Text="Date of Birth:"></asp:Label>
                                        *</td>
                                    <td class="style39">
                                        <asp:DropDownList ID="DOB_DD" runat="server">
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
                                        <asp:DropDownList ID="DOB_MM" runat="server">
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
                                        <asp:DropDownList ID="DOB_YYYY" runat="server">
                                            <asp:ListItem>YYYY</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                <td class="style29">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address:" ></asp:Label>
                                    </td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtAddress" runat="server" Height="23px" MaxLength="50" CssClass="UpperCase"></asp:TextBox>
                                    </td>

                                <td class="style29">
                                       <asp:Label ID="Label4" runat="server" Text="Landmark:" ></asp:Label>
                                    </td>
                                    <td class="style39">
                                          <asp:TextBox ID="txtLandmark" runat="server" Height="23px" MaxLength="50" CssClass="UpperCase"></asp:TextBox>
                                    </td>
                                    
                                   
                                </tr>

                                 <tr>
                                <td class="style29">
                                     <asp:Label ID="lblCity" runat="server" Text="City:" ></asp:Label>
                                    
                                    </td>
                                    <td class="style39">
                                            <asp:TextBox ID="txtCity" runat="server" ValidationGroup="vg3" Height="23px" MaxLength="30" CssClass="UpperCase"></asp:TextBox>
                                        
                                    </td>

                                <td class="style29">
                                            <asp:Label ID="Label3" runat="server" Text="District:" ></asp:Label>
                                    </td>
                                    <td class="style39">
                                     <asp:TextBox ID="txtDistrict" runat="server" Height="23px" MaxLength="50" CssClass="UpperCase"></asp:TextBox>
                                    </td>
                                    
                                   
                                </tr>


                                <tr>
                                    <td class="style38">
                                        <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                                    </td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtState" runat="server" Height="23px" MaxLength="30" CssClass="UpperCase" 
                                            ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        <asp:Label ID="lblPinCode" runat="server" Text="Pin Code:"></asp:Label>
                                    </td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtPinCode" runat="server" Height="23px" MaxLength="10" CssClass="UpperCase"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        <asp:Label ID="lblcountry0" runat="server" Text="Country:" ></asp:Label>
                                    </td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtCountry" runat="server" ValidationGroup="vg3" Height="23px" MaxLength="25" CssClass="UpperCase"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        <asp:Label ID="lblMobileNo" runat="server" Text="Mobile No:"></asp:Label>
                                        *&nbsp;</td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="10" 
                                            ValidationGroup="vg3" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtMobileNo" ErrorMessage="*" ForeColor="Red" 
                                            Style="font-weight: 700;" Text="*" ValidationGroup="vg3"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td class="style38">
                                        <asp:Label ID="lblEmailID0" runat="server" Text="Email ID:" ></asp:Label>
                                    </td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtEmailID" runat="server" Height="23px" ValidationGroup="vg3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailID"
                                            ErrorMessage="*" Text="*" Style="font-weight: 700;" ForeColor="Red" ValidationGroup="vg3"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="lblTelephoneNo" runat="server" Text="Telephone No:"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtTelephoneNo" runat="server" Height="23px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr>
                                        <td class="style29" colspan="4">
                                            <asp:Label ID="Label1" runat="server" 
                                                Style="color: Red; font-weight: 700" Text="Bank Details"></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Bank Name</td>
                                    <td class="style39">
                                        <asp:TextBox ID="BankName" runat="server" Height="23px" MaxLength="30"  CssClass="UpperCase"
                                            ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        Account No</td>
                                    <td class="style31">
                                        <asp:TextBox ID="AccountNo" runat="server" Height="23px" 
                                            MaxLength="30" ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Branch Name</td>
                                    <td class="style39">
                                        <asp:TextBox ID="BranchName" runat="server" Height="23px" MaxLength="30"  CssClass="UpperCase"
                                            ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        PAN No</td>
                                    <td class="style31">
                                        <asp:TextBox ID="PanNo" runat="server" Height="23px" MaxLength="30"  CssClass="UpperCase"
                                            ValidationGroup="vg3" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        IFS Code</td>
                                    <td class="style39">
                                        <asp:TextBox ID="IFSCode" runat="server" Height="23px" MaxLength="30"  CssClass="UpperCase"
                                            ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        &nbsp;</td>
                                    <td class="style31">
                                        &nbsp;</td>
                                </tr>
                                    <tr>
                                        <td class="style29" colspan="4">
                                            <asp:Label ID="lblPersonalDetails0" runat="server" 
                                                Style="color: Red; font-weight: 700" Text="Nominee Details"></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Nominee Name</td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtNomineeName" runat="server" Height="23px" MaxLength="30" CssClass="UpperCase" 
                                            ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                    <td class="style38">
                                        Nominee Relation</td>
                                    <td class="style31">
                                        <asp:TextBox ID="txtNomineeRelation" runat="server" Height="23px"  CssClass="UpperCase"
                                            MaxLength="30" ValidationGroup="vg3"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        &nbsp;Contact Details</td>
                                    <td class="style39">
                                        <asp:TextBox ID="txtNomineeContact" runat="server" Height="23px" MaxLength="30"  CssClass="UpperCase"
                                            ValidationGroup="vg3"></asp:TextBox>
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
            ReadOnly="True">                                     TERMS & CONDITIONS.
1. A person he or she has to sponsor one left and one right for any type of income.
2. A person can sponsor as many directs as he or she can sponsor.
3. Rewards scheme is applicable on the package of 2100/-Rs only.
4. To join VIRAT FUTURE MARKETING LIMITED business opportunity, a person (he/she) will have to deposit CASH/ DD/PAY ORDER in the bank account of VIRAT FUTURE MARKETING LIMITED as per the package he or she wants to join in.
5. VIRAT FUTURE MARKETING LIMITED will pay all benefits, earnings through net Banking at every week.
6. Deduction of TDS/SERVICE charges if any as per the government rules.
7. Any dispute between VIRAT FUTURE MARKETING LIMITED and any one will be the subject matter of jurisdiction at Delhi court.
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
                                            CssClass="button" Visible="true" />
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
<%--<body style="background-image: url('images/background.jpg')">--%>


