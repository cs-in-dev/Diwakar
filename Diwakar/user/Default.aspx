<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Starlinenetworking.User.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat='server'>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>Welcome to
        <%=ConfigurationManager.AppSettings["CoName"].ToString()%>
        (User Panel)</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form2" runat="server">
    <!-- Header -->
    <div id="header">
        <div class="shell">
            <!-- Logo + Top Nav -->
            
            <!-- End Logo + Top Nav -->
            <!-- Main Nav -->
        </div>
    </div>
    <div class="menu-width">
        <div style="width: 75%; height: 30px; padding-left: 160px;">
            <!-- Main Nav -->
            
            <!-- End Main Nav -->
            <!-- Container -->
            <div id="container">
            <center>
                <div style="width: 350px; height: 279px">
                    <!-- Small Nav -->
                    <!-- End Small Nav -->
                    <!-- Message OK -->
                    <!-- End Message OK -->
                    <!-- Message Error -->
                    <!-- End Message Error -->
                    <!-- Main -->
                    <div id="main">
                        <div class="cl">
                            &nbsp;
                            
                        </div>
                        <!-- Content -->
                        <div style="width:350px;" >
                            <!-- Box -->
                            <div class="box">
                                <!-- Box Head -->
                                <div class="box-head">
                                    
                                    Login</div>
                                <!-- End Box Head -->
                                <!-- Table -->
                                <div class="table">
                                    
                                           <table class="style26" align="center">
     <tr>
<td>
<table align="center" style="height: 171px; width: 112%">


    
<tr>
<td colspan="2"><br /></td>
</tr>
                <tr>
                    <td class="style28" align="left">
                                    <asp:Label ID="lblLoginName" runat="server" CssClass="text" Text="Subscriber ID :" 
                                        style="color: #000000"></asp:Label>
                                </td>
                    <td align="left">
                                    <asp:TextBox ID="txtLoginName1" runat="server" CssClass="controls" 
                                        MaxLength="50" style="color: #000000"></asp:TextBox>
                                </td>
                </tr>
                <tr>
                    <td class="style28" align="left">
                                    <asp:Label ID="lblPassword" runat="server" CssClass="text" Text="Password :" 
                                        style="color: #000000"></asp:Label>
                                </td>
                    <td align="left">
                                    <asp:TextBox ID="txtPassword1" runat="server" CssClass="controls" 
                                        MaxLength="10" TextMode="Password" style="color: #000000"></asp:TextBox>
                                </td>
                </tr>
                <tr>
                    <td class="style27" colspan="2">
                                    <asp:Label ID="lblMessageBox1" runat="server" 
                                        Style="font-weight: bold; text-align: center; color: #FF3300;" 
                            CssClass="style26"></asp:Label>
                                </td>
                </tr>
                <tr><td></td>
                    <td class="style27" align="left">
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                            style="text-align: center" Text="Login" />
                    </td>
                </tr>
                <tr><td colspan="2"><a href="ForgotPassword.aspx">Forgot Password? Click here</a></td>
                </tr>
                </table>
</td>
</tr>

            </table>
                                        </div>
                                    </div>
                                    <!-- Pagging -->
                                </div>
                                <!-- Table -->
                            </div>
                            <!-- End Box -->
                            <!-- Box -->
                            <!-- End Box -->
                        </div>
            </center>
                        <!-- End Content -->
                        <!-- Sidebar -->
                        <!-- End Sidebar -->
                        &nbsp;</div>
                </div>
                <!-- Main -->
            </div>
        </div>
        <!-- End Container -->
        <!-- Footer -->
        <!-- End Footer -->
    </form>
</body>
</html>
