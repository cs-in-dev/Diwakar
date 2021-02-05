<%@ Page Language="C#" AutoEventWireup="true" Inherits="admin_Default" Codebehind="Default.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 31%;
            margin-left: 0px;
        }
        .style2
        {
            width: 548px;
        }
        .style3
        {
            width: 425px;
        }
        .style4
        {
            text-align: center;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
    <div>
        <div class="style4">
    <br />
    <br /><br /><br />
    <strong>&nbsp;<h1>Welcome to Admin Panel</h1></strong><br /><br />
        </div>
        
        <table align="center" bgcolor="" width="45%" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">

                    <asp:Login ID="Login1" runat="server" Width="700px" Height="150px" BackColor="#EFF3FB" BorderColor="#B5C7DE" 
                        BorderPadding="8" BorderStyle="Solid" BorderWidth="2px" 
                        DestinationPageUrl="~/240578/AdminHome.aspx" Font-Names="Times New Roman" 
                        Font-Size="14px" ForeColor="#333333" 
                        Font-Bold="True" LoginButtonText="Submit" TitleText="Admin Login " PasswordLabelText="Password" UserNameLabelText="Login Name" OnLoggedIn="Login1_LoggedIn">
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                        <TextBoxStyle Font-Size="0.8em" />
                        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" 
                            ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />                                             
                    </asp:Login>                    
&nbsp;</td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
