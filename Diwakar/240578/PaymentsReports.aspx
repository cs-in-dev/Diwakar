<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="PaymentsReports.aspx.cs" Inherits="GOG.Admin.PaymentsReports" %>
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
        .style3
        {
            width: 487px;
        }
        .style5
        {
            /*width: 487px;*/
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
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<h2><center><strong> Payments</strong></center></h2><br />--%>
<%--<asp:Label runat="server" ID="Label1" Text="" ForeColor="Red"></asp:Label><br />--%>

    <table class="style1" >
        <center>
       <%-- <span class="style9"><strong>Payments Reports</strong></span><strong> </strong>
        
            <tr>
     <td>
            Year:<asp:DropDownList ID="ddlYear" runat="server" onchange = "PopulateDays()" />
            Month:<asp:DropDownList ID="ddlMonth" runat="server" onchange = "PopulateDays()" />
            Day:<asp:DropDownList ID="ddlDay" runat="server" />
         </td>
                </tr>--%>
             <fieldset style="width:500px">
    <legend>Select Date</legend>
                 Payout Date: <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="date" DataValueField="date" ></asp:DropDownList> 
           
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="select distinct FORMAT(dateoftransaction,'d','af') as date from accountmaster where txntype =6 order by FORMAT(dateoftransaction,'d','af') "></asp:SqlDataSource>
    </fieldset>
          
<br /> 

    
        <%--<tr>
            <td class="style5" align="right">
               Payments Date From
            </td>
            <td style="text-align: left">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="style7"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="vg1" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                      <asp:CalendarExtender runat="server" ID="CE1"   TargetControlID="TextBox1"></asp:CalendarExtender>
                      </td>
        </tr>--%>
       <%-- <tr>
            <td class="style5" align="right">
             Payments Date Till</td>
            <td style="text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="style7" >
                       </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="vg1" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                          <asp:CalendarExtender runat="server" ID="CalendarExtender1"   TargetControlID="TextBox2"></asp:CalendarExtender>

                   </td>
        </tr>--%>
        <%--<tr>
            <td class="style5" align="right">
                Member Id</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="style7"></asp:TextBox>
            </td>
        </tr>
       --%>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server"  Text="Submit" 
                    CssClass="style7" OnClick="Button1_Click" ValidationGroup="vg1" />
                <span class="style6">&nbsp;</span></td>
        </tr>
        <tr class="style6">
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click" />
            </td>
        </tr>
        </table>

<asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="50" AllowSorting="true"
    GridLines="None" style="text-align: center" Width="100%" 
    ForeColor="#333333">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="S.No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %></ItemTemplate>
            </asp:TemplateField>
         <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                    SortExpression="MemberID" />
        <asp:BoundField DataField="Name" HeaderText="Member Name" 
                    SortExpression="Name" />
        <asp:BoundField DataField="Date" HeaderText="Date" 
                    SortExpression="Date" />
        <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                    SortExpression="Particulars" />
        <asp:BoundField DataField="Amount" HeaderText="Amount"
                    SortExpression="Amount" ReadOnly="True" DataFormatString="{0:f2}" />
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT MemberID,DateofTransaction AS Date, Particulars, Debit AS Amount FROM AccountMaster WHERE (TxnType = 6) ">
    <SelectParameters>
        <asp:SessionParameter Name="MemberID" SessionField="UserCode" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>--%>
</asp:Content>
