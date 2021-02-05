<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="ViewReceipt1.aspx.cs" Inherits="Rainsonglobal._240578.ViewReceipt1" %>
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
        .auto-style1 {
            width: 196px;
        }
    </style>
     <script type="text/javascript">
        function clearSearchKey() {
            $('#<%=txtMemberID.ClientID%>').val('');
             $('#<%=txtOrderID.ClientID%>').val('');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%">
    <br /><center><h1>Search Order</h1></center>


    <table class="style10">  
         <tr>
            <td class="style5" align="right">
                Order Status</td>
            <td style="text-align: left" class="auto-style1">
                <asp:DropDownList ID="DropDownList1" runat="server" style="width:171px;" onchange="clearSearchKey();">
                     <asp:ListItem Value="10">All</asp:ListItem>
                     <asp:ListItem Value="0">Pending</asp:ListItem>
                     <asp:ListItem Value="1">Dispatched</asp:ListItem>
                     <asp:ListItem Value="2">Delivered</asp:ListItem>
                     <asp:ListItem Value="3">Cancelled</asp:ListItem>
                </asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="*"  ValidationGroup="vg1" ForeColor="red" ControlToValidate="DropDownList1" InitialValue="-1"></asp:RequiredFieldValidator>--%>
            </td>
               <td>
                <asp:Button ID="btnstatus" runat="server" Text="Search by Status"  ValidationGroup="vg1" OnClick="btnstatus_Click"/>
            </td>
        </tr>     
        <tr>
            <td class="style5" align="right">
               Order Date From
            </td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7" autocomplete="off"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1" Format="yyyy-MM-dd"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="*"  ValidationGroup="vg4" ForeColor="red" ControlToValidate="date1"></asp:RequiredFieldValidator>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Order Date Till</td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" autocomplete="off" ></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2" Format="yyyy-MM-dd"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ErrorMessage="*"  ValidationGroup="vg4" ForeColor="red" ControlToValidate="date2"></asp:RequiredFieldValidator>
                   </td>
            <td>
               <%-- <asp:Button ID="btnbystatus" runat="server" Text="Search by Status"  ValidationGroup="vg4" OnClick="btnbystatus_Click"/>--%>
                <asp:Button ID="btnbydate" runat="server" Text="Search by Date"  ValidationGroup="vg4" OnClick="btnbydate_Click"/>
            </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Member Id</td>
            <td style="text-align: left" class="auto-style1">
                <asp:TextBox ID="txtMemberID" runat="server" CssClass="style7"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ErrorMessage="*"  ValidationGroup="vg2" ForeColor="red" ControlToValidate="txtMemberID"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="btnbymemberid" runat="server" Text="Search by MemberID" OnClick="btnbymemberid_Click" ValidationGroup="vg2"/>
            </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Order Id</td>
            <td style="text-align: left" class="auto-style1">
                <asp:TextBox ID="txtOrderID" runat="server" CssClass="style7"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ErrorMessage="*"  ValidationGroup="vg3" ForeColor="red" ControlToValidate="txtOrderID"></asp:RequiredFieldValidator>
            </td>
             <td>
                <asp:Button ID="btnbyorderid" runat="server" Text="Search by OrderID "  OnClick="btnbyorderid_Click" ValidationGroup="vg3"/>
            </td>
        </tr>


        <tr>
            <td class="style5" align="right">
                Product Code </td>
            <td style="text-align: left" class="auto-style1">
                <asp:TextBox ID="txtproductcode" runat="server" CssClass="style7"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="*"  ValidationGroup="vg31" ForeColor="red" ControlToValidate="txtproductcode"></asp:RequiredFieldValidator>
            </td>
             <td>
                <asp:Button ID="btnproductcode" runat="server" Text="Search by ProductCode "  OnClick="btnproductcode_Click" ValidationGroup="vg31"/>
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
            <td class="style12">
                &nbsp;</td>
            <td style="text-align: left" class="auto-style1">
                
            </td>
        </tr>

       <%-- <tr>
            <td class="style2" colspan="2">
            <div style="width:100%; overflow:scroll">

            </div>
                
            </td>
        </tr>--%>
    </table>


   <div>
        <center>
             <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click1" />
        </center>

    </div>
        <br />
        <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
        DataKeyNames="OrderId" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No Data Found" ShowFooter="True"  ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <%--  <asp:BoundField DataField="BranchInvoiceNo" HeaderText="Invoice No." InsertVisible="False" 
                ReadOnly="True" SortExpression="BranchInvoiceNo" />--%>
            <asp:TemplateField HeaderText="Sr No.">
                <ItemTemplate>
                   <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Order ID" SortExpression="OrderID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblOid" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">
               
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd MMM yyyy}" />
             <asp:BoundField DataField="TotalDP" HeaderText="TotalDP" SortExpression="TotalDP"  />
             <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV"  />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                SortExpression="MemberID" />
                 <asp:BoundField DataField="MemberName" HeaderText="MemberName" 
                SortExpression="MemberName" />
              <asp:BoundField DataField="sts" HeaderText="Status" SortExpression="sts"  />
            <asp:TemplateField>
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible='<%# Bind("stsvisible") %>'>Cancel</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField>
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Visible='<%# Bind("stsdisvisible") %>'>Dispatch</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButto2" runat="server" OnClick="LinkButto2_Click" Visible='<%# Bind("stsvisible") %>'>Deliver</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
           <%-- <asp:TemplateField HeaderText="Order ID" SortExpression="OrderID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>--%>
          
            <%-- <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="viewBill" runat="server" NavigateUrl='<% #Eval("ViewDetails") %>' Target="_blank">View</asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>--%>

            <asp:TemplateField HeaderText="View Invoice" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton11" runat="server" OnClick="LinkButton11_Click1" class="btn btn-xs btn-danger">View</asp:LinkButton>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>

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
   

        <br />
        <br />

        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
        DataKeyNames="OrderId" 
        EmptyDataText="No Data Found" ShowFooter="True"  ShowHeaderWhenEmpty="True" Visible="false">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <%--  <asp:BoundField DataField="BranchInvoiceNo" HeaderText="Invoice No." InsertVisible="False" 
                ReadOnly="True" SortExpression="BranchInvoiceNo" />--%>
            <asp:TemplateField HeaderText="Sr No.">
                <ItemTemplate>
                   <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
                </asp:TemplateField>
           <%-- <asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">
               
                <ItemTemplate>
                    <asp:Label ID="lblOid" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Order ID" SortExpression="OrderID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd MMM yyyy}" />
             <asp:BoundField DataField="TotalDP" HeaderText="TotalDP" SortExpression="TotalDP"  />
             <asp:BoundField DataField="TotalBV" HeaderText="TotalBV" SortExpression="TotalBV"  />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                SortExpression="MemberID" />
                 <asp:BoundField DataField="MemberName" HeaderText="MemberName" 
                SortExpression="MemberName" />
              <asp:BoundField DataField="sts" HeaderText="Status" SortExpression="sts"  />
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
