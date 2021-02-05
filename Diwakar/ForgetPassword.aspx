<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Amazewellness.ForgetPassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <%--    <link href="css/login.css" rel="stylesheet" type="text/css"  />
    <div class="page-title-wrapper tpl-image title-margins-large" style="background-color:#f1f1f1;color:#4d4d4d;background-image:url('images/squairy_light2.png');background-repeat:repeat">
				<div class="page-title-inner clearfix">
					<div class="container">
						<div class="container-inner">							
						</div>
					</div>
				</div>
                </div>--%>
    <style>
        .ForgotPassword {
            border-radius: 4px;
            padding: 40px 40px;
            border: 4px solid #000000;
            background: #ffffff;
            -webkit-box-shadow: 0px 39px 61px -36px rgba(148,148,148,1);
            -moz-box-shadow: 0px 39px 61px -36px rgba(148,148,148,1);
            box-shadow: 0px 39px 61px -36px rgba(148,148,148,1);
        }

        @media screen and (max-width: 767px) and (min-width: 240px) {
            .ForgotPassword {
                padding: 20px 20px;
            }
        }

        @media only screen and (min-device-width: 320px) and (max-device-width: 480px) {
            #msrspns {
                margin-top: 45%;
            }

            .form {
                height: 500px;
                border-radius: 4px;
                padding: 20px;
                border: 4px solid #000000;
                background: #ffffff;
                margin: 0px auto;
                width: 100%;
            }

            .reg-form {
                border-radius: 4px;
                padding: 20px;
                border: 4px solid #000000;
                background: #ffffff;
                margin: 0px auto;
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class=" container" style="margin-top:6em;">
    <div class="col-md-4"></div>
        <div class="col-md-4">
                <div class="login-content  animated bounceIn" data-animation="bounceIn" style="background-color:white;padding:15px;">
                    <div>
                        <div class="section-title" style="text-align:center;">
                            <a href="Default.aspx"><img src="img/logo.png"></a>
                            <h3>LogIn to your Account</h3><br>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-user" style="width:20px;"></i></span>
                                <input type="text" id="LoginID" class="form-control" placeholder="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon "><i class="fa fa-key" style="width:20px;"></i></span>
                                <input type="password" id="Password" class="form-control " placeholder="Password">
                            </div>
                        </div>
                        <div class="login-form-action clearfix">

                             <span id="addTo" class="btn btn-success btn-block green-btn">LogIn&nbsp; <i class="icon-chevron-right"></i></span>
                            
                        </div>
                    </div>
                </div>
                <div class="login-form-links link1  animated fadeInLeftBig" data-animation="fadeInLeftBig" data-animation-delay=".2s" style="animation-delay: 0.2s; background-color:white;padding:15px;margin-top:2px;">
                    <h4 class="blue">Don't have an Account?</h4>
                    <span>No worry</span>
                    <a href="Registration.aspx" class="blue">Click Here</a>
                    <span>to Register</span>
                </div>
                <div class="login-form-links link2  animated fadeInRightBig" data-animation="fadeInRightBig" data-animation-delay=".4s" style="animation-delay: 0.4s; background-color:white;padding:15px;margin-top:2px;">
                    <h4 class="green">Forgot your Password?</h4>
                    <span>Dont worry</span>
                    <a href="#" class="green">Click Here</a>
                    <span>to Get New One</span>
                </div>
            </div>
    <div class="col-md-4"></div>
        </div>






    <div class="full" style="background: #f7f7f7;">
        <div class="row">
            <div class="medium-6 medium-centered large-4 large-centered columns">
                <div class="ForgotPassword">
                    <div class="alt mod modSectionHeader" data-connectors="1">
                        <div class="special-title centered-text">
                            <h2 style="">Forgot Password
                            </h2>
                        </div>
                    </div>

                    <p>
                        <strong>Member ID :</strong>
                        <asp:TextBox ID="TextBox1" runat="server" PlaceHolder="AM UserCode"></asp:TextBox>
                    </p>

                    <div class="submit">
                        <asp:Button ID="Button1" runat="server" class="button white" Text="Login" OnClick="Button1_Click" ValidationGroup="vglgn" />
                    </div>

                </div>
            </div>
        </div>
        <div class="four spacing"></div>
    </div>


    <div class="content">
        <div class="container">
            <div class="container-inner">
                <br />

                <section class="container1s">


                    <div class="login-help">
                    </div>
                </section>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
