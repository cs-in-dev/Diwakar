<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="TransferStockViewOrders.aspx.cs" Inherits="Trnsfer.Stockdetails" %>
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
    <br /><h1>Transfered Stocks</h1>


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
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
                
                <span class="style6"><asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    CssClass="style7" onclick="btnSubmit_Click" /></span></td>
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


    
    <%--<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
        
        onselectedindexchanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True"  >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="DATE" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ProductCode" HeaderText="PRODUCT CODE" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductCode" />
            <asp:BoundField DataField="ProductName" HeaderText="PRODUCT NAME" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductName" />
            <asp:BoundField DataField="Particulars" HeaderText="Details" 
                SortExpression="Particulars" DataFormatString="{0:f2}" />
           
            
            <asp:BoundField DataField="Invoice" HeaderText="INVOICE NO" 
                SortExpression="Invoice" />
             <asp:BoundField DataField="Rate" HeaderText="RATE" 
                SortExpression="Rate" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="TransferQty" HeaderText="Transfer Qty" 
                SortExpression="TransferQty" />
            
             <asp:BoundField DataField="Vat" HeaderText="VAT TAX" 
                SortExpression="Vat" DataFormatString="{0:f2}" />
             <asp:BoundField DataField="ADDVAT" HeaderText="ADD VAT" 
                SortExpression="ADD VAT" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="Amounts" HeaderText="TOTAL AMOUNT" 
                SortExpression="Amounts" DataFormatString="{0:f2}" />
            
                   
        </Columns>
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
    </asp:GridView>--%>

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
        
        onselectedindexchanged="GridView1_SelectedIndexChanged" ShowFooter="True" EmptyDataText="No Records Found"  >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="DATE" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ProductId" HeaderText="PRODUCT CODE" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductCode" />
            <asp:BoundField DataField="ProductName" HeaderText="PRODUCT NAME" InsertVisible="False" 
                ReadOnly="True" SortExpression="ProductName" />
            <asp:BoundField DataField="RecievedQty" HeaderText="TransferedQty" 
                SortExpression="RecievedQty" DataFormatString="{0:f0}" />
              
           <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                SortExpression="Particulars" />
            <asp:BoundField DataField="StoreID" HeaderText="Transferred To" 
                SortExpression="Particulars" />
            
            
                   
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
  
    
    
    
   <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT     ProductMaster.ProductID AS Expr1, ProductMaster.ProductCode, ProductMaster.ProductName, derivedtbl_1.* FROM         ProductMaster INNER JOIN (SELECT     StockRequest.OrderID, StockRequest.FrenchiseID, StockRequest.OrderDate, StockRequest.Status, StockRequestDetails.Qty, StockRequestDetails.ProductID, StockRequestDetails.Tax, StockRequestDetails.Amount, StockRequest.TotalAmount, StockRequest.NetAmount  FROM  StockRequest INNER JOIN  StockRequestDetails ON StockRequest.OrderID = StockRequestDetails.OrderId  WHERE      (StockRequest.Status = 'Closed')) AS derivedtbl_1 ON ProductMaster.ProductID = derivedtbl_1.ProductID">
       DataSourceID="SqlDataSource1" 
    </asp:SqlDataSource>--%>
  
    
    
    
</asp:Content>
