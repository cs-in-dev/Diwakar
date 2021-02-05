<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepurchaseCategories1.aspx.cs" Inherits="GrowTogether._240578.RepurchaseCategories1" MasterPageFile="~/240578/AdminMasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<center>
    `<table width ="30%">
                <tr> 
            <td><asp:Label ID="catnamelbl" runat="server"  Text ="Category Name"></asp:Label>
                </td>
                <td><asp:TextBox ID="catnametxt" runat ="server" ValidationGroup="vgctgrnm"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="reqrd1" runat="server" ControlToValidate="catnametxt" ErrorMessage="*" ForeColor="Red" ValidationGroup="vgctgrnm"></asp:RequiredFieldValidator>
                </td>
                </tr>  
               
               <tr> 
                <td></td>
                <td><asp:Button ID="sbmtbtn" runat="server"  Text ="Submit" 
                        onclick="sbmtbtn_Click" ValidationGroup="vgctgrnm" /></td>
                </tr>
               
               <tr> 
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CategoryID" 
                        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                                SortExpression="CategoryName" />
                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConflictDetection="CompareAllValues" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        DeleteCommand="DELETE FROM [CategoryMaster] WHERE [CategoryID] = @original_CategoryID" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT [CategoryName], [CategoryID] FROM [CategoryMaster]" 
                        UpdateCommand="UPDATE [CategoryMaster] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @original_CategoryID">
                        <DeleteParameters>
                            <asp:Parameter Name="original_CategoryID" Type="Int64" />
                            <asp:Parameter Name="original_CategoryName" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CategoryName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CategoryName" Type="String" />
                            <asp:Parameter Name="original_CategoryID" Type="Int64" />
                            <asp:Parameter Name="original_CategoryName" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                   </td>
                </tr>
    </table>
</center>
</asp:Content>


