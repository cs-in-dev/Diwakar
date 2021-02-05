<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="SuperBusines.AdminOrderDetailsFranchise" %>
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
        
     #ContentPlaceHolder1_GridView1
     {
         width:105%!important;
     }
    </style>
     <style type="text/css">

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
    <style type="text/css">

        table
        {
            width:0px!important;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
<br />
<asp:Panel ID="Panel1" runat="server" Width="100%">


   
    
    <table>
   <tr><td align="center" style="width:20px;margin-left:0px!important;">
      
       <img src="../images/Anmol_logo.png" style="height: 88px; width: 129px"/> </td></tr>
    <tr><td align="center" class="style9">Adress: ##<br /> </td></tr>

    <tr>

<td align="center" style="text-align:center;font-weight:bolder;"  >
<span style="font-size:16px;">

RETAIL INVOICE
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
        <asp:Label ID="lblFrenchiseID" runat="server" Text="FrenchiseID"></asp:Label>
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
CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
GridLines="None" Width="100%" style="float:left; margin-top: 0px;" ShowFooter="True" 
             ShowHeaderWhenEmpty="True" EmptyDataText="No Payouts released." 
             onrowdatabound="GridView1_RowDataBound" Font-Size="9px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
    
       <asp:TemplateField HeaderText="SNo" HeaderStyle-Width="5px">
    <ItemTemplate>
    <%#((GridViewRow)Container).RowIndex+1 %>
    </ItemTemplate>
           <HeaderStyle Width="5px" />
    </asp:TemplateField>
    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" HeaderStyle-Width="5px" >
        <HeaderStyle Width="5px" />
        </asp:BoundField>
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" HeaderStyle-Width="5px" ControlStyle-Width="50px" ItemStyle-Width="50" >
              
        <ControlStyle Width="50px" />
        <HeaderStyle Width="5px" />
        <ItemStyle Width="50px" />
        </asp:BoundField>
              
        <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="MRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
         <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
         <asp:BoundField DataField="Unit Price" HeaderText="DP" SortExpression="Unit Price" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
        <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
        <asp:BoundField DataField="BV" HeaderText="BV" SortExpression="BV" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
          <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
          <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" HeaderStyle-Width="10px" >
         
        <HeaderStyle Width="10px" />
        </asp:BoundField>
         
        <asp:BoundField DataField="Dis." HeaderText="Dis." SortExpression="Dis." DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"> 
                <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
                <%--<asp:BoundField DataField="VAT/CST%" HeaderText="VAT/CST%" SortExpression="VAT/CST%" DataFormatString="{0:f2}" />  --%>
         <%--<asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" DataFormatString="{0:f2}"/>--%>
          
         <asp:BoundField DataField="VAT/CST%" HeaderText="VAT Amount" SortExpression="VAT/CST%" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
        <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
        <asp:BoundField DataField="VAT/Additional" HeaderText="Add VAT" SortExpression="VAT/Additional" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
       
        <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
       
       <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
        <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
        <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
         <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
         <asp:BoundField DataField="Total Price" HeaderText="Total DP" SortExpression="Total Price" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15">
      
        
        <ControlStyle Width="15px" />
        <FooterStyle Width="15px" />
        <HeaderStyle Width="15px" />
        <ItemStyle Width="15px" />
        </asp:BoundField>
      
        
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
         


         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:conn %>" 
             SelectCommand="SELECT     ProductRepurchase.ProductCode Code, ProductRepurchase.ProductName,ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, ((ProductRepurchase.MRP*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.',  
OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*((ProductRepurchase.Vat)/100))'VAT/CST%',(OrderDetails.TotalDP*(ProductRepurchase.AddVat/100)) AS 'VAT/Additional', 
                   (ProductRepurchase.MRP*OrderDetails.Qty)TotalMRP,    (OrderDetails.TotalDP ) 'Total Price'
FROM OrderDetails INNER JOIN
                      ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.BranchInvoiceNo=@OrderID and OrderMaster.FrenchiseID=@FrenchiseID">
                      <SelectParameters>
                      <asp:QueryStringParameter Name="OrderID" QueryStringField="BranchInvoiceNo" Type="Int32" />
                      <asp:QueryStringParameter Name="FrenchiseID" QueryStringField="FrenchiseID" Type="String" />
                         
                      </SelectParameters>
         </asp:SqlDataSource>
       
         <div style="float:left; margin-top:-5px; padding-right:205px;">
         <table class="Name2" >
         <tr>
         <td></td><td></td><td><%--<asp:Label ID="lblTotalBV" runat="server" Text=""></asp:Label>--%></td></tr>
             <tr> <td></td><td></td><td><%--<asp:Label ID="lblTotalPV" runat="server" Text=""></asp:Label>--%></td></tr>
             <%--<tr> <td>Total Weight(gm):</td><td></td><td><asp:Label ID="lblTotalWeight" runat="server" Text=""></asp:Label></td></tr>--%>
            <tr>  <td colspan="3">(<asp:Label ID="lblMoneyInWord" runat="server" Text="" Visible="false"></asp:Label>)</td></tr>
            <tr>  <td>Upline Distributor Id</td><td></td><td><asp:Label ID="lblUplineDisID" runat="server" Text=""></asp:Label></td></tr>
        
         </table>
         </div>
         <div style="float:right; margin-top:-5px;">
         <table class="Name2" >
         <%--<tr>
         <td>Qty:</td><td></td><td><asp:Label ID="lblNetProductValue" runat="server" Text="0.00"></asp:Label></td></tr>--%>
             <tr> <td>Total Tax Amount:</td><td></td><td><asp:Label ID="lblTotalTaxAmount" runat="server" Text="0.00"></asp:Label></td></tr>
             <tr> <td>Courier Charges:</td><td></td><td><asp:Label ID="lblCourierCharges" runat="server" Text="0.00"></asp:Label></td></tr>            
            <tr>  <td>Net Payment (Including Tax):</td><td></td><td><asp:Label ID="lblTotalPayment" runat="server" Text="0.00"></asp:Label></td></tr>
        
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

    <tr><td>
  
   <span class="Name"  style="border-bottom: 2px dotted #333; padding-bottom:5px;">  Note: . <br /> </span>
    <br />    <br />
    <table width="92%" style="font-size:8pt;"><tr>
<td style="text-align:left;font-weight:bold">
Terms & Conditions :
</td>
<td style="text-align:right;" >
    For Buland India
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
   
    <span class="Name" style="padding-left:30px;font-size:10px;">Registered Office :##</span>
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
