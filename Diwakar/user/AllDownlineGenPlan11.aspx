<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="AllDownlineGenPlan11.aspx.cs" Inherits="sarvodaya.user.AllDownlineGenPlan11" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .webgrid-table {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 1.1em;
            width: 100%;
            display: table;
            border-collapse: separate;
            border: solid 1px #5CB8E7;
            color: #000;
        }

            .webgrid-table td, th {
                border: 1px solid #000;
                padding: 3px 7px 2px;
            }

        .webgrid-header {
            background-color: #5E879C;
            color: #fff !important;
            padding-bottom: 4px;
            padding-top: 5px;
            text-align: left;
            font-weight: bold;
        }

        .webgrid-footer {
        }

        .webgrid-row-style {
            padding: 3px 7px 2px;
        }

        .webgrid-alternating-row {
            background-color: #F7F6F3;
            padding: 3px 7px 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>All Downline</h2>
    <br />
    <br />
    <div style="width: 675px; margin: 0px 209px">
        &nbsp;<table class="style32">
            <tr class="style23">
                <td class="style33">
                    <strong>&nbsp;Date From : </strong></td>
                <td class="style31">
                    <asp:TextBox ID="TextBox1" AutoComplete="Off" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="calen1" runat="server" TargetControlID="TextBox1"></asp:CalendarExtender>
                </td>

            </tr>
            <tr class="style23">
                <td class="style33">
                    <strong>Date To : </strong></td>
                <td class="style31">
                    <asp:TextBox ID="TextBox2" AutoComplete="Off" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox2"></asp:CalendarExtender>
                    <%--<asp:CheckBox ID="chkdt" runat="server" />--%>
                </td>
            </tr>
            <%--<tr class="style23">
                <td class="style33" >
                    <strong>Select: </strong></td>
                <td class="style31" >
                     <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem Selected="True">Without Subscribers</asp:ListItem>
                </asp:DropDownList>
                   </td>
            </tr>--%>

            <tr class="style23">
                <td class="style33">&nbsp;</td>
                <td class="style31">
                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Search" />
                </td>
            </tr>
            <%--   <tr class="style23">
                <td class="style33" >
                    &nbsp;</td>
                <td class="style31" >
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" onclick="ImageButton1_Click" />
                </td>
            </tr>--%>
        </table>
    </div>


    <br />
    <div style="width: 100%; overflow-x: scroll;">
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>

                <table class="webgrid-table" cellspacing="0" rules="all" border="1" style="width: 100%; border-collapse: collapse;">

                    <tr class="webgrid-header">
                        <th scope="col" style="width: 3%;" align="left">S.No</th>
                        <th scope="col" style="width: 6%;" align="left">Member ID</th>
                        <th scope="col" style="width: 17%;" align="left">Member Name</th>
                        <th scope="col" style="width: 2%;" align="left">Level</th>
                        <th scope="col" style="width: 8%;" align="left">Joining Date</th>
                      
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr class="webgrid-footer">

                    <td align="left" valign="middle" style="color: Black;">
                        <asp:Label ID="serialnum" runat="server" Text='<%# Container.ItemIndex + 1 %>' /></td>
                    <td align="left" valign="middle" style="color: Black;">
                        <asp:Label ID="lblusercode" runat="server" Text='<%# Eval("usercode") %>' /></td>
                    <td align="left" valign="middle" style="color: Black;">
                        <asp:Label ID="username" runat="server" Text='<%# Eval("username") %>' /></td>
                    <td align="left" valign="middle" style="color: Black;">
                        <asp:Label ID="level" runat="server" Text='<%# Eval("level") %>' /></td>

                    <td align="left" valign="middle" style="color: Black;">
                        <asp:Label ID="DOJ" runat="server" Text='<%# Eval("DOJ")%>' /></td>

                 

                 <%--   <td align="left" valign="middle" style="color: Black;">
                        <asp:Button ID="btnrank" runat="server" Text="View" OnClick="btnrank_Click" Visible='<%# Eval("sts") %>' />
                    </td>--%>
                </tr>

            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
