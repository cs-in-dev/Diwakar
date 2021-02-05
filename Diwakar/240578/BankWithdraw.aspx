<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/240578/AdminMasterPage.master"  CodeBehind="BankWithdraw.aspx.cs" Inherits="MoneyMagnet.Admin.BankWithdraw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style31
        {
            width: 52%;
        }
        .style32
        {
            width: 226px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table class="style31">
            <tr>
                <td>
    <asp:GridView ID="Gridbankwithdraw" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None" DataKeyNames="TXNID" 
                        ForeColor="#333333">
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
            No Bank Transfer Request Found!
            </EmptyDataTemplate>
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
         <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %></ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="TXNID" HeaderText="TXNID" 
                SortExpression="TXNID" ReadOnly="True" InsertVisible="False" />
            <asp:BoundField DataField="Date" HeaderText="Date" 
                SortExpression="Date" ReadOnly="True" />
            <asp:BoundField DataField="MemberId" HeaderText="MemberId" 
                SortExpression="MemberId" />
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="AmountRequested" HeaderText="AmountRequested"
                SortExpression="AmountRequested" DataFormatString="{0:f0}" />
            <asp:BoundField DataField="TxnCharges" HeaderText="TxnCharges"
                SortExpression="TxnCharges" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="NetAmount" HeaderText="NetAmount"
                SortExpression="NetAmount" DataFormatString="{0:f2}" />
            
           
            <asp:BoundField DataField="BankName" HeaderText="BankName" 
                SortExpression="BankName" />
            <asp:BoundField DataField="IFSCCode" HeaderText="IFSCCode" 
                SortExpression="IFSCCode" />
            <asp:BoundField DataField="AccountNo" HeaderText="AccountNo" 
                SortExpression="AccountNo" />
                
            <asp:BoundField DataField="PaymentMode" HeaderText="PaymentMode" 
                SortExpression="PaymentMode" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table class="style31">
                        <tr>
                            <td class="style32" 
                                style="text-align:center; font-family: Verdana; font-size: small">
                                Select TXNID : </td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="SqlDataSource1" DataTextField="TXNID" DataValueField="TXNID" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style32" style="text-align: right;">
                                <asp:Button ID="Button2" runat="server" 
                                    Text="Cancel" OnClick="Button2_Click" /></td>
                            <td style="text-align: left">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                    Text="Cleared" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
            SelectCommand="SELECT tblBankWithdraw.TXNID,CONVERT(NVARCHAR,tblBankWithdraw.Date, 103) AS Date,tblBankWithdraw.Amount,(cast(tblBankWithdraw.Amount as money)*.20)TxnCharges,(cast(tblBankWithdraw.Amount as money)-cast(tblBankWithdraw.Amount as money)*.20)NetAmount, tblBankWithdraw.MemberId, tblMemberMaster.UserName AS Name, tblBankWithdraw.Amount AS AmountRequested, tblMemberMaster.BankName, tblMemberMaster.IFSCCode, tblMemberMaster.AccountNo, tblBankWithdraw.PaymentMode, tblBankWithdraw.Status FROM tblBankWithdraw INNER JOIN tblMemberMaster ON tblBankWithdraw.MemberId = tblMemberMaster.UserCode where tblBankWithdraw.Status ='Pending' order by Date"></asp:SqlDataSource>
</div>
</asp:Content>