<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="ProductInvoice.aspx.cs" Inherits="Bigshop._240578.ProductInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style7
        {
            width: 311px;
        }
        .style9
        {
            height: 19px;
        }
        </style>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="submenu" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid_7">
<div style="text-align:center">
<div>
<asp:Button ID="btnPrint" runat="server" Text="Print" onclick="btnPrint_Click" />
</div>
<asp:Panel ID="pnl1" runat="server">
<table style="width:100%; border:1px solid; background-color:White;"  >
<tr >
<td align="right" style="font-weight: bold">Retail Invoice</td></tr>
<tr>
<td  >
<table style="width:100%; ">


<tr>

<td colspan="2" style="text-align:left;font-weight:bolder;"  >
<span style="font-size:19px; ">
Star Line Networking Pvt.Ltd.

</span>
</td>

</tr>
<tr >
<td colspan="2" align="left" style="font-weight:bold">
Regd.No.
</td>
</tr>
<tr>
<td align="left" style="font-weight:bold">TIN: </td></tr>
<tr >
<td>
    &nbsp;</td>
<td>
    &nbsp;</td>
</tr>
</table>
</td>
<td style="text-align:right;" >
<table width="100%" >
<tr>
<td colspan="2" style="font-weight:bold;text-align:right;">
PH: 016-52216612 
</td></tr>
<tr >
<td colspan="2" style="text-align:right;font-weight:bold;">
InvoiceNo:
    <asp:Label ID="lblinvno" runat="server" Text="Label"></asp:Label>
</td>
</tr>
<tr>
<td  colspan="2" style="text-align:right;font-weight:bold;" >
Date:
<asp:Label ID="lblDate" runat="server"></asp:Label>
</td>
</tr>
</table>

</td>
</tr>
<tr>
<td colspan="2">
<hr style="color:black; font-size:2px;" />
</td>
</tr>
<tr>
<td  style="text-align:left;" colspan="2">
<b>Invoice To:</b>

</td>
</tr>
<tr>
<td style="text-align:left;font-weight:bold" colspan="2">
<asp:Label ID="lblName" runat="server"></asp:Label>
</td>
</tr>

<tr>
<td style="text-align:left;" colspan="2" class="style9">
<asp:Label ID="lblid" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td style="text-align:left;" colspan="2">
<asp:Label ID="lblmob" runat="server"></asp:Label>
</td>
</tr>
<%--<tr>
<td style="text-align:left;"  colspan="2">
<asp:Label ID="lblPinCode" runat="server"></asp:Label>
</td>
</tr>--%>
<tr>
<td style="text-align:left;" colspan="2">
India
</td>
</tr>

<tr >
<td colspan="2">
<table width="100%" style="border:1px solid;" align="center" >
<tr>
<td style="border:1px solid;">
Item
</td>
<td style="border:1px solid;">
Description
</td>
<td style="border:1px solid;">
Qty
</td>
<td style="border:1px solid;">
CV
</td>
<td style="border:1px solid;">
Total
</td>
</tr>





<tr style="height:150px;">
<td style="border-style: solid; border-color: inherit; border-width: 1px; width:5%;" >

1
</td>
    <td style="border-style: solid; border-color: inherit; border-width: 1px;width:40%;" 
        >
<asp:Label ID="ProductName" Text="Silver Article" runat="server"></asp:Label>
</td>
<td style="border-style: solid; border-color: inherit; border-width: 1px; width:10%;">
    <asp:Label ID="lblqnty" runat="server" Text="Label"></asp:Label>
</td>
<td style="border-style: solid; border-color: inherit; border-width: 1px; width:10%;" 
        >
<asp:Label ID="lblAmount" runat="server"></asp:Label>
</td>
<td style="border-style: solid; border-color: inherit; border-width: 1px; width:10%;" 
        >
<asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
</td>
</tr>


<tr>
<td style="border-style: solid; border-color: inherit; border-width: 1px; " 
        >

</td>
<%--<td style="border-style: solid; border-color: inherit;  font-weight:bold; border-width: 1px;" 
        >
        Including VAT 1.05% Grand Total
</td>--%>
<td style="border-style: solid; border-color: inherit; border-width: 1px;" 
        >
</td>
<td style="border-style: solid;font-weight:bold; border-color: inherit; border-width: 1px;" 
        >

    Net Amount</td>
<td style="border-style: solid; border-color: inherit; border-width: 1px;" 
>
        <b>
<asp:Label ID="Amount" runat="server"></asp:Label>
</b>

</td>

</tr>
</table>
</td>

</tr>
<tr>
<td style="text-align:left;">
<b>
Address:
</b>
</td>


</tr>
<tr>
<td style="text-align:left;font-weight:bold">
Star Line Networking Pvt.Ltd
</td>
<td class="style7" align="right" style="font-weight:bold;">
For Star Line Networking Pvt.Ltd<sup>&#174;</sup>
</td>
</tr>
<tr>
<td style="text-align:left;font-weight:bold;">
Opposite Dashmesh Public School,
</td>
<td style="text-align:right;" >
<b>Web: www.slnetworking.com/</b>
</td>
</tr>
<tr>
<td style="text-align:left;font-weight:bold;" >

First Floor, New Court Road ,

</td>
<td style="text-align:right;"  >
<b></b>
</td>
</tr>
<tr>
<td style="text-align:left;font-weight:bold;" >
Mansa - 151505,
Punjab,India
</td>
<td class="style7">

</td>
</tr>
<tr>
<td  colspan="2" align="center" style="font-weight:bold" >
Conditions:
</td>
</tr>
<tr>
<td colspan="2" align="center" style="font-weight:bold">
1.For Any issues Jurisdiction will be held on Mansa.
</td>
</tr>
<tr>
<td colspan="2" align="center" style="font-weight:bold">
2.Once Goods sold will not be returned.
</td>
</tr>
</table>
</asp:Panel>

    </div>
    </div>
    <%--<div class="grid_5">
        <uc1:InformationBlock ID="InformationBlock1" runat="server" />
    </div>--%>
</asp:Content>
