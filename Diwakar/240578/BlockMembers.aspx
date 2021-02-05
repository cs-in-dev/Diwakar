<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="BlockMembers.aspx.cs" Inherits="GWG1.BlockMembers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            height: 129px;
            width: 266px;
        }
        .style31
        {
            width: 116px;
            text-align:left;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="border:1px Solid Black;width:600px;">
            <tr>
            <td  colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td  style="text-align:center;font-size:small;font-weight:bold;" colspan="4">
              <i>(Block Members)</i>
              <br /><br /></td>
        </tr>
        <tr>
            <td  style="text-align:right;color:Black;font-size:small;font-weight:bold;">
                &nbsp;</td> 
            <td style="color:Black;font-size:small;font-weight:bold;">MemberID</td>
            <td style="text-align: left">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:TextBox ID="txtMemberCode" runat="server"></asp:TextBox>  
                 <asp:HiddenField ID="MemberCode" runat="server" /> 
                 <asp:AutoCompleteExtender ServiceMethod="GetMemberList" MinimumPrefixLength="1"
                            CompletionInterval="0" EnableCaching="true" CompletionSetCount="10" TargetControlID="txtMemberCode"
                            ID="autoCompleteExtender1" runat="server" FirstRowSelected="false">
                        </asp:AutoCompleteExtender> 
                </ContentTemplate>
                 <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="txtMemberCode" EventName="TextChanged" />                        
                    </Triggers>
                 </asp:UpdatePanel>           

            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td  style="text-align:right;color:Black;font-size:small;font-weight:bold;">
                &nbsp;</td> 
            <td style="color:Black;font-size:small;font-weight:bold;">Select Status</td>
            <td style="text-align: left">
                <asp:DropDownList ID="ddlStatus" runat="server">
                <asp:ListItem Text="<Select Status>" Value=""></asp:ListItem>
                <asp:ListItem Text="Active" Value="0"></asp:ListItem>
                <asp:ListItem Text="DeActive" Value="1"></asp:ListItem>
                </asp:DropDownList>               

            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td class="style31">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td>
              <br />  <asp:Button ID="btnBlock" runat="server" Text="Submit" 
                    style="height: 26px" onclick="btnBlock_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;</td><td colspan="2">
                <strong><b><asp:Literal ID="Literal1" runat="server"></asp:Literal> </b></strong>
            </td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
          <tr class="style6">
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" onclick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;</td><td>&nbsp;</td>
            <td>&nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        </table>
        <br />
        <br />
   
        <center>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserCode" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="UserCode" HeaderText="UserCode" ReadOnly="True" SortExpression="UserCode"></asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
                    <asp:BoundField DataField="LoginName" HeaderText="LoginName" SortExpression="LoginName"></asp:BoundField>
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB"></asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
                    <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo"></asp:BoundField>
                    <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail"></asp:BoundField>
                    <asp:BoundField DataField="PanNo" HeaderText="PanNo" SortExpression="PanNo"></asp:BoundField>
                    <asp:BoundField DataField="DOJ" HeaderText="DOJ" SortExpression="DOJ"></asp:BoundField>
                    <asp:BoundField DataField="PinAmount" HeaderText="PinAmount" SortExpression="PinAmount"></asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                    <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#EFF3FB"></RowStyle>

                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <%-- <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                GridLines="Horizontal" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">               
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Activate" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Left" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
                
            </asp:GridView>--%>
            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conn %>" 
                SelectCommand="SELECT [UserCode], [UserName], convert(nvarchar,[DOB],103) [DOB], [MobileNo], [EMail], convert(nvarchar,[DOJ],103) [DOJ], case when [Status]=DeActivate then 'DeActivate' else 'Activate' end as Status FROM [tblMemberMaster]ORDER BY [DOJ]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="MemberStatus" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conn %>' SelectCommand="SELECT [UserCode], [UserName], [LoginName], [DOB], [Address], [City], [State], [MobileNo], [EMail], [PanNo], [DOJ], [PinAmount], [Status], [UserType] FROM [tblMemberMaster] where Status='Deactive'"></asp:SqlDataSource>
        </div>
        </center>
</asp:Content>
