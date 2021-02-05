<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="SuperBusines.OrderDetailsFranchise" %>
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

    <table width="100%" cellspacing="0" cellpadding="0" style="border: #47d9bf;border-style:solid;">
   <tr><td align="center" style="width:20px;">
      
       <asp:Image ID="Image1"  ImageUrl="~/user/img/logo.png" Width="100px" runat="server" /> </td></tr>
    <tr><td align="center" class="style9">Adress: . 
  </td></tr>

    <tr>

<td align="center" style="text-align:center;font-weight:bolder;"  >
<span style="font-size:16px;">

RETAIL INVOICE
</span>
</td>

</tr>


    <tr><td>
    <table class="tblinv" width="100%" cellspacing="0" cellpadding="0">
    <tr><td valign="top" style="width:58%;">
    <table class="tblinv padd"  cellspacing="0" cellpadding="0">
    <tr><td valign="top" style="height:40px; font-size:12pt;">Invoice To :
    <asp:Label ID="lblMemberID" runat="server" Text=""></asp:Label>
       <br />
       Name :<asp:Label ID="lblcustname" runat="server" Text=""></asp:Label> 
        <br />
        Address :<asp:Label ID="lblcustaddr" runat="server" Text=""><span class="text">Head Office - B-118 , 119 <br />Manhattan Mall , Upper Ground Floor,<br> Sector -20A, Faridabad <br> Phone No. 0129-4080624</span></asp:Label>
        <br />
        <asp:Label ID="lblFrenchiseID" runat="server" Text="FrenchiseID"></asp:Label>
    </td></tr>
    
    
    </table></td>
    
    
    <td style="width:70%;"><table class="tblinv padd"  cellspacing="0" cellpadding="0"><tr>
        <td valign="top" style="width:70%; font-size:12pt;">Bill No. : <asp:Label ID="lblinvoiceno" runat="server" Text=""></asp:Label>
    <br />Dated : <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
   <%--  <br />TIN No : <asp:Label ID="lblTinNo" runat="server" Text="06921231181 "></asp:Label>--%>
      <br />PAN No : <asp:Label ID="lblPanNo" runat="server" Text=""></asp:Label>
      <%-- <br />CIN No : <asp:Label ID="lblCinNo" runat="server" Text="U52300HR2015PTC057302"></asp:Label>--%>
            <br /> Customer Care No : <asp:Label ID="Label2" runat="server" Text="7840000593"></asp:Label>
        </td></tr>
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
             onrowdatabound="GridView1_RowDataBound" BorderColor="#000333" BorderStyle="Solid" BorderWidth="1px" Font-Size="9px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
    
       <asp:TemplateField HeaderText="SNo" HeaderStyle-Width="5px">
    <ItemTemplate>
    <%#((GridViewRow)Container).RowIndex+1 %>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" HeaderStyle-Width="5px" />
        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" HeaderStyle-Width="5px" ControlStyle-Width="50px" ItemStyle-Width="50" />
              
        <asp:BoundField DataField="MRP" HeaderText="MRP" SortExpression="MRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
         <asp:BoundField DataField="Unit Price" HeaderText="DP" SortExpression="Unit Price" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
        <asp:BoundField DataField="BV" HeaderText="BV" SortExpression="BV" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
          <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" HeaderStyle-Width="10px" />
         
        <asp:BoundField DataField="Dis." HeaderText="Dis." SortExpression="Dis." DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15" /> 
                <%--<asp:BoundField DataField="VAT/CST%" HeaderText="VAT/CST%" SortExpression="VAT/CST%" DataFormatString="{0:f2}" />  --%>
         <%--<asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" DataFormatString="{0:f2}"/>--%>
          
         <asp:BoundField DataField="VAT/CST%" HeaderText="VAT Amount" SortExpression="VAT/CST%" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15" Visible="false"/>
        <asp:BoundField DataField="VAT/Additional" HeaderText="Add VAT" SortExpression="VAT/Additional" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15" Visible="false"/>
       
       <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
        <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
         <asp:BoundField DataField="Total Price" HeaderText="Total DP" SortExpression="Total Price" DataFormatString="{0:f2}" HeaderStyle-Width="15px" ItemStyle-Width="15" ControlStyle-Width="15" FooterStyle-width="15"/>
      
        
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
             SelectCommand="SELECT     ProductRepurchase.ProductCode Code, ProductRepurchase.ProductName,ProductRepurchase.MRP, OrderDetails.DP 'Unit Price', OrderDetails.Qty,OrderDetails.BV,OrderDetails.TotalBV, ((ProductRepurchase.MRP*OrderDetails.Qty)-(OrderDetails.TotalMRP )) 'Dis.',  
OrderDetails.TotalMRP Value, (OrderDetails.TotalMRP) 'Tax Amount', (OrderDetails.TotalDP*((ProductRepurchase.Vat)/100))'VAT/CST%',
                   (ProductRepurchase.MRP*OrderDetails.Qty)TotalMRP,    (OrderDetails.TotalDP ) 'Total Price'
FROM OrderDetails INNER JOIN
                      ProductRepurchase ON OrderDetails.ProductID = ProductRepurchase.ProductID INNER JOIN OrderMaster ON OrderMaster.OrderID = OrderDetails.OrderID where OrderMaster.OrderId=@OrderID and FrenchiseID = 'RSG201501'">
                      <SelectParameters>
                      <asp:QueryStringParameter Name="OrderID" QueryStringField="ID" Type="Int32" />
                         <%-- <asp:SessionParameter Name="usercode" SessionField="usercode" Type="String" />--%>
                      </SelectParameters>
         </asp:SqlDataSource>
       <div style="float:left; margin-top:-5px; margin-left: -9px;">
                 <table class="Name2" >
               
                    <tr> <td>Upline Distributor Id</td><td><asp:Label ID="lblUplineDisID" runat="server" Text="" Style="padding-left:289px;"></asp:Label></td></tr>
                    <tr><td>Pay Mode</td><td><asp:Label ID="lblpaymode" runat="server" Text="" Style="padding-left:289px;"></asp:Label></td></tr>
                      </table>
                    </div>

                    <asp:Panel ID="panelcheque" runat="server" Visible="false"><table  >
                     <tr><td><asp:Label ID="lblChecqueNo" runat="server" Text="ChecqueNo" Font-Bold="true"></asp:Label></td><td><asp:Label ID="ChecqueNo" runat="server" Text="" Style="padding-left:349px;"></asp:Label></td></tr>
                     <tr><td><asp:Label ID="Label8" runat="server" Text="ChecqueDate" Font-Bold="true"></asp:Label></td><td><asp:Label ID="ChecqueDate" runat="server" Text="" Style="padding-left:349px;"></asp:Label></td></tr>
                     <tr><td><asp:Label ID="Label9" runat="server" Text="Bank Name" Font-Bold="true"></asp:Label></td><td><asp:Label ID="chequebankname" runat="server" Text="" Style="padding-left:349px;"></asp:Label></td></tr>  </table></asp:Panel>
                     <asp:Panel ID="panelIMPS" runat="server" Visible="false"><table >
                     <tr><td><asp:Label ID="Label10" runat="server" Text="Refference NO"  Font-Bold="true"></asp:Label></td><td><asp:Label ID="IMPSReffNo" runat="server" Text="" Style="padding-left:349px;"></asp:Label></td></tr>
                     <tr><td><asp:Label ID="Label11" runat="server" Text="IMPS Date"  Font-Bold="true"></asp:Label></td><td><asp:Label ID="IMPSDate" runat="server" Text="" Style="padding-left:349px;"></asp:Label></td></tr>
                     <tr><td><asp:Label ID="Label12" runat="server" Text="IMPS Amount"  Font-Bold="true"></asp:Label></td><td><asp:Label ID="IMPSAmount" runat="server" Text="" Style="padding-left:349px;"></asp:Label></td></tr>  </table></asp:Panel>
               
                 <div style="float:left; margin-top:-5px;">
                 <table class="Name2" >
                     <tr> <td>Total Tax Amount:</td><td></td><td><asp:Label ID="lblTotalTaxAmount" runat="server" Text="0.00"></asp:Label></td></tr>
                     <tr> <td>Courier Charges:</td><td></td><td><asp:Label ID="lblCourierCharges" runat="server" Text="0.00"></asp:Label></td></tr>  
                      <tr> <td>BV Discount Amount</td><td></td><td><asp:Label ID="bvdiscountamount" runat="server" Text="0.00"></asp:Label></td></tr>            
                    <tr>  <td>Net Payment (Including Tax and After deduct BV Discount Amount):</td><td></td><td>(?)<asp:Label ID="lblTotalPayment" runat="server" Text="0.00"></asp:Label></td></tr>
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
    For Diwakar Retail Ltd.
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
2. Subject to Haryana Jurisdiction.
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
   
    <span class="Name" style="padding-left:30px;font-size:10px;">Registered Office : </span>
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
