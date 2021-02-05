<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsUpdate.aspx.cs" MasterPageFile="~/240578/AdminMasterPage.master"
    Inherits="NewsUpdate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div>

            <table class="style1">

                <tr>
                    <td>
                        <table class="style1x">
                            <tr>
                                <td style="font-size: x-small"></td>
                            </tr>
                            <tr>
                                <td style="font-size: x-small">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                                        DataSourceID="SqlDataSource1" DataTextField="Page" DataValueField="Page"
                                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:conn %>"
                                        SelectCommand="SELECT [Page] FROM [Contents]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                                        >
                                        <asp:ListItem Value="0">Show</asp:ListItem>
                                        <asp:ListItem Value="1">Hidden</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                
                            </tr>
                            <tr>
                                <td style="font-size: x-small">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:Editor ID="NewsEditor" runat="server" Height="400px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2"></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="UpdateNews" runat="server"
                                        Text="Update News" OnClick="UpdateNews_Click" />
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>

        </div>
    </center>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1x {
            width: 100%;
            height: 488px;
        }

        .style2 {
            height: 39px;
            font-size: xx-small;
            color: #000000;
        }
    </style>
</asp:Content>
