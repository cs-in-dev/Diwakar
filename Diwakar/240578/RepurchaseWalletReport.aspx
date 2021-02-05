<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="RepurchaseWalletReport.aspx.cs" Inherits="CyraShop._240578.RepurchaseWalletReport" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <table class="style2" style="margin-top: 20px;">
     <caption class="style28">
                <strong>REPURCHASE WALLET REPORT
        </strong>
             </caption>
        <tr>
            <td style="text-align: right">Member ID</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtmemberid" OnTextChanged="txtmemberid_TextChanged" AutoPostBack="true" runat="server" ValidationGroup="v2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtmemberid" ErrorMessage="*"
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
            </td>
             <td style="text-align: right">&nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SUBMIT" ValidationGroup="v2" />

            </td>
        </tr>
        <tr>
            <td style="text-align: right">User Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtusername" runat="server" Height="22px" ReadOnly="true" ValidationGroup="v2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtusername" ErrorMessage="*"
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
                        </td>

        </tr>
      <tr>
            <td class="style5" align="right">
               Order Date From
            </td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1" Format="yyyy-MM-dd"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="*"  ValidationGroup="vg4" ForeColor="red" ControlToValidate="date1"></asp:RequiredFieldValidator>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Order Date Till</td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" ></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2" Format="yyyy-MM-dd"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ErrorMessage="*"  ValidationGroup="vg4" ForeColor="red" ControlToValidate="date2"></asp:RequiredFieldValidator>
                   </td>
            <td>
               
                <asp:Button ID="btnbydate" runat="server" Text="Search by Date"  ValidationGroup="vg4" OnClick="btnbydate_Click"/>
            </td>
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
    <div>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="true" PageSize="40" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
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
             
                    <%--<Columns>
             <asp:TemplateField HeaderText="S.No." >
             <ItemTemplate>
             <%#Container.DisplayIndex+1 %>
             </ItemTemplate>
             </asp:TemplateField>
            
             </Columns>--%>
             <Columns>
                 <asp:TemplateField HeaderText="S.No">
                     <ItemTemplate>
                         <%# Container.DataItemIndex +1 %>
                     </ItemTemplate>



                 </asp:TemplateField>
                 </Columns>

        </asp:GridView>
         <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"  AllowPaging="true" PageSize="40" OnPageIndexChanging="GridView2_PageIndexChanging" >
            <AlternatingRowStyle BackColor="White" />
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
             
                    <%--<Columns>
             <asp:TemplateField HeaderText="S.No." >
             <ItemTemplate>
             <%#Container.DisplayIndex+1 %>
             </ItemTemplate>
             </asp:TemplateField>
            
             </Columns>--%>
             <Columns>
                 <asp:TemplateField HeaderText="S.No">
                     <ItemTemplate>
                         <%# Container.DataItemIndex +1 %>
                     </ItemTemplate>



                 </asp:TemplateField>
                 </Columns>

        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="display:none">
            <AlternatingRowStyle BackColor="White" />
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
             
                    <%--<Columns>
             <asp:TemplateField HeaderText="S.No." >
             <ItemTemplate>
             <%#Container.DisplayIndex+1 %>
             </ItemTemplate>
             </asp:TemplateField>
            
             </Columns>--%>
             <Columns>
                 <asp:TemplateField HeaderText="S.No">
                     <ItemTemplate>
                         <%# Container.DataItemIndex +1 %>
                     </ItemTemplate>



                 </asp:TemplateField>
                 </Columns>

        </asp:GridView>
    </div>

</asp:Content>
