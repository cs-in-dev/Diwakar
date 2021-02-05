<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="BranchOrderDetails.aspx.cs" Inherits="SuperBusines.BranchOrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
            font-weight: 700;
        }
        
         .Name
      {
          color: #656666;
font-family: Arial, Helvetica, sans-serif;
font-size: 12px;
line-height:27px;
      }
      
         .Name2
      {
          color: #656666;
font-family: Arial, Helvetica, sans-serif;
font-size: 14px;
line-height:27px;
      }
                
        .style7
        {
            width: 311px;
        }
         .tblinv
         {
             width:100%;
            height: 123px;
        }
        
        .tblinv td
        {
            border:0px solid #333;
            
            }
            .tblinv th
            {
                border:1px solid #333;
                background-color:#65ac42;
                
                }
                .padd td 
                {
                    padding:5px;
                    }
                     .padd1 td
                {
                    padding:5px 10px;
                    }
                    .padd1 th
                    {
                        padding:7px;
                        color:#fff;
                        }
        
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
<br />
<asp:Panel ID="Panel1" runat="server">
<%--System.Configuration.ConfigurationManager.AppSettings["CoName"].ToString() --%>
    <table width="100%" cellspacing="0" cellpadding="0">
   <tr><td align="center" style="font-weight: bold; font-size:20pt;"><img src="../images/Anmol_logo.png" alt="Logo" border="0" style="width:112px; height: 124px;" /></td></tr>
    <tr><td align="center" class="style9">Address&nbsp; :&nbsp;&nbsp; Gorakshani Goshala Road, Gumati No-13 Near Petrol Pump <br />  Madhubani , Bihar - 847211<br /> <br /> </td></tr>

    <tr>

<td align="center" style="text-align:center;font-weight:bolder;"  >
<span style="font-size:16px;">

TAX INVOICE
</span>
</td>

</tr>


    <tr><td>
    <table class="tblinv" width="100%" cellspacing="0" cellpadding="0">
    <tr><td valign="top" style="width:70%;">
    <table class="tblinv padd"  cellspacing="0" cellpadding="0">
    <tr><td valign="top" style="height:40px; font-size:12pt;">Invoice To :
    <asp:Label ID="lblMemberID" runat="server" Text=""></asp:Label>
       <br />
       Name :<asp:Label ID="lblcustname" runat="server" Text=""></asp:Label> 
        <br />
        Address :<asp:Label ID="lblcustaddr" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblFrenchiseId" runat="server" Text="BranchID"></asp:Label>
    </td></tr>
    
    
    </table></td>
    
    
    <td style="width:70%;"><table class="tblinv padd"  cellspacing="0" cellpadding="0"><tr>
        <td valign="top" style="width:70%; font-size:12pt;">Bill No. : <asp:Label ID="lblinvoiceno" runat="server" Text=""></asp:Label>
    <br />Dated : <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
     <br />TIN No : <asp:Label ID="lblTinNo" runat="server" Text=""></asp:Label>
      <br />PAN No : <asp:Label ID="lblPanNo" runat="server" Text=""></asp:Label>
       <br />CIN No : <asp:Label ID="lblCinNo" runat="server" Text=""></asp:Label></td></tr>
    </table></td></tr></table>
    
    </td></tr>
    
    <tr>
    <td>
    <table class="tblinv padd1" cellspacing="0" cellpadding="0" width="100%">   
     <tr><td colspan="3" width="100%">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
CellPadding="4"  ForeColor="#333333" 
GridLines="None" Width="100%" style="float:left; margin-top: 0px;" ShowFooter="True" 
             ShowHeaderWhenEmpty="True" EmptyDataText="No Payouts released." 
             onrowdatabound="GridView1_RowDataBound">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
    
       <asp:TemplateField HeaderText="SNo">
    <ItemTemplate>
    <%#((GridViewRow)Container).RowIndex+1 %>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="ProductCode" HeaderText="Code" SortExpression="ProductCode" />
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
              <asp:BoundField DataField="BV" HeaderText="BV" SortExpression="BV" />
        <%-- <asp:BoundField DataField="PriceBeforVAT" HeaderText="Price B/F VAT" SortExpression="Price B/F VAT" DataFormatString="{0:f2}" />--%>
         <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" DataFormatString="{0:f2}" />
          <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
         
        <asp:BoundField DataField="Dis" HeaderText="Dis" SortExpression="Dis" DataFormatString="{0:f2}" />
                <asp:BoundField DataField="VAT" HeaderText="VAT/CST" SortExpression="VAT" DataFormatString="{0:f2}" />   
         <%--<asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" DataFormatString="{0:f2}"/>--%>
          
         <asp:BoundField DataField="AddVAT" HeaderText="Add Vat" SortExpression="AddVAT" DataFormatString="{0:f2}" />
       
       <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV" DataFormatString="{0:f2}"/>
         <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" SortExpression="TotalPrice" DataFormatString="{0:f2}"/>
      
        
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <EmptyDataTemplate>
        No Rows Found!
    </EmptyDataTemplate>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
        HorizontalAlign="Center" />
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" 
    ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#F7F6F3" 
    HorizontalAlign="Center" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    
</asp:GridView>
         


         <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" --  DataSourceID="SqlDataSource1"--
             ConnectionString="<%$ ConnectionStrings:conn %>" 
             SelectCommand="SELECT     ProductMaster.ProductCode,ProductMaster.ProductName,ProductMaster.BV,(ProductMaster.DP-(ProductMaster.DP*0.08))BranchPrice,(ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat) as PriceBeforVAT,((ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat)-((ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat)*0.08))UnitPrice,derivedtbl_1.Qty,
((ProductMaster.DP*derivedtbl_1.Qty))*0.08 as Dis, ((((ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat)-((ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat)*0.08))*ProductMaster.Vat/100)*derivedtbl_1.Qty)VAT, 
  ((((ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat)-((ProductMaster.DP*100)/(100+ProductMaster.Vat+ProductMaster.AddVat)*0.08))*ProductMaster.AddVat/100)*derivedtbl_1.Qty)AddVAT,(ProductMaster.BV*derivedtbl_1.Qty)TotalBV,((ProductMaster.DP-(ProductMaster.DP*0.08))*derivedtbl_1.Qty)TotalPrice, ProductMaster.MRP,  derivedtbl_1.OrderID, derivedtbl_1.Status, 
                      derivedtbl_1.FrenchiseID, derivedtbl_1.Amount
FROM         ProductMaster INNER JOIN
                          (SELECT     StockRequest.OrderID, StockRequest.Status, StockRequest.FrenchiseID, StockRequestDetails.Amount, StockRequestDetails.Qty, 
                                                    StockRequestDetails.MRP, StockRequestDetails.ProductID
                            FROM          StockRequest INNER JOIN
                                                   StockRequestDetails ON StockRequest.OrderID = StockRequestDetails.OrderId) AS derivedtbl_1 ON ProductMaster.ProductID = derivedtbl_1.ProductID  where derivedtbl_1.OrderID=@OrderID">
                      <SelectParameters>
                      <asp:QueryStringParameter Name="OrderID" QueryStringField="OrderID" Type="Int32" />
                      </SelectParameters>
         </asp:SqlDataSource>--%>
         <br />
         <br />
         <div style="float:left; margin-top:20px;">
         <table class="Name2" >
         <tr>
         <td></td><td></td><td><%--<asp:Label ID="lblTotalBV" runat="server" Text=""></asp:Label>--%></td></tr>
             <tr> <td></td><td></td><td><%--<asp:Label ID="lblTotalPV" runat="server" Text=""></asp:Label>--%></td></tr>
             <tr> <td>Total Weight(gm):</td><td></td><td><asp:Label ID="lblTotalWeight" runat="server" Text=""></asp:Label></td></tr>
            <tr>  <td colspan="3"><%--(<asp:Label ID="lblMoneyInWord" runat="server" Text=""></asp:Label>)--%></td></tr>
            <tr>  <td></td><td></td><td><asp:Label ID="lblUplineDisID" runat="server" Text=""></asp:Label></td></tr>
        
         </table>
         </div>
         <div style="float:right; margin-top:20px;">
         <table class="Name2" >
         <tr>
         <td>Discount Value:</td><td></td><td><asp:Label ID="lblNetProductValue" runat="server" Text="0.00"></asp:Label></td></tr>
             <tr> <td>Total  Tax Vat Amount :</td><td></td><td><asp:Label ID="lblTotalTaxAmount" runat="server" Text="0.00"></asp:Label></td></tr>
             <tr>
                 <td>Total Tax Addvat Amount</td>
                 <td>&nbsp;</td>
                 <td><asp:Label ID="lblAddvat" runat="server" Text="0.00"></asp:Label></td>
             </tr>
             <tr> <td>Courier Charges:</td><td></td><td><asp:Label ID="lblCourierCharges" runat="server" Text="0.00"></asp:Label></td></tr>          
              <tr>
                  <%--<td>Net Price</td>
                  <td>
                      </td>
                  <td><asp:Label ID="lblnetprice" runat="server" Text=""></asp:Label></td>--%>
             </tr>
              <tr>  <td>Total Price:</td><td></td><td><asp:Label ID="lbltotalprice" runat="server" Text="0.00"></asp:Label></td></tr>
        
         </table>
         </div>
    </td></tr>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    </table>
    
    </td>
    
    </tr>

    <tr><td>
    <br />    <br />
   <span class="Name">  Note: . <br /> </span>
    ..............................................................................................................................................................................................................................................................................<br />    <br />
    <table width="100%" style="font-size:8pt;"><tr>
<td style="text-align:left;font-weight:bold">
Terms & Conditions :
</td>
<td style="text-align:right;" >
  FOR  Buland India®
</td>
</tr>
<tr>
<td style="text-align:left;">
1. All taxes as applicable.
</td>

<td style="text-align:right;" >

</td>
</tr>
<tr>
<td style="text-align:left;" >
2. Subject to -------------------- Jurisdiction.
</td>
<td style="text-align:right;"  >

</td>
</tr>
<tr>

<td class="style7" style="text-align:LEFT;">
<strong>Declaration:</strong> We declare that this invoice shows the actual price Of the goods described and that all particulars are true and correct.
</td>
<td style="text-align:right;">
<b>Authorised Signatory</b>
</td>
</tr>
<tr>
<td  colspan="2" align="center" style="font-weight:bold" >

</td>
</tr>
<tr>
<td colspan="2" align="center" style="font-weight:bold">
</td>
</tr>
<tr>
<td colspan="2" align="center" style="font-weight:bold">
* This is computer generated statement, hence signature is not required.

</td>
</tr></table>
<br />
    ..............................................................................................................................................................................................................................................................................<br />
    <span class="Name" style="padding-left:30px;">Registered Office : <span style="color: rgb(51, 51, 51); font-family: Raleway, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(0, 0, 0);">Buland India</span> Address : Gorakshani Goshala Road, Gumati No-13 Near Petrol Pump  Madhubani , Bihar - 847211</span>
    </td></tr>
    
    </table>


</asp:Panel>
    <br />
    <br />
    <center>
        <asp:Button runat="server" ID="PrintButton" Text="Print" 
            onclick="PrintButton_Click" />
    </center>
    <br />
  <br />
    <a href="ViewOrders.aspx">Back</a>
       
</asp:Content>
