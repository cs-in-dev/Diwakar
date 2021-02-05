<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="TotalDirectMember.aspx.cs" Inherits="Amazewellness._240578.TotalDirectMember" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--<table><tr><td>Member Id</td><td> <asp:TextBox ID="txtMemberId" runat="server"></asp:TextBox></td></tr>
            <tr><td colspan="2"> <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></td></tr>
        </table>--%>
        <br />

        <table>
            <caption class="style34">
            <strong>Total Direct Members 
            </strong></caption>


            <tr class="style23">
                <td class="style33" >
                    <strong>&nbsp;Member Id  : </strong></td>
                <td class="style31" >
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                     </td>
            </tr>
            <tr class="style23">
                <td class="style33" >
                    <strong>&nbsp;Date From : </strong></td>
                <td class="style31" >
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" Format="dd-MM-yyyy" TargetControlID="TextBox2"></asp:CalendarExtender>
        <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
                                
            TargetControlID="TextBox2"
            Mask="99/99/9999"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"
            DisplayMoney="Left"
            AcceptNegative="Left"
            ErrorTooltipEnabled="True" />
        <asp:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
            ControlExtender="MaskedEditExtender2"
            ControlToValidate="TextBox2"
            EmptyValueMessage="Date is required"
            InvalidValueMessage="Date is invalid"
            Display="Dynamic"
            TooltipMessage="Input a date"
            EmptyValueBlurredText="*"
            InvalidValueBlurredMessage="*" ForeColor="Red"
            />
                &nbsp;(MM/DD/YYYY)</td>
            </tr>
            <tr class="style23">
                <td class="style33" >
                    <strong>Date To : </strong></td>
                <td class="style31" >
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CalendarExtender1"   TargetControlID="TextBox3"></asp:CalendarExtender>
                    <asp:MaskedEditExtender runat="server" ID="TextBox3_MaskedEditExtender" Enabled="True"  TargetControlID="TextBox3" 
            Mask="99/99/9999"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"
            DisplayMoney="Left"
            AcceptNegative="Left"
            ErrorTooltipEnabled="True">
                    </asp:MaskedEditExtender>
        <asp:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
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



      
            <tr class="style23">
                <td class="style33" >
                    &nbsp;</td>
                <td class="style31" >
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit"  />
                </td>
            </tr>
        </table>
        <div style="margin-top:1%">
            <asp:Panel ID="Panel1" runat="server" Visible="false"><b> Total Direct Member: <asp:Label ID="LabelCount" runat="server" ></asp:Label></b></asp:Panel> </div>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" style="margin-left:1%;margin-top:1%"
            GridLines="Vertical" Width="85%" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Sr.No">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserCode" HeaderText="Member Id" SortExpression="UserCode"/>
                <asp:BoundField DataField="Username" HeaderText="Member Name" SortExpression="Username"/>
                <asp:BoundField DataField="DOJ" HeaderText="Date of joining" SortExpression="DOJ" DataFormatString="{0:dd MMM yyyy , hh:mm:ss tt}"/>
            </Columns>
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>
</asp:Content>
