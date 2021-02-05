<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="RePurchaseBonanza.aspx.cs" Inherits="Amazewellness.user.RePurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
    
    .divgrid

    {
        height: 200px;

        width: 370px;
    }

    .divgrid table
    {
        width: 350px;

    }

    .divgrid table th

    {

        background-color: Green;

        color: #fff;

    }

</style>
    <script type="text/javascript">
       
    var GridId = "<%=GridView1.ClientID %>";
    var ScrollHeight = $(window).height()-300;
    window.onload = function () {
        var grid = document.getElementById(GridId);
        var gridWidth = grid.offsetWidth;
        var gridHeight = grid.offsetHeight;
        var headerCellWidths = new Array();
        for (var i = 0; i < grid.getElementsByTagName("TH").length; i++) {
            headerCellWidths[i] = grid.getElementsByTagName("TH")[i].offsetWidth;
        }
        grid.parentNode.appendChild(document.createElement("div"));
        var parentDiv = grid.parentNode;
 
        var table = document.createElement("table");
        for (i = 0; i < grid.attributes.length; i++) {
            if (grid.attributes[i].specified && grid.attributes[i].name != "id") {
                table.setAttribute(grid.attributes[i].name, grid.attributes[i].value);
            }
        }
        table.style.cssText = grid.style.cssText;
        table.style.width = gridWidth + "px";
        table.appendChild(document.createElement("tbody"));
        table.getElementsByTagName("tbody")[0].appendChild(grid.getElementsByTagName("TR")[0]);
        var cells = table.getElementsByTagName("TH");
 
        var gridRow = grid.getElementsByTagName("TR")[0];
        for (var i = 0; i < cells.length; i++) {
            var width;
            if (headerCellWidths[i] > gridRow.getElementsByTagName("TD")[i].offsetWidth) {
                width = headerCellWidths[i];
            }
            else {
                width = gridRow.getElementsByTagName("TD")[i].offsetWidth;
            }
            cells[i].style.width = parseInt(width - 3) + "px";
            gridRow.getElementsByTagName("TD")[i].style.width = parseInt(width - 3) + "px";
        }
        parentDiv.removeChild(grid);
 
        var dummyHeader = document.createElement("div");
        dummyHeader.appendChild(table);
        parentDiv.appendChild(dummyHeader);
        var scrollableDiv = document.createElement("div");
        if(parseInt(gridHeight) > ScrollHeight){
             gridWidth = parseInt(gridWidth) + 17;
        }
        scrollableDiv.style.cssText = "overflow:auto;height:" + ScrollHeight + "px;width:" + gridWidth + "px";
        scrollableDiv.appendChild(grid);
        parentDiv.appendChild(scrollableDiv);
    }

    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <center>
                    <h3>Caping Report</h3>
            </center>
        </tr>
          <tr>
        <td style="text-align:center"><strong>Select OrderType</strong></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>First Purchase</asp:ListItem>
                    <asp:ListItem>Repurchase</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
   
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CellPadding="4" Width="700px"  ShowHeaderWhenEmpty="True" EmptyDataText="No Rows Found !" ForeColor="#333333" Style="margin-top: 2px">
            <RowStyle BackColor="#F7F6F3" HorizontalAlign="Center"
                VerticalAlign="Middle" ForeColor="#333333" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="S.No" ItemStyle-Width="5%">
                    <ItemTemplate>
                        <%# Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DateTo" HeaderText="DateTo" SortExpression="DateTo" ItemStyle-Width="12%" />
                <asp:BoundField DataField="CarryLeft" HeaderText="CarryLeft" SortExpression="CarryLeft" DataFormatString="{0:f0}" ItemStyle-Width="11%" />
                <asp:BoundField DataField="CarryRight" HeaderText="CarryRight" SortExpression="CarryRight" DataFormatString="{0:f0}" ItemStyle-Width="11%" />
                <asp:BoundField DataField="NewLeft" HeaderText="NewLeft" SortExpression="NewLeft" DataFormatString="{0:f0}" ItemStyle-Width="11%" />
                <asp:BoundField DataField="NewRight" HeaderText="NewRight" SortExpression="NewRight" DataFormatString="{0:f0}" ItemStyle-Width="11%" />
                <asp:BoundField DataField="Pair" HeaderText="Pair" SortExpression="Pair" DataFormatString="{0:f0}" ItemStyle-Width="10%" />
                <asp:BoundField DataField="LeftForward" HeaderText="LeftForward" SortExpression="LeftForward" DataFormatString="{0:f0}" ItemStyle-Width="11%" />
                <asp:BoundField DataField="RightForward" HeaderText="RightForward" SortExpression="RightForward" DataFormatString="{0:f0}" ItemStyle-Width="18%" />

            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#F7F6F3" ForeColor="White" Font-Bold="True" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#d35400" Font-Bold="True" ForeColor="White" Font-Size="12px" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
     

</asp:Content>
