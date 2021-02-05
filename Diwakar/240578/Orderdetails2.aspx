<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="Orderdetails2.aspx.cs" Inherits="GrowTogether._240578.Orderdetails2" %>
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
     #ContentPlaceHolder1_GridView1 th, #ContentPlaceHolder1_GridView1 td
     {
         padding:5px 0px!important;
         font-size:10px!important;
         width:30px!important;
     }
        
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
    <br />
<asp:Panel ID="Panel1" runat="server" Width="100%">


    <style>

      @media print {
     
            /*#ContentPlaceHolder1_GridView1 td
        {
            border:1px solid #333!important;
        }


             #ContentPlaceHolder1_GridView1 th
        {
           
            
            border:1px solid #333!important;
        }*/
             #ContentPlaceHolder1_GridView1 tr:first-child {
                border-bottom: 1px solid #333!important;
            }

            #ContentPlaceHolder1_GridView1 tr:last-child {
                border-top: 1px solid #333!important;
            }
        }

    </style>

    <table width="100%" cellspacing="0" cellpadding="0">
   <tr><td align="center" style="width:20px;">
      
       <asp:Image ID="Image1" ImageUrl="../img/logo.png" Width="100px" runat="server" /> </td></tr>

  <%--  <tr><td align="center" class="style9">Adress: . 
  </td></tr>--%>

          <tr>

<td align="center" style="text-align:center;font-weight:bolder;"  >
<span style="font-size:16px;">


<%--Diwakar Retail Ltd.--%><br />
    
   
     <span style="font-size:12px;"> www.diwakarretail.com</span>
    <br />
     <span style="font-size:12px;"> Email:diwakarretail2017@gmail.com
</span>
   <br /><br /><br />
</span>
</td>

</tr>
    <tr>

<td align="center" style="text-align:center;font-weight:bolder;"  >
<span style="font-size:16px;">

RETAIL INVOICE
</span>
     <br /><br /><br />
</td>

</tr>


    <tr><td>
    <table class="tblinv" width="100%" cellspacing="0" cellpadding="0">
    <tr><td valign="top" style="width:70%;">
    <table class="tblinv padd"  cellspacing="0" cellpadding="0">
    <tr><td valign="top" style="height:40px; font-size:12pt;text-align:left">Invoice To :
    <asp:Label ID="lblMemberID" runat="server" Text=""></asp:Label>
       <br />
       Name :<asp:Label ID="lblcustname" runat="server" Text=""></asp:Label> 
        <br />
        Address :<asp:Label ID="lblcustaddr" runat="server" Text=""></asp:Label>
        <br />
        <%--<asp:Label ID="lblFrenchiseID" runat="server" Text="FrenchiseID"></asp:Label>--%>
    </td></tr>
    
    
    </table></td>
    
    
    <td style="width:70%;"><table class="tblinv padd"  cellspacing="0" cellpadding="0"><tr>
        <td valign="top" style="width:70%; font-size:12pt;text-align:left">Invoice No. : <asp:Label ID="lblinvoiceno" runat="server" Text=""></asp:Label>
    <br />Invoice Dated : <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
   <%--  <br />TIN No : <asp:Label ID="lblTinNo" runat="server" Text="09376523067C"></asp:Label>--%>
      <br />GSTIN : <asp:Label ID="lblPanNo" runat="server" Text=" xxxxxxxxxxx "></asp:Label>
     <%--  <br />CIN No : <asp:Label ID="lblCinNo" runat="server" Text="12345678"></asp:Label></td></tr>--%>
    </table></td></tr></table>
    
    </td></tr>
    
    <tr>
    <td>
        <br />
        <br />
    <table class="tblinv padd1" cellspacing="0" cellpadding="0" width="100%">   
     <tr><td colspan="3" width="100%">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
GridLines="None" Width="100%" style="float:left; margin-top: 0px;" ShowFooter="True" 
             ShowHeaderWhenEmpty="True" EmptyDataText="No Payouts released." 
             onrowdatabound="GridView1_RowDataBound" BorderColor="#000333" BorderStyle="Solid" BorderWidth="1px" Font-Size="9px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
    
       <asp:TemplateField HeaderText="SNo" HeaderStyle-Width="5px">
    <ItemTemplate>
    <%#((GridViewRow)Container).RowIndex+1 %>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" Visible="false"/>
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName"  />
              <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />   
        <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="MRP" DataFormatString="{0:f0}"/>
         <asp:BoundField DataField="Unit Price" HeaderText="Distributor Price" SortExpression="Unit Price" DataFormatString="{0:f0}" />
        <asp:BoundField DataField="BV" HeaderText="Business Value" SortExpression="Business Value" DataFormatString="{0:f0}"/>
         <asp:BoundField DataField="Vat" HeaderText="VAT" SortExpression="Vat" DataFormatString="{0:f0}" Visible="false"/>
       
         
       <%-- <asp:BoundField DataField="Dis." HeaderText="Dis." SortExpression="Dis." DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15" /> --%>
                <%--<asp:BoundField DataField="VAT/CST%" HeaderText="VAT/CST%" SortExpression="VAT/CST%" DataFormatString="{0:f2}" />  --%>
         <%--<asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" DataFormatString="{0:f2}"/>--%>
          
         <asp:BoundField DataField="VAT/CST%" HeaderText="VAT Amount" SortExpression="VAT/CST%" DataFormatString="{0:f0}"  Visible="false"/>
        <asp:BoundField DataField="VAT/Additional" HeaderText="Add VAT" SortExpression="VAT/Additional" DataFormatString="{0:f0}" Visible="false"/>
       <asp:BoundField DataField="TotalVAT" HeaderText="Total VAT" SortExpression="TotalVAT" DataFormatString="{0:f0}" />
       <asp:BoundField DataField="TotalBV" HeaderText="Total Business Value" SortExpression="TotalBV" DataFormatString="{0:f0}" />
       <%-- <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP" DataFormatString="{0:f2}" />--%>
         <asp:BoundField DataField="Total Price" HeaderText="Total Distributor Price" SortExpression="Total Price" DataFormatString="{0:f0}" />
      
        
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <EmptyDataTemplate>
        No Rows Found!
    </EmptyDataTemplate>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" 
        HorizontalAlign="Center" />
<HeaderStyle BackColor="#1C5E55" Font-Bold="True" 
    ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#E3EAEB" 
    HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
    
</asp:GridView>
         


         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:conn %>" 
             SelectCommand="SELECT     ProductRepurchase.ProductCode Code, ProductRepurchase.ProductName,ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,ProductRepurchase.Vat, (((ProductRepurchase.Vat)))'TotalVAT',OrderDetails.TotalBV, ((ProductRepurchase.MRP*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.',  
OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*((ProductRepurchase.Vat)/100))'VAT/CST%',
                   (ProductRepurchase.MRP*OrderDetails.Qty)TotalMRP,    (OrderDetails.TotalDP ) 'Total Price'
FROM OrderDetails INNER JOIN
                      ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.OrderId=@OrderID ">
                      <SelectParameters>
                      <asp:QueryStringParameter Name="OrderID" QueryStringField="ID" Type="Int32" />
                         <%-- <asp:SessionParameter Name="usercode" SessionField="usercode" Type="String" />--%>
                      </SelectParameters>
         </asp:SqlDataSource>
       
         <div style="float:left; margin-top:-5px;">
         <table class="Name2" >
        <%-- <tr>
         <td></td><td></td><td>--%><%--<asp:Label ID="lblTotalBV" runat="server" Text=""></asp:Label>--%><%--</td></tr>--%>
             <%--<tr> <td></td><td></td><td>--%><%--<asp:Label ID="lblTotalPV" runat="server" Text=""></asp:Label>--%><%--</td></tr>--%>
             <%--<tr> <td>Total Weight(gm):</td><td></td><td><asp:Label ID="lblTotalWeight" runat="server" Text=""></asp:Label></td></tr>--%>
            <%--<tr>  <td colspan="3">--%><%--(<asp:Label ID="lblMoneyInWord" runat="server" Text="" Visible="false"></asp:Label>)--%><%--</td></tr>--%>
           <%-- <tr>  <td>Upline Distributor Id</td><td></td><td><asp:Label ID="lblUplineDisID" runat="server" Text=""></asp:Label></td></tr>--%>
        


             
         </table>
         </div>
         <div style="float:right; margin-top:-5px;">
         <table class="Name2" >
         <%--<tr>
         <td>Qty:</td><td></td><td><asp:Label ID="lblNetProductValue" runat="server" Text="0.00"></asp:Label></td></tr>--%>
             <%-- <tr> <td ><asp:Label ID="lblMoneyInWord" runat="server" Text="" Visible="false"></asp:Label></td></tr>
                    <tr> <td>Upline Distributor Id</td><td><asp:Label ID="lblUplineDisID" runat="server" Text="" Style="padding-left:289px;"></asp:Label></td></tr>
                    <tr><td>Pay Mode</td><td><asp:Label ID="lblpaymode" runat="server" Text="" Style="padding-left:289px;"></asp:Label></td></tr>
             <tr> <td>Total Tax Amount:</td><td></td><td><asp:Label ID="lblTotalTaxAmount" runat="server" Text="0.00"></asp:Label></td></tr>--%>
            <tr><td>

                <br />
                <br />
                </td></tr>
              <tr><td></td> <td style="text-align:left">Courier Charges:</td><td><asp:Label ID="lblCourierCharges" runat="server" Text="0.00"></asp:Label></td></tr>  
             <%-- <tr> <td>BV Discount Amount</td><td></td><td><asp:Label ID="bvdiscountamount" runat="server" Text="0.00"></asp:Label></td></tr>            --%>
          <%--  <tr>  <td>Net Payment (Including Tax and After deduct BV Discount Amount):</td><td></td><td>(Rs.)<asp:Label ID="lblTotalPayment" runat="server" Text="0.00"></asp:Label></td></tr>--%>
          <tr> <td></td> <td style="text-align:left">Total Amount Paid</td><td>Rs.<asp:Label ID="lblTotalPayment" runat="server" Text="0.00"></asp:Label></td></tr>
            <%-- <tr>
                 <td>Total Payment:</td>
                 <td>&nbsp;</td>
                 <td><asp:Label ID="Label2" runat="server" Text="0.00"></asp:Label></td>
             </tr>
        --%>
         </table>
         </div>
    </td></tr>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    </table>
    
    </td>
    
    </tr>
        <tr><td style="text-align:left;font-size:13px"><br /><br /><br /><span>VAT is 5% included in Distributor Price.</span><br /><br /><span>Total Amount to be Paid in words: </span><asp:Label ID="lblamountinword" runat="server" Text="0.00"></asp:Label></td></tr>
    <tr><td>
  
   
    <br />    <br />
    <table width="92%" style="font-size:8pt;"><tr>
<td style="text-align:left;font-weight:bold">
Terms & Conditions :
</td>
<td style="text-align:right;" >
  <%--  For RainSan Global--%>
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
2. Subject to Delhi Jurisdiction.
</td>
<td style="text-align:right;"  >

</td>
</tr>
<tr>

<td class="style7" style="text-align:LEFT;" colspan="2">
<strong>Declaration:</strong> We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.
</td>
<%--<td style="text-align:right;">--%>
<%--<b>Authorised Signatory</b>--%>
<%--</td>--%>
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
 This is computer generated statement, hence signature is not required.

</td>
</tr></table>
<br />
   <tr>
       <td style="text-align:center;">
           <span class="Name" style="font-size:10px;text-align:left">Registered Office :  Diwakar Retail Ltd. 26, UGF Unique Shopping Mall  Near GVM Girls College 
Murthal Road, Sonipat-131001   </span>
       </td>
       
   </tr>
    
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
    <a href="ViewReceipt1.aspx">Back</a>
       
</asp:Content>