<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CyraShop.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Diwakar Retails</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link href="css/preview.css" rel="stylesheet" />
    <link href="img/favicon.png" rel="icon" type="image/png" />
    <style>
        .container {
            margin-right: auto;
            margin-left: auto;
            padding-left: 0px;
            padding-right: 0px;
        }

        .form-control {
            display: block;
            width: 100%;
            height: 40px;
        }

        .btn {
            display: inline-block;
            padding: 10px 12px;
            margin-bottom: 0;
            font-size: 16px;
        }
        .form-group{
            margin-bottom:0 !important;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
        <div class=" container" style="margin-top: 5%;">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="login-content  animated bounceIn" data-animation="bounceIn">
                    <div>
                        <div class="section-title" style="text-align: center;">
                            <a href="Default.aspx">
                                <img src="img/logo.png" style="height: 58px" /></a>
                            <h3>LogIn to your Account</h3>
                            <br />
                        </div>
                        <div class="form-group">
                            <div class="">
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server" PlaceHolder="UserCode">
                                     
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox1" ValidationGroup="vg1" Font-Size="24px"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="">
                                
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password" PlaceHolder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox2" ValidationGroup="vg1" Font-Size="24px"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="">
                            <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-success btn-block green-btn" OnClick="Button1_Click" ValidationGroup="vg1" />
                          
                        </div>
                    </div>
                </div>
                <div class="login-form-links link1  animated fadeInLeftBig" data-animation="fadeInLeftBig" data-animation-delay=".2s" style="animation-delay: 0.2s; background-color: white; padding: 15px; margin-top: 2px;">
                    <h4 class="blue">Don't have an Account?</h4>
                    <span>No worry</span>
                    <a href="Registration.aspx" class="blue">Click Here</a>
                    <span>to Register</span>
                </div>
                <div class="login-form-links link2  animated fadeInRightBig" data-animation="fadeInRightBig" data-animation-delay=".4s" style="animation-delay: 0.4s; background-color: white; padding: 15px; margin-top: 2px;">
                    <h4 class="green">Forgot your Password?</h4>
                    <span>Dont worry</span>
                    <a href="ForgotPassword.aspx" class="green">Click Here</a>
                    <span>to Get New One</span>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </form>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script type="text/javascript">
        //$(document).keypress(function (event) {
        //    var keycode = (event.keyCode ? event.keyCode : event.which);
        //    if (event.keycode == 13) {
        //        $('#addTo').click();
        //    }
        //})
        $(document).keypress(function (e) {
            if (e.which == 13) {
                $('#addTo').click();
                // enter pressed
            }
        });

    </script>
   
</body>
</html>
