<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="AddJoiningPackages.aspx.cs" Inherits="Amazewellness._240578.AddJoiningPackages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
 
 
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57)) {
             alert("Please Enter Only Numeric Value:");
             return false;
         }
 
         return true;
      }
 
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>

   
    <div>
        <h3 style="  margin-left: 328px;">
            Add New Joining Packages
        </h3>
        <table>

            <tr>
                <td>
            <asp:Label ID="Label1" runat="server" Text="Code"></asp:Label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px" Width="172px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox1" Font-Size="19px" ValidationGroup="vg1"></asp:RequiredFieldValidator>

        </td>

            </tr><br />
            <tr>
                <td>
                 <asp:Label ID="Label2" runat="server" Text="Amount"></asp:Label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
              </td>
            <td>
            <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 0px" Width="172px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"  ControlToValidate="TextBox2" Font-Size="19px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
            </td>
            </tr>  <br />
            <tr>
                <td>
            <asp:Label ID="Label3" runat="server" Text="Discription"></asp:Label>&nbsp &nbsp &nbsp &nbsp &nbsp </td>
          
        <td>
            <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 0px" Width="169px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox3" Font-Size="19px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
        </td>

            </tr><br />

            <tr>
                <td>
            <asp:Label ID="Label4" runat="server" Text="Joining Pv"></asp:Label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        </td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" Width="172px" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox4" Font-Size="19px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
        </td>

            </tr><br />
            <tr>
                <td>
            <asp:Label ID="Label5" runat="server" Text="Cap Limit"></asp:Label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        </td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" Width="172px" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox5" Font-Size="19px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
        </td>

            </tr><br />
            <tr>
                <td>
            <asp:Label ID="Label6" runat="server" Text="Direct Income"></asp:Label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
        </td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" Width="172px" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox6" Font-Size="19px" ValidationGroup="vg1"></asp:RequiredFieldValidator>
        </td>

            </tr><br />

            <tr>
                <td></td>
                
                    <td>
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="vg1" />&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="vg1" />&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 

            </td>
            <td>
                <asp:Label ID="lblerror" runat="server" Text="" ForeColor="#339966" Font-Bold="true"></asp:Label>
        
            </td>

            </tr>


        </table>
        </div>
      <div>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="14px">
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              <Columns>
                  <asp:TemplateField HeaderText="S.No">
                      <ItemTemplate>
                          <%#Container.DataItemIndex+1 %>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code"/>
                  <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Discription" HeaderText="Description" SortExpression="Discription"/>
                  <asp:BoundField DataField="JoiningPV" HeaderText="Joining PV" SortExpression="JoiningPV"/>
                   <asp:BoundField DataField="Caplimit" HeaderText="Cap Limit" SortExpression="Caplimit"/>
                   <asp:BoundField DataField="DirectIncome" HeaderText="Direct Income" SortExpression="DirectIncome"/>
                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkBtnEdit" runat="server" OnClick="LinkBtnEdit_Click">Edit</asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <%--<asp:TemplateField>
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkBtnDelete" runat="server" OnClick="LinkBtnDelete_Click">Delete</asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>--%>
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
      </div>
         </center>

</asp:Content>
