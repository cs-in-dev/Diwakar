<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="DwnRepurchase.aspx.cs" Inherits="Amazewellness.user.DwnRepurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function BackPage() {
            window.history.back()
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
    
    <strong style="font-size: large">DOWNLINE REPURCHASE</strong>
        <br />
        <table>
            <tr><td>Month:</td><td>               

                <asp:DropDownList ID="ddlMonth" runat="server">
                <asp:ListItem Value="0">-Month-</asp:ListItem>
                <asp:ListItem Value="1">Jan</asp:ListItem>
                <asp:ListItem Value="2">Feb</asp:ListItem>
                <asp:ListItem Value="3">March</asp:ListItem>
                <asp:ListItem Value="4">April</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">Aug</asp:ListItem>
                <asp:ListItem Value="9">Sep</asp:ListItem>
                <asp:ListItem Value="10">Oct</asp:ListItem>
                <asp:ListItem Value="11">Nov</asp:ListItem>
                <asp:ListItem Value="12">Dec</asp:ListItem>
                </asp:DropDownList>
                              </td></tr>
            <tr><td>Year: </td><td> <asp:DropDownList ID="ddlYear" runat="server">                
                                    </asp:DropDownList></td></tr>
            <tr><td></td><td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td></tr>
        </table>
    </center>

      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowFooter="True"
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" 
        Width="100%" EmptyDataText="No records found." ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                SortExpression="MemberID" />
            <asp:BoundField DataField="SR" HeaderText="Self" 
                SortExpression="SR" DataFormatString="{0:f2}"/>                
            <asp:BoundField DataField="DR" HeaderText="Downline" SortExpression="DR" DataFormatString="{0:f2}" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:f2}"/>                    
           <asp:TemplateField>
               <ItemTemplate>                   
                   <asp:LinkButton ID="LinkButton1" runat="server" ToolTip='<%# Bind ("Downline") %>' OnClick="LinkButton1_Click">Downline</asp:LinkButton>
               </ItemTemplate>
           </asp:TemplateField> 
             <asp:TemplateField>
               <ItemTemplate>                   
                   <asp:LinkButton ID="LinkButton2" runat="server" ToolTip='<%# Bind ("Upline") %>' OnClick="LinkButton2_Click">Upline</asp:LinkButton>
               </ItemTemplate>
           </asp:TemplateField>           
           
        </Columns>
        <FooterStyle BackColor="#47D9BF" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#47D9BF"  HorizontalAlign="Center"  Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#47D9BF" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="White"  HorizontalAlign="Center"  />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
   <center> <a runat="server" id="lnk" onclick="BackPage()" style="cursor:pointer;color:red;" visible="false">Back</a></center>
</asp:Content>
