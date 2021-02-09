 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productlist1.aspx.cs" Inherits="GrowTogether._240578.Productlist1" MasterPageFile="~/240578/AdminMasterPage.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
    DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
    DataValueField="CategoryID" 
    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    
</asp:DropDownList>
    <br />
    <br />

    <table>
        <tr>
             <td style="text-align: right">Product&nbsp; Code</td>
            <td>

                <asp:TextBox ID="txtproductcode" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search By Product Code" />
            </td>
        </tr>
    </table>
    <div>
        
    </div>
    
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#507CD1" HorizontalAlign="Center" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

        <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB"></RowStyle>

        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
    </asp:GridView>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:conn %>" 
    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster] ORDER BY [CategoryName]">
</asp:SqlDataSource>

</asp:Content>
