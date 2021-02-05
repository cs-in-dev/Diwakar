<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="EditMyOrderDetails.aspx.cs" Inherits="GWG.MyOrderDetailss" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Order Details&nbsp;<asp:Label runat="server" ID="OrderID"></asp:Label>
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<div style="text-align:left;">
<asp:Button ID="btnprnt" runat="server"  Text="Print" onclick="btnprnt_Click"/></div>
<asp:Panel ID="Panel1" runat="server">
  
    </asp:Panel>


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound1">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
             <asp:TemplateField HeaderText="ID">
                <ItemTemplate>

                    <asp:Label ID="lbld" runat="server" Enabled="false" Text='<%#Eval("ID")%>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="OrderID">
                <ItemTemplate>

                    <asp:Label ID="lblOrderID" runat="server"  Enabled="false" Text='<%#Eval("OrderID")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ProductID">
                <ItemTemplate>

                    <asp:Label ID="lblProductID" runat="server"  Enabled="false" Text='<%#Eval("ProductID")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MRP">
                <ItemTemplate>

                    <asp:Label ID="lblMRP" runat="server" Enabled="false" Text='<%#Eval("MRP")%>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="BV">
                <ItemTemplate>

                    <asp:Label ID="lblBV" runat="server" Enabled="false" Text='<%#Eval("BV")%>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
             
             <asp:TemplateField HeaderText="Tax">
                <ItemTemplate>

                    <asp:Label ID="lblTax" runat="server" Enabled="false" Text='<%#Eval("Tax")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty" SortExpression="Qty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Text='<%# Bind("Qty") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Amount">
                <ItemTemplate>

                    <asp:Label ID="lblA" runat="server" Enabled="false" Text='<%#Eval("Amount")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [StockRequestDetails] WHERE [ID] = @original_ID AND (([OrderId] = @original_OrderId) OR ([OrderId] IS NULL AND @original_OrderId IS NULL)) AND (([ProductID] = @original_ProductID) OR ([ProductID] IS NULL AND @original_ProductID IS NULL)) AND (([MRP] = @original_MRP) OR ([MRP] IS NULL AND @original_MRP IS NULL)) AND (([BV] = @original_BV) OR ([BV] IS NULL AND @original_BV IS NULL)) AND (([Tax] = @original_Tax) OR ([Tax] IS NULL AND @original_Tax IS NULL)) AND (([Qty] = @original_Qty) OR ([Qty] IS NULL AND @original_Qty IS NULL)) AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL))" InsertCommand="INSERT INTO [StockRequestDetails] ([OrderId], [ProductID], [MRP], [BV], [Tax], [Qty], [Amount]) VALUES (@OrderId, @ProductID, @MRP, @BV, @Tax, @Qty, @Amount)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [StockRequestDetails] WHERE ([OrderId] = @OrderId)" UpdateCommand="UPDATE [StockRequestDetails] SET [Qty] = @Qty, [Amount] = @Amount WHERE [ID] = @original_ID AND (([OrderId] = @original_OrderId) OR ([OrderId] IS NULL AND @original_OrderId IS NULL)) AND (([ProductID] = @original_ProductID) OR ([ProductID] IS NULL AND @original_ProductID IS NULL)) AND (([MRP] = @original_MRP) OR ([MRP] IS NULL AND @original_MRP IS NULL)) AND (([BV] = @original_BV) OR ([BV] IS NULL AND @original_BV IS NULL)) AND (([Tax] = @original_Tax) OR ([Tax] IS NULL AND @original_Tax IS NULL)) AND (([Qty] = @original_Qty) OR ([Qty] IS NULL AND @original_Qty IS NULL)) AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int64" />
            <asp:Parameter Name="original_OrderId" Type="Int64" />
            <asp:Parameter Name="original_ProductID" Type="Int64" />
            <asp:Parameter Name="original_MRP" Type="Decimal" />
            <asp:Parameter Name="original_BV" Type="Int64" />
            <asp:Parameter Name="original_Tax" Type="Double" />
            <asp:Parameter Name="original_Qty" Type="Int64" />
            <asp:Parameter Name="original_Amount" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderId" Type="Int64" />
            <asp:Parameter Name="ProductID" Type="Int64" />
            <asp:Parameter Name="MRP" Type="Decimal" />
            <asp:Parameter Name="BV" Type="Int64" />
            <asp:Parameter Name="Tax" Type="Double" />
            <asp:Parameter Name="Qty" Type="Int64" />
            <asp:Parameter Name="Amount" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="OrderId" QueryStringField="OrderId" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OrderId" Type="Int64" />
            <asp:Parameter Name="ProductID" Type="Int64" />
            <asp:Parameter Name="MRP" Type="Decimal" />
            <asp:Parameter Name="BV" Type="Int64" />
            <asp:Parameter Name="Tax" Type="Double" />
            <asp:Parameter Name="Qty" Type="Int64" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="original_ID" Type="Int64" />
            <asp:Parameter Name="original_OrderId" Type="Int64" />
            <asp:Parameter Name="original_ProductID" Type="Int64" />
            <asp:Parameter Name="original_MRP" Type="Decimal" />
            <asp:Parameter Name="original_BV" Type="Int64" />
            <asp:Parameter Name="original_Tax" Type="Double" />
            <asp:Parameter Name="original_Qty" Type="Int64" />
            <asp:Parameter Name="original_Amount" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
