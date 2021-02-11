<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="SponsorSubordinate.aspx.cs" Inherits="Bvirodh._240578.SponsorSubordinate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="csp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 31%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h2>DownLine List</h2>
    </center>
    <table class="auto-style1">
        <tr>
            <td style="width: 77px">Date From</td>
            <td>
                <asp:TextBox ID="DateFrom" runat="server" AutoComplete="Off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DateFrom" ErrorMessage="*" ValidationGroup="vg1" ForeColor="Red"></asp:RequiredFieldValidator>

                <csp:CalendarExtender runat="server" TargetControlID="DateFrom"></csp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td style="width: 77px">Date To</td>
            <td>
                <asp:TextBox ID="DateTo" runat="server" AutoComplete="Off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DateTo" ErrorMessage="*" ValidationGroup="vg1" ForeColor="Red"></asp:RequiredFieldValidator>
                <csp:CalendarExtender runat="server" TargetControlID="DateTo"></csp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td style="width: 77px">Sponsor Id</td>
            <td>
                <asp:TextBox ID="SponsorId" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ControlToValidate="SponsorId" ErrorMessage="*" ValidationGroup="vg1" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

       <%-- <tr>
            <td style="width: 77px">Select Type </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="0">All</asp:ListItem>
                <asp:ListItem Value="1">Without Subscribers</asp:ListItem>
            </asp:DropDownList>
            </td>
            
        </tr>--%>

        <tr>
            <td></td>
            <td>
                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" ValidationGroup="vg1" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server"
                    ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click" />
            </td>
        </tr>
    </table>

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="SNo.">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName" />
            <asp:BoundField DataField="UserCode" HeaderText="User Code" SortExpression="UserCode" />
               <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="SponsorID" HeaderText="Sponsor ID" SortExpression="SponsorID" />
             <asp:BoundField DataField="Spname" HeaderText="Sponsor Name" SortExpression="Spname" />
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
            
            <asp:BoundField DataField="DOJ" HeaderText="DOJ" DataFormatString="{0:dd MMM yyyy}" SortExpression="DOJ" />
           
            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
             <asp:BoundField DataField="ConfirmDate" HeaderText="Confirm Date" DataFormatString="{0:dd MMM yyyy}" SortExpression="DOJ" />
            <%--    <asp:BoundField DataField="LoginPassword" HeaderText="Password" SortExpression="Address" />--%>
            <%--   <asp:BoundField DataField="Sonof" HeaderText="Sonof" SortExpression="Sonof" />--%>
            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />

            <%--<asp:BoundField DataField="PhotoLink" HeaderText="PhotoLink" SortExpression="PhotoLink" />--%>
            <%--<asp:TemplateField HeaderText="PhotoLink">
                <ItemTemplate>
                    <asp:HyperLink runat="server" Target="_blank" href='<%#Eval("PhotoLink") %>' ImageHeight="20px" Width="20px" ImageUrl='<%#Eval("PhotoLink") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
