<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="NewJoinings.aspx.cs" Inherits="Starlinenetworking.user.NewJoinings" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="obout_Grid_NET" namespace="Obout.Grid" tagprefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 702px;
        }
        .style6
        {
            text-align: right;
            width: 350px;
        }
        .style7
        {
            width: 350px;
        }
        .style8
        {
            text-align: right;
        }
        .style9
        {
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center style="font-size: x-large;"><strong>New Joinings</strong></center>
    <table class="style1">
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr class="style23">
                <td class="style8" >
                    <strong>Date From : </strong></td>
                <td class="style31" >
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
            <tr class="style23">
                <td class="style8" >
                    <strong>Date To : </strong></td>
                <td class="style31" >
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
            <td class="style7">
                &nbsp;</td>
            <td class="style7">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
            </td>
        </tr>
    </table>
    <br />
   <div align="center" style="font-family:@Arial Unicode MS; font-size:large; width:100%"> My New Joining <%=Request.QueryString["Side"].ToString() %></div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" CellPadding="4" DataSourceID="Left" 
            ForeColor="#333333" GridLines="None" PageSize="80" Width="100%" 
        HorizontalAlign="Center">
        <PagerStyle BackColor="#1C5E55" Font-Bold="true" ForeColor="White" HorizontalAlign="Center" />
        <Columns>
        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <%--<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />--%>
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
   <span class="style1"><strong>Total Records:<asp:Label ID="Label2" 
            runat="server"></asp:Label>
        </strong></span>
    <br />
            <asp:SqlDataSource ID="Left" runat="server"
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        
        SelectCommand="select *  from dbo.GetNewJoiningsLeft(@UserCode, @DateFrom,@DateTo)" 
        onselected="Left_Selected">
        <SelectParameters>
            <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            <asp:ControlParameter Name="DateFrom" DbType="Date" ControlID="TextBox2" PropertyName="Text" />
            <asp:ControlParameter Name="DateTo" DbType="Date" ControlID="TextBox3" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AllowSorting="True" CellPadding="4" DataSourceID="Right" 
            ForeColor="#333333" GridLines="None" PageSize="80" Width="100%" 
        HorizontalAlign="Center">
        <PagerStyle BackColor="#1C5E55" Font-Bold="true" ForeColor="White" HorizontalAlign="Center" />
        <Columns>
        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <%--<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />--%>
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
   
    <br />
            <asp:SqlDataSource ID="Right" runat="server"
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        
        SelectCommand="select *  from dbo.GetNewJoiningsRight(@UserCode, @DateFrom,@DateTo)"
        onselected="Right_Selected">
        <SelectParameters>
            <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            <asp:ControlParameter Name="DateFrom" DbType="Date" ControlID="TextBox2" PropertyName="Text" />
            <asp:ControlParameter Name="DateTo" DbType="Date" ControlID="TextBox3" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
