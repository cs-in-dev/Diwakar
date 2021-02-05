<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="EditandDeleteCategory.aspx.cs" Inherits="SSRPPL._19111973.EditandDeleteCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*.style1
        {
             width: 70%;
            height: 12px;
        }*/

        .style6
        {
            color: #990000;
            width: 231px;
        }
        .style7
        {
            height: 22px;
            width: 231px;
        }
        .style8
        {
            height: 26px;
            width: 231px;
        }
        .style9
        {
            height: 23px;
            color: #990000;
            width: 231px;
        }
         .style10
        {
            text-align: center;
        }
         .style20
       {
           text-align: center;
           width: 254px;
       }
        .GridView td
        {
            padding: 2px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:Panel ID="pnlAddTopic" runat="server" Font-Size="Large" ForeColor="#5D7B9D">
          Add/Delete Sub Category<br />
    <table class="style1">
        <tr>
            <td style="text-align:right;width:50%">
                 Category :
            </td>
            <td style="text-align:left;width:50%">
                <asp:TextBox ID="txtCatgry" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCatgry" ForeColor="Red" ValidationGroup="vg1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:right;width:50%">
               Parent Category:
            </td>
            <td style="text-align:left;width:50%">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"  DataValueField="CategoryID" DataTextField="CategoryName"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                     ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand=" select CategoryID,CategoryName from categorymaster where PID = -1 ">
                 </asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Enter Subject Title" ControlToValidate="DropDownList1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td style="text-align:left;width:50%">

            </td>
            <td style="text-align:left;width:50%">
                <asp:Button ID="btnSave"  runat="server" Text="Save Category" OnClick="btnSave_Click" ValidationGroup="vg1"/>
            </td>
        </tr>

        <tr>
            
            <td align="right">
                 &nbsp;</td>
            <td>
                 
            </td>
        </tr>
        <tr>
            
                <td style="text-align:left;width:50%">
                 <asp:Label ID="Label6" runat="server"></asp:Label>  
                    
                </td>
                <td class="style10" style="text-align:left;width:50%">
                    </td>                  
                  
            
        </tr>
        </table>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" style="text-align: center;">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" Visible="False" />
        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
        <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
        <asp:TemplateField HeaderText="Parent Category" SortExpression="PCategory">
            <%--<EditItemTemplate>
                <asp:Dropdownlist  ID="dropdown2" runat="server" DataTextField="FullPAth" DataValueField="CategoryID" DataSourceID="SqlDataSource2"></asp:Dropdownlist>
            </EditItemTemplate>--%>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PCategory") %>'></asp:Label>
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


     <%-- SelectCommand="select *,  [dbo].[CategoryMape](categoryid) FullPAth from categorymaster" --%>
     
     


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" OnUpdating="SqlDataSource1_Updating"
       ConnectionString="<%$ ConnectionStrings:conn %>"
        DeleteCommand="DELETE FROM [categorymaster] WHERE [CategoryID] = @original_CategoryID" 
       InsertCommand="INSERT INTO [categorymaster] VALUES (@Category)" OldValuesParameterFormatString="original_{0}"
         SelectCommand="select *,  [dbo].[FindCategoryName](PID) PCategory from categorymaster where PID not in (-1,43) " 
        UpdateCommand="UPDATE [categorymaster] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @original_CategoryID">
        <DeleteParameters>
            <asp:Parameter Name="original_CategoryID" Type="Int64" />
            <asp:Parameter Name="original_Category" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Category" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="original_CategoryID" Type="Int64" />
            <asp:Parameter Name="original_Category" Type="String" />
            <asp:Parameter Name="PCategory" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Panel>
</asp:Content>
