<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TDSReport.aspx.cs" MasterPageFile="~/240578/AdminMasterPage.master" Inherits="WGRL._03032003.GreenPinTopup" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
  
    <style type="text/css">
        .style31
        {
            width: 365px;
            text-align: left;
        }
        .style32
        {
            width: 732px;
            text-align: right;
            margin-left:-145px;
        }
        .style33
        {
            width: 357px;
            text-align: right;
            color: #000000;
            font-size: medium;
        }
        .style34
        {
            font-size: x-large;
            color: #000000;
            margin-left: 190px;
        }
        .style3
        {
            width: 487px;
        }

         .style6
        {
            color: #FF0000;
            font-size: small;
        }
         #ContentPlaceHolder1_GridView1{
             margin-left:7%;
         }
    </style>
  
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <table class="style32">
        <caption class="style34">
            <strong>TDS Report
            </strong></caption>
            <tr class="style23">
                <td class="style33" >
                    <strong>&nbsp;Date From : </strong></td>
                <td class="style31" >
                    <asp:TextBox ID="FromDate" runat="server" CssClass="style7"></asp:TextBox>
                    <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="FromDate" Format="yyyy-MM-dd"></asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="vg4" ForeColor="red" ControlToValidate="FromDate"></asp:RequiredFieldValidator></td>
            </tr>
            <tr class="style23">
                <td class="style33" >
                    <strong>Date To : </strong></td>
                <td class="style31" >
                    <asp:TextBox ID="DateTo" runat="server" CssClass="style7"></asp:TextBox>

                    <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="DateTo" Format="yyyy-MM-dd"></asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="vg4" ForeColor="red" ControlToValidate="DateTo"></asp:RequiredFieldValidator></td>
            </tr>


            <tr class="style23">
                <td class="style33" >
                    &nbsp;</td>
                <td class="style31" >
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />
                </td>
            </tr>
           <%-- <tr class="style23">
                <td class="style33" >
                    &nbsp;</td>
                <td class="style31" >
                    &nbsp;</td>
            </tr>--%>


            <tr class="style6">
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click" />
            </td>
        </tr>


            <tr>
                <td colspan="2" class="style8">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                         ForeColor="#333333" GridLines="None" 
                        PageSize="100" Width="940px" style="margin-left:7%" DataKeyNames="TrackID" 
                        DataSourceID="SqlDataSource1">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                         <asp:TemplateField HeaderText="S.N." HeaderStyle-Font-Bold="true" >
             <ItemTemplate>
             <%#Container.DisplayIndex+1 %>
             </ItemTemplate>
             </asp:TemplateField>
                            <asp:BoundField DataField="UserCode" HeaderText="Member ID" 
                                SortExpression="UserCode" />
                            <asp:BoundField DataField="UserName" HeaderText="Name" 
                                SortExpression="UserName" />

                            
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="State" 
                                HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" 
                                SortExpression="PostalCode" />
                            <asp:BoundField DataField="MobileNo" HeaderText="Mobile" 
                                SortExpression="MobileNo" />
                            <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                            <asp:BoundField DataField="PanNo" HeaderText="Pan No" SortExpression="PanNo" />
                            <asp:BoundField DataField="TrackID" HeaderText="TrackID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="TrackID" />
                            <asp:BoundField DataField="DateFrom" HeaderText="DateFrom" DataFormatString="{0:d}"
                                SortExpression="DateFrom" />
                            <asp:BoundField DataField="DateTo" HeaderText="DateTo"  DataFormatString="{0:d}"
                                SortExpression="DateTo" />
                            <asp:BoundField DataField="TDS" HeaderText="TDS" SortExpression="TDS" />
                            <asp:BoundField DataField="TotalPayout" HeaderText="Payout" 
                                SortExpression="TotalPayout" />
                        </Columns>

                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" />
                        <PagerSettings PageButtonCount="50" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        
                        SelectCommand="SELECT     tblMemberMaster.UserCode, tblMemberMaster.UserName, tblMemberMaster.Address, tblMemberMaster.City, tblMemberMaster.State, tblMemberMaster.PostalCode, tblMemberMaster.MobileNo, tblMemberMaster.EMail, tblMemberMaster.PanNo, Payouts.TrackID, Payouts.DateFrom, Payouts.DateTo, Payouts.TDS, Payouts.TotalPayout FROM         tblMemberMaster INNER JOIN Payouts ON tblMemberMaster.UserCode = Payouts.UserCode Where cast(Payouts.DateFrom as date) >= cast(@DOJ as date) and Cast(Payouts.DateTo as date) <= cast(@DOJ2 as date) AND Payouts.TotalPayout!=0" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FromDate" DbType="Date" Name="DOJ"
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="DateTo" DbType="Date" Name="DOJ2" 
                                PropertyName="Text" />
                            <%--<asp:ControlParameter ControlID="TextBox1" DbType="String" Name="UC" 
                                PropertyName="Text" />--%>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <br />

</asp:Content>

