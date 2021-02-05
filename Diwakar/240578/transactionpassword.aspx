<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="transactionpassword.aspx.cs" Inherits="OpinionWorldGroup.Admin.transactionpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        .style28
        {
            color: #000000;
            font-weight: bold;
            text-decoration: underline;
            font-style: italic;
        }
        .style29
        {
            text-align: left;
        }
        .style30
        {
            color: #000000;
            width: 270px;
            text-align: left;
        }
        .style33
    {
        font-family: Verdana;
        font-size: small;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Panel ID="Panel1" runat="server">
   
   <table id="Table1" border="0" runat="server">
<tr>
<td colspan="3" style="font-family: Verdana; font-size: large; font-weight: 700; font-style: italic; text-decoration: underline" align="center">
                Change Transaction Password</td>
</tr>
<tr>
<td colspan="3"><br /><br /></td>
</tr>
  
        
        <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Enter Member Id"></asp:Label>
        
        </td>
            <td align="right">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
           
            <td align="left">
                <asp:Button ID="btngetmember" runat="server" 
                    Text="GetTransactionPassword" onclick="btngetmember_Click"   />
            </td>
        </tr>
         <tr>
        <td colspan="3">
            <asp:Label ID="lblmess" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
        </td>
        </tr>
        <tr>
        <td colspan="3"><br /></td>
        </tr>
</table>
    </asp:Panel>
    
    <asp:Panel ID="Panelviewinformation" runat="server">
    
    <table class="style2" style="width: 571px">
        <tr>
<td colspan="3" style="font-family: Verdana; font-size: large; font-weight: 700; font-style: italic; text-decoration: underline" align="center">
                Change Transaction Password</td>
</tr>
        <tr>
            <td align="right" class="style33">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Existing Password&nbsp;&nbsp; </td>
            <td class="style30">
                <asp:TextBox ID="txtExistingPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtExistingPassword" ErrorMessage="Enter old Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style33">
                New Password</td>
            <td class="style30">
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtNewPassword" ErrorMessage="Enter new Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style33">
                Confirm New Password</td>
            <td class="style30">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtConfirmPassword" ControlToValidate="txtNewPassword" 
                    ErrorMessage="Confirm Password Mismatch" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
        <td></td>
            <td align="left">
                
                <asp:Button ID="btntransaction" runat="server" 
                    Text="Change Transaction Password" onclick="btntransaction_Click" />
            </td>
        </tr>
        <tr>
            <td class="style6" colspan="2" align="center">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
    </table>

    </asp:Panel>
</asp:Content>
