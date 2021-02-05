<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TotalMembers.aspx.cs" MasterPageFile="~/240578/AdminMasterPage.master" Inherits="MoneyMagnet.Super19111973TotalMembers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">

    <style type="text/css">
        .style31 {
            width: 365px;
            text-align: left;
        }

        .style32 {
            width: 732px;
            text-align: right;
        }

        .style33 {
            width: 357px;
            text-align: right;
            color: #000000;
            font-size: medium;
        }

        .style34 {
            font-size: x-large;
            color: #000000;
        }
    </style>

    <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.10.1.min.js"></script>
    <link type="text/css" href="../css/siena.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/santiago.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/latoja.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/lugo.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/cangas.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/vigo.datepicker.css" rel="stylesheet" />
    <link type="text/css" href="../css/nigran.datepicker.css" rel="stylesheet" />


    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <%-- <script type="text/javascript">
        $(document).ready(function () {
            $("#TextBox2").datepicker();
            $("#TextBox3").datepicker();
        });
   </script>--%>
    <%--<style type="text/css">
        .ui-datepicker table
        {
            width:100%!important;
        }
    </style>--%>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style32">
        <caption class="style34">
            <strong>Total Distributors
            </strong>
        <tr class="style23">
            <td class="style33">
                <strong>&nbsp;Date From : </strong></td>
            <td class="style31">
                <%-- <asp:TextBox ID="TextBox2" runat="server" ClientIDMode="Static"></asp:TextBox>--%>   <%--j query calender--%>


                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:CalendarExtender runat="server" ID="CE1" Format="yyyy-MM-dd" TargetControlID="TextBox2"></asp:CalendarExtender>


                &nbsp;(MM/DD/YYYY)</td>
        </tr>
        <tr class="style23">
            <td class="style33">
                <strong>Date To : </strong></td>
            <td class="style31">
                <%-- <asp:TextBox ID="TextBox3" runat="server" ClientIDMode="Static" ></asp:TextBox>--%> <%--j query calender--%>


                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:CalendarExtender runat="server" ID="CalendarExtender1" Format="yyyy-MM-dd" TargetControlID="TextBox3"></asp:CalendarExtender>






                &nbsp;(MM/DD/YYYY)</td>
        </tr>
        <tr class="style23">
            <td class="style33">&nbsp;</td>
            <td class="style31">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" />
            </td>
        </tr>
        <tr class="style23">
            <td class="style33">
                <strong>Search : </strong></td>
            <td class="style31">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server">

                        <asp:ListItem Value="EMail">Email</asp:ListItem>
                        <asp:ListItem Value="UserName">Name</asp:ListItem>
                        <asp:ListItem Value="LoginName">Member ID</asp:ListItem>
                        <asp:ListItem Value="City">City</asp:ListItem>
                        <asp:ListItem Value="State">State</asp:ListItem>
                        <asp:ListItem Value="EMail">EMail</asp:ListItem>
                        <asp:ListItem Value="MobileNo">MobileNo</asp:ListItem>
                        <asp:ListItem Value="AccountNo">AccountNo</asp:ListItem>
                        <asp:ListItem Value="BankName">BankName</asp:ListItem>
                    </asp:DropDownList>
            </td>
        </tr>
        <tr class="style23">
            <td class="style33">&nbsp;</td>
            <td class="style31">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
            </td>
        </tr>
            <tr class="style23">
                <td class="auto-style3">
                    <asp:ImageButton ID="ImageButton1" runat="server"
                        ImageUrl="~/240578/images/excel_icon.gif" OnClick="ImageButton1_Click1" /></td>
            </tr>

            <tr>
            <td colspan="2" class="style8">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None"
                    PageSize="200" Width="954px" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="true">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserCode" HeaderText="User ID"
                            SortExpression="UserCode" />
                        <asp:BoundField DataField="SponserId" HeaderText="Sponsor ID"
                            SortExpression="SponserId" />
                        <asp:BoundField DataField="SpName" HeaderText="SponserName"
                            SortExpression="SpName" />
                        <asp:BoundField DataField="UserName" HeaderText="Name"
                            SortExpression="UserName" />
                        <asp:BoundField DataField="LoginName" HeaderText="Login Id"
                            SortExpression="LoginName" />
                        <asp:BoundField DataField="LoginPassword" HeaderText="Password"
                            SortExpression="LoginPassword" />
                        <asp:BoundField DataField="TransectionPassword" HeaderText="Trans Password"
                            SortExpression="TransectionPassword" />
                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No"
                            SortExpression="MobileNo" />
                        <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                        <asp:BoundField DataField="AccountNo" HeaderText="Account No" SortExpression="AccountNo" />
                        <asp:BoundField DataField="IFSCCode" HeaderText="IFSC Code" SortExpression="IFSCCode" />
                        <asp:BoundField DataField="BranchName" HeaderText="Branch Name" SortExpression="BranchName" />
                        <asp:BoundField DataField="BankName" HeaderText="Bank Name" SortExpression="BankName" />
                        <asp:BoundField DataField="DOJ" DataFormatString="{0:dd MMM yyyy}"
                            HeaderText="DOJ" SortExpression="DOJ" />
                        <asp:BoundField DataField="PinAmount" HeaderText="Joining Amount"
                            SortExpression="PinAmount" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                        HorizontalAlign="Center" />
                    <PagerSettings PageButtonCount="50" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        SelectCommand="SELECT [UserCode],[Myserialnum], [UserName], Sponsorid as SpID,[dbo].[MySponsorName](UserCode) as SpName, [LoginPassword], [TransectionPassword], [MobileNo], [EMail], [DOJ], [State], [IFSCCode], [City], PinAmount FROM [tblMemberMaster] WHERE ((cast(DOJ as date) >= cast(@DOJ as date)) and (cast(DOJ as date) <= cast(@DOJ2 as date))) AND (([UserCode] LIKE '%' + @UserCode + '%') OR ([UserName] LIKE '%' + @UserName + '%') OR ([Pinamount] LIKE '%' + @Pinamount + '%') OR ([MobileNo] LIKE '%' + @MobileNo + '%') OR ([EMail] LIKE '%' + @EMail + '%') OR ([LoginName] LIKE '%' + @LoginName + '%') OR ([City] LIKE '%' + @City + '%') OR ([State] LIKE '%' + @City + '%') OR ([AccountNo] LIKE '%' + @City + '%') OR ([IFSCCode] LIKE '%' + @City + '%'))  ORDER BY [myserialnum] desc">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox2" DbType="Date" Name="DOJ" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox3" DbType="Date" Name="DOJ2" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox1" Name="UserCode" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="UserName" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="MobileNo" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="EMail" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="LoginName" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="PanNo" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="City" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="Pinamount" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>

                <%--SelectCommand="SELECT [UserCode],[Myserialnum], [UserName], Sponsorid as SpID,[dbo].[MySponsorName](UserCode) as SpName, [LoginPassword], [TransectionPassword], [MobileNo], [EMail], [DOJ], [State], [IFSCCode], [City], PinAmount FROM [tblMemberMaster] WHERE (((cast([DOJ] as date) >= cast(@DOJ as date)) AND (cast([DOJ] as date) <= dateadd(day,1,cast(@DOJ2 as date)))) Or (([UserCode] LIKE '%' + @UserCode + '%') OR ([UserName] LIKE '%' + @UserName + '%') OR ([Pinamount] LIKE '%' + @Pinamount + '%') OR ([MobileNo] LIKE '%' + @MobileNo + '%') OR ([EMail] LIKE '%' + @EMail + '%') OR ([LoginName] LIKE '%' + @LoginName + '%') OR ([City] LIKE '%' + @City + '%') OR ([State] LIKE '%' + @City + '%') OR ([AccountNo] LIKE '%' + @City + '%') OR ([IFSCCode] LIKE '%' + @City + '%')))  ORDER BY [myserialnum] desc">--%>                
              
                
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

