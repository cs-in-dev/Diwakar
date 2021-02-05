<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="GrowIcard.aspx.cs" Inherits="GrowTogether.user.GrowIcard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
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
    </script>
    <link rel="stylesheet" href="/lib/w3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlContents" runat="server">

        <style type="text/css">
            .container {
                /*padding: 10px;*/
                /*margin: auto;*/
                width: 40%;
                border: 1px solid #006699;
            }

            .header {
                width: 100%;
                height: auto;
            }

                .header img {
                    margin: 0px auto;
                    border-radius: 4px;
                }

            img.center {
                display: block;
                /* margin-left: auto; */
                margin-right: auto;
                /*border: 4px solid #47d9bf;*/
                padding: 5px;
                width: 30%;
                
            }

            .responsive-table {
                width: 100%;
            }

            .table {
                width: 100%;
            }

                .table > tbody > tr > th {
                    text-align: left;
                    font-size: 14px;
                }

                .table > tbody > tr > td {
                    text-align: left;
                    font-size: 12px;
                }

            .content {
                padding:0 10px;
            }

            h2 {
                text-align: center;
            }

            p {
                font-size: 14px;
            }

            .btn {
                padding: 10px;
                box-shadow: 0;
                background: orange;
                color: white;
                border-radius: 4px;
                display: block;
                width: 100%;
                margin: 10px 4px 10px 4px;
            }

            .profiletbl th {
                background-color: transparent;
            }
        </style>

        <style type="text/css" media="print">
            @page {
                size: auto; /* auto is the initial value */
                margin: 0mm; /* this affects the margin in the printer settings */
            }

            html {
                margin: 0px; /* this affects the margin on the html before sending to printer */
            }

            body {
                border: solid 1px blue;
                margin: 10mm 15mm 10mm 15mm; /* margin you want for the content */
            }
        </style>
        <br />
        <div class="container" id='DivIdToPrint' xmlns="http://www.w3.org/1999/xhtml">
            <div class="row">
                <div class="col-md-4">
                    <div class="header">
                        <center>
                            <span>
                                <img src="images/logo.png" class="img-responsive" style="width:200px; margin-bottom:10px;" />
                            </span>
                        </center>
                    </div>
                    <div class="content">
                        <div>
                            <%-- <img src="img/userimage.png" class="img-responsive center" />--%>
                          
                            <span class="ompf-pic-inner">
                                <asp:Image ID="MyImage" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' data-original="#" class="lazyload" Height="60px" />
                                            <%--<asp:Image ID="Myimage" runat="server"></asp:Image>--%>
                            </span>
                         
                        </div>
                        <div class="table-responsive">

                            <table class="table table-hover profiletbl">
                                <tbody>
                                    <tr>
                                        <th>Name</th>
                                        <td>
                                            <asp:Label ID="llbname" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th>Designation</th>
                                        <td>DSA </td>
                                    </tr>
                                    <tr>
                                        <%-- <th></th>--%>
                                        <th>DSA ID</th>
                                        <td><a href="UpdateMember.aspx"><%= Session["UserCode"].ToString()%></a>
                                            <br />
                                        </td>

                                    </tr>
                                    <tr>
                                        <th>Mobile No.</th>
                                        <td>
                                            <asp:Label ID="llbmobile" runat="server"></asp:Label></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                        <p style="font-size:13px;">
                            <span style="font-size:14px;font-weight:600;">Head Office:</span>
                            <br />
                         Diwakar Retail Ltd. 26, UGF Unique Shopping Mall Near GVM Girls College
Murthal Road, Sonipat-131001<br />
                         <%--   +91 7617522212, +91 7617622212<br />--%>
                            <b>diwakarretail2017@gmail.com</b>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="return PrintPanel();" />
</asp:Content>
