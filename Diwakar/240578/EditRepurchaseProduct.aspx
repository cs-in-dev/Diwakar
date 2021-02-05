<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="EditRepurchaseProduct.aspx.cs" Inherits="WGRL._240578.EditRepurchaseProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <table class="style2" style="margin-top: 50px;">

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
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <b>Sub Category</b></td>
            <td style="text-align: left">
                <asp:DropDownList ID="ddlCategoryID" runat="server"
                    Width="300px" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlCategoryID_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <b>Product&nbsp; Name</b></td>
            <td style="text-align: left">

                <asp:DropDownList ID="ddlProductID" runat="server" Width="300px"
                    DataTextField="ProductName"
                    DataValueField="ProductID"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="ddlProductID_SelectedIndexChanged">
                </asp:DropDownList>

            </td>
        </tr>

        <tr>
            <td style="text-align: right">
                <b>Last Used SAC Code</b></td>
            <td style="text-align: left;">

                <asp:TextBox ID="txtlastproductcode" runat="server" Enabled="false"></asp:TextBox>

            </td>


            <td>
                <asp:Button ID="btnRefresh" runat="server" Text="Refresh Code" OnClick="btnRefresh_Click" Style="margin-left: -140px" />
            </td>


        </tr>
        <tr>
            <td style="text-align: right">SAC Code</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtProductCode" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Product Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtProductName" runat="server"
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Product Category</td>
            <td style="text-align: left">
                <%--<asp:TextBox ID="txtPV" runat="server"></asp:TextBox>--%>
                <asp:DropDownList runat="server" ID="dropdowncategory" DataSourceID="SqlDataSource5" DataTextField="Categoryname" DataValueField="CategoryID" Width="300px">
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                    ConnectionString="<%$ ConnectionStrings:conn %>"
                    SelectCommand="select Categoryname,CategoryID from categorymaster where PID !=-1"></asp:SqlDataSource>
            </td>

            <tr>
                <td style="text-align: right">MRP</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtMrp" runat="server"></asp:TextBox></td>

                <tr>
                    <td style="text-align: right">DP</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtDP" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">BV</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtBV" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">CGST</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtCGST" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                            ControlToValidate="txtCGST" ErrorMessage="Add CGST"
                            ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">SGST</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtSGST" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ControlToValidate="txtSGST" ErrorMessage="Add SGST"
                            ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right">IGST</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtIGST" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="txtIGST" ErrorMessage="Add IGST"
                            ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td style="text-align: right">Add Quantity</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtVat" runat="server"></asp:TextBox></td>
                </tr>


                <tr>
                    <td style="text-align: right">Add ML</td>
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
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right" class="auto-style1">Show in MRP Invoicing</td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="-1">Select</asp:ListItem>
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                            ControlToValidate="DropDownList1" ErrorMessage="Please enter PCS"
                            ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>

                </tr>

                <tr>
                    <td style="text-align: right">Image</td>
                    <td style="text-align: left">
                        <asp:Image ID="Image1" Width="100px" Height="100px" runat="server" />
                        <asp:FileUpload ID="imageedit" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right"></td>
                    <td style="text-align: left">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update Product"
                            OnClick="btnUpdate_Click" />
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
