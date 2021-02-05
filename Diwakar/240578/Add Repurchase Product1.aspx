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
     
  
    <%--<tr>
     <td style="text-align: right">
            CategoryID</td>
        <td style="text-align: left;" >
            <asp:DropDownList ID="DropDownList1" runat="server"  Width="150px"
                DataSourceID="SqlDataSource1" DataTextField="CategoryName"  AppendDataBoundItems="true"
                DataValueField="CategoryID" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" >
                <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conn %>" 
                SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CategoryMaster]" >
            </asp:SqlDataSource>
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
            <asp:TextBox ID="TextBox4" runat="server"  ValidationGroup="v2"
                 ></asp:TextBox>
           
  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
             ControlToValidate="TextBox4" ErrorMessage="Enter DP." 
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
            <td style="text-align: right">IGST</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtIGST" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                    ControlToValidate="txtIGST" ErrorMessage="Add IGST"
                    ValidationGroup="v2" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    <tr>
        <td style="text-align: right">
            Vat</td>
        <td style="text-align: left">
            <asp:TextBox ID="TextBox5" runat="server"  ValidationGroup="v2"
                 ></asp:TextBox>
           
  
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
             ControlToValidate="TextBox5" ErrorMessage="Enter Vat." 
             style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>
   
  
        </td>
    </tr>
        <tr>
            <td style="text-align: right">CashBack</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtcashback" runat="server" ValidationGroup="v2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtcashback" ErrorMessage="Enter CashBack."
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>

            </td>
        </tr>

        <tr>
            <td style="text-align: right">CashBackMonth</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtmonth" runat="server" ValidationGroup="v2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtmonth" ErrorMessage="Enter Month."
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>

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
            <td style="text-align: right">Redemtion Points</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtredemption" runat="server" ValidationGroup="v2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtredemption" ErrorMessage="Enter Redemtion Points."
                    Style="color: #FF0000" ValidationGroup="v2"></asp:RequiredFieldValidator>

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
