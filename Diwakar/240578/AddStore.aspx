<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStore.aspx.cs" Inherits="mmart2.Super19111973.AddStore" MasterPageFile ="~/240578/AdminMasterPage.master"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div>
        <div>
            <div>
            
                <asp:Panel ID="PinPannel" runat="server" Width="810px" CssClass="style28">
                    <table width="100%">
                        <tr>
                           <td class="style9">Add Franchise </td>
                        </tr>
                        
                    </table>
                    <table class="style13">
                        <%--<tr>
                            <td align="center" style="color:white">
                                <a href="ePinPay.aspx" style="color: #FFFFFF"> <strong>CLICK HERE TO PURCHASE AN EPIN ONLINE</strong></a></td>
                        </tr>--%>
                    </table>
                </asp:Panel>
            </div>
            <div>
            </div>
            <div>
             <asp:Panel ID="InformationPanel" runat="server" Style="margin-top: 0px" 
                    Width="816px" CssClass="style28">
                 <center>                            <table class="style20">
                                <tr>
                                    <td align="center" colspan="3" style="text-align: left">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <table class="style3">
                                            <tr>
                                                <td align="right" class="style32">
                                                    </td>
                                                <td align="right" class="style33">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="center" style="text-align: left">&nbsp;</td>
                                </tr>
                               <%-- <tr>
                                    <td class="style25">
                                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Transaction Password:"
                                            ></asp:Label>
                                        *
                                    </td>
                                    <td class="style26">
                                        <asp:TextBox ID="txtTransectionPassword" runat="server" ValidationGroup="vg3" TextMode="Password"
                                            Height="23px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTransectionPassword"
                                            ErrorMessage="*" ValidationGroup="vg3" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style27">
                                        Re-enter Trans Password:*</td>
                                    <td class="style25">
                                        <asp:TextBox ID="txtLoginPass1" runat="server" Height="23px" TextMode="Password"
                                            ValidationGroup="vg3"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtLoginPass1"
                                            ControlToValidate="txtTransectionPassword" ErrorMessage="*" ValidationGroup="vg3"
                                            ForeColor="Red"></asp:CompareValidator>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td align="left" colspan="3">
                                        <asp:Label ID="lblPersonalDetails" runat="server" Style="color: Red; font-weight: 700"
                                            Text="Franchise Details"></asp:Label>
                                    </td>
                                    <td align="left">&nbsp;</td>
                                </tr>

                                 <tr>
                                    <td class="style31" style="text-align:right;">
                                        Franchise Type</td>
                                    <td class="auto-style1">
                                        <%--<asp:TextBox ID="txtname" runat="server" ValidationGroup="vg3" Height="22px" 
                                            MaxLength="200" Width="200px"></asp:TextBox>--%>
                                        &nbsp;<asp:DropDownList ID="ddlBranchtype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranchtype_SelectedIndexChanged" ValidationGroup="vg3">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>District Franchise</asp:ListItem>
                                            <asp:ListItem>Master Franchise</asp:ListItem>
                                            <asp:ListItem>Mini Franchise</asp:ListItem>
                                            <asp:ListItem>Leader Franchise</asp:ListItem>
                                           <%-- <asp:ListItem>Franchise</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranchtype" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" InitialValue="Select" Font-Size="19px"></asp:RequiredFieldValidator>
                                     </td>
                                     <%--<td class="style31" style="width:350px;">
                                         <asp:Label ID="lblamount" runat="server" Text="Please Select Profit Percentage"></asp:Label>
                                         <asp:DropDownList ID="ddldist" runat="server"  ValidationGroup="vg3" AutoPostBack="True" OnSelectedIndexChanged="ddlBranchtype_SelectedIndexChanged">
                                            <asp:ListItem>Select</asp:ListItem>
                                             <asp:ListItem Value="8">8%</asp:ListItem>
                                        </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddldist" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" InitialValue="Select" Font-Size="19px"></asp:RequiredFieldValidator>


                                          <asp:DropDownList ID="ddlmaster" runat="server"  ValidationGroup="vg3" AutoPostBack="True" OnSelectedIndexChanged="ddlBranchtype_SelectedIndexChanged">
                                              <asp:ListItem>Select</asp:ListItem>
                                              <asp:ListItem Value="6">6%</asp:ListItem>
                                        </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlmaster" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" InitialValue="Select" Font-Size="19px"></asp:RequiredFieldValidator>
                               
                                                   
                                         <asp:DropDownList ID="ddlmini" runat="server"  ValidationGroup="vg3" AutoPostBack="True" OnSelectedIndexChanged="ddlBranchtype_SelectedIndexChanged">
                                              <asp:ListItem>Select</asp:ListItem>
                                              <asp:ListItem Value="4">4%</asp:ListItem>
                                         </asp:DropDownList>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlmini" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" InitialValue="Select" Font-Size="19px"></asp:RequiredFieldValidator>
                                        
                                          <asp:DropDownList ID="ddlLeader" runat="server"  ValidationGroup="vg3" AutoPostBack="True" OnSelectedIndexChanged="ddlBranchtype_SelectedIndexChanged">
                                              <asp:ListItem>Select</asp:ListItem>
                                              <asp:ListItem Value="2">2%</asp:ListItem>
                                        </asp:DropDownList>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlLeader" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" InitialValue="Select" Font-Size="19px"></asp:RequiredFieldValidator>
                                     </td>--%>
                                     
                                     
                                    
                                </tr>

                                <tr>
                                    <td class="style31" style="text-align:right;"><asp:Label ID="lblparent" runat="server" Text="Parent Franchise ID * "></asp:Label></td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtparent" runat="server" AutoPostBack="True" OnTextChanged="txtparent_TextChanged" Width="192px" ></asp:TextBox>
                                        <asp:Label ID="lblParenterror" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtparent" ValidationGroup="vg3" Font-Size="19px"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td class="style31" style="text-align:right;">Franchise Name * </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtfname" runat="server" Width="196px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtfname" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" Font-Size="19px"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style31" style="text-align:right;">Contact Name *</td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtcname" runat="server" Width="201px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtcname" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" Font-Size="19px"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style31" style="text-align:right;">
                                        <asp:Label ID="lblPassword" runat="server" Text="Login Password"></asp:Label>
                                        :*</td>
                                    <td class="auto-style1"> 
                                        <asp:TextBox ID="txtPassword" runat="server" Height="22px" MaxLength="200" placeholder="Enter Password" TextMode="Password" ValidationGroup="vg3" Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="vg3" Font-Size="19px"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td class="style31" style="text-align:right;">
                                        <asp:Label ID="lblname0" runat="server" Text="Address"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtAddress" runat="server" Height="22px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td class="style31" style="text-align:right;">
                                        City</td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtCity" runat="server" Height="22px" MaxLength="200" ValidationGroup="vg3" Width="200px"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>

                                 <tr>
                                     <td class="style31" style="text-align:right;">
                                         <asp:Label ID="Label2" runat="server" Text="State"></asp:Label>
                                     </td>
                                     <td class="auto-style1">
                                         <asp:TextBox ID="txtState" runat="server" Height="22px" Width="200px"></asp:TextBox>
                                     </td>
                                     <td class="style31">
                                         &nbsp;</td>
                                     <td class="style31">&nbsp;</td>
                                </tr>

                                 <tr>
                                    <td class="style31" style="text-align:right;">
                                        Country</td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtCountry" runat="server" Height="22px" MaxLength="200" ValidationGroup="vg3" Width="200px"></asp:TextBox>
                                     </td>
                                     <td class="style31">
                                         &nbsp;</td>
                                     <td class="style31">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td class="style31" style="text-align:right;">
                                        <asp:Label ID="lblAddress" runat="server" Text="Email"></asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtEmail" runat="server" Height="22px" MaxLength="200" ValidationGroup="vg3" Width="200px">
                                    
                                        </asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style31" style="text-align:right;">
                                         Mobile No                                       
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="txtMobileNo" runat="server" Height="22px" ValidationGroup="vg3" Width="200px"></asp:TextBox>
                                    </td>
                                    <td class="style31">
                                        &nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>
                       

                                <tr>
                                    <td class="style31">&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                    <td class="style31">&nbsp;</td>
                                </tr>
                       

                                <tr>
                                    <td align="center" colspan="3">
                                        
                                        <asp:Label ID="lblMessage" runat="server" Style="color: #FF3300; font-weight: 700;"></asp:Label>
                                    </td>
                                    <td align="center">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="3">
                                        
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="vg3"
                                            CssClass="button" Height="26px" onclick="btnSubmit_Click" />
                                        
                                    </td>
                                    <td align="center">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="3">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            style="color: #FF0000; font-weight: 700" />
                                        &nbsp;
                                    </td>
                                    <td align="center">&nbsp;</td>
                                </tr>
                            </table></center>

                            <br />
                        </asp:Panel>
                <asp:Panel ID="SuccessPanel" runat="server" Visible="False">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </asp:Panel>
                        <div>
                      <%--  <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="ID" DataSourceID="SqlDataSource1" >
                            <Columns>                              
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                             
                                <asp:BoundField DataField="StoreName" HeaderText="StoreName" 
                                    SortExpression="StoreName" />
                                <asp:BoundField DataField="StoreAddress" HeaderText="StoreAddress" 
                                    SortExpression="StoreAddress" />
                                <asp:BoundField DataField="StoreContact" HeaderText="StoreContact" 
                                    SortExpression="StoreContact" />
                                <asp:BoundField DataField="StoreEmail" HeaderText="StoreEmail"  
                                    SortExpression="StoreEmail" />
                                
                            </Columns>
                            </asp:GridView>
                        
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:conn %>" 
                                DeleteCommand="DELETE FROM [StoreMaster] WHERE [ID] = @ID" 
                                InsertCommand="INSERT INTO [StoreMaster]  [StoreName], [StoreAddress], [StoreContact], [StoreEmail]) VALUES (@StoreCode, @StoreName, @StoreAddress, @StoreContact, @StoreLoginID, @StorePassword)" 
                                SelectCommand="SELECT * FROM [StoreMaster]" 
                                UpdateCommand="UPDATE [StoreMaster] SET  [StoreName] = @StoreName, [StoreAddress] = @StoreAddress, [StoreContact] = @StoreContact ,StoreEmail=@StoreEmail,RLimit=@RLimit WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                  
                                    <asp:Parameter Name="StoreName" Type="String" />
                                    <asp:Parameter Name="StoreAddress" Type="String" />
                                    <asp:Parameter Name="StoreContact" Type="String" />
                                    <asp:Parameter Name="StoreEmail" Type="String" />
    
                                </InsertParameters>
                                <UpdateParameters>
                                     <asp:Parameter Name="StoreName" Type="String" />
                                      <asp:Parameter Name="RLimit"   />
                                    <asp:Parameter Name="StoreAddress" Type="String" />
                                    <asp:Parameter Name="StoreContact" Type="String" />
                                    <asp:Parameter Name="StoreEmail" Type="String" />
                                    <asp:Parameter Name="ID" Type="Int64" />
                                </UpdateParameters>
                            </asp:SqlDataSource>--%>
                        
                        </div>
            </div>
            <div>
             
              
            </div>
    </div>
    </div>
    </center>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <title></title>
    <script type="text/javascript" language="JavaScript1.2">

        if (document.all) {
            document.onkeydown = function () {
                var key_f5 = 116; // 116 = F5 

                if (key_f5 == event.keyCode) {
                    event.keyCode = 27;

                    return false;
                }
            }
        }

    </script>
    <%--<script type="text/javascript">
        function DisableButtons() {
            var inputs = document.getElementsByTagName("INPUT");
            for (var i in inputs) {
                if (inputs[i].type == "button" || inputs[i].type == "submit") {
                    inputs[i].disabled = true;
                    inputs[i].value = "processing..";
                }
            }
        }
        window.onbeforeunload = DisableButtons; //uncomment to use this script.
    </script>--%>
    <style type="text/css">
        .style9
        {
            color: #FF0000;
            font-size: large;
            text-align: center;
        }
        .style13
    {
        width: 806px;
    }
        .style20
        {
            width: 816px;
        }
        .style28
        {
            font-family: "Century Gothic";
        }
        .style29
        {
            width: 203px;
            text-align: left;
        }
        .style31
        {
            width: 204px;
            text-align: left;
        }
        .button
        {
        }
        .style3
        {
            width: 812px;
        }
        .style32
        {
            text-align: right;
            width: 405px;
        }
        .style33
        {
            width: 405px;
            text-align: left;
            color: #993333;
            font-weight: 700;
        }
        .style41
        {
            width: 217px;
        }
        .auto-style1 {
            width: 142px;
            text-align: left;
        }
        </style>
</asp:Content>

