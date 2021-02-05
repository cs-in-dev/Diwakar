<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="RepurchaseDetails.aspx.cs" Inherits="CyraShop._240578.RepurchaseDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="style10">  
          <center>
        <div>
            <h1>Repurchase Payment Details</h1>
        </div>
    </center>
          <tr class="style6">
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" onclick="ImageButton1_Click" />
            </td>
        </tr>
         <%-- <tr>
            <td class="style5" align="right">
                Order Id</td>
            <td style="text-align: left" class="auto-style1">
                <asp:TextBox ID="txtOrderID" runat="server" CssClass="style7"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ErrorMessage="*"  ValidationGroup="vg3" ForeColor="red" ControlToValidate="txtOrderID"></asp:RequiredFieldValidator>
            </td>
             <td>
                <asp:Button ID="btnbyorderid" runat="server" Text="Search by OrderID "  OnClick="btnbyorderid_Click" ValidationGroup="vg3"/>
            </td>
        </tr>--%>
           <div style="width:100%;">
              
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                   CellPadding="4" AllowPaging="true" PageSize="40" OnPageIndexChanging="GridView1_PageIndexChanging"
                   ForeColor="#333333" GridLines="None" AllowSorting="True" DataSourceID="SqlDataSource1">
                   <AlternatingRowStyle BackColor="White" />

                   <Columns>
                        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex +1 %>
                </ItemTemplate>
            </asp:TemplateField>
                       <asp:BoundField DataField="MemberID" HeaderText="MemberID"
                           SortExpression="MemberID" />
                       <asp:BoundField DataField="DateofTransaction" HeaderText="DateofTransaction"
                           SortExpression="DateofTransaction" />
                       <asp:BoundField DataField="Particulars" HeaderText="Particulars"
                           SortExpression="Particulars" />
                       <asp:BoundField DataField="Credit" HeaderText="Credit"
                           SortExpression="Credit" />
                       <asp:BoundField DataField="Debit" HeaderText="Debit"
                           SortExpression="Debit" />

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
               <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conn %>' SelectCommand="SELECT [MemberID], [DateofTransaction], [Particulars], [Credit], [Debit] FROM [AccountMaster]where txntype=11"></asp:SqlDataSource>
           </div>
         </table>
</asp:Content>
