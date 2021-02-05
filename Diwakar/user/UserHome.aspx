<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" Inherits="User_UserHome" CodeBehind="UserHome.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 200px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="rounded-corner" summary="">
        <thead>
            <tr>
                <th width="200" class="rounded-company" scope="col">
                    <strong>YOUR DETAILS</strong>
                </th>
                <th width="460" class="rounded-q1" scope="col">
                    <span id="ctl00_ContentPlaceHolder1_lblDesignation">
                        <asp:Label runat="server" ID="MyRank"></asp:Label></span>
                </th>
            </tr>
        </thead>
        <tfoot>
        </tfoot>
        <tbody>
            <tr id="ctl00_ContentPlaceHolder1_CongoMsg">
                <td>
                    <strong>Congratulations! </strong>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <strong>Distributor Id </strong>
                </td>
                <td>
                    <asp:Label ID="UserCode" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Distributor Name</strong>
                </td>
                <td>
                    <asp:Label ID="UserName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Join On</strong>
                </td>
                <td>
                    <asp:Label ID="MemberSince" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <strong>Status</strong></td>
                <td>
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>My Package</strong>
                </td>
                <td>
                    <asp:Label ID="WalletPoint" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Introducer ID</strong>
                </td>
                <td>
                    <asp:Label ID="Spid" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Activation Date</strong>
                </td>
                <td>
                    <asp:Label ID="lblactivation" runat="server"></asp:Label>
                </td>
            </tr>
           
        </tbody>
    </table>
    <br>

    <br>
  

    <div id="dvcon" runat="server" style="display: none;">

        <style type="text/css">
            * {
                margin: 0;
                padding: 0;
                font-weight: 700;
            }

            .style1 {
                font-size: 12pt;
            }

            .style2 {
                height: 17px;
            }

            .style3 {
                font-size: medium;
            }

            .style4 {
                width: 70%;
            }

            .style5 {
                font-size: 15px;
            }

            .style6 {
                color: #006699;
            }

            .style7 {
                font-weight: normal;
                font-size: 15px;
            }

            .style8 {
                color: #333333;
            }

            .style9 {
                color: #333333;
                font-size: 14px;
            }

            .style10 {
                font-size: 14px;
                text-align: justify;
            }
        </style>



        <div style="border: 5px solid #006699; padding: 5px;">

            <asp:Panel runat="server" ID="Panel1" Style="border: 2px solid #2CA8E6; padding: 2px;">
                <table id="Table1" border="0" runat="server" width="100%">
                    <tr>
                        <td align="left" colspan="2">
                            <%-- <img src="../images/logonew.png" width="40%" />--%>
                            <img src="http://test3.emlm.in/user/images/logo.png" width="25%" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <h4 class="style3">WELCOME TO Diwakar Retail Ltd.</h4>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <%--<b> TRACK ID&nbsp;:&nbsp; </b>--%>
                            <asp:Label ID="lblusername3" runat="server" Font-Bold="true" Text=""></asp:Label>
                            <asp:Label ID="lblmemberid" runat="server" Text="" Font-Bold="true" Visible="false"></asp:Label>
                        </td>
                        <td align="right">
                            <b>Date&nbsp;:&nbsp;<asp:Label ID="lbldate" runat="server" Text="" Font-Bold="true"></asp:Label></b>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="lbladd" runat="server" Font-Bold="true" Text=""></asp:Label>

                        </td>
                        <td align="right">
                            <%--<b>JOINING&nbsp;DATE&nbsp;:&nbsp;<asp:Label ID="lbldoj" runat="server" Text="" Font-Bold="true"></asp:Label></b>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblcity" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                            <%--  <b> ADDRESS&nbsp;:&nbsp;
                    <asp:Label ID="lblusername4" runat="server" Font-Bold="true" Text=""></asp:Label></b>--%>
                        </td>
                        <td align="right">
                            <%--<b> SPONSOR ID&nbsp;:&nbsp;<asp:Label ID="lblsponsorid" runat="server" Text="" Font-Bold="true"></asp:Label></b>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <%-- <b>  PIN CODE&nbsp;:&nbsp;--%>
                            <%-- <asp:Label ID="lblusername5" runat="server" Font-Bold="true" Text=""></asp:Label>--%></b>
                        </td>
                        <td align="right">
                            <%--<b> PLACEMENT&nbsp;:&nbsp;<asp:Label ID="lblside" runat="server" Text="" Font-Bold="true"></asp:Label></b>--%>
&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" class="style2">
                            <%--<strong>MOBILE NO</strong><b>&nbsp;:&nbsp;
                    <asp:Label ID="lblmobileno" runat="server" Font-Bold="True"></asp:Label>--%>
                    </b>
                        </td>
                        <td align="right" class="style2">
                            <%-- <b>  STATUS&nbsp;:<asp:Label ID="lblusername6" runat="server"></asp:Label>
                    &nbsp;</b>&nbsp;--%></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" class="style2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="style1" colspan="2">
                            <span class="style6"><strong>We Wish You Great Success !!!</strong></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style1" colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">
                            <p class="MsoNormal">
                                <span lang="EN-US">Congratulations! We Thank 
                        you for choosing a Diwakar Retail Ltd. product & business for a bright future. We are sure that our 
                        remarkable products and services will complement your life style and take care 
                        of all your needs.<o:p></o:p></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">
                            <p class="MsoNormal">
                                <b><span lang="EN-US">In view of the above purchase, we extend an invitation to 
                        you to participate in our GloBIl Customer Referral System. With every purchase, 
                        you are entitled for a </span><span class="style8"><span class="style7"
                            lang="EN-US"><strong>Free Business Account / Business Center</strong></span></span><span
                                lang="EN-US"><span class="style6">.</span> This BA Name is your entry point 
                        for growing your business with Diwakar Retail Ltd. Your Business Account Name and 
                        password are shown below: 
                            </span></b>





                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">&nbsp;
                    <table cellspacing="0" style="margin-left: 150px" class="style4">
                        <tr>
                            <td>Your ID
                            </td>
                            <td class="style9">
                                <asp:Label ID="lblBIname" runat="server" Font-Bold="true" Text=""></asp:Label></td>
                        </tr>

                        <tr>
                            <td>Your Password</td>
                            <td>
                                <asp:Label ID="lblpwd" runat="server" Font-Bold="true" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Your Product Packages</td>
                            <td class="style10">
                                <asp:Label ID="lblBIid" runat="server" Font-Bold="true" Text=""></asp:Label>(<asp:Label ID="LabelPDiscription" runat="server" Text=""></asp:Label>)</td>
                        </tr>
                        <tr>
                            <td>Sponser ID</td>
                            <td class="style9">
                                <asp:Label ID="lblsponser" runat="server" Font-Bold="true" Text=""></asp:Label></td>
                        </tr>

                        <caption>

                            <tr>
                                <td style="border-bottom: 1px solid black; border-top: 1px solid black;" padding="5px">Your Personalized Website</td>
                                <td class="style6"
                                    style="border-bottom: 1px solid black; border-top: 1px solid black;">
                                    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
                                </td>
                            </tr>
                            <%-- <caption>
                               
                            </caption>--%>
                        </caption>
                        <tr>
                            <td>Your Status</td>
                            <td class="style10">
                                <asp:Label ID="Label1" runat="server" Font-Bold="true" Text=""></asp:Label></td>
                        </tr>
                    </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: justify">
                            <p class="MsoNormal">
                                <span class="style5" lang="EN-US">Taking care of your life from all sides.
                        <p></p>
                                </span>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">
                            <p class="MsoNormal">
                                <span lang="EN-US">Our motto is to take of all the required needs on human life and to fill Happiness all around. We take care of&nbsp; your health, your Lifestyle and make your life </span>B<span lang="EN-US">righter. Take the best use of your services and plan for a great success and better future. We always strive for excellence and once again we thank you for the services endeavored. We are here to lead, guide and accompany you, towards your world of success.<p></p>
                                </span>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">
                            <p class="MsoNormal">
                                <span lang="EN-US">Believe that your Yes to Diwakar Retail Ltd. is your prosperity. On 
                        this journey to success, feel free to consult your team leader or our nearest 
                        branch offices or at <span class="style6"><a href="mailto:diwakarretail2017@gmail.com ">diwakarretail2017@gmail.com </a>.</span> We are available around the clock to support 
                        you. Once again, welcome to Diwakar Retail Ltd. growing family of prosperous 
                        distributors. As we always say:
                                    <o:p>
                        <b> 
                        <span class="style10">GROWTH &amp; SUCCESS</span>.</b></o:p>
                                </span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">
                            <p class="MsoNormal">
                                <b><i><span lang="EN-US">Coming together is a Beginning. Keeping together is 
                        Progress, Working together is success in diwakarretails<o:p></o:p></span></i></b>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: justify" colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <span lang="EN-US" class="style10">Diwakar Retail Ltd.</span>
                        </td>
                    </tr>
                    <%--<li>Gorakshani Goshala Road <br />Gumati No-13 Near Petrol pump <br /> MadhuBIni , Bihar - 847211<br />M:8409229942 </li>--%>
                    <tr>
                        <td align="left" colspan="2">
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <br />
                            <br />

                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">Copyright © 2021 Diwakar Retail Ltd. All Rights Reserved.</td>
                    </tr>
                </table>
            </asp:Panel>

        </div>
        <br />
        <br />


    </div>

</asp:Content>

