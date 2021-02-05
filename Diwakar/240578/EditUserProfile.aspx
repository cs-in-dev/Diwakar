<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="EditUserProfile.aspx.cs" Inherits="Wojok._240578.EditUserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {            color: #990000;
            font-weight: bold;
            /*text-align: center;*/
        }
        .style3
        {
            text-align: right;
            width: 192px;
        }
        .style4
        {
            text-align: center;
            width: 192px;
            color: #990000;
        }
        table
        {
            width:970px;
            text-align:left;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:30%; margin:auto;">
            <tr>
                <td class="style2" colspan="2">Edit User Credentials / Roles</td>
            </tr>
            <tr>
                <td ></td>
                <td>
                    <span> Select User Name</span>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        Height="19px" Width="200px" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td ></td>
                <td >
                    <span> <strong>Permissions</strong></span>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="16px" Width="200px">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td> &nbsp; </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Height="26px" 
                        Text="Save new Credentials" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
