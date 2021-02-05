<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" Inherits="Admin_UserActivation" Codebehind="UserActivation.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="SearchPanel"  runat="server">
   <table>
   <tr>
   <td>Enter Member ID : </td><td>&nbsp;<asp:TextBox ID="UserID" runat="server" Width="200px"></asp:TextBox></td><td>
    <asp:RequiredFieldValidator ID="Rqfwithdrawamount" runat="server" 
                        ControlToValidate="UserID" Display="Dynamic" ErrorMessage="Enter ID" 
                        Text="*"></asp:RequiredFieldValidator>
                          <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
       runat="server" ControlToValidate="UserID" ErrorMessage="Invalid Input" 
       Font-Bold="False" ForeColor="Red" SetFocusOnError="True" 
         ValidationExpression="^[A-Z]{3}\d+$" ></asp:RegularExpressionValidator>--%>
       &nbsp;<asp:Button ID="Search" runat="server" onclick="Search_Click" 
           Text="Get Status" /></td>
   </tr>
       <tr>
           <td>
               &nbsp;</td>
           <td>
               <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                   RepeatDirection="Horizontal">
                   <asp:ListItem>Active</asp:ListItem>
                   <asp:ListItem>Deactive</asp:ListItem>
               </asp:RadioButtonList>
           </td>
           <td>
               <asp:Button ID="Search0" runat="server" onclick="Button1_Click" 
                   Text="Update Status" />
           </td>
       </tr>
   </table>
   
   </asp:Panel>
   
    

                  </asp:Content>

