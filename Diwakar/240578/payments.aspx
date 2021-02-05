<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="payments.aspx.cs" Inherits="Amazewellness._240578.payments" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table>
            
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Member ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtmemberid" runat="server" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtmemberid" ValidationGroup="vg1" ForeColor="Red" Font-Size="18px">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdate" runat="server" ReadOnly="True"></asp:TextBox>
                     <%--<asp:CalendarExtender runat="server" ID="CE1" Format="dd-MM-yyyy" TargetControlID="txtdate"></asp:CalendarExtender>--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtdate" ValidationGroup="vg1" ForeColor="Red" Font-Size="18px">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Particulars"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtparticulars" runat="server" ReadOnly="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtparticulars" ValidationGroup="vg1" ForeColor="Red" Font-Size="18px">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Amount"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtAmount" ValidationGroup="vg1" ForeColor="Red" Font-Size="18px">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="vg1" />
                </td>
            </tr>

            <tr>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
                <asp:HiddenField ID="HiddenField3" runat="server" />
                <asp:HiddenField ID="HiddenField4" runat="server" />
                <td>

                </td>
                <td>
                    <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Green"></asp:Label>
                </td>
            </tr>

        </table>
    </center>
</asp:Content>
