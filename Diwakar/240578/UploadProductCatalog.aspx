<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="UploadProductCatalog.aspx.cs" Inherits="Rainsonglobal._240578.UploadProductCatalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <br />
    <br />

    <b><span style="text-align: center; font-size: 18px;">Upload Product Catalog</span></b>

    <br />
    <br />
    <br />
    <br />
    <table>
        <tr>
            <td style="text-align: right">
                Upload Product Catalog :</td>
            <td style="text-align: left">
               <%-- <asp:Image ID="Image1" Width="100px" Height="100px"  runat="server" />--%>
<asp:FileUpload ID="imageedit" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
 <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
               
            </td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Product" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</asp:Content>
