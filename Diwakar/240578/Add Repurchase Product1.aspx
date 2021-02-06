<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Repurchase Product1.aspx.cs" Inherits="GrowTogether._240578.Add_Repurchase_Product1" MasterPageFile="~/240578/AdminMasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            height: 29px;
        }
        .style3
        {
            height: 27px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style2" style="margin-top: 20px;">
     
    <tr>
     <td style="text-align: right">
            &nbsp;</td>
        <td style="text-align: left">
            &nbsp;</td>
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
                    SelectCommand="select Categoryname,CategoryID from categorymaster where PID=-1"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                    ControlToValidate="ddlCategoryID" ErrorMessage="please select Sub Category."
                    ValidationGroup="v2" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

            </td>
        </tr>
    <tr>
        <td style="text-align: right">
            Product Code</td>
        <td style="text-align: left">
            <asp:TextBox ID="productcodetxt" runat="server" 
                 AutoPostBack="true" ValidationGroup="v2" OnTextChanged="productcodetxt_TextChanged"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                 ControlToValidate="productcodetxt" ErrorMessage="Enter Product Code." 
                                 style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label2" runat="server" style="float:left;" ForeColor="Red"></asp:Label>
           
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            Product Name</td>
        <td style="text-align: left">
            <asp:TextBox ID="productnametxt" runat="server" ValidationGroup="v2"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            MRP:</td>
        <td style="text-align: left">
            <asp:TextBox ID="TextBox3" runat="server" Height="22px" ValidationGroup="v2" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
             ControlToValidate="TextBox3" ErrorMessage="Enter Distributor Price." 
             style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
          
  
        </td>

    </tr>
        <tr>
        <td style="text-align: right">
            DP</td>
        <td style="text-align: left">
            <asp:TextBox ID="txtDP" runat="server"  ValidationGroup="v2"
                 ></asp:TextBox>
           
  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
             ControlToValidate="txtDP" ErrorMessage="Enter DP." 
             style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
   
        </td>
        </tr>
         <tr>
        <td style="text-align: right">
            BV</td>
        <td style="text-align: left">
            <asp:TextBox ID="TextBox1" runat="server"  ValidationGroup="v2"
                 ></asp:TextBox>
           
  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
             ControlToValidate="TextBox1" ErrorMessage="Enter PV." 
             style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
   
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
        <td style="text-align: right">
            Image</td>
        <td style="text-align: left">
&nbsp;<asp:FileUpload ID="Reproductupload" runat="server" /> <asp:Button ID="btnUpload" runat="server" Text="upload" onclick="btnUpload_Click" />
        </td>
        
    </tr>
    <tr>
    <td colspan="2" align="center">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="350px" 
                    style="margin-bottom: 0px" />

    </td>
    </tr>
    <tr>
    
    <td colspan="2"> <cc1:Editor ID="ProductEditor" runat="server" Height="400px" Width="600px" /></td>
    </tr>


     <tr>
        <td style="text-align: right">
            &nbsp;</td>
        <td style="text-align: left">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" ValidationGroup="v2" />
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td style="text-align: left">
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
