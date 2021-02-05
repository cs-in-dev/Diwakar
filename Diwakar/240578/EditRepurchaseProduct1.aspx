<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditRepurchaseProduct1.aspx.cs" Inherits="GrowTogether._240578.EditRepurchaseProduct1" MasterPageFile="~/240578/AdminMasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        src = 'http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js'
        function ShowPreview1(input) {

            if (input.files && input.files[0]) {

                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_Image1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);

            }
        }

    </script>
    <table class="style2" style="margin-top: 50px;">

        <%-- <tr>  <td style="text-align: right">
            CategoryID</td>
        <td style="text-align: left">
            <asp:DropDownList ID="catidlist" runat="server" 
                 DataTextField="CategoryName" 
                DataValueField="CategoryID" Width="155px" AutoPostBack="True" 
                onselectedindexchanged="catidlist_SelectedIndexChanged">
                         </asp:DropDownList>
                        </td>
    </tr>--%>

        <%--<tr>
            <td style="text-align: right">
                Product&nbsp; Name</td>
            <td style="text-align: left">            
               
                <asp:DropDownList ID="DropDownList1" runat="server" Width="155px" 
                    DataTextField="ProductName" 
                    DataValueField="ProductID" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged1" 
                    AutoPostBack="True">
                </asp:DropDownList>
               
                </td>
        </tr>--%>
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
                    SelectCommand="select Categoryname,CategoryID from categorymaster where PID=-1 And CategoryID !=42"></asp:SqlDataSource>
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
        </tr>
        <tr>
            <td style="text-align: right">Product&nbsp; Code</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtProductCode" runat="server" Width="129px" OnTextChanged="txtProductCode_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Product Name</td>
            <td style="text-align: left">
                <asp:TextBox ID="productnametxt" runat="server" TextMode="MultiLine"
                    Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">MRP:</td>
            <td style="text-align: left">
                <asp:TextBox ID="pricetxt" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="flrt1" runat="server" TargetControlID="pricetxt" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>

        <tr>
            <td style="text-align: right">DP</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtbv0" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="txtbv0_FilteredTextBoxExtender" runat="server" TargetControlID="txtbv0" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">BV</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtbv" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtbv" FilterType="Numbers"></asp:FilteredTextBoxExtender>
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
            <td style="text-align: right">Vat</td>
            <td style="text-align: left">
                <asp:TextBox ID="pricetxt0" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="pricetxt0_FilteredTextBoxExtender" runat="server" TargetControlID="pricetxt0" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">CashBack</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtcashback" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="pricetxt0" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">CashBackMonth</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtmonth" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="pricetxt0" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>

        <tr>
            <td style="text-align: right">Self CashBack</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtselfcashback" runat="server" ValidationGroup="v2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                    ControlToValidate="txtselfcashback" ErrorMessage="Enter CashBack."
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>

            </td>
        </tr>

        <tr>
            <td style="text-align: right">Self CashBackMonth</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtselefcashbackmonth" runat="server" ValidationGroup="v2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                    ControlToValidate="txtselefcashbackmonth" ErrorMessage="Enter Month."
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td style="text-align: right">Redemption Points</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtredemption" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="pricetxt0" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Special Discount</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtdiscount" runat="server" ValidationGroup="v2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                    ControlToValidate="txtdiscount" ErrorMessage="Enter Redemtion Points."
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>

            </td>
        </tr>


        <tr>
            <td style="text-align: right">Image
            </td>

            <td style="text-align: left">
                <asp:Image ID="Image1" Width="100px" Height="100px" runat="server" />
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">Delete Image</asp:LinkButton>
                        </td>
                    </tr>
                </table>

                <asp:FileUpload ID="imageedit" runat="server" />

            </td>

        </tr>
        <%-- <tr >
           
            <td align="center">
  <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Delete Image</asp:LinkButton>
            </td>
           
        </tr>--%>

        <tr>
            <td colspan="2" style="text-align: left;">Add Product Detail</td>
        </tr>
        <tr>
            <td colspan="2">
                <cc1:Editor ID="ProductEditor" runat="server" Height="400px" />
            </td>
        </tr>


        <tr>
            <td style="text-align: right"></td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Product" />
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
