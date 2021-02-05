<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="AddAdminPoint.aspx.cs" Inherits="OpinionWorldGroup.SuperAdmin.AddAdminPoint" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            height: 129px;
            width: 266px;
        }
        .style31
        {
            width: 116px;
            text-align:right;
        }
        
        .style50
        {
            color: #000000;
            font-weight: bold;
            text-decoration: underline;
          text-align: center;
            font-size: 15pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
    <tr><td><br /></td></tr>
        <tr>
            <td class="style50" colspan="3">
                Transfer Funds to Admin</td>
        </tr>
        <tr>
            <td class="style31">
&nbsp;Amount</td><td><%=ConfigurationManager.AppSettings["Currency"].ToString()%></td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="Rqfwithdrawamount" runat="server" 
                        ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="invalid Amount" 
                        Text="*"></asp:RequiredFieldValidator>
                          <cc1:filteredtextboxextender ID="TextBox4_FilteredTextBoxExtender1" runat="server" 
                        Enabled="True" FilterType="Numbers" TargetControlID="TextBox4"> </cc1:filteredtextboxextender>
            </td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;</td><td></td>
            <td style="text-align: left">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Add Points" style="height: 26px" />
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="3">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
