<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="ukinvestorNEW.Admin.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: #000000;
            text-align: center;
        }
        .style4
        {
            text-align: right;
        }
        .style5
        {
            color: #000000;
            text-align: right;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager> --%>
   <asp:Panel ID="paneladdmessage" runat="server">
    
<table width="700px">
<tr>
<td class="style4"><h2 class="style1"><strong>Add New Task</strong></h2></td>
</tr>
<%--<tr>
<td align="left" class="style1">Present Date</td>
<td align="left">

    <asp:TextBox ID="txtdate"   runat="server" Enabled="false"></asp:TextBox>
</td>--%>
<tr>
<td class="style5">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="SurveyId" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        Height="210px" Width="769px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="SurveyId" HeaderText="Task ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="SurveyId" />
            <asp:BoundField DataField="Details" HeaderText="Title" 
                SortExpression="Details" />
            <asp:TemplateField HeaderText="Startdate" SortExpression="Startdate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Startdate", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox3" Format="MM'/'dd'/'yyyy HH':'mm':'ss">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Startdate", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox3" Format="MM'/'dd'/'yyyy HH':'mm':'ss">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Startdate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enddate" SortExpression="Enddate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Enddate", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox4" Format="MM'/'dd'/'yyyy HH':'mm':'ss">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Enddate", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox4" Format="MM'/'dd'/'yyyy HH':'mm':'ss">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Enddate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="Type">
                <EditItemTemplate>
                     <asp:DropDownList ID="TextBox1" runat="server" Text='<%# Bind("Type") %>'>
                        <asp:ListItem>Survey</asp:ListItem>
                        <asp:ListItem>Ad-Click</asp:ListItem>
                        <asp:ListItem>Ad-Post</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="TextBox1" runat="server" Text='<%# Bind("Type") %>'>
                    <asp:ListItem>Survey</asp:ListItem>
                    <asp:ListItem>Ad-Click</asp:ListItem>
                    <asp:ListItem>Ad-Post</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings PageButtonCount="100" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        DeleteCommand="DELETE FROM [tblsurvey] WHERE [SurveyId] = @original_SurveyId"
        
        InsertCommand="INSERT INTO [tblsurvey] ([Details], [Startdate], [Enddate], [Type]) VALUES (@Details, @Startdate, @Enddate, @Type)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [tblsurvey]" 
        
        UpdateCommand="UPDATE [tblsurvey] SET [Details] = @Details, [Startdate] = @Startdate, [Enddate] = @Enddate, [Type] = @Type WHERE [SurveyId] = @original_SurveyId">
        <DeleteParameters>
            <asp:Parameter Name="original_SurveyId" Type="Int64" />
            <asp:Parameter Name="original_Details" Type="String" />
            <asp:Parameter DbType="DateTime" Name="original_Startdate" />
            <asp:Parameter DbType="DateTime" Name="original_Enddate" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Link" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Details" Type="String" />
            <asp:Parameter DbType="DateTime" Name="Startdate" />
            <asp:Parameter DbType="DateTime" Name="Enddate" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Details" Type="String" />
            <asp:Parameter DbType="DateTime" Name="Startdate" />
            <asp:Parameter DbType="DateTime" Name="Enddate" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="original_SurveyId" Type="Int64" />
            <asp:Parameter Name="original_Details" Type="String" />
            <asp:Parameter DbType="DateTime" Name="original_Startdate" />
            <asp:Parameter DbType="DateTime" Name="original_Enddate" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter Name="original_Link" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SurveyId" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        Width="916px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SurveyId" HeaderText="Task ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="SurveyId" />
            <asp:BoundField DataField="Details" HeaderText="Title" 
                SortExpression="Details" />
            <asp:TemplateField HeaderText="Startdate" SortExpression="Startdate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Startdate", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox5" Format="MM'/'dd'/'yyyy HH':'mm':'ss">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Startdate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Enddate" SortExpression="Enddate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Enddate", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox6" Format="MM'/'dd'/'yyyy HH':'mm':'ss">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Enddate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="Type">
                <EditItemTemplate>
                     <asp:DropDownList ID="TextBox7" runat="server" Text='<%# Bind("Type") %>'>
                        <asp:ListItem>Survey</asp:ListItem>
                        <asp:ListItem>Ad-Click</asp:ListItem>
                        <asp:ListItem>Ad-Post</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    </td>
</tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
    </tr>
</table>
</asp:Panel>
</asp:Content>
