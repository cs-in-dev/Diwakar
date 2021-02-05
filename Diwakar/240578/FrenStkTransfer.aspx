<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/240578/AdminMasterPage.master"  CodeBehind="FrenStkTransfer.aspx.cs" Inherits="totalfuturcare.User.FrenStkTransfer" %>
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
            height: 26px;
        }
        .style38
        {
            height: 26px;
        }
        .style39
        {
            font-size: 12px;
        }
        </style>
   <script  type="text/javascript">
       function onBlur(event, ctlName, explen, decLen, x) {
           return;
           alert('aa');
                var cntNbr = document.getElementById(ctlName.id).value;
                var res = x.split("_");
                var x1 = Number(res[3]) + Number(1);
 
                var table = document.getElementById("<%=GivMon.ClientID%>");

                var Row = table.rows[x1];
                var CellValue = Row.cells[5].innerText;
                 
                Row.cells[7].innerText = Number(Row.cells[5].innerText) * Number(cntNbr);
                var sAmt = document.getElementById("<%= Label6.ClientID %>");
               var gvDrv = document.getElementById("<%= GivMon.ClientID %>");

               var z = 0;


             




                document.getElementById("<%= HiddenField3.ClientID %>").Value = 0;
                for (i = 1; i < gvDrv.rows.length; i++) 
                {
                    var cell = gvDrv.rows[i].cells;

                  

                        
                     document.getElementById("<%= HiddenField3.ClientID %>").Value = Number(document.getElementById("<%= HiddenField3.ClientID %>").Value) + Number(x1);
 
                     z = Number(z) + Number(cell[5].innerHTML);
                     document.getElementById("<%= HiddenField1.ClientID %>").Value = z;
                }
//                 document.getElementById("<%= Label4.ClientID %>").innerHTML = document.getElementById("<%= HiddenField3.ClientID %>").Value; 
               //  document.getElementById("<%= Label6.ClientID %>").innerHTML = document.getElementById("<%= HiddenField1.ClientID %>").Value;
             }
    </script>
    <script  type="text/javascript">
        function JvfunonBlur(ctlName, x) {
            var grid = document.getElementById('<%=GivMon.ClientID %>');
            var col1;
            var totalcol1 = 0;

            var col2;
            var totalcol2 = 0;
            return;

            var cntNbr = document.getElementById(ctlName.id).value;
            var res = x.split("_");
            var x1 = Number(res[3]) + Number(1);
            var Row = grid.rows[x1];
            var CellValue = Row.cells[5].innerText;
            Row.cells[7].innerText = Number(Row.cells[5].innerText) * Number(cntNbr);
            var sAmt = document.getElementById("<%= Label6.ClientID %>");
            var z = 0;
            var gvDrv = document.getElementById("<%= GivMon.ClientID %>");

             


            for (i1 = 1; i1 < gvDrv.rows.length; i1++) {
                var cell = gvDrv.rows[i1].cells;
                z = Number(z) + Number(cell[7].innerHTML);
                document.getElementById("<%= HiddenField1.ClientID %>").Value = z;
            }

            document.getElementById("<%= Label6.ClientID %>").innerHTML = document.getElementById("<%= HiddenField1.ClientID %>").Value;
            var resAmt = document.getElementById("<%= HiddenField1.ClientID %>").Value;

            document.getElementById("<%= HiddenField4.ClientID %>").innerHTML = document.getElementById("<%= HiddenField1.ClientID %>").Value;

            for (i = 0; i < grid.rows.length; i++) {
                col1 = grid.rows[i].cells[6];
                for (j = 0; j < col1.childNodes.length; j++) {
                    if (col1.childNodes[j].type == "text") {
                        if (!isNaN(col1.childNodes[j].value) && col1.childNodes[j].value != "") {
                            totalcol1 += parseInt(col1.childNodes[j].value)
                        }
                    }
                }
            }
            document.getElementById('<%=Label4.ClientID %>').innerHTML = totalcol1;
            document.getElementById("<%= HiddenField5.ClientID %>").innerHTML = document.getElementById("<%= Label4.ClientID %>").Value;   
            
        }
    </script>

    <%--<script  type="text/javascript">
        function JvfunonBlur() {
            var grid = document.getElementById('<%=GivMon.ClientID %>');
            var col1;
            var totalcol1 = 0;

            var col2;
            var totalcol2 = 0;


            for (i = 0; i < grid.rows.length; i++) {
                col1 = grid.rows[i].cells[0];
                col2 = grid.rows[i].cells[1];

                for (j = 0; j < col1.childNodes.length; j++) {
                    if (col1.childNodes[j].type == "text") {
                        if (!isNaN(col1.childNodes[j].value) && col1.childNodes[j].value != "") {
                            totalcol1 += parseInt(col1.childNodes[j].value)
                        }
                    }
                }
            }
            document.getElementById('<%=Label4.ClientID %>').value = totalcol1;
        }
    </script>--%>

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
        <br /><br />
        <table style="width: 572px">
            <tr>
                <td style="text-align: right; font-size: small; font-family: Verdana;">
                    
                    <asp:Label ID="Label1" runat="server" style="font-size: 12px" 
                        Text="Frenchise ID :"></asp:Label>
                </td>
                <td style="text-align: left; font-size: small; font-family: Verdana;">
                    <asp:TextBox ID="txtUserCode" runat="server" AutoPostBack="True" 
                        ontextchanged="txtUserCode_TextChanged"></asp:TextBox>
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtUserCode" ForeColor="Red" ValidationGroup="v1"></asp:RequiredFieldValidator>--%>

                    <asp:Label ID="Label8" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <asp:Label ID="Label2" runat="server" style="font-size: 12px" Text="Name :"></asp:Label>
                </td>
                <td class="style35">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr >
                <td style="text-align: right; font-family: Verdana;" class="style39">
                    Select Category:</td>
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
            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand=" select (select CategoryName from categorymaster where CategoryID =@CategoryID)  CategoryName ,Productid,productCode,ProductName,CategoryId,BV,MRP,'Amoount' Amoount,'Quantity' Quantity from productrepurchase  where CategoryID =@CategoryID">
        
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="CategoryID"   PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" valign="top">
            <asp:GridView ID="GivMon" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" Font-Size="12px" 
                onrowcancelingedit="GivMon_RowCancelingEdit" 
                onrowdatabound="GivMon_RowDataBound" onrowediting="GivMon_RowEditing" 
                onrowupdating="GivMon_RowUpdating" 
                Width="100%" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" 
                        SortExpression="CategoryName" />
                    <asp:BoundField DataField="productCode" DataFormatString="{0:F2}" 
                        HeaderText="Product Code" SortExpression="productCode" />
                    <asp:BoundField DataField="ProductName" DataFormatString="{0:F2}" 
                        HeaderText="Product Name" SortExpression="ProductName" />
                    <asp:BoundField DataField="Stock" DataFormatString="{0:F0}" 
                        HeaderText="Available Qty" ReadOnly="True" SortExpression="Stock" />
                    <asp:BoundField DataField="BV" DataFormatString="{0:F2}" HeaderText="BV" 
                        ReadOnly="True" SortExpression="BV" />
                    <asp:BoundField DataField="MRP" DataFormatString="{0:F2}" HeaderText="DP" 
                        ReadOnly="True" SortExpression="MRP" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>                          
                                 <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
                                onBlur="javascript:return onBlur(event, this,3,2,this.id);" 
                                ontextchanged="TextBox1_TextChanged" Text='<%#Eval("Qty") %>' 
                                Width="90px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="sAmt" DataFormatString="{0:F2}" HeaderText="Amount" 
                        ReadOnly="True" SortExpression="sAmt" />
                       
                    <asp:BoundField DataField="Productid" HeaderText="Productid" 
                        SortExpression="Productid" Visible="false" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Left" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <table align="left" class="style36">
                <tr>
                    <td align="right" class="style37" colspan="2">
                        <table class="style36">
                            <tr>
                                <td align="right">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="left">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style37">
                        <asp:TextBox ID="TextBox2" runat="server" Text="Pending" Visible="false"></asp:TextBox>
                        <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click"  
                            style="font-size: small; font-family: Verdana; height: 26px;" 
                            Text="Submit" Visible="false" />
                    </td>
                    <td align="left" class="style38">
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style37">
                        <asp:Label ID="Label7" runat="server" Text="" ForeColor="Red"></asp:Label>
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
                                    <asp:Label ID="Label5" runat="server" Text="Total Amount :"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" style="font-size: 12px" Text=""></asp:Label>
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
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" Value="-1" />
            <asp:HiddenField ID="HiddenField4" runat="server" />
            <asp:HiddenField ID="HiddenField5" runat="server" />
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


