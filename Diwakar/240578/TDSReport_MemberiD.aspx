<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TDSReport_MemberiD.aspx.cs" MasterPageFile="~/240578/AdminMasterPage.master" Inherits="WGRL._03032003.TDSReport_MemberiD" %>

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
            <strong>Total TDS  (Member ID)
            </strong></caption>
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



       <%-- <tr class="style23">
                <td class="style33" >
                    <strong>Member ID </strong></td>
            <td class="style31">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="vg2" Font-Size="18px"></asp:RequiredFieldValidator>
            </td>--%>
            <tr class="style23">
                <td class="style33" >
                    &nbsp;</td>
                <td class="style31" >
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search"  />
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
                        PageSize="100" Width="940px" style="margin-left:7%" 
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
                            <asp:BoundField DataField="Panno" HeaderText="Pan No" 
                                SortExpression="Panno" />
                            <asp:BoundField DataField="allpayout" HeaderText="Total Payout" 
                                SortExpression="allpayout" />
                           
                          
                            <asp:BoundField DataField="totalTDS" HeaderText="Total TDS" SortExpression="totalTDS" />
                            
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
                        
                        SelectCommand="Select table1.totalTDS,table1.allpayout,table1.usercode, tblmembermaster.username ,tblmembermaster.Panno  from tblmembermaster inner join (SELECT   sum(TDS) as totalTDS, Sum(TotalPayout) as allpayout ,UserCode   from payouts where cast(Payouts.DateFrom as date) >= cast(@DOJ as date) and Cast(Payouts.DateTo as date) <= cast(@DOJ2 as date)  group by  UserCode) AS table1  on tblmembermaster.usercode=table1.usercode  where table1.allpayout!=0" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox2" DbType="Date" Name="DOJ" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox3" DbType="Date" Name="DOJ2" 
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

