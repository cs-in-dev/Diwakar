<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="Add Repurchase Product.aspx.cs" Inherits="WGRL._240578.Add_Repurchase_Product" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2 {
            height: 29px;
        }

        .style3 {
            height: 27px;
        }
    </style>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        function showimagepreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_Image1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style2" style="margin-top: 20px;">

        <tr>
            <td style="text-align: right">&nbsp;</td>
            <td style="text-align: left">&nbsp;</td>
        </tr>

        <tr>
            <td style="text-align: right">
                <b>Main Category</b></td>
            <td style="text-align: left;">
                <asp:DropDownList ID="ddlmaincategory" runat="server" Width="300px"
                    DataSourceID="SqlDataSource2" DataTextField="Categoryname" AppendDataBoundItems="true"
                    DataValueField="CategoryID" OnSelectedIndexChanged="ddlmaincategory_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:conn %>"
                    SelectCommand="select Categoryname,CategoryID from categorymaster where PID=-1 And CategoryID !=43"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="ddlmaincategory" ErrorMessage="please select Parent Category."
                    ValidationGroup="v2" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <b>Sub Category</b></td>
            <td style="text-align: left;">

                <asp:DropDownList ID="ddlCategoryID" runat="server" Width="300px">
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="ddlCategoryID" ErrorMessage="please select Sub Category."
                    ValidationGroup="v2" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

            </td>
        </tr>

        <tr>
            <td style="text-align: right">
                <b>Last Used Product Code</b></td>
            <td style="text-align: left;">

                <asp:TextBox ID="txtlastproductcode" runat="server" Enabled="false"></asp:TextBox>

            </td>
            <td>
                <asp:Button ID="btnRefresh" runat="server" Text="Refresh Code" OnClick="btnRefresh_Click" Style="margin-left: -271px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Product Code</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtProductCode" runat="server" Width="300px"
                    AutoPostBack="True" OnTextChanged="txtProductCode_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txtProductCode" ErrorMessage="please enter Product Code."
                    ForeColor="Red" ValidationGroup="v2"></asp:RequiredFieldValidator>
                <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Product Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtProductName" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtProductName" ErrorMessage="please enter product name"
                    ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- <tr>
        <td style="text-align: right">
            PV</td>
        <td style="text-align: left">
            <asp:TextBox ID="txtPV" runat="server" Height="22px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
             ControlToValidate="txtPV" ErrorMessage="Enter PV." 
             style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
          
    
        </td>
    </tr>--%>

        <tr>
            <td style="text-align: right">MRP</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtMRP" runat="server" Height="22px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="txtMRP" ErrorMessage="please enter MRP"
                    ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td style="text-align: right">DP</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtDP" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtDP" ErrorMessage="Please enter DP"
                    ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>

        <tr>
            <td style="text-align: right">BV</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtBV" runat="server"></asp:TextBox>


                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
             ControlToValidate="txtBV" ErrorMessage="Enter BV." 
             style="color: #FF0000" ValidationGroup="v3"></asp:RequiredFieldValidator>--%>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="txtBV" ErrorMessage="please enter BV"
                    ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td style="text-align: right">Vat(%)</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtvat" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ControlToValidate="txtvat" ErrorMessage="Please enter Vat"
                    ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td style="text-align: right">AddVat(%)</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtaddvat" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="text-align: right">Weight(gm)</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td style="text-align: right">Description</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtDetails" runat="server"></asp:TextBox>

                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
             ControlToValidate="txtDetails" ErrorMessage="Enter Description." 
             style="color: #FF0000" ValidationGroup="v3"></asp:RequiredFieldValidator>--%>
          
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Include in MRP Bill</td>
            <td style="text-align: left">

                <asp:CheckBox ID="CheckBox1" runat="server" />
            </td>
        </tr>

        <tr>
            <td style="text-align: right">Image</td>
            <td style="text-align: left">&nbsp;<asp:FileUpload ID="fuImage" runat="server" onchange="showimagepreview(this)" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpload" runat="server" Text="upload" OnClick="btnUpload_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="350px"
                    Style="margin-bottom: 0px; margin-left: 100px;" />

            </td>
        </tr>
        <tr>
            <td style="text-align: right">&nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="v2" />
            </td>
        </tr>
        <tr>
            <td class="style3">&nbsp;</td>
            <td style="text-align: left">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
