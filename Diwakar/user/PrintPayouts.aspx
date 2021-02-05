<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="PrintPayouts.aspx.cs" Inherits="eSolutionsCurry.User.MyPayoutsPrint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 700px;
            color: rgb(0, 0, 0);
        }
        .style2
        {
            width: 700px;
        }
        .style6
        {
            width: 462px;
        }
        .style7
        {
            height: 20px;
            width: 20px;
            color: rgb(0, 0, 0);
        }
        .style8
        {
            width: 462px;
            font-weight: bold;
            color: rgb(0, 0, 0);
        }
        .style9
        {
            color: rgb(0, 0, 0);
        }
        .style10
        {
            width: 462px;
            color: rgb(0, 0, 0);
        }
        .style11
        {
            width: 462px;
            color: rgb(0, 0, 0);
            font-size: large;
        }
        .style12
        {
            width: 56%;
        }
        .style13
        {
            font-family: Tahoma;
            font-size: 11px;
            color: rgb(0, 0, 0);
            line-height: 17px;
        }
        .style15
        {
            width: 245px;
            height: 18px;
        }
        .style16
        {
            width: 702px;
        }
        .style17
        {
            font-size: medium;
            color: #000000;
        }
        .style18
        {
        }
        .style19
        {
            width: 462px;
            font-weight: bold;
            color: rgb(0, 0, 0);
            font-size: medium;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><asp:Button runat="server" Text="Print" ID="PrintButton" 
        onclick="PrintButton_Click" /></center>
    <asp:Panel ID="Panel1" runat="server" Width="700px">
        <table style="border-style: solid; border-width: 2pt; border-color: inherit; width:700px;" 
            align="center">
            <tr>
                <td class="style16" 
                    
                    
                    
                    style="text-align: center; font-size: x-large; text-decoration: underline; font-weight: bold; line-height: 30px;">
                    <table style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; width: 100%;">
                        <tr>
                            <td align="center" class="alltext" 
                                style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: rgb(41, 57, 124); line-height: 17px; margin-top: 1px; margin-right: 1px; margin-bottom: 1px; margin-left: 1px; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-weight: bold; text-align: center; ">
                                <span style="font-size: 14pt; "><strong>Diwakar Retails
                                                                </strong></span></td>
                        </tr>
                        <tr style="font-size: 12pt; ">
                            <td align="center" 
                                
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: center; " 
                                class="style9">
                                <strong>Address : <br /><br /></strong></td>
                        </tr>
                        <tr style="font-size: 12pt; ">
                            <td align="center" 
                                
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: center; " 
                                class="style9">
                                <span style="font-size: 13pt; ">Phone - </span></td>
                        </tr>
                        <tr style="font-size: 12pt; ">
                            <td align="center" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; " 
                                class="style9">
                                <strong>Email: <a href="mailto:diwakarretail2017@gmail.com">diwakarretail2017@gmail.com</a>, 
                                Website: http://diwakarretail.com   </strong></td>
                        </tr>
                        <tr style="font-size: 12pt; ">
                            <td align="center" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; ">
                                <center style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; ">
                                    <table align="center" cellspacing="0" class="iner_border" 
                                        
                                        style="border: 1px solid rgb(204, 204, 204); margin: 0px; padding: 0px; width: 94%;">
                                        <tr style="background-color: rgb(102, 153, 204); ">
                                            <td align="Center" colspan="2" 
                                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 16px; text-align: left; ">
                                                <strong><span style="color: rgb(0, 51, 153); ">Disributor Details</span></strong></td>
                                            <td align="Center" 
                                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 16px; text-align: left; ">
                                                &nbsp;</td>
                                            <td align="Center" 
                                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 16px; text-align: left; ">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style1" 
                                                
                                                
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; width: 85px; text-align: left;">
                                                <strong>Member ID:</strong></td>
                                            <td style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <asp:Label ID="MemberID" runat="server" CssClass="style9" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td style="font-family: Tahoma; font-size: 11px; color: rgb(0, 0, 0); line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <strong>Bank Name</strong></td>
                                            <td style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <asp:Label ID="BankName" runat="server" CssClass="style9" Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" 
                                                
                                                
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; width: 85px; text-align: left;">
                                                <strong>Member Name:</strong></td>
                                            <td style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;" 
                                                class="style9">
                                                <asp:Label ID="MemberName" runat="server" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left; color: #000000; font-weight: 700;">
                                                Account No</td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <asp:Label ID="AccountNo" runat="server" CssClass="style9" Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td
                                                
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; width: 85px; " 
                                                align="left" class="style9">
                                                <strong>Address:</strong></td>
                                            <td colspan="0" 
                                                
                                                
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;" 
                                                class="style9">
                                                <asp:Label ID="MemberAddress" runat="server" style="font-weight: 700"></asp:Label>
                                            </td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left; font-weight: 700; color: #000000;">
                                                IFS Code</td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <asp:Label ID="IFSCode" runat="server" CssClass="style9" Font-Bold="True"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" 
                                                
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; width: 85px; "
                                                align="left">
                                                <strong>Mobile No:</strong></td>
                                            <td style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;" 
                                                class="style9">
                                                <asp:Label ID="MemberMobile" runat="server" style="font-weight: 700"></asp:Label>
                                            </td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <strong>PAN No.:</strong></td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                <asp:Label ID="MemberPanNo" runat="server" style="font-weight: 700"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" 
                                                
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; width: 85px; "
                                                align="left">
                                                <strong>Track Id :</strong></td>
                                            <td style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;" 
                                                class="style9">
                                                <asp:Label ID="TrackID" runat="server" style="font-weight: 700"></asp:Label>
                                            </td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                &nbsp;</td>
                                            <td class="style9" 
                                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; height: 20px; width: 257px; text-align: left;">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style16">
                    <table 12pt;"="" align="center" font-size:="" 
                        
                        style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; ">
                        <tr>
                            <td align="Center" colspan="10" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; ">
                                <strong><span style="color: rgb(0, 51, 153); "><u>Congratulations!!!</u></span></strong></td>
                        </tr>
                    </table>
                    <span class="Apple-style-span" 
                        style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; display: inline !important; float: none; ">
                    &nbsp;</span><table align="center" cellspacing="0" 
                        
                        style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; width: 70%;">
                        <tr style="font-size: 12pt; ">
                            <td 8pt"="" align="Left" font-size:="" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; " 
                                class="style9">
                                <span style="font-size: 9pt; "><strong>Dear Distributor,</strong></span><span 
                                    class="alltext" 
                                    style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(41, 57, 124); margin-top: 1px; margin-right: 1px; margin-bottom: 1px; margin-left: 1px; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-weight: bold; "></span></td>
                        </tr>
                        <tr style="font-size: 12pt; ">
                            <td align="center" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; " 
                                class="style9">
                                <span style="font-size: 8pt; "><span style="font-size: 9pt; "><strong>Here is 
                                your commission cheque for the day</strong></span><span class="alltext" 
                                    style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(41, 57, 124); margin-top: 1px; margin-right: 1px; margin-bottom: 1px; margin-left: 1px; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-weight: bold; "></span></span></td>
                        </tr>
                    </table>
                    <table class="style12" align=center style=" width:90%">
                  <div align=center>
                        <caption align=top>
                            <strong><span class="style17">From</span></strong> <strong>
                            <asp:Label ID="DateFrom" runat="server" ForeColor="Black" 
                                style="color:black"></asp:Label>
                            <span class="style17">Till</span>
                            <asp:Label ID="DateTill" runat="server" ForeColor="Black" 
                                style="color:black"></asp:Label>
                            </strong>
                        </caption></div>
                        <tr>
                <td align="center" valign="top" class="style18">
                    <table align="center" border="1" cellspacing="0" class="iner_border" 
                        style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204);" 
                        width="70%">
                        <tr>
                            <td class="style15" colspan="2" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; text-align: left; background-color: rgb(102, 153, 204);">
                                <strong><span style="color: rgb(255, 255, 255);">Incentive Details For Period 
                                Starting</span></strong></td>
                        </tr>
                        <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Binary Income:</strong></td>
                            <%--<td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span2">
                                <asp:Label ID="Binary" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                         <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Direct Income:</strong></td>
                          <%--  <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span2">
                                <asp:Label ID="lbldirect" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                         <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Performance bonus:</strong></td>
                          <%--  <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span2">
                                <asp:Label ID="lblpromance" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Repurchase Income:</strong></td>
                           <%-- <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span2">
                                <asp:Label ID="lblrepurchase" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>

                        <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Redemption Income:</strong></td>
                           <%-- <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span2">
                                <asp:Label ID="lblredemption" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                         <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Cash Back Income:</strong></td>
                           <%-- <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span3">
                                <asp:Label ID="lblsalaryincome" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>

                         <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Self Cash Back Income:</strong></td>
                           <%-- <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span3">
                                <asp:Label ID="lblselfcashback" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>

                         <tr>
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Total Amount:</strong></td>
                          <%--  <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span8">
                                <asp:Label ID="TotalPayout" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                Direct<strong> Income:</strong></td>
                           <%-- <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                &nbsp;</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span1">
                                <asp:Label ID="lblglxy" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td class="style8" 
                                style="font-family: tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                TDS 5% :</td>
                          <%--  <td align="left" class="style7" 
                                style="font-family: tahoma; font-size: 11px; line-height: 17px;">
                                less 5%</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span id="span9">
                                <asp:label id="tds" runat="server" cssclass="style9"></asp:label>
                                </span>
                            </td>
                        </tr>
                        <tr >
                            <td class="style8" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;">
                                <strong>Admin Charges 7%:</strong></td>
                           <%-- <td align="left" class="style7" 
                                style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                                Less 7%</td>--%>
                            <td align="left" colspan="0" 
                                style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;">
                                <span ID="Span10">
                                <asp:Label ID="AdminCharges" runat="server" CssClass="style9"></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8" style="font-family: Tahoma; font-size: 11px; line-height: 17px; text-align: left;"><b>Gross Payable:</b></td>
                            <td align="left" colspan="0" style="font-family: Tahoma; font-size: 11px; color: rgb(114, 114, 114); line-height: 17px; height: 20px; width: 257px;"><span id="Span16">
                                <asp:Label ID="grossPayment" runat="server" CssClass="style9"></asp:Label>
                                </span></td>
                        </tr>
                      
                    </table>
                </td>
            </tr>
                    </table>
                </td>
            </tr>
            
        </table>
        <br 
                        style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; " />
        <table align="center" 
            style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" 
            width="70%">
            <tr>
                <td align="left" class="style9" 
                    style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                    <strong>We are sure that we can create a mutually beneficial long term working 
                    relationship with you and assure you of our full cooperation in making this tie 
                    up a success for both of us.</strong></td>
            </tr>
        </table>
        <table align="center" 
            style="color: rgb(114, 114, 114); font-family: Tahoma; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 17px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" 
            width="70%">
            <tr>
                <td align="left" class="style9" 
                    style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                    <strong>Keep up the good work.</strong></td>
            </tr>
            <tr>
                <td align="left" class="style9" 
                    style="font-family: Tahoma; font-size: 11px; line-height: 17px;">
                    <strong>Best Regards,</strong></td>
            </tr>
            <tr>
                <td align="left" class="style13">
                    <strong>Diwakar Retails.</strong>&nbsp;</td>
            </tr>
        </table>
       
    </asp:Panel>
</asp:Content>
