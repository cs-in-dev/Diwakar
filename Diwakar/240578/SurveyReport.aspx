<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="SurveyReport.aspx.cs" Inherits="surveypowerasia.Admin.SurveyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: xx-large;
            text-decoration: underline;
            color: #003399;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <strong>SURVEY REPORT</strong></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Expired</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="SurveyId" DataSourceID="AllSurvey" 
                    GridLines="Horizontal" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="SurveyId" HeaderText="SurveyId" 
                            InsertVisible="False" ReadOnly="True" SortExpression="SurveyId" />
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" />
                        <asp:BoundField DataField="Startdate" HeaderText="Startdate" 
                            SortExpression="Startdate" />
                        <asp:BoundField DataField="Enddate" HeaderText="Enddate" 
                            SortExpression="Enddate" />
                        <asp:BoundField DataField="Surveyamount" HeaderText="Surveyamount" 
                            SortExpression="Surveyamount" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" 
                            SortExpression="UserId" />
                        <asp:BoundField DataField="LoginName" HeaderText="LoginName" 
                            SortExpression="LoginName" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="ReceiveDate" HeaderText="ReceiveDate" 
                            SortExpression="ReceiveDate" />
                        <asp:BoundField DataField="RedeemDate" HeaderText="RedeemDate" 
                            SortExpression="RedeemDate" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="AllSurvey" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                    
                    SelectCommand="SELECT dbo.tblsurvey.SurveyId, dbo.tblsurvey.Details, convert(nvarchar(10),dbo.tblsurvey.Startdate,103) As StartDate, convert(nvarchar(10),dbo.tblsurvey.Enddate,103) As EndDate, dbo.tblsurvey.Surveyamount, dbo.tblSurveyDate.UserId, dbo.tblMemberMaster.LoginName, dbo.tblMemberMaster.UserName, convert(nvarchar(10),dbo.tblSurveyDate.ReceiveDate,103) As ReceiveDate, convert(nvarchar(10),dbo.tblSurveyDate.RedeemDate,103) As RedeemDate FROM dbo.tblsurvey INNER JOIN dbo.tblSurveyDate ON dbo.tblsurvey.SurveyId = dbo.tblSurveyDate.SurveyID INNER JOIN dbo.tblMemberMaster ON dbo.tblSurveyDate.UserId = dbo.tblMemberMaster.UserCode">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="SurveyId" datasourceid="OpenTask" 
                    GridLines="Horizontal" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="SurveyId" HeaderText="SurveyId" 
                            InsertVisible="False" ReadOnly="True" SortExpression="SurveyId" />
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" />
                        <asp:BoundField DataField="Startdate" HeaderText="Startdate" 
                            SortExpression="Startdate" />
                        <asp:BoundField DataField="Enddate" HeaderText="Enddate" 
                            SortExpression="Enddate" />
                        <asp:BoundField DataField="Surveyamount" HeaderText="Surveyamount" 
                            SortExpression="Surveyamount" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" 
                            SortExpression="UserId" />
                        <asp:BoundField DataField="LoginName" HeaderText="LoginName" 
                            SortExpression="LoginName" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="ReceiveDate" HeaderText="ReceiveDate" 
                            SortExpression="ReceiveDate" />
                        <asp:BoundField DataField="RedeemDate" HeaderText="RedeemDate" 
                            SortExpression="RedeemDate" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="OpenTask" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                    
                    SelectCommand="SELECT dbo.tblsurvey.SurveyId, dbo.tblsurvey.Details, convert(nvarchar(10),dbo.tblsurvey.Startdate,103) As StartDate, convert(nvarchar(10),dbo.tblsurvey.Enddate,103) As EndDate, dbo.tblsurvey.Surveyamount, dbo.tblSurveyDate.UserId, dbo.tblMemberMaster.LoginName, dbo.tblMemberMaster.UserName, convert(nvarchar(10),dbo.tblSurveyDate.ReceiveDate,103) As ReceiveDate, convert(nvarchar(10),dbo.tblSurveyDate.RedeemDate,103) As RedeemDate FROM dbo.tblsurvey INNER JOIN dbo.tblSurveyDate ON dbo.tblsurvey.SurveyId = dbo.tblSurveyDate.SurveyID INNER JOIN dbo.tblMemberMaster ON dbo.tblSurveyDate.UserId = dbo.tblMemberMaster.UserCode where (dbo.tblsurvey.Enddate >= GETDATE()) AND (dbo.tblsurvey.Startdate <= GETDATE())">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="SurveyId" datasourceid="ClosedSurvey" 
                    GridLines="Horizontal" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="SurveyId" HeaderText="SurveyId" 
                            InsertVisible="False" ReadOnly="True" SortExpression="SurveyId" />
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" />
                        <asp:BoundField DataField="Startdate" HeaderText="Startdate" 
                            SortExpression="Startdate" />
                        <asp:BoundField DataField="Enddate" HeaderText="Enddate" 
                            SortExpression="Enddate" />
                        <asp:BoundField DataField="Surveyamount" HeaderText="Surveyamount" 
                            SortExpression="Surveyamount" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" 
                            SortExpression="UserId" />
                        <asp:BoundField DataField="LoginName" HeaderText="LoginName" 
                            SortExpression="LoginName" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="ReceiveDate" HeaderText="ReceiveDate" 
                            SortExpression="ReceiveDate" />
                        <asp:BoundField DataField="RedeemDate" HeaderText="RedeemDate" 
                            SortExpression="RedeemDate" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="ClosedSurvey" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                    
                    SelectCommand="SELECT dbo.tblsurvey.SurveyId, dbo.tblsurvey.Details, convert(nvarchar(10),dbo.tblsurvey.Startdate,103) As StartDate, convert(nvarchar(10),dbo.tblsurvey.Enddate,103) As EndDate, dbo.tblsurvey.Surveyamount, dbo.tblSurveyDate.UserId, dbo.tblMemberMaster.LoginName, dbo.tblMemberMaster.UserName, convert(nvarchar(10),dbo.tblSurveyDate.ReceiveDate,103) As ReceiveDate, convert(nvarchar(10),dbo.tblSurveyDate.RedeemDate,103) As RedeemDate FROM dbo.tblsurvey INNER JOIN dbo.tblSurveyDate ON dbo.tblsurvey.SurveyId = dbo.tblSurveyDate.SurveyID INNER JOIN dbo.tblMemberMaster ON dbo.tblSurveyDate.UserId = dbo.tblMemberMaster.UserCode where (dbo.tblsurvey.Enddate <= GETDATE())">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
