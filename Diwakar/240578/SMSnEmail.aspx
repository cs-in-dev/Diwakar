<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SMSnEmail.aspx.cs" MasterPageFile="~/240578/AdminMasterPage.master"
    Inherits="SMSEmail" %>
    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div style="font-weight: 700">

            <table>
                
                <tr>
                    <td>
                        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                             Width="690px">
                            <ajaxToolkit:TabPanel runat="server" HeaderText="Email" ID="TabPanel1">
                                <ContentTemplate>
                                    <br />
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="Type" runat="server" AutoPostBack="True" 
                                                    RepeatDirection="Horizontal" 
                                                    onselectedindexchanged="Type_SelectedIndexChanged" 
                                                    style="font-size: xx-small; color: #000000">
                                                    <asp:ListItem Value="">Select ALL</asp:ListItem>
                                                   <%-- <asp:ListItem Value="">Unselect All </asp:ListItem>--%>
                                                </asp:RadioButtonList>

                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                Enter Emails</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="EmailTO" runat="server" Height="100px" TextMode="MultiLine" 
                                                    Width="600px" CssClass="style3"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                Enter Subject</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="EmailSubject" runat="server" Width="600px" CssClass="style2"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                Enter Message</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <cc1:Editor ID="EmailBody" runat="server" Height="200px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                Attachments</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="style2" />
                                                &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                                    Text="Upload" CssClass="style2" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="5" 
                                                    RepeatDirection="Horizontal" style="font-size: x-small; color: #000000">
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="SendEmail" runat="server" onclick="SendEmail_Click" 
                                                    Text="Send Emails" CssClass="style2" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="SMS">
                            <ContentTemplate>
                                    <br />
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                                    RepeatDirection="Horizontal" 
                                                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                                                    style="font-size: xx-small; color: #000000">
                                                  
                                                    <asp:ListItem Value="U">Select All </asp:ListItem>
                                                   <%-- <asp:ListItem Value="U">Unselect All Users</asp:ListItem>--%>
                                                </asp:RadioButtonList>

                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style6">
                                                <span class="style5">Ent</span><span class="style4">er Mobile No(s)</span></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="Mobiles" runat="server" Height="100px" TextMode="MultiLine" 
                                                    Width="600px" CssClass="style3"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                Enter Message</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="Message" runat="server" Height="100px" TextMode="MultiLine" 
                                                    Width="600px" CssClass="style3"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style3">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="SendSMS" runat="server" onclick="SendSMS_Click" 
                                                    Text="Send SMS" CssClass="style6" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                        </ajaxToolkit:TabContainer>
                    </td>
                </tr>
            </table>

        </div>
    </center>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
                        
    .style3
    {
        font-size: x-small;
        color: #000000;
    }
    .style4
    {
        color: #000000;
        font-size: x-small;
    }
    .style5
    {
        color: #000000;
    }
    .style6
    {
        font-size: x-small;
    }
                        
    </style>
</asp:Content>
