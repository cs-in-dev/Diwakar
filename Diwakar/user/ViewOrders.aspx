<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="SuperBusines.ViewOrdersFranchise" %>
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
        .style5
        {           
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
        .style10
        {
            width: 100%;
            font-size: xx-large;
            color: #FFFFFF;
        }
        .style12
        {
            width: 482px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%">
    <br /><center><h1>Search Invoice</h1></center>


    <table class="style10">       
        <tr>
            <td class="style5" align="right">
                Date From
            </td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1"></asp:CalendarExtender>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Date Till</td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" ></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2"></asp:CalendarExtender>
                   </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Member Id</td>
            <td style="text-align: left" class="style12">
                <asp:TextBox ID="txtMemberID" runat="server" CssClass="style7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Order Id</td>
            <td style="text-align: left" class="style12">
                <asp:TextBox ID="txtOrderID" runat="server" CssClass="style7" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    CssClass="style7" onclick="btnSubmit_Click" />
                <span class="style6">&nbsp;</span></td>
        </tr>
        <tr class="style6">
            <td class="style12">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
                
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
            <div style="width:100%; overflow:scroll">

            </div>
                
            </td>
        </tr>
    </table>


    
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
        DataKeyNames="OrderId" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No Data Found" ShowFooter="true" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <%--  <asp:BoundField DataField="BranchInvoiceNo" HeaderText="Invoice No." InsertVisible="False" 
                ReadOnly="True" SortExpression="BranchInvoiceNo" />--%>
            <asp:TemplateField HeaderText="Sr No.">
                <ItemTemplate>
                   <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID"  
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
             <asp:BoundField DataField="TotalDP" HeaderText="TotalDP" SortExpression="TotalDP" DataFormatString="{0:f2}" />
             <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                SortExpression="MemberID" />
                 <asp:BoundField DataField="MemberName" HeaderText="MemberName" 
                SortExpression="MemberName" />
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="viewBill" runat="server" NavigateUrl='<% #Eval("ViewDetails") %>' Target="_blank">View</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>
            <%-- <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlUpdatessBill" runat="server" NavigateUrl='<% #Eval("BranchInvoiceNo","EditsBranchbillOrderDetails.aspx?ID={0}") %>' Target="_blank">Update Billing</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlUpdatess" runat="server" NavigateUrl='<% #Eval("OrderID","AddCourierCharges.aspx?ID={0}") %>' Target="_blank">Update CourierCharges</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>    --%>      
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <EmptyDataTemplate>
            <center>
                No Data Found
                </center>
            </EmptyDataTemplate>
        <FooterStyle BackColor="#47d9bf" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#47d9bf" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
   
     <br /><br />
        <div><center>
            <%--<asp:ImageButton ID="ImageButton1" runat="server" 
               ImageUrl="~/user/images/excel_icon.gif" 
        onclick="ImageButton1_Click" />--%>
             </center></div>
    
    <br /><br />
    </div>
    
</asp:Content>
