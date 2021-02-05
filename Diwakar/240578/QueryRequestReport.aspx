<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="QueryRequestReport.aspx.cs" Inherits="CyraShop._240578.QueryRequestReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <style type="text/css">
        .auto-style1 {
            padding: 5px;
        }


    </style>

    <style type="text/css">
         
        .stb th, .stb td {
            /*width:100%;*/
    padding: 5px;
    border-color: #ccc;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br />
        <br />
        <br />
        <h1 style="font-size:140%;">Query Report</h1>
        <table>
            <tr>
                <td>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                        <HeaderTemplate>
                            <table cellspacing="0" class="stb" rules="all" border="1">
                                <tr style="background-color: #ccc;">
                                    <th scope="col" align="center" >S.No.</th>
                                    <th scope="col" align="center" style="width:20%">Name
                                    </th>
                                    <th scope="col" align="center">Email
                                    </th>
                                    <th scope="col" align="center">Message
                                    </th>
                                    <th scope="col" align="center">Query Date
                                    </th>

                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="center"><%# Container.ItemIndex + 1 %></td>
                                <td align="center">
                                    <asp:Label ID="lblCustomerId"  runat="server" Text='<%# Eval("Name") %>' />
                                </td>
                                 <td align="center">
                                    <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("Email") %>' />
                                </td>
                                <td align="center">
                                    <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Description") %>' />
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("QueryDate") %>' />
                                </td>


                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>

                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select * from Requestquery"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </center>
</asp:Content>
