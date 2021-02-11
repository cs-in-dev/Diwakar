<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true"
    CodeBehind="ViewOrders1.aspx.cs" Inherits="Rainsonglobal.user.ViewOrders1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<style type="text/css">
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
        .auto-style1 {
            width: 196px;
        }
    </style>--%>
    <script type="text/javascript">
        function clearSearchKey() {

            $('#<%=txtOrderID.ClientID%>').val('');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">
        <br />
        <center>
            <h1>Search Order</h1>
        </center>
        <br />
        <br />
        <center>
            <table>
              
                <tr>
                    <td align="right">Order Date From
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="date1" runat="server"></asp:TextBox>
                        <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1"></asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                            ValidationGroup="vg4" ForeColor="red" ControlToValidate="date1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">Order Date Till</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="date2" runat="server"></asp:TextBox>

                        <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2">
                        </asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                            ValidationGroup="vg4" ForeColor="red" ControlToValidate="date2"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        
                        <asp:Button ID="btnbydate" runat="server" Text="Search by Date" ValidationGroup="vg4"
                           onclick="btnbydate_Click" />
                    </td>
                </tr>

                <tr>
                    <td align="right">Order Id</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtOrderID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                            ValidationGroup="vg3" ForeColor="red" ControlToValidate="txtOrderID"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnbyorderid" runat="server" Text="Search by OrderID "
                            ValidationGroup="vg3" OnClick="btnbyorderid_Click"/>
                    </td>
                </tr>

                <%-- <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    CssClass="style7" onclick="btnSubmit_Click"  ValidationGroup="vg1"/>
                <span class="style6">&nbsp;</span></td>
        </tr>--%>
                <tr class="style6">
                    <td class="style12">&nbsp;</td>
                    <td style="text-align: left" class="auto-style1"></td>
                </tr>

                <%-- <tr>
            <td class="style2" colspan="2">
            <div style="width:100%; overflow:scroll">

            </div>
                
            </td>
        </tr>--%>
            </table>
        </center>

        <%-- <div>
        <center>
             <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click1" />
        </center>

    </div>--%>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True"
            DataKeyNames="OrderID"
            CellPadding="4"   ForeColor="#333333"
            Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound"
            EmptyDataText="No records found." ShowHeaderWhenEmpty="True" Style="width: 104%;
            border-collapse: collapse;"
            CssClass="table" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="SrNo.">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1%>
                    </ItemTemplate>
                    <ItemStyle Width="8%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Invoice No" SortExpression="OrderID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblId" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP"
                    DataFormatString="{0:F2}" />
                <%--   <asp:BoundField DataField="TotalPV" HeaderText="TotalPV" SortExpression="TotalPV" />--%>
                <asp:BoundField DataField="TotalDP" HeaderText="Total DP" SortExpression="TotalDP"
                    DataFormatString="{0:F2}" Visible="false" />
                <asp:BoundField DataField="TotalBV" HeaderText="Total BV" SortExpression="TotalBV"
                    DataFormatString="{0:F2}" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:TemplateField HeaderText="InvoiceType" SortExpression="InvoiceType" Visible="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InvoiceType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="InvoiceType" runat="server" Text='<%# Bind("InvoiceType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="sts" HeaderText="Status" SortExpression="sts"
                     />
                <%--<asp:CommandField SelectText="View" ShowSelectButton="True " HeaderText="Invoice" class="btn btn-xs btn-danger"/>--%>
                <asp:TemplateField HeaderText="Invoice">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="btn btn-xs btn-danger">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="true" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" HorizontalAlign="Center" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT Sum(OrderDetails.TotalMRP)TotalMRP, 
        Sum(OrderDetails.TotalPV)TotalPV, Sum(OrderDetails.TotalDP)TotalDP, Sum(OrderDetails.TotalBV)TotalBV,OrderDetails.OrderID, 
        OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date)Date, OrderMaster.PayStatus, OrderMaster.Status
         FROM OrderDetails INNER JOIN OrderMaster ON OrderDetails.OrderID = OrderMaster.OrderID where OrderMaster.MemberID=@UserCode group by OrderDetails.OrderID, OrderMaster.MemberID, OrderMaster.FrenchiseID, cast(OrderMaster.PaymentDate as date), OrderMaster.PayStatus, OrderMaster.Status order by cast(OrderMaster.PaymentDate as date) desc">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>--%>



        <br />
        <br />

        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" Width="100%" AutoGenerateColumns="False"
            DataKeyNames="OrderId"
            EmptyDataText="No Data Found" ShowFooter="True" ShowHeaderWhenEmpty="True" Visible="false">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <%--  <asp:BoundField DataField="BranchInvoiceNo" HeaderText="Invoice No." InsertVisible="False" 
                ReadOnly="True" SortExpression="BranchInvoiceNo" />--%>
                <asp:TemplateField HeaderText="Sr No.">
                    <ItemTemplate>
                        <%#Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">

                    <ItemTemplate>
                        <asp:Label ID="lblOid" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="TotalDP" HeaderText="TotalDP" SortExpression="TotalDP"
                    DataFormatString="{0:f0}" Visible="false" />
                <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV"
                    DataFormatString="{0:f0}" />
                <asp:BoundField DataField="MemberID" HeaderText="MemberID"
                    SortExpression="MemberID" />
                <asp:BoundField DataField="MemberName" HeaderText="MemberName"
                    SortExpression="MemberName" />
                <asp:BoundField DataField="sts" HeaderText="Status" SortExpression="sts" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <EmptyDataTemplate>
                <center>
                    No Data Found
                </center>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"
                HorizontalAlign="Left" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="right" />
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
        <br />
        <br />
        <div>
            <center>
                <%--<asp:ImageButton ID="ImageButton1" runat="server" 
               ImageUrl="~/user/images/excel_icon.gif" 
        onclick="ImageButton1_Click" />--%>
            </center>
        </div>

        <br />
        <br />
    </div>
</asp:Content>
