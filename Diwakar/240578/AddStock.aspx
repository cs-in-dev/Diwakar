<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="AddStock.aspx.cs" Inherits="GWG.AddStock" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .style2
        {
            color: #CC00CC;
            font-size: Large;
            
        }
        .style3
        {
            font-size: small;
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
<center style="color: #9900CC">
    <span class="style2">Add Stock</span>
</center>
</div>
<hr />
<div>
<center>
<table style="width: 588px">
<tr>
<td style="text-align: right;">
    Store Name</td>
<td style="text-align:left;">
   <asp:DropDownList ID="drpStore" runat="server"  AppendDataBoundItems="True">
      <asp:ListItem Text="Company" Value="1"></asp:ListItem>
        </asp:DropDownList>
   
    </td>
</tr>
<tr>
            <td style="text-align:right;">
                Product Code</td>
            <td class="style20">
                </td>
            <td style="text-align:left;">
                Product Name</td>
            
        </tr>
<tr>
            <td class="style17" style="text-align: right;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="ProductCode" runat="server"  
    Width="200px" AutoPostBack="True" ontextchanged="ProductCode_TextChanged"></asp:TextBox>
                        <asp:HiddenField ID="PID" runat="server" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ProductCode" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>                  
    <asp:AutoCompleteExtender ServiceMethod="GetProductCodeList" 
    MinimumPrefixLength="1"
    CompletionInterval="0" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="ProductCode"
    ID="autoCompleteExtender1" runat="server" FirstRowSelected = "false">
</asp:AutoCompleteExtender>
                    </ContentTemplate>
                     <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style17" style="text-align: center;">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img alt="" class="style19" src="images/busy.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
            <td class="style17" style="text-align: left;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="ProductName" runat="server" 
    Width="200px" AutoPostBack="True" ontextchanged="ProductName_TextChanged"></asp:TextBox>
     <asp:AutoCompleteExtender ServiceMethod="GetProductNameList" 
    MinimumPrefixLength="1"
    CompletionInterval="0" EnableCaching="false" CompletionSetCount="10" 
    TargetControlID="ProductName"
    ID="autoCompleteExtender2" runat="server" FirstRowSelected = "false">
</asp:AutoCompleteExtender>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td class="style17" style="text-align: center;">
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <img alt="" class="style19" src="images/busy.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
      </tr>
    
    <tr>
            <td style="text-align: right;">
                Inward No</td>
            <td class="style20">
                </td>
            <td style="text-align: left;">
                Time In</td>
            
        </tr>

        <tr>
            <td class="style17" style="text-align: right;">
                
                        <asp:TextBox ID="txtInwardNo" runat="server"  
    Width="200px"></asp:TextBox>  
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtInwardNo" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>                  
   
            </td>
            <td class="style17" style="text-align: left">
                
            </td>
            <td class="style17" style="text-align: left;">
               
                        <asp:TextBox ID="txtTimeIn" runat="server"  Width="200px" ></asp:TextBox> 
                          <%--<asp:RequiredFieldValidator ID="rgv2" runat="server" ControlToValidate="txtTimeIn" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>                      
                
            </td>
            <td class="style17" style="text-align: left">
              
            </td>
      </tr>

       <tr>
            <td style="text-align: right;">
                Vat %</td>
            <td class="style20">
                </td>
            <td style="text-align: left;">
                Company Name</td>
            
        </tr>

        <tr>
            <td class="style17" style="text-align: right;">               
                        <asp:TextBox ID="txtVehicleNo" runat="server"  Width="200px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtVehicleNo" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>                             
   
            </td>
            <td class="style17" style="text-align: left">
                
            </td>
            <td class="style17" style="text-align: left">
                
                        <asp:TextBox ID="txtCompanyName" runat="server"  Width="200px" ></asp:TextBox>   
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator> 
                    
            </td>
            <td class="style17" style="text-align: left">
              
            </td>
      </tr>


        <tr>
            <td class="style17" style="text-align: right;">               
               Addional Vat %</td>
            <td class="style17" style="text-align: center;">
                
                &nbsp;</td>
            <td class="style17" style="text-align: left;">
                
                Rate</td>
            <td class="style17" style="text-align: center;">
              
                &nbsp;</td>
      </tr>


        <tr>
            <td class="style17" style="text-align: right;">               
                        <asp:TextBox ID="txtDriversName" runat="server"  Width="200px" ></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txtDriversName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>   </td>
            <td class="style17" style="text-align: left">
                
                &nbsp;</td>
            <td class="style17" style="text-align: left">
                
                       <asp:TextBox ID="txtrate" runat="server"  Width="200px" ></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtrate" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>  </td>
            <td class="style17" style="text-align: left">
              
                &nbsp;</td>
      </tr>


       <tr>
            <td style="text-align: right;">
                Invoice No</td>
            <td class="style20">
                </td>
            <td class="style20">
                
   Product Qty</td>
            
        </tr>

        <tr>
            <td class="style17" style="text-align: right;">               
                        <asp:TextBox ID="txtDCNo" runat="server"  
    Width="200px"></asp:TextBox>    
    <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtDCNo" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>               
   
            </td>
            <td class="style17" style="text-align: left">
                
            </td>
            <td class="style17" style="text-align: left">
                
            <asp:TextBox ID="txtQty" runat="server" Width="201px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQty" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>            
                    
            </td>
            <td class="style17" style="text-align: left">
              
            </td>
      </tr>


        <tr>
            <td class="style17" style="text-align: left">               
                        &nbsp;</td>
            <td class="style17" style="text-align: left">
                
                &nbsp;</td>
            <td class="style17" style="text-align: left">
                
                Bill
                
                Date</td>
            <td class="style17" style="text-align: left">
              
                &nbsp;</td>
      </tr>


        <tr>
            <td class="style17" style="text-align: left">               
                &nbsp;</td>
            <td class="style17" style="text-align: left">
                
                
            </td>
            <td class="style17" style="text-align: left">
                
                        <asp:TextBox ID="txtdates" runat="server" CssClass="style7" Width="201px"></asp:TextBox>
                     <asp:CalendarExtender ID="cc2" runat="server" Format="dd-MM-yyyy" TargetControlID="txtdates"></asp:CalendarExtender>
            <td class="style17" style="text-align: left">
              
                &nbsp;</td>
      </tr>


<tr>
<td style="text-align: right;" >
    Amount</td>
      <td class="style17" style="text-align: center">
            <asp:TextBox ID="TextBox1" runat="server"  Width="200px" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDriversName" ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>    </td>
</tr>


<tr>
<td style="text-align: right;">
 Current Balance</td>
      <td class="style17" style="text-align: center">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblClossingQty" runat="server" Width="50px" ReadOnly="True"></asp:Label>
                    </ContentTemplate>
                     <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ProductName" EventName="TextChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ProductCode" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
</tr>


<tr>
<td >
    &nbsp;</td>
<td style="text-align:left;">
<%--<asp:TextBox ID="txtQty" runat="server" Width="150 px"></asp:TextBox>--%>
</td>
</tr>
<tr>
<td colspan="2">
<asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
</td>
<td style="text-align:left;">
<asp:Button runat ="server" ID="btnAdd" Width ="90 px" BackColor="DarkKhaki" 
        Text="Add Stock" onclick="btnAdd_Click" style="height: 26px" />
</td>
</tr>
</table>
</center>
</div>
<div>
</div>
</asp:Content>
