<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="VoucherEfundReport.aspx.cs" Inherits="MoneyMagnet.SuperAdmin.VoucherEfundReport" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Width="950px" Height="100%" ScrollBars="Both">


        <cc1:Grid ID="Grid1" runat="server" AllowFiltering="True"
            AllowGrouping="True" DataSourceID="SqlDataSource1">
        </cc1:Grid>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="Data Source=107.151.2.55;Initial Catalog=takeover;User ID=takeover;Password=hello1takeover@@@"
            ProviderName="System.Data.SqlClient"
            SelectCommand="SELECT [MemberID], [TxnID], [DateofTransaction], [Particulars], [Credit], [Debit] FROM [AccountMaster] WHERE DateOfTransaction<=getdate() AND Txntype IN (7,6,15,5) ORDER BY [DateofTransaction], [TxnID]"
            ConflictDetection="CompareAllValues"
            DeleteCommand="DELETE FROM [AccountMaster] WHERE [TxnID] = @original_TxnID AND [DateofTransaction] = @original_DateofTransaction AND [Particulars] = @original_Particulars AND [Credit] = @original_Credit AND [Debit] = @original_Debit"
            InsertCommand="INSERT INTO [AccountMaster] ([DateofTransaction], [Particulars], [Credit], [Debit]) VALUES (@DateofTransaction, @Particulars, @Credit, @Debit)"
            OldValuesParameterFormatString="original_{0}"
            UpdateCommand="UPDATE [AccountMaster] SET [DateofTransaction] = @DateofTransaction, [Particulars] = @Particulars, [Credit] = @Credit, [Debit] = @Debit WHERE [TxnID] = @original_TxnID AND [DateofTransaction] = @original_DateofTransaction AND [Particulars] = @original_Particulars AND [Credit] = @original_Credit AND [Debit] = @original_Debit">
            <DeleteParameters>
                <asp:Parameter Name="original_TxnID" Type="Int64" />
                <asp:Parameter Name="original_DateofTransaction" Type="DateTime" />
                <asp:Parameter Name="original_Particulars" Type="String" />
                <asp:Parameter Name="original_Credit" Type="Decimal" />
                <asp:Parameter Name="original_Debit" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DateofTransaction" Type="DateTime" />
                <asp:Parameter Name="Particulars" Type="String" />
                <asp:Parameter Name="Credit" Type="Decimal" />
                <asp:Parameter Name="Debit" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="30" Name="TxnType" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DateofTransaction" Type="DateTime" />
                <asp:Parameter Name="Particulars" Type="String" />
                <asp:Parameter Name="Credit" Type="Decimal" />
                <asp:Parameter Name="Debit" Type="Decimal" />
                <asp:Parameter Name="original_TxnID" Type="Int64" />
                <asp:Parameter Name="original_DateofTransaction" Type="DateTime" />
                <asp:Parameter Name="original_Particulars" Type="String" />
                <asp:Parameter Name="original_Credit" Type="Decimal" />
                <asp:Parameter Name="original_Debit" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </asp:Panel>
</asp:Content>
