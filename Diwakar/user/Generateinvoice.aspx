
<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="Generateinvoice.aspx.cs" Inherits="peopleshop._User.Generateinvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 20px;
        }
        .style5
        {
            font-size: medium;
            font-weight: bold;
            height: 32px;
        }
        .style6
        {
            font-size: small;
        }
        .style7
        {
            font-size: medium;
            color: #000000;
            font-weight: bold;
        }
        .style8
        {
            padding: 1px;
            font-size: small;
            border-left-color: #A0A0A0;
            border-right-color: #C0C0C0;
            border-top-color: #A0A0A0;
            border-bottom-color: #C0C0C0;
            font-weight: bold;
        }
        .style10
        {
            font-size: medium;
            color: #FF0000;
        }
        .style11
        {
            height: 24px;
        }
        .style9
        {
            font-size: small;
            color: #000000;
            width: 111px;
            font-weight: bold;
        }
        .style12
        {
            width: 669px;
        }
        .style13
        {
            width: 111px;
        }
        .style15
        {
            font-size: small;
            width: 111px;
        }
        .style20
        {
            width: 112px;
        }
        .style21
        {
            color: #000000;
        }
        .style22
        {
            font-size: small;
            height: 32px;
        }
        .style23
        {
            height: 59px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="style2">
        <tr>
            <td colspan="2" align="center" class="style10">
                Performa Invoice</td>
        </tr>
       <%-- <tr>
            <td class="style9">
                Enter Invoice Number</td>
            <td align="left">
                <asp:TextBox ID="txtinvoice" runat="server"></asp:TextBox>
            </td>
        </tr>--%>
        <%--<tr>
            <td>
                &nbsp;</td>
            <td align="left">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
                    Text="Proceed" />
            </td>
        </tr>--%>
    </table>

    <asp:Panel ID="Panel2" runat="server">

        <div style="overflow:scroll; width:675px;">

    <table class="style2" >
        <tr>
            <td rowspan="3" >
                <asp:Image ID="Image1" runat="server" Height="100px" 
                    ImageUrl="~/Data/img/logo1.png" Width="200px" />
            </td>
            <td colspan="3" class="style5" align="center" >
                AMAZE WELLNESS MARKETING PVT. LTD.</td>
            <td align="right" class="style22">
               <%-- TIN:07576938003--%></td>
        </tr>
       <%-- <tr>
            <td colspan="3" class="style6" align="center" >
                SU-167, 1st Floor, Pitampura<br /> New Delhi - 110034</td>
          
        </tr>--%>
        <%--<tr>
            <td colspan="3" align="center">
                Tel. : 8130693306, 011-27342371 <br /> Email: info@amazeindian.in, www.amazeindian.in
                <br />
                CIN:U74120UP2014PTC065183 v</td>
            
        </tr>--%>
        <tr>
            <td colspan="3">
                &nbsp;</td>
            <td align="right" colspan="2">
                </td>
        </tr>
        <tr>
            <td colspan="5" align="left" class="style6">
                <table class="style12">
                    <tr>
                        <td align="left" class="style9" style="display:none;">
                            <b>Invoice No:</b></td>
                        <td align="left" class="style13" style="display:none;">
                            <b>
                            <asp:Label ID="lblinvoice" runat="server" CssClass="style21" 
                                style="font-size: small; "></asp:Label>
                            </b>
                        </td>
                        <td align="left" class="style13">
                            <b><span class="style21">Date:</span></b></td>
                        <td align="left" class="style15">
                            <span class="style21">
                            <asp:Label ID="lbldate" runat="server" style="font-size: small"></asp:Label>
                            </span>
                        </td>
                        <td align="left" class="style13">
                            <span class="style21"><strong>User Name:</strong></span></td>
                        <td align="left" class="style20">
                            <asp:Label ID="lblusername" runat="server" style="font-size: small"></asp:Label>
                            </span></b>
                            </span></b>
                            </span></b>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style9">
                            <strong>Payment Status:</strong></td>
                        <td align="left" class="style15">
                            <b>
                            <asp:Label ID="lblStatus" runat="server" CssClass="style21" 
                                style="font-size: small; "></asp:Label>
                            </b>
                        </td>
                        <td align="left" class="style13">
                            <b><span class="style21">Distributor ID:</span></b></td>
                        <td align="left" class="style13">
                            <span class="style21">
                            <asp:Label ID="lblcode" runat="server" style="font-size: small"></asp:Label>
                            </span></td>
                        <td align="left" class="style15" style="display:none;">
                            <span class="style21"><strong>Address:</strong></span></td>
                        <td align="left" class="style20" style="display:none;">
                           
                            <asp:Label ID="lbladd" runat="server" CssClass="style21" 
                                style="font-size: small; "></asp:Label>
                            <span class="style21">
                        </td>
                    </tr>
                    <%--<tr>
                        <td align="left" class="style9">
                         <strong>  Cadre:</strong></span></td>
                        <td align="left" class="style9">
                            <asp:Label ID="lblCadre" runat="server" Text="Cadre"></asp:Label></td>
                        <td class="style13">
                         <span class="style21">REStatus:</span></td>
                        <td class="style13">
                            <asp:Label ID="lblStatusss" runat="server" Text="Status"></asp:Label></td>
                        <td class="style13">
                         <span class="style21">  Rank:</span></td>
                        <td class="style13">
                            <asp:Label ID="lblRank" runat="server" Text="Rank"></asp:Label></td>
                    </tr>--%>
                    <tr>
                        <td class="style13">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center" width="60%">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                    GridLines="None" onrowdatabound="GridView1_RowDataBound" ShowFooter="True" 
                    Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="S.No.">
                            <ItemTemplate>
                                <asp:Label ID="lblSNo" runat="server" Text="<%# (Container.DataItemIndex)+1 %>"> 
                         </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="ProductCode" HeaderText="Product Code" 
                            SortExpression="ProductCode" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" 
                            SortExpression="ProductName" />
                        
                        <asp:BoundField DataField="Price" HeaderText="DP" DataFormatString="{0:F2}" SortExpression="Price" />
                        <asp:BoundField DataField="PV" HeaderText="PV" DataFormatString="{0:F2}" SortExpression="PV" />
                        <asp:BoundField DataField="Quantity" HeaderText="Qty" DataFormatString="{0:F2}" SortExpression="Quantity" />
                        <asp:BoundField DataField="TotalPV" HeaderText="TotalPV" DataFormatString="{0:F2}" SortExpression="TotalPV" />
                        <asp:BoundField DataField="NetPrice" HeaderText="NetAmount" DataFormatString="{0:F2}" SortExpression="NetPrice" />
                    
                             </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#47D9BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand=" SELECT ProductRepurchase.ProductName, Round(DetailProdPurRequest.sMRP,2) Price, Round(DetailProdPurRequest.sBV,2) PV , DetailProdPurRequest.Quantity, ProductRepurchase.ProductCode, DetailProdPurRequest.sTotBV as TotalPV,(DetailProdPurRequest.Quantity*DetailProdPurRequest.sMRP)  NetPrice,dbo.MyRankPercString(DetailProdPurRequest.MemberId) as Cadre,dbo.MyRanks(DetailProdPurRequest.MemberId) as Rank,dbo.GetStatus(DetailProdPurRequest.MemberId) as Status FROM DetailProdPurRequest INNER JOIN ProductRepurchase ON DetailProdPurRequest.ProductCode = ProductRepurchase.ProductCode where DetailProdPurRequest.orderid in(select OrderID from MasterProdPurRequest where orderid=@Invoice)

">
                    <SelectParameters>
                        <asp:SessionParameter Name="Invoice" SessionField="ordid" />
                        <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style11" colspan="5" style="border-bottom:1px solid;">
                </td>
        </tr>
      <%--  <tr style="border-top:1px solid;">
            <td colspan="2" align="left" class="style3">
                VAT ClASS</td>
            <td align="left" class="style3" colspan="2">
                Taxable Amount</td>
            <td align="left" class="style3" colspan="2">
                VAT Amount</td>
            <td align="left" class="style3" colspan="2">
                Net Amount</td>
            <td class="style12">
                </td>
            <td class="style3">
            </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                VAT 5.25%</td>
            <td align="left" colspan="2">
                <asp:Label ID="lbltax5" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="left" colspan="2">
                <asp:Label ID="lblvat5" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="left" colspan="2">
                <asp:Label ID="lblnetprice5" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="left">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" colspan="2" class="style13">
                VAT 13.25%</td>
            <td align="left" colspan="2" class="style13">
                <asp:Label ID="lbltax13" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="left" colspan="2" class="style13">
                <asp:Label ID="lblvat13" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="left" colspan="2" class="style13">
                <asp:Label ID="lblnetprice13" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="left" class="style13">
                </td>
            <td class="style13">
                </td>
            <td class="style13">
                </td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                VAT 4.25%</td>
            <td align="left" colspan="2">
                <asp:Label ID="lbltax4" runat="server"></asp:Label>
            </td>
            <td align="left" colspan="2">
                <asp:Label ID="lblvat4" runat="server"></asp:Label>
            </td>
            <td align="left" colspan="2">
                <asp:Label ID="netprice4" runat="server"></asp:Label>
            </td>
            <td align="left">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>--%>
        <%--<tr>
            <td align="left" colspan="2" style="border-top:1px solid;">
                E &amp; O.E.: Subject to Delhi Jurisdiction Only</td>
            <td colspan="3" style="text-align: right; border-top-style: solid; border-top-color: inherit; border-top-width: 1px;">
                For Amaze wellness Marketing Pvt. Ltd.</td>
        </tr>--%>
        <%--<tr>
            <td colspan="5" style="border-top:1px solid;">
                &nbsp;</td>
        </tr>--%>
        <%--<tr >
            <td colspan="5">
                &nbsp;</td>
        </tr>
       --%>
    </table>

            </div>
    </asp:Panel>
    <table>
    <tr>
            <td class="style3">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Print" 
                    style="background-color: #3366FF" ForeColor="White" />
            </td>
        </tr>
    </table>
</asp:Content>
