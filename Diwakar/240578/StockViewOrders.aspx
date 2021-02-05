<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="StockViewOrders.aspx.cs" Inherits="SuperBusines.Stockdetails" %>
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
            width: 966px;
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
    <br /><h1>Search Stocks</h1>


    <table class="style10">       
        <tr>
            <td class="style5" align="right">
                Date From
            </td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" Format="dd-MM-yyyy" TargetControlID="date1"></asp:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="date1"></asp:RequiredFieldValidator>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Date Till</td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" ></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" Format="dd-MM-yyyy" TargetControlID="date2"></asp:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="date2"></asp:RequiredFieldValidator>
                   </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Product Code</td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="txtproduct" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Bill No</td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="txtbill" runat="server" ></asp:TextBox></td>
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
              <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.png" OnClick="ImageButton2_Click" />  
            </td>
        </tr>
       
        <tr>
            <td class="style2" colspan="2">
            <div style="width:960px; overflow:scroll">

            </div>
                
            </td>
        </tr>
    </table>


    
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
        
        onselectedindexchanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" EmptyDataText="No Records Found"  >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="InwardDate" HeaderText="Bill Date" 
                SortExpression="InwardDate" DataFormatString="{0:dd/MMM/yyyy}" />
            
            <asp:BoundField DataField="ProductCode" HeaderText="Peoduct Code" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductCode" />
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductName" />
            <asp:BoundField DataField="CompanyName" HeaderText="Name Of Suppleyer" InsertVisible="False" 
                ReadOnly="True" SortExpression="CompanyName" />
            <asp:BoundField DataField="InwardNo" HeaderText="Inward No" 
                SortExpression="Inward No" />
            <asp:BoundField DataField="InvoiceNo" HeaderText="Invoice No" 
                SortExpression="InvoiceNo" />
             <asp:BoundField DataField="Rate" HeaderText="RATE" 
                SortExpression="Rate" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="RecievedQty" HeaderText="QTY" 
                SortExpression="RecievedQty" />
            
             <asp:BoundField DataField="Vat" HeaderText="VAT TAX" 
                SortExpression="Vat" DataFormatString="{0:f2}" />
             <asp:BoundField DataField="ADDVAT" HeaderText="ADD VAT" 
                SortExpression="ADD VAT" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="Amount" HeaderText="TOTAL" 
                SortExpression="Amount" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="Amountss" HeaderText="TOTAL AMOUNT" 
                SortExpression="Amountss" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="Date" HeaderText="DATE" SortExpression="Date" DataFormatString="{0:dd/MMM/yyyy}" />

            
           
            
            <%--<asp:BoundField DataField="Particulars" HeaderText="Details" 
                SortExpression="Particulars" />--%>
                 
             
            
                <%--<asp:CommandField ShowSelectButton="True" SelectText="View Details" /> 
                <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlUpdate" runat="server" NavigateUrl='<% #Eval("UpdateOrder") %>'>Update Order</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>   
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlUpdate" runat="server" NavigateUrl='<% #Eval("OrderID","EditOrderDetails.aspx?OrderID={0}") %>'>Update Billing</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField> --%>          
        </Columns>
        <EmptyDataRowStyle Width = "450px"
   HorizontalAlign = "Center"/>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
   <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT [OrderID], [Date], [MemberID], (select UserName from tblMemberMaster where UserCode=[MemberID]) [MemberName], 'UpdateOrders.aspx?ID='+cast([OrderID] as nvarchar) [UpdateOrder] FROM [OrderMaster] WHERE ([Status] = @Status) ORDER BY [Date] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
     <br /><br />
    <br /><br />
    
    
</asp:Content>
