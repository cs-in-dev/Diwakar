<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="UserGeneratedPin.aspx.cs" Inherits="sarvodaya._03032003.UserGeneratedPin" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style5
        {
            /*width: 487px;*/
            color: #000000;
            font-size: small;
        }
        .style12
        {
            width: 482px;
        }
        .style7
        {
            font-size: small;
        }
        .style6
        {
            color: #FF0000;
            font-size: small;
        }
        .style10
        {
            width: 966px;
            font-size: xx-large;
            color: #FFFFFF;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table class="style10">
        <tr>
            <td class="style5" align="right">
                Date From
            </td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="style7" ></asp:TextBox>

                          <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="TextBox3"></asp:CalendarExtender>
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Date Till</td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="style7"></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="CE1" TargetControlID="TextBox4"></asp:CalendarExtender>
                   </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
                <asp:Button ID="Button1" runat="server"  Text="Submit" 
                    CssClass="style7" />
                <span class="style6">&nbsp;</span></td>
        </tr>
    </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                  <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                <asp:BoundField DataField="CreationDate" HeaderText="Creation Date" SortExpression="CreationDate" />
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
                <asp:BoundField DataField="CreatedFor" HeaderText="CreatedFor" SortExpression="CreatedFor" />
                <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT (select username from tblMemberMaster where UserCode=CreatedBy) UserName,CreationDate,CreatedBy,CreatedFor,[Status] FROM TBLPINMASTER WHERE CREATEDBY=CREATEDFOR and CAST(creationdate as date)&gt;= cast(@datefrom as date) AND  CAST(creationdate as date)&lt;= cast(@dateTo as date) ">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox3" Name="datefrom" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox4" Name="dateTo" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
    
</asp:Content>
