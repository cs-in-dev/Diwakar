<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master"    AutoEventWireup="true" CodeBehind="TransactionDetails.aspx.cs" Inherits="mmart2.Store.TransactionDetailsss" %>
    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            color: #CC00FF;
            font-size: large;
        }
    </style>
      <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.10.1.min.js"></script>
	<link type="text/css" href="../css/siena.datepicker.css" rel="stylesheet"/>
   	<link type="text/css" href="../css/santiago.datepicker.css" rel="stylesheet"/>
	<link type="text/css" href="../css/latoja.datepicker.css" rel="stylesheet"/>
	<link type="text/css" href="../css/lugo.datepicker.css" rel="stylesheet"/>
	<link type="text/css" href="../css/cangas.datepicker.css" rel="stylesheet"/>
	<link type="text/css" href="../css/vigo.datepicker.css" rel="stylesheet"/>
	<link type="text/css" href="../css/nigran.datepicker.css" rel="stylesheet"/>


    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#date1").datepicker();
            $("#date2").datepicker();
        });
</script>
    <style type="text/css">
		body {
			font: 100% "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
			margin: 0;
			background:fff;
		}

		h1 {
			width:900px!important;
			margin: .5em auto 0;
			padding: 10px 0 0;
			background: url('css/images/cal_logo.png') left center no-repeat;
			height: 43px;
			line-height: 30px;
			padding-left: 50px;
			color: #ed7474;
			font-size: 1.6em;
		}

		h2 {
			width:900px!important;
			margin: .5em auto 0;
		}

		article {
			display: block;
			width: 960px;
			margin: 5em auto;
		}

		input {
			font-size: 1em;
		}

		footer {
			width: 900px!important;
			display: block;
			margin: 30em auto 5em;
			padding: 1em 2em;
			color: #888;
			font-size: .9em;
			background: #f0f0f0;
			border-radius: 1.5em;
		}

		footer a {
			color: #666;
			text-decoration: none;
		}

		footer a:hover {
			color: #000;
		}

		footer a:first-child {
			font-weight: bold;
		}

	</style>

    <style type="text/css">
        .ui-datepicker table
        {
            width:100%!important;
        }
    </style>
 
    <style type="text/css">
        .ContentPlaceHolder1_GridView1
        {
            width:100%!important;
        }
    </style>
    <style type="text/css">
        .ContentPlaceHolder1_GridView2
        {
            width:100%!important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center class="style2">
           <br /> Transaction Statement  <br /><br />
        </center>
    </div>
    <hr />
    <center>
        <div>
            <table class="style10">       
        <tr>
            <td class="style5" align="right">
                Date From
            </td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="date1" runat="server" CssClass="style7" ClientIDMode="Static"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Date From" Font-Size="15px" ControlToValidate="date1" ForeColor="Red" ValidationGroup="v2"></asp:RequiredFieldValidator>
                      
                      </td>
        </tr>
        <tr>
            <td class="style5" align="right">
                Date Till</td>
            <td style="text-align: left" class="style12">
                    <asp:TextBox ID="date2" runat="server" CssClass="style7" ClientIDMode="Static" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Date Till" Font-Size="15px" ControlToValidate="date2" ForeColor="Red" ValidationGroup="v2"></asp:RequiredFieldValidator>

                          
                   </td>
        </tr>
        <%--<tr>
            <td class="style5" align="right">
                Enter Branch</td>
            <td style="text-align: left" class="style12">
                <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
               
            </td>
        </tr>--%>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"  ValidationGroup="v2"
                    CssClass="style7" onclick="btnSubmit_Click" />
                <span class="style6">&nbsp;</span></td>
        </tr>
        <tr class="style6">
            <td class="style12">
                &nbsp;</td>
            <td style="text-align: left" class="style12">
              <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/240578/images/excel_icon.png" OnClick="ImageButton2_Click" />    
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
            <div style="width:960px; overflow:scroll">

            </div>
                
            </td>
        </tr>
    </table>
          <table>
          <%--<tr>
          <td>
          Date From:
          </td>
          <td>
         <asp:TextBox ID="txtDateFrom" runat="server"></asp:TextBox>
         <asp:CalendarExtender ID="cal" TargetControlID="txtDateFrom" runat="server"></asp:CalendarExtender>
         <asp:MaskedEditExtender ID="mask" runat="server" TargetControlID="txtDateFrom"  Mask="99/99/9999" MaskType="Date"></asp:MaskedEditExtender>          
          </td>
          </tr>
          <tr>
            <td>
          Date To:
          </td>
          <td>
         <asp:TextBox ID="txtDateTo" runat="server"></asp:TextBox>
         <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDateTo" runat="server"></asp:CalendarExtender>
         <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtDateTo"  Mask="99/99/9999" MaskType="Date"></asp:MaskedEditExtender>          
          </td>

          </tr>--%>
<%--          <tr>
         <td>
         Store Name:
         </td>
          <td>
 <asp:DropDownList ID="DrpSelect" runat="server" DataSourceID="SqlDataSource1" 
                  DataTextField="StoreName" DataValueField="ID" ></asp:DropDownList>

              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:conn %>" 
                  SelectCommand="SELECT [StoreName], [ID] FROM [StoreMaster]">
              </asp:SqlDataSource>

          </td>
          </tr>--%>
          </table>
        </div>
       <%-- <div><br />
            <asp:Button ID="btnSearch" runat="server" Width="90 px" BackColor="DarkKhaki" 
                Text="Search" onclick="btnSearch_Click" />
        </div>--%>
    
    <div>
       
        <div></div>
        <br />
        <br />
        <asp:GridView ID="grd1" runat="server" Width="100%" CellPadding="4" AutoGenerateColumns="False"  
             onrowdatabound="grd1_RowDataBound" 
            ShowFooter="True" AllowPaging="True" AllowSorting="True" PageSize="20" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:D}"
                    SortExpression="Date" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name"  SortExpression="ProductName" />
               
                <asp:BoundField DataField="Particulars" HeaderText="Particulars" 
                    SortExpression="Particulars" />
                <asp:BoundField DataField="TransferQty" HeaderText="Transfer Qty" 
                    SortExpression="TransferQty" />
                
                <asp:BoundField DataField="TotalBV" HeaderText="Total BV" SortExpression="TotalBV"/>
                
                <asp:BoundField DataField="TotalDP" HeaderText="Total DP" SortExpression="TotalDP" DataFormatString="{0:F2}"/>
                <asp:BoundField DataField="TotalMRP" HeaderText="Total MRP" SortExpression="TotalMRP" DataFormatString="{0:F2}"/>
                
               
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
            <center>
                No Data Found
                </center>
            </EmptyDataTemplate>
          
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
            <RowStyle BackColor="#F7F6F3" HorizontalAlign="Left" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    </center>
</asp:Content>
