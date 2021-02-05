<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="ViewDispatchDetails.aspx.cs" Inherits="Rainsonglobal._240578.ViewDispatchDetails" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />

    <b><span style="text-align: center; font-size: 18px;">Dispatch Details</span></b>

    <br />
    <br />

    <center>

         <br />
         <table class="style10">  
              
        <tr>
            <td class="style5" align="right">
                Date From
            </td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="date1"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="*"  ValidationGroup="vg1" ForeColor="red" ControlToValidate="date1"></asp:RequiredFieldValidator>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Date Till</td>
            <td style="text-align: left" class="auto-style1">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" ></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="date2"></asp:CalendarExtender>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ErrorMessage="*"  ValidationGroup="vg1" ForeColor="red" ControlToValidate="date2"></asp:RequiredFieldValidator>
                   </td>
            <td>
                <asp:Button ID="btnbyDate" runat="server" Text="Search by Date"  ValidationGroup="vg1" OnClick="btnbyDate_Click"/>
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
        <br /><div style="width:100%">
        <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" AutoGenerateColumns="False"  
            ShowFooter="True"  AllowSorting="True"  ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Sr No.">
                <ItemTemplate>
                   <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
                </asp:TemplateField>
                 <asp:BoundField DataField="OrderID" HeaderText="Order ID" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                    SortExpression="MemberID" />
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Date" HeaderText="Order Date" DataFormatString="{0:dd MMM yyyy}"
                    SortExpression="Date" />
                <asp:BoundField DataField="DispatchDate" HeaderText="Dispatch Date"  SortExpression="DispatchDate" DataFormatString="{0:dd MMM yyyy}"/>
               
                <asp:BoundField DataField="TrackingCode" HeaderText="Tracking Code" 
                    SortExpression="TrackingCode" />
                <asp:BoundField DataField="CourierCompanyName" HeaderText="Courier Company Name" 
                    SortExpression="CourierCompanyName" />
                
                <asp:BoundField DataField="Paymentmode" HeaderText="Payment mode" SortExpression="Paymentmode"/>
                
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:F0}"/>
                <asp:BoundField DataField="Referencenumber" HeaderText="Reference Number" SortExpression="Referencenumber" />

                <asp:BoundField DataField="ChequeDate" HeaderText="Cheque Date" 
                    SortExpression="ChequeDate"  DataFormatString="{0:dd MMM yyyy}"/>
                <asp:BoundField DataField="ChequeNo" HeaderText="Cheque No" 
                    SortExpression="ChequeNo" />
                
               
                
               
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
            <center>
                No Data Found
                </center>
            </EmptyDataTemplate>
          
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
            <RowStyle BackColor="#F7F6F3" HorizontalAlign="Left" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            </div>
    </center>
     <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:conn %>" 
                  SelectCommand="SELECT * from ordermaster where status=1">
              </asp:SqlDataSource>--%>
</asp:Content>
