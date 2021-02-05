<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMasterPage.master" CodeBehind="ActivateAccount.aspx.cs" Inherits="totalfuturcare.User.ActivateAccount" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style30
        {
            color: #000000;
            font-size: large;
            font-family: Verdana;
        }
        .style35
        {
            text-align: left;
        }
        .style36
        {
            width: 100%;
        }
        .style37
        {
            width: 384px;
            height: 26px;
        }
        .style38
        {
            height: 26px;
        }
        </style>

   <script  type="text/javascript">
            function onBlur(event, ctlName, explen, decLen, x) {
                var cntNbr = document.getElementById(ctlName.id).value;
                var res = x.split("_");
                var x1 = Number(res[3]) + Number(1);
 
                var table = document.getElementById("<%=GivMon.ClientID%>");
                var Row = table.rows[x1];
                var CellValue = Row.cells[4].innerText;
                Row.cells[7].innerText = Number(Row.cells[4].innerText) * Number(cntNbr);
                Row.cells[8].innerText = Number(Row.cells[5].innerText) * Number(cntNbr);
               
            }
    </script>
     <%--<script type="text/javascript" language="javascript">
        function DoPostBackWithRowIndex(rowIndex){
            if(document.getElementById('<%=HdnSelectedRowIndex.ClientID%>') != null){
                document.getElementById('<%=HdnSelectedRowIndex.ClientID%>').value = rowIndex;
            }
            return true;
        }
     </script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:Panel ID="Panelviewrecord" runat="server">
  
<div>
<table style="height: 320px; width: 100%">
<tr>
<td class="style30">
    <center>
        <table style="width: 572px">
            <tr >
                <td style="text-align: right; font-size: small; font-family: Verdana;">
                    SELECT CATEGORY :</td>
                <td style="text-align: left; font-size: small; font-family: Verdana;">
                    
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlCategory_SelectedIndexChanged1" Height="25px">
                    </asp:DropDownList>
                </td>
                <td class="style35">
                    <asp:TextBox ID="TextBox1" runat="server" Text="Pending" Visible="false"></asp:TextBox>
                </td>
            </tr>
        </table>
    </center>
    </td>
</tr>
    <tr>
        <td align="center" valign="top">
            <asp:GridView ID="GivMon" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                onrowcancelingedit="GivMon_RowCancelingEdit" 
                OnRowDataBound="GivMonRowDataBound" onrowediting="GivMon_RowEditing" 
                onrowupdating="GivMon_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" 
                        SortExpression="CategoryName" />
                    <asp:BoundField DataField="productCode" DataFormatString="{0:F2}" 
                        HeaderText="Product Code" SortExpression="productCode" />
                    <asp:BoundField DataField="ProductName" DataFormatString="{0:F2}" 
                        HeaderText="Product Name" SortExpression="ProductName" />
                    <asp:BoundField DataField="CategoryId" DataFormatString="{0:F2}" 
                        HeaderText="Category Id" ReadOnly="True" SortExpression="CategoryId" />
                        <asp:BoundField DataField="MRP" DataFormatString="{0:F2}" HeaderText="DP" 
                        ReadOnly="True" SortExpression="MRP" />
                    <asp:BoundField DataField="BV" DataFormatString="{0:F2}" HeaderText="PV" 
                        ReadOnly="True" SortExpression="BV" />
                    
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
                                onBlur="javascript:return onBlur(event, this,3,2,this.id);" 
                                ontextchanged="TextBox1_TextChanged"
                                Text='<%#Eval("sQuantity") %>' Width="90px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender runat="server" Id="fe1" FilterType="Numbers" TargetControlID="TextBox1"></cc1:FilteredTextBoxExtender>
                            <%--<asp:Label id="lblAddressId" runat ="server" text='<%# Eval("Amount")%>'></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="sAmt" DataFormatString="{0:F2}" HeaderText="PV Total" 
                        ReadOnly="True" SortExpression="sAmt" />

                    <asp:BoundField DataField="Productid" HeaderText="Productid" 
                        SortExpression="Productid" Visible="false" />
                   
 <asp:BoundField DataField="sTotalAmount" DataFormatString="{0:F2}" HeaderText="Amount" 
                        ReadOnly="True" SortExpression="sTotalAmount" />
                    <asp:BoundField DataField="Productid" HeaderText="Productid" 
                        SortExpression="Productid" Visible="false" />
                    <%--   <asp:TemplateField HeaderText="MRP*Qty" >
                       
                        <ItemTemplate>
                            <asp:TextBox ID="MRPQty" runat="server"  Text='<%#Eval("sAmt") %>' Width="90px"  ></asp:TextBox>   
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#47D9BF" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#47D9BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>


            <table align="left" class="style36">
                <tr>
                    <td class="style37" align="right">
                        <asp:TextBox ID="TextBox2" runat="server" Text="Pending" Visible="false"></asp:TextBox>
                        <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                            style="font-size: small; font-family: Verdana" Text="Submit" />
                    </td>
                    <td align="left" class="style38">
                        </td>
                </tr>
                  <tr>
                    <td align="center" class="style37">
                        <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                    </td>
                    <td align="left" class="style38">
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td align="center" class="style37">
                        <table align="left" class="style36">
                            <tr>
                                <td align="right">
                                    <asp:Label ID="Label3" runat="server" Text="Total Quantity :"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" style="font-size: 12px" Text=""></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label5" runat="server" Text="Total PV :"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" style="font-size: 12px" Text=""></asp:Label>
                                </td>
                                 <td align="right">
                                    <asp:Label ID="Label1" runat="server" Text="Total Amount :"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblTotalAmount" runat="server" style="font-size: 12px" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" class="style38">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <asp:HiddenField ID="HiddenField3" runat="server" Value="-1" />
            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand=" select (select CategoryName from categorymaster where CategoryID =@CategoryID)  CategoryName ,Productid,productCode,ProductName,CategoryId,BV,MRP,'Amoount' Amoount,'Quantity' Quantity from productrepurchase  where CategoryID =@CategoryID">
        
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="CategoryID"   PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
        </td>
    </tr>
</table>
</div>

  </asp:Panel>
</asp:Content>


