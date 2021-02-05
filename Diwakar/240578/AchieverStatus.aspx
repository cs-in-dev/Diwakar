<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="AchieverStatus.aspx.cs" Inherits="OpinionWorldGroup.Admin.AchieverStatus" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style5
    {
        text-align: center;
    }
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%--<div>
        <asp:label id="label1" runat="server" text="Rewards"></asp:label>&nbsp &nbsp
        <asp:dropdownlist id="dropdownlist1" runat="server" autopostback="true"  OnSelectedIndexChanged="dropdownlist1_SelectedIndexChanged">
             <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>Bag</asp:ListItem>
             <asp:ListItem>2000</asp:ListItem>
             <asp:ListItem>4500</asp:ListItem>
             <asp:ListItem>9000</asp:ListItem>
             <asp:ListItem>20000</asp:ListItem>
             <asp:ListItem>60000</asp:ListItem>
             <asp:ListItem>200000</asp:ListItem>
             <asp:ListItem>400000</asp:ListItem>
            <asp:ListItem>Royalty</asp:ListItem>

            
        </asp:dropdownlist>
    </div>--%>
    <table class="style1" align="center" style="width: 50%">
        <tr>
           <td style="width:33.33%;"></td>
           <td style="width:33.33%;">
              <strong>Select Date</strong>
          </td> 
           <td style="width:33.33%;"></td>
        </tr>
        <tr>
        <td class="style5" style="text-align:right;">
                Date From
          </td>
          <td style="text-align: left">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="style7" placeholder="yyyy/MM/dd" ></asp:TextBox>
                      <asp:CalendarExtender runat="server" ID="calendar1"   TargetControlID="TextBox1" Format="yyyy/MM/dd"></asp:CalendarExtender>
                      </td>
            <td></td>
        </tr>
        <tr>
            <td class="style5" style="text-align:right;">
                Date Till
                </td>
           <td style="text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="style7" placeholder="yyyy/MM/dd"
                        ontextchanged="TextBox2_TextChanged"></asp:TextBox>
               
                          <asp:CalendarExtender runat="server" ID="CalendarExtender1"   TargetControlID="TextBox2" Format="yyyy/MM/dd"></asp:CalendarExtender>
                  </td>
   
        </tr>
        <tr>
            <td></td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
                    CssClass="style7" />
                <span class="style6">&nbsp;</span>
            </td>   
            <td></td>
        </tr>

        <tr class="style6">
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.gif" onclick="ImageButton1_Click" />
            </td>
             
        </tr>
</table>
           
  
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" 
                GridLines="None" style="text-align: center;margin-top:15px" Width="100%" 
                ForeColor="#333333" Font-Size="14px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True" EmptyDataText="No rows found !">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                 <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %></ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" SortExpression="ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                                SortExpression="Qualification" />
                    <asp:BoundField DataField="Rewards" HeaderText="Rewards" 
                                SortExpression="Rewards" />
                   <%-- <asp:BoundField DataField="LC" HeaderText="Left Count" 
                                SortExpression="LC" />
                    <asp:BoundField DataField="RC" HeaderText="Right Count" SortExpression="RC"/>--%>
                    <asp:BoundField DataField="AchievedDate" HeaderText="Achieved Date" SortExpression="AchievedDate"/>
                    <asp:BoundField DataField="ReceivedDate" HeaderText="Received Date" SortExpression="ReceivedDate"/>
                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"/>
                 <%--   <asp:TemplateField HeaderText="Received Date Update">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkbtn" runat="server" OnClick="linkbtn_Click">Edit</asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>--%>

                     <asp:TemplateField HeaderText="User Code">
                        <ItemTemplate>
                            <asp:Label ID="lblcode" runat="server" Text='<%#Eval("UserCode")%>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>

                   <%-- <asp:BoundField DataField="UserCode" HeaderText="User Code" SortExpression="UserCode"/>--%>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"/>
                     <asp:TemplateField HeaderText="Click Here">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkbtn1" runat="server" Visible='<%#Eval("visible") %>' OnClick="linkbtn1_Click1">Pay Now</asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
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
            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        
                        
                        
                SelectCommand="SELECT DateofTransaction AS Date,MemberID, Particulars, Credit AS Amount FROM AccountMaster WHERE (MemberID in (@MemberID)) AND (TxnType in (13)) AND (debit = 0)">
                <SelectParameters>
                    <asp:SessionParameter Name="MemberID" SessionField="UserCode" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
        </div>
</asp:Content>
