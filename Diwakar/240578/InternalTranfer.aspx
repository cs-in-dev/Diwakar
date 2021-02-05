<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InternalTranfer.aspx.cs" MasterPageFile="~/240578/AdminMasterPage.master" Inherits="eSolutionsCurry.InterWalletTranferadmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  <div>
      <asp:Panel ID="Panel2" runat="server">
      <table style="text-align:center;width:100%;"><tr><td style="width:50%;text-align:right;">Enter UserCode</td><td style="width:50%;text-align:left;">
          <asp:TextBox ID="txtmember" runat="server"></asp:TextBox>

          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtmember"
                    ErrorMessage="Invalid ID" Font-Bold="False" ForeColor="Red" SetFocusOnError="True"
                    ValidationExpression="^[A-Z]{3}\d+$"></asp:RegularExpressionValidator>
                                                                                                                  </td></tr>
          <tr>
              <td style="width:50%;text-align:right;">&nbsp;</td>
              <td style="width:50%;text-align:left;">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
          </tr>
          </table></asp:Panel>
     <asp:Panel ID="Panel1" runat="server">
      <center>   <table id="fund" align="center" style="width:50%; margin:0 auto;">
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td  colspan="3" align="center" style="text-align:center!important;"><span style=" font-weight:bold; color:Black">
                    Internal Fund Transfer </span></td>
            </tr>
           <tr><td style="text-align:center;">
              <span>Select</span> <%--<asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                    </asp:RadioButtonList>--%></td>

               <td></td>
               <td><asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>


           </tr>
            
            <tr>
                <td align="left">
                    Enter Amount </td><td>&nbsp;</td>
                <td align="left">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
      ErrorMessage="Enter Your MemberID" Font-Bold="False" style="color: #FF0000"></asp:RequiredFieldValidator>
                    <asp:FilteredTextBoxExtender ID="TextBox4_FilteredTextBoxExtender" runat="server"
                    Enabled="True" FilterType="Numbers" TargetControlID="TextBox4">
                </asp:FilteredTextBoxExtender>
                </td>
            </tr>
            
            <%--<tr>
                <td align="left">
                    Transfer To</td><td>&nbsp;</td>
                <td align="left">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Task E-fund</asp:ListItem>
                        <asp:ListItem>Reward E-Fund</asp:ListItem>
                         </asp:DropDownList> </td>
            </tr>--%>
            <tr>
                <td align="left">
                    Transaction Password</td><td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" MaxLength="10" Enabled="false"></asp:TextBox><span style="color:red;">DO NOT ENTER PASWORD</span>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td><td></td>
                <td align="left">
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Transfer"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
                &nbsp;
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table></center>
          </asp:Panel>
    
    </div>
    

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style>
        #fund td {
            text-align:left!important;
        }
        input[type=radio] {
            float:right;
        }

    </style>
    </asp:Content>
