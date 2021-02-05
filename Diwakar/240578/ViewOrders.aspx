<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="SuperBusines.AdminViewOrdersFranchise" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.10.1.min.js"></script>
    <link type="text/css" href="../css/siena.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/santiago.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/latoja.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/lugo.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/cangas.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/vigo.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/nigran.datepicker.css" rel="stylesheet" />


    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#date1").datepicker({
                dateFormat: 'yy-mm-dd'
            }).val();
            $("#date2").datepicker({
                dateFormat: 'yy-mm-dd'
            }).val();
        });
    </script>
    <style type="text/css">
        body {
            font: 100% "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
            margin: 0;
            background: fff;
        }

        h1 {
            width: 900px !important;
            margin: .5em auto 0;
            padding: 10px 0 0;
            background: url('css/images/cal_logo.png') left center no-repeat;
            height: 43px;
            line-height: 30px;
            padding-left: 50px;
            color: #ed7474;
            font-size: 1.6em;
        }

        h2 {
            width: 900px !important;
            margin: .5em auto 0;
        }

        article {
            display: block;
            width: 960px;
            margin: 5em auto;
        }

        input {
            font-size: 1em;
        }

        footer {
            width: 900px !important;
            display: block;
            margin: 30em auto 5em;
            padding: 1em 2em;
            color: #888;
            font-size: .9em;
            background: #f0f0f0;
            border-radius: 1.5em;
        }

            footer a {
                color: #666;
                text-decoration: none;
            }

                footer a:hover {
                    color: #000;
                }

                footer a:first-child {
                    font-weight: bold;
                }
    </style>

    <style type="text/css">
        .ui-datepicker table {
            width: 100% !important;
        }
    </style>

    <style type="text/css">
        .style1 {
            width: 100%;
            font-size: x-large;
        }

        .style2 {
        }

        .style5 {
            color: #000000;
            font-size: small;
        }

        .style6 {
            color: #FF0000;
            font-size: small;
        }

        .style7 {
            font-size: small;
        }

        .style9 {
            color: #000000;
            font-size: x-large;
        }

        .style10 {
            width: 966px;
            font-size: xx-large;
            color: #FFFFFF;
        }

        .style12 {
            width: 482px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <center>
        <h1>Search Order</h1>
    </center>

    <table>
        <tr>
            <td>Date
            </td>
            <td>
                <asp:TextBox ID="date1" runat="server" CssClass="style7" ClientIDMode="Static"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="date2" runat="server" CssClass="style7" ClientIDMode="Static"></asp:TextBox>
            </td>

            <td>Member Id
            </td>
            <td>
                <asp:TextBox ID="txtMemberID" runat="server" CssClass="style7"></asp:TextBox>
            </td>
            <td>Franchise ID</td>
            <td>
                <asp:TextBox ID="txtfrnid" runat="server" CssClass="style7"></asp:TextBox>
            </td>
            <td>Order Id
            </td>
            <td>
                <asp:TextBox ID="txtOrderID" runat="server" CssClass="style7"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table class="style10">
        <tr>
            <td class="style5" align="center" colspan="2">

                <asp:Button ID="btnSubmit" runat="server" CssClass="style7" OnClick="btnSubmit_Click" Text="Submit" />

            </td>
        </tr>


    </table>



    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"
        GridLines="None" Width="100%" AutoGenerateColumns="False"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged" EmptyDataText="No Data Found">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="S.No" ControlStyle-Width="75px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>

                <ControlStyle Width="75px"></ControlStyle>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="3%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order ID" SortExpression="OrderID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Memberid" HeaderText="Member Id" SortExpression="Memberid" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Member Name" SortExpression="Name" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Frenchise ID" SortExpression="FrenchiseID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FrenchiseID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FrenchiseID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="orderdate" HeaderText="Order Date" SortExpression="orderdate" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-Width="15" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Width="15px"></ControlStyle>

                <FooterStyle Width="15px"></FooterStyle>

                <HeaderStyle Width="15px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center" Width="15px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-Width="15" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Width="15px"></ControlStyle>

                <FooterStyle Width="15px"></FooterStyle>

                <HeaderStyle Width="15px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center" Width="15px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TotalDP" HeaderText="Total DP" SortExpression="TotalDP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-Width="15" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Width="15px"></ControlStyle>

                <FooterStyle Width="15px"></FooterStyle>

                <HeaderStyle Width="15px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center" Width="15px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DispatchStatus" HeaderText="Dispatch Status" SortExpression="DispatchStatus" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-Width="15" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Width="15px"></ControlStyle>

                <FooterStyle Width="15px"></FooterStyle>

                <HeaderStyle Width="15px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center" Width="15px"></ItemStyle>
            </asp:BoundField>


            <asp:TemplateField HeaderText="View Invoice" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="btn btn-xs btn-danger">View</asp:LinkButton>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Delete Order" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkdelete" runat="server" OnClick="linkdelete_Click" Visible='<% #Eval("VisiblleLinks") %>' class="btn btn-xs btn-danger">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <center>
                No Data Found
            </center>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"
            HorizontalAlign="Center" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />

        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>

    <br />
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server"
        ImageUrl="images/excel_icon.gif"
        OnClick="ImageButton1_Click" />
    <br />
    <br />


</asp:Content>
