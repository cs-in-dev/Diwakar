<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="AddE-Wallet.aspx.cs" Inherits="febify._240578.AddE_Wallet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .style2 {
            height: 29px;
        }

        .style3 {
            height: 27px;
        }
    </style>
      function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert("Please Enter Only Numeric Value:");
                return false;
            }

            return true;
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="style2" style="margin-top: 20px;">
         <caption class="style28">
                <strong>ADD REPURCHASE WALLET
        </strong>
             </caption>
        <tr>
            <td style="text-align: right">Member ID</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtmemberid" OnTextChanged="txtmemberid_TextChanged" AutoPostBack="true" runat="server" ValidationGroup="v2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtmemberid" ErrorMessage="*"
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">User Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtusername" runat="server" Height="22px" ReadOnly="true" ValidationGroup="v2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtusername" ErrorMessage="*"
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
                        </td>

        </tr>
           <tr>
            <td style="text-align: right">Existing Balance</td>
            <td style="text-align: left">
                <asp:TextBox ID="txteexistingamount" runat="server" Height="22px" ReadOnly="true" ValidationGroup="v2"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txteexistingamount" ErrorMessage="*"
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
                        </td>

        </tr>
          <tr>
            <td style="text-align: right">Select Category</td>
            <td style="text-align: left">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Credit</asp:ListItem>
                    <asp:ListItem>Debit</asp:ListItem>
                </asp:DropDownList>

                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="DropDownList1" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>--%>
                        </td>

        </tr>
          <tr>
            <td style="text-align: right">Add Amount</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtaddamount" runat="server" Height="22px" ValidationGroup="v2"  onkeypress="return isNumberKey(event)"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtaddamount" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtaddamount" ErrorMessage="*"
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
                        </td>

        </tr>
           <tr>
            <td style="text-align: right">&nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SUBMIT" ValidationGroup="v2" />

            </td>
          
        </tr>
   <%--      </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="TxnID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TxnID" HeaderText="TxnID" InsertVisible="False" ReadOnly="True" SortExpression="TxnID" />
            <asp:BoundField DataField="TxnType" HeaderText="TxnType" SortExpression="TxnType" />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID" />
            <asp:BoundField DataField="DateofTransaction" HeaderText="DateofTransaction" SortExpression="DateofTransaction" />
            <asp:BoundField DataField="Particulars" HeaderText="Particulars" SortExpression="Particulars" />
            <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
            <asp:BoundField DataField="Debit" HeaderText="Debit" SortExpression="Debit" />
            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>--%>



   <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conn %>' SelectCommand="SELECT [TxnID], [TxnType], [MemberID], [DateofTransaction], [Particulars], [Credit], [Debit], [level], [status] FROM [AccountMaster] WHERE (([TxnType] = @TxnType) AND ([MemberID] = @MemberID))">
             <SelectParameters>
                 <asp:Parameter DefaultValue="11" Name="TxnType" Type="Int64"></asp:Parameter>
                 <asp:SessionParameter SessionField="UserCode" Name="MemberID" Type="String"></asp:SessionParameter>
             </SelectParameters>
         </asp:SqlDataSource>
</asp:Content>
