<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="ViewPayouts1.aspx.cs" Inherits="GOG.Admin.ViewPayoutsNew" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
          width: 100%;
            font-size: x-large;
           
        }
        .style2
        {
        }
        .style3
        {
            width: 487px;
        }
        .style5
        {
            /*width: 487px;*/
            color: #000000;
            font-size: small;
        }
        .style6
        {
            color: #FF0000;
            font-size: small;
        }
        .style7
        {
            font-size: small;
        }
        .style9
        {
            color: #000000;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1" >
        <span class="style9"><strong>View Payout</strong></span><strong> </strong>
      <%--  <tr>--%>
            <td class="style5" align="right">
                Payout Date
            </td>
         <td style="text-align: left">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DateTo" DataValueField="DateTo">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT DISTINCT CONVERT(VARCHAR(11),GenratedOn,111) AS DateTo FROM [Payouts] Where GenratedOn<=GETDATE() ORDER BY [DateTo] DEsc"></asp:SqlDataSource>
            </td>
           <%-- <td style="text-align: left">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="style7" placeholder="yyyy/MM/dd " ></asp:TextBox>

                <%--<asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox4"  PromptCharacter="_"></asp:MaskedEditExtender>
                <asp:MaskedEditValidator ID="MaskedEditValidator1" runat="server" ControlExtender="MaskedEditExtender1" ControlToValidate="TextBox4" EmptyValueMessage="Date is required" InvalidValueMessage="Date is invalid" IsValidEmpty="False" TooltipMessage="Input a Date"></asp:MaskedEditValidator>
                      <asp:CalendarExtender runat="server" ID="CE1"   TargetControlID="TextBox4" Format="yyyy/MM/dd"></asp:CalendarExtender>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Date Till</td>
            <td style="text-align: left">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="style7" placeholder="yyyy/MM/dd"
                        ontextchanged="TextBox3_TextChanged"></asp:TextBox>
                <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox3" PromptCharacter="_" ></asp:MaskedEditExtender>
               <asp:MaskedEditValidator ID="MaskedEditValidator2" runat="server" ControlExtender="MaskedEditExtender2"  ControlToValidate="TextBox3" EmptyValueMessage="Date is required" InvalidValueMessage="Date is invalid" IsValidEmpty="False" TooltipMessage="Input a Date"></asp:MaskedEditValidator>
                          <asp:CalendarExtender runat="server" ID="CalendarExtender1"   TargetControlID="TextBox3" Format="yyyy/MM/dd"></asp:CalendarExtender>
                   </td>
        </tr>--%>
        <tr>
            <td class="style5" align="right">
                Member Id</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="style7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Track Id</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox5" runat="server" CssClass="style7" 
                   ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
                    CssClass="style7" />
                <span class="style6">&nbsp;</span></td>
        </tr>
        <tr class="style6">
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" onclick="ImageButton1_Click" />
            </td>
        </tr>
        </table>
        <div style="width:1100px;overflow:scroll;height: 600px;">
        <table >
        <tr>
            <td class="style2" colspan="2">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" style="font-size: small;overflow:scroll;" Width="450px"
                   ShowHeaderWhenEmpty="True" DataKeyNames="TrackID" OnRowDataBound="GridView1_RowDataBound" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        No Rows Found!
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    
                    <Columns>
             <asp:TemplateField HeaderText="S.N." >
             <ItemTemplate>
             <%#Container.DisplayIndex+1 %>
             </ItemTemplate>
             </asp:TemplateField>
            <%--  <asp:TemplateField HeaderText="Cheque">
                            <ItemTemplate>
                            <asp:HyperLink ID="Print" runat="server" Text="Cheque Print" NavigateUrl='<%#Eval("TrackID","Check.aspx?ID={0}") %>'></asp:HyperLink>
                            </ItemTemplate>
                            </asp:TemplateField>--%>
                        <asp:BoundField />
                        <asp:BoundField />
             </Columns>
              </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
