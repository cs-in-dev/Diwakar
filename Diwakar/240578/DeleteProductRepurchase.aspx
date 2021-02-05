<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="DeleteProductRepurchase.aspx.cs" Inherits="WGRL._240578.DeleteProductRepurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style2">
  <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td style="text-align: left">

                &nbsp;</td>
              </tr>
              <tr>
              <td style="text-align: right">
                CategoryID</td>
            <td style="text-align: left">
            <asp:DropDownList ID="dcatlist" runat="server" AutoPostBack="True" Width="155px" 
                    DataSourceID="SqlDataSource2" DataTextField="CategoryName" 
                    DataValueField="CategoryID" 
                    onselectedindexchanged="dcatlist_SelectedIndexChanged" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster]">
                </asp:SqlDataSource>
              </td>
                </tr>
               <tr>
            <td style="text-align: right">
                Product Name </td>
            <td style="text-align: left">

                <asp:DropDownList ID="d" runat="server" AutoPostBack="True" Width ="155px" 
                    DataSourceID="SqlDataSource1" DataTextField="ProductName" 
                    DataValueField="ProductID" style="margin-bottom: 0px" 
 >

                 </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                    SelectCommand="SELECT [ProductID], [ProductName] FROM [ProductRepurchase] where CategoryID=@Cat and Status !=1">
                    <SelectParameters >
                    <asp:ControlParameter ControlID="dcatlist" Type="Int64"  Name="Cat"/>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Product Delete" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
