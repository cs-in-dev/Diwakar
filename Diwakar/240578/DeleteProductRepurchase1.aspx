<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteProductRepurchase1.aspx.cs" Inherits="GrowTogether._240578.DeleteProductRepurchase1" MasterPageFile="~/240578/AdminMasterPage.master"%>

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
                    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] ">
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
                    SelectCommand="SELECT [ProductID], [ProductName] FROM [ProductRepurchase] where CategoryID=@Cat and status!=1">
                    <SelectParameters >
                    <asp:ControlParameter ControlID="dcatlist" Type="Int64"  Name="Cat"/>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
               Product Code</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtproductcode" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Delete By ProductCode" />
            </td>
            
        </tr>
        <tr>
            <td style="text-align: right">
                </td>
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
