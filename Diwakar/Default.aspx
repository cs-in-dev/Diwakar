<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CyraShop.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class=" container" style="margin-top: 5%;">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="login-content  animated bounceIn" data-animation="bounceIn" style="background-color: white; padding: 15px;">
                    <div>
                        <div class="section-title" style="text-align: center;">
                            <a href="Default.aspx">
                                <img src="img/logo.png" style="height: 58px" /></a>
                            <h3>LogIn to your Account</h3>
                            <br />
                        </div>
                        <div class="form-group">
                            <div class="">
                                <%--  <span class="input-group-addon "><i class="fa fa-user" style="width:20px;"></i></span>
                                <input type="text"   id="LoginID" class="form-control" placeholder="Username" />--%>
                               
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server" PlaceHolder="UserCode">
                                     
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox1" ValidationGroup="vg1" Font-Size="24px"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="">
                                <%-- <span class="input-group-addon "><i class="fa fa-key" style="width:20px;"></i></span>
                                <input type="password"   id="Password" class="form-control " placeholder="Password" />--%>
                                
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password" PlaceHolder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBox2" ValidationGroup="vg1" Font-Size="24px"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="">
                            <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-success btn-block green-btn" OnClick="Button1_Click" ValidationGroup="vg1" />
                            <%--    <span id="addTo" class="btn btn-success btn-block green-btn">LogIn&nbsp; <i class="icon-chevron-right"></i></span>--%>
                            <%-- <%--<button type="submit" id="addTo" class="btn btn-success btn-block green-btn">LogIn &nbsp; <i class="icon-chevron-right"></i></button>--%>
                            <%--<asp:Button ID="addTo" runat="server" Text="Login" class="btn btn-success btn-block green-btn" onkeypress="keypress()" />--%>
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

</asp:Content>
