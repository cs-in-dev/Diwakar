<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="DownPayouts.aspx.cs" Inherits="WGRL.User.MyDownPayouts" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="obout_Grid_NET" namespace="Obout.Grid" tagprefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style9
        {
            width: 698px;
        }
        .style13
        {
            text-align: right;
            width: 336px;
        }
        .style14
        {
            width: 337px;
        }
        .style15
        {
            width: 336px;
        }
    
        .style16
        {
            color: #000000;
        }
    
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center style="font-size: x-large;"><strong>Downline Payout</strong></center>

        <table class="style9">
            <tr>
                <td class="style13" >
                    <strong>Date From : </strong></td>
                <td class="style14" >
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      <cc1:CalendarExtender runat="server" ID="CE1" TargetControlID="TextBox2"></cc1:CalendarExtender><cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
                                
            TargetControlID="TextBox2"
            Mask="99/99/9999"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"
            DisplayMoney="Left"
            AcceptNegative="Left"
            ErrorTooltipEnabled="True" />
        <cc1:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
            ControlExtender="MaskedEditExtender2"
            ControlToValidate="TextBox2"
            EmptyValueMessage="Date is required"
            InvalidValueMessage="Date is invalid"
            Display="Dynamic"
            TooltipMessage="Input a date"
            EmptyValueBlurredText="*"
            InvalidValueBlurredMessage="*" style="color: #FF0000"
            />
                &nbsp;(MM/DD/YYYY)
                      </td>
            </tr>
            <tr>
                <td class="style13" >
                    <strong>Date To : </strong></td>
                <td class="style14" >
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="TextBox3"></cc1:CalendarExtender><cc1:MaskedEditExtender runat="server" ID="TextBox3_MaskedEditExtender" Enabled="True"  TargetControlID="TextBox3" 
            Mask="99/99/9999"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"
            DisplayMoney="Left"
            AcceptNegative="Left"
            ErrorTooltipEnabled="True">
                    </cc1:MaskedEditExtender>
        <cc1:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
            ControlExtender="TextBox3_MaskedEditExtender"
            ControlToValidate="TextBox3"
            EmptyValueMessage="Date is required"
            InvalidValueMessage="Date is invalid"
            Display="Dynamic"
            TooltipMessage="Input a date"
            EmptyValueBlurredText="*"
            InvalidValueBlurredMessage="*" ForeColor="Red"
            />
                               
                &nbsp;(MM/DD/YYYY)</td>
            </tr>
        <tr>
        <td align="right" class="style15"><strong>Enter Member ID : </strong> </td>
            <td class="style14"><asp:TextBox runat="server" ID="MemberID"></asp:TextBox>&nbsp;(Type
                <strong>IS</strong> to select all members)</td>
        </tr>
            <tr>
                <td class="style15">
                </td>
                <td class="style14">
                    <asp:Button ID="Submit" runat="server" onclick="Submit_Click" Text="Submit" />
                </td>
            </tr>
             <tr>
                <td class="style15">
                </td>
                <td class="style14">
                    <asp:Label ID="Label1" runat="server" Text="" />
                </td>
            </tr>
        </table>
        
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
    
            
            
        SelectCommand="select * from dbo.GetDownlinePayOutDetails(@UserCode,@DateFrom,@DateTo) WHERE ([UserCode]  LIKE '%' + @Search + '%' )" 
        
        onselecting="SqlDataSource1_Selecting">
    <SelectParameters>
        <asp:SessionParameter SessionField="UserCode" Name="UserCode" />
         <asp:ControlParameter Name="DateFrom" DbType="Date" ControlID="TextBox2" PropertyName="Text" />
         <asp:ControlParameter Name="DateTo" DbType="Date" ControlID="TextBox3" PropertyName="Text" />
         <asp:ControlParameter Name="Search" ControlID="MemberID" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
   
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" PageSize="200" Width="100%" 
        HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#47D9BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
   
    <br />
                   
</asp:Content>
 