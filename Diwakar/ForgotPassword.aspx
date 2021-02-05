<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CyraShop.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Diwakar Retails</title>
 <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
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
    </style>
</head>
<body style="background-color: #00b050;">
    <form id="form1" runat="server">
    <div>
<div class=" container" style="margin-top:5%;">
    <div class="col-md-4"></div>
        <div class="col-md-4">
                <div class="login-content  animated bounceIn" data-animation="bounceIn" style="background-color:white;padding:15px;">
                    <div>
                        <div class="section-title" style="text-align:center;">
                            <a href="Default.aspx"><img src="img/logo.png"></a>
                            <h3>Forgot Password</h3><br>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-user" style="width:20px;"></i></span>
                                <%--<input type="text" id="LoginID" class="form-control" placeholder="Memberid">--%>
                                   <asp:TextBox ID="TextBox1" runat="server" class="form-control" PlaceHolder="UserCode"></asp:TextBox>
                            </div>
                        </div>
                       <%-- <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-key" style="width:20px;"></i></span>
                                <input type="password" id="Password" class="form-control " placeholder="Password">
                            </div>
                        </div>--%>
                        <div class="login-form-action clearfix">

                            <%-- <span id="addTo" class="btn btn-success btn-block green-btn">Submit&nbsp; <i class="icon-chevron-right"></i></span>--%>
                             <asp:Button ID="Button1" runat="server"  class="btn btn-success btn-block green-btn" Text="Submit" OnClick="Button1_Click" ValidationGroup="vglgn" />
                            
                        </div>
                    </div>
                </div>
            </div>
    <div class="col-md-4"></div>
        </div>    
    </div>
    </form>
</body>
</html>
