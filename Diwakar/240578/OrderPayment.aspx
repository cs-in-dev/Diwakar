<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="OrderPayment.aspx.cs" Inherits="Rainsonglobal._240578.OrderPayment" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div>
            <h1>Order Payment Details</h1>
        </div>
    </center>
    <br />
    <br />

    <table class="style10">  
         <tr>
            <td class="style5" align="right">
                Payment Mode</td>
            <td style="text-align: left" class="auto-style1">
                <asp:DropDownList ID="DropDownList1" runat="server" style="width:171px;" onchange="clearSearchKey();">
                     <asp:ListItem Value="All">All</asp:ListItem>
                     <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
            <asp:ListItem Value="IMPS">IMPS</asp:ListItem>
                      <asp:ListItem Value="Repurchase Wallet">Repurchase Wallet</asp:ListItem>
           
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="*"  ValidationGroup="vg4" ForeColor="red" ControlToValidate="DropDownList1" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
             <td>
                                 <asp:Button ID="btnsearchbypaymentmode" runat="server" Text="Search by Payment Mode"  ValidationGroup="vg4" OnClick="btnsearchbypaymentmode_Click"/>
            
             </td>
        </tr>     
        <tr>
            <td class="style5" align="right">
                Order Date From
            </td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7" autocomplete="off"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="*"  ValidationGroup="vg1" ForeColor="red" ControlToValidate="date1"></asp:RequiredFieldValidator>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Order Date Till</td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" autocomplete="off"></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ErrorMessage="*"  ValidationGroup="vg1" ForeColor="red" ControlToValidate="date2"></asp:RequiredFieldValidator>
                   </td>
            <td>
                <asp:Button ID="btnbyDate" runat="server" Text="Search by Date"  ValidationGroup="vg1" OnClick="btnbyDate_Click"/>
            </td>
        </tr>
         <tr>
            <td class="style5" align="right">
                Payment Date From
            </td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="txtpaymentdatefrom" runat="server" CssClass="style7" autocomplete="off"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CalendarExtender2" TargetControlID="txtpaymentdatefrom"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  runat="server" ErrorMessage="*"  ValidationGroup="vg5" ForeColor="red" ControlToValidate="txtpaymentdatefrom"></asp:RequiredFieldValidator>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Payment Date Till</td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="txtpaymentdatetill" runat="server" CssClass="style7" autocomplete="off"></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender3" TargetControlID="txtpaymentdatetill"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  runat="server" ErrorMessage="*"  ValidationGroup="vg5" ForeColor="red" ControlToValidate="txtpaymentdatetill"></asp:RequiredFieldValidator>
                   </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Search by Payment Date"  ValidationGroup="vg5" OnClick="Button1_Click"/>
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
                    ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click" />
        </center>

    </div>
    <div style="width:100%;">
   <%-- <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%" HeaderStyle-HorizontalAlign="Left" AllowPaging="true" PageSize="100" OnPageIndexChanging="GridView1_PageIndexChanging">--%>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%" HeaderStyle-HorizontalAlign="Left">
        <Columns>
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
             <asp:TemplateField HeaderText="MemberID" SortExpression="OrderID">
               
                <ItemTemplate>
                    <asp:Label ID="lblMemberID" runat="server" Text='<%# Bind("MemberID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        <%--<asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"  />--%>
        <asp:BoundField DataField="Date" HeaderText="Order Date" SortExpression="Date"/>
           
         <%--<asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID"  />--%>
         <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName" />
              
        <asp:BoundField DataField="Paymentmode" HeaderText="Paymentmode" SortExpression="Paymentmode"   />
               <asp:BoundField DataField="Referencenumber" HeaderText="ReferenceNumber" SortExpression="Referencenumber"   />
             <asp:BoundField DataField="ImpsDate" HeaderText="IMPS Date" SortExpression="ImpsDate"   />
        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount"   DataFormatString="{0:f0}"/>
             <asp:BoundField DataField="ChequeNo" HeaderText="Cheque No" SortExpression="ChequeNo"   />
             <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" SortExpression="PaymentDate"/>
             <asp:BoundField DataField="sts" HeaderText="Order Status" SortExpression="sts"   />
             <asp:BoundField DataField="PayStatus" HeaderText="Payment Status" SortExpression="PayStatus"   />
        <asp:BoundField DataField="ChequeDate" HeaderText="Cheque Date" SortExpression="ChequeDate"/>
           <asp:TemplateField>
               <HeaderTemplate>Action</HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButto2" runat="server" OnClick="LinkButto2_Click" Visible='<%# Bind("stsvisible") %>'>Pay</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField>
               <HeaderTemplate>Delete Order</HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButto3" runat="server" OnClick="LinkButto3_Click" Visible='<%# Bind("stsvisible1") %>'>Delete</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
        
        </Columns>
        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

        <EditRowStyle BackColor="#999999"></EditRowStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>




        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%" HeaderStyle-HorizontalAlign="Left" AllowPaging="true" PageSize="100">
        <Columns>
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
        <%--<asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"  />--%>
        <asp:BoundField DataField="Date" HeaderText="Order Date" SortExpression="Date"   DataFormatString="{0:dd MMM yyyy}"/>
           
         <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID"  />
         <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName" />
              
        <asp:BoundField DataField="Paymentmode" HeaderText="Paymentmode" SortExpression="Paymentmode"   />
            <asp:BoundField DataField="Referencenumber" HeaderText="ReferenceNumber" SortExpression="Referencenumber"   />
             <asp:BoundField DataField="ImpsDate" HeaderText="IMPS Date" SortExpression="ImpsDate"   />
        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount"   DataFormatString="{0:f0}"/>
             <asp:BoundField DataField="ChequeNo" HeaderText="Cheque No" SortExpression="ChequeNo"   />
             <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" SortExpression="PaymentDate"   DataFormatString="{0:dd MMM yyyy}"/>
             <asp:BoundField DataField="PayStatus" HeaderText="Payment Status" SortExpression="PayStatus"   />
        <asp:BoundField DataField="ChequeDate" HeaderText="Cheque Date" SortExpression="ChequeDate"   DataFormatString="{0:dd MMM yyyy}"/>
        </Columns>
        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

        <EditRowStyle BackColor="#999999"></EditRowStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
   <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:conn %>" 
             SelectCommand="SELECT OrderID,Date,MemberID,Paymentmode,ChequeNo,ChequeDate,(select username from tblmembermaster where usercode=MemberID) as Name,Amount  from ordermaster order by orderid desc  ">
                      
         </asp:SqlDataSource>--%>
        </div>
</asp:Content>
