<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="GyanTechnologies._240578.Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <style>
        .text-left {
            text-align: left !important;
        }

        th, td {
            padding: 5px 20px !important;
        }

        .ajax__calendar_container TD {
            padding: 0px !important;
            margin: 0px !important;
            font-size: 11px;
        }
    </style>




    <script type="text/javascript">

        $(document).ready(function () {


            if ($('#<% = txtsponserid.ClientID%>').val() != '') {
                SponserID();

            }

        });

    </script>

    <script type="text/javascript">
        $(document).on('click', 'span.snlogin', function () {


         <%--   $('#<% = txtpin.ClientID%>').removeAttr('style');--%>
            $('#<% = txtsponserid.ClientID%>').removeAttr('style');
            $('#<% = TextBox1.ClientID%>').removeAttr('style');

         <%--   $('#<% = Position.ClientID%>').removeAttr('style');--%>

            $('#<% = txtLoginPassword.ClientID%>').removeAttr('style');
            $('#<% = txtReenterLogin.ClientID%>').removeAttr('style');
            $('#<% = txtFirstName.ClientID%>').removeAttr('style');
            $('#<% = txtLastName.ClientID%>').removeAttr('style');
            $('#<% = txtFatherHusband.ClientID%>').removeAttr('style');
            $('#<% = txtDateofBirth.ClientID%>').removeAttr('style');
            $('#<% = txtAddress.ClientID%>').removeAttr('style');
            $('#<% = txtState.ClientID%>').removeAttr('style');

            $('#<% = txtCountry.ClientID%>').removeAttr('style');
            $('#<% = txtDistrict.ClientID%>').removeAttr('style');
            $('#<% = txtPinCode.ClientID%>').removeAttr('style');
            $('#<% = txtMobileNo.ClientID%>').removeAttr('style');
            $('#<% = txtEmailID.ClientID%>').removeAttr('style');
            $('#<% = txtBankName.ClientID%>').removeAttr('style');
            $('#<% = txtAccountNo.ClientID%>').removeAttr('style');
            $('#<% = txtIFSCode.ClientID%>').removeAttr('style');
            $('#<% = txtNomineeFirst.ClientID%>').removeAttr('style');
            $('#<% = txtNomineeLastName.ClientID%>').removeAttr('style');
            $('#<% = txtRelation.ClientID%>').removeAttr('style');
            $('#<% = txtNomineeFatherHusband.ClientID%>').removeAttr('style');


            var Register = {};

           <%-- Register.EnterPin = $('#<% = txtpin.ClientID%>').val();--%>
            Register.sponserid = $('#<% = txtsponserid.ClientID%>').val();
            Register.sponsername = $('#<% = TextBox1.ClientID%>').val();
           <%-- Register.Position = $('#<% = Position.ClientID%>').val();--%>

            Register.LoginPassword = $('#<% = txtLoginPassword.ClientID%>').val();
            Register.ReloginPassword = $('#<% = txtReenterLogin.ClientID%>').val();
            Register.FirstName = $('#<% = txtFirstName.ClientID%>').val();
            Register.LastName = $('#<% = txtLastName.ClientID%>').val();
            Register.FatherHusband = $('#<% = txtFatherHusband.ClientID%>').val();
            Register.DateofBirth = $('#<% = txtDateofBirth.ClientID%>').val();
            Register.Address = $('#<% = txtAddress.ClientID%>').val();
            Register.State = $('#<% = txtState.ClientID%>').val();
            Register.Country = $('#<% = txtCountry.ClientID%>').val();
            Register.District = $('#<% = txtDistrict.ClientID%>').val();
            Register.PinCode = $('#<% = txtPinCode.ClientID%>').val();
            Register.MobileNo = $('#<% = txtMobileNo.ClientID%>').val();
            Register.EmailID = $('#<% = txtEmailID.ClientID%>').val();
            Register.BankName = $('#<% = txtBankName.ClientID%>').val();
            Register.AccountNo = $('#<% = txtAccountNo.ClientID%>').val();
            Register.IFSCode = $('#<% = txtIFSCode.ClientID%>').val();
            Register.NomineeFirst = $('#<% = txtNomineeFirst.ClientID%>').val();
            Register.NomineeLastName = $('#<% = txtNomineeLastName.ClientID%>').val();
            Register.Relation = $('#<% = txtRelation.ClientID%>').val();
            Register.NomineeFatherHusband = $('#<% = txtNomineeFatherHusband.ClientID%>').val();

            Register.city = $('#<% =txtcity.ClientID%>').val();
            Register.PANNo = $('#<% = txtPANNo.ClientID%>').val();



           <%-- if (Register.EnterPin == '' || Register.EnterPin == undefined || Register.EnterPin == null) {
                $('#<% = txtpin.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtpin.ClientID%>').focus();
                return;
            }--%>


            if (Register.sponserid == '' || Register.sponserid == undefined || Register.sponserid == null) {
                $('#<% = txtsponserid.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtsponserid.ClientID%>').focus();
                return;
            }
            if (Register.sponsername == '' || Register.sponsername == undefined || Register.sponsername == null) {
                $('#<% = TextBox1.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = TextBox1.ClientID%>').focus();
                return;
            }

           <%-- if (Register.Position == "Please Select" || Register.Position == undefined || Register.Position == null || Register.Position == '' || Register.Position == 'Both Side Filled') {
                $('#<%=Position.ClientID%>').empty();
                $('#<%=Position.ClientID%>').append('<option selected="selected" value="Both Side Filled">Both Side Filled</option>');
                $('#<% = Position.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = Position.ClientID%>').focus();
                return;
            }--%>

            if (Register.LoginPassword == '' || Register.LoginPassword == undefined || Register.LoginPassword == null) {
                $('#<% = txtLoginPassword.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtLoginPassword.ClientID%>').focus();
                return;
            }

            if (Register.LoginPassword != Register.ReloginPassword) {
                $('#<% = txtReenterLogin.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtReenterLogin.ClientID%>').focus();
                return;
            }

            if (Register.FirstName == '' || Register.FirstName == undefined || Register.FirstName == null) {
                $('#<% = txtFirstName.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtFirstName.ClientID%>').focus();
                return;
            }
            if (Register.LastName == '' || Register.LastName == undefined || Register.LastName == null) {
                $('#<% = txtLastName.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtLastName.ClientID%>').focus();
                return;
            }
            if (Register.State == '' || Register.State == undefined || Register.State == null) {
                $('#<% = txtState.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtState.ClientID%>').focus();
                return;
            }
            if (Register.MobileNo == '' || Register.MobileNo == undefined || Register.MobileNo == null) {
                $('#<% = txtMobileNo.ClientID%>').attr('style', 'border:2px solid red;');
                $('#<% = txtMobileNo.ClientID%>').focus();
                return;
            }

            $.ajax({
                type: "POST",

                url: "Registration.aspx/insertrecord",
                data: "{Register: " + JSON.stringify(Register) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var userid = data.d;
                    var password = $('#<% = txtLoginPassword.ClientID%>').val();

                    $('#<% = Panel1.ClientID%>').hide();
                    $('#<% = Panel2.ClientID%>').show();
                    $('#<% = Label1.ClientID%>').text(userid);
                    $('#<% = Label2.ClientID%>').text(password);



                },
                error: function (data) {
                    alert(data.d);
                    alert(data.status);
                    alert(Error);
                }

            });



        });
    </script>

    <script type="text/javascript">

       <%-- function EnterPin() {


            var Register = {};


            Register.EnterPin = $('#<% = txtpin.ClientID%>').val();

            $.ajax({
                type: "POST",
                url: "Registration.aspx/checkpin",
                data: "{EnterPin:'" + Register.EnterPin + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == 'error') {
                        alert('Invalid Pin Please Enter Vaild Pin');
                        $('#<% = txtpin.ClientID%>').val('');
                    }

                    else {
                        alert('Pin is vaild Please Enter Sponser ID');
                    }

                },
                error: function (data) {

                }
            });
        }--%>

        function MobileNo() {


            var Register = {};


            Register.MobileNo = $('#<% = txtMobileNo.ClientID%>').val();

            $.ajax({
                type: "POST",
                url: "Registration.aspx/CheckMobile",
                data: "{MobileNo:'" + Register.MobileNo + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == 'error') {
                        if (Register.MobileNo < 10) {
                           // alert('Valid Mobile Number');
                        }
                        else {
                            alert('Invalid Mobile Number');

                        }
                        $('#<% = txtMobileNo.ClientID%>').val('');
                    }

                    else {
                        //alert('Mobile No is Valid');
                    }

                },
                error: function (data) {

                }
            });
        }


        //function phoneno(){          
        //    var val = MobileNo.value
        //    if (/^\d{10}$/.test(val)) {
        //        // value is ok, use it
        //    } else {
        //        alert("Invalid number; must be ten digits")
        //        number.focus()
        //        return false
        //    }


        function PANNo() {


            var Register = {};


            Register.PANNo = $('#<% = txtPANNo.ClientID%>').val();

            $.ajax({
                type: "POST",
                url: "Registration.aspx/CheckPANNo",
                data: "{PANNo:'" + Register.PANNo + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == 'error') {
                        alert('This PanNo Already Used Please Try With Different PanNo');
                        $('#<% = txtPANNo.ClientID%>').val('');
                    }

                    else {
                      //  alert('PanNo is Valid');
                    }

                },
                error: function (data) {

                }
            });
        }

        function SponserID() {


            var Register = {};


            Register.sponserid = $('#<% = txtsponserid.ClientID%>').val();

            $.ajax({
                type: "POST",
                url: "Registration.aspx/checktxtsponserid",
                data: "{sponserid:'" + Register.sponserid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    var sponsor = data.d;


                    if (sponsor == 'Invaild Sponsorid') {

                        alert('Invaild Sponser ID');
                        $('#<% = txtsponserid.ClientID%>').val('');
                    }
                    else {
                        $('#<% = TextBox1.ClientID%>').val(sponsor);
                       <%--  $('#<%=Position.ClientID%>').append('<option selected="selected" value="Left">Left</option>');
                         $('#<%=Position.ClientID%>').append('<option selected="selected" value="Right">Right</option>');--%>
                    }



                },
                error: function (data) {

                }
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <center>
        <div class="container">
    <asp:Panel ID="Panel1" runat="server" >
  <%--      <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div style="padding: 25px 20px; box-shadow: 0px 0px 10px 0px #f1f1f1; border: 1px solid #e8e8e8;">
         <div class="form-group">
            <label for="usrname"><span class="glyphicon glyphicon-user"></span>&nbsp Enter Pin</label>
            <asp:TextBox ID="txtpin" CssClass="form-control" onchange="EnterPin();" Style="width: 100%;" runat="server" placeholder="Enter Pin"></asp:TextBox>
        </div>
        <div class="form-group">

            <label for="usrname"><span class="glyphicon glyphicon-user"></span>&nbsp Sponser ID</label>
            <asp:TextBox ID="txtsponserid" CssClass="form-control" onchange="SponserID();" Style="width: 100%;" runat="server" placeholder="Sponser ID"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="usrname"><span class="glyphicon glyphicon-user"></span>&nbsp Sponsor Name</label>
            <asp:TextBox ID="TextBox1" CssClass="form-control" ReadOnly="true" Style="width: 100%;" runat="server" placeholder="Sponsor Name"></asp:TextBox>
        </div>
     
        <div class="form-group">
            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Position </label>
            <asp:DropDownList ID="Position" CssClass="form-control" Style="width: 100%;" runat="server">
                <asp:ListItem>Please Select</asp:ListItem>
                 <asp:ListItem>Left</asp:ListItem>
                 <asp:ListItem>Right</asp:ListItem>
            </asp:DropDownList>
            
        </div>

         <div>
              <asp:Label ID="lblright" runat="server" Style="color: red;display:none; width: 100%;padding:10px"></asp:Label><br />
            <asp:Label ID="lblleft" runat="server" Style="color: red; display:none; width: 100%;padding:10px"></asp:Label>
        </div>
                    </div>
</div>
            </div>--%>

        <div>
            <h1>
                <b>Registration</b> 
            </h1>
           
        </div>
        <br />

<div class="form-horizontal" style="padding: 25px 20px; box-shadow: 0px 0px 10px 0px #f1f1f1; border: 1px solid #e8e8e8;">

     <div class="row">
         <div class="col-md-6">
              <div class="form-group">
    <label class="control-label col-sm-6 col-xs-12 text-left" for="psw"><span class="glyphicon glyphicon-user"></span>&nbsp; Sponser ID</label>
    <div class="col-sm-6 col-xs-12 ">
     <asp:TextBox ID="txtsponserid" CssClass="form-control" onchange="SponserID();" Style="width: 100%;" AutoComplete="Off" runat="server" placeholder="Sponser ID"></asp:TextBox>
    </div>
                  </div>
          </div>


          <div class="col-md-6">
              <div class="form-group">
    <label class="control-label col-sm-6 col-xs-12 text-left" for="psw"><span class="glyphicon glyphicon-user"></span>&nbsp; Sponser Name</label>
    <div class="col-sm-6 col-xs-12 ">
     <asp:TextBox ID="TextBox1" CssClass="form-control" AutoComplete="Off" ReadOnly="true" Style="width: 100%;" runat="server" placeholder="Sponsor Name"></asp:TextBox>
    </div>
                  </div>
          </div>

      </div>


      <div class="row">

          <div class="col-md-6">
              <div class="form-group">
    <label class="control-label col-sm-6 col-xs-12 text-left" for="psw"><span class="glyphicon glyphicon-eye-open"></span>&nbsp; Login Password</label>
    <div class="col-sm-6 col-xs-12 ">
    <asp:TextBox ID="txtLoginPassword" AutoComplete="Off" runat="server" CssClass="form-control" placeholder="Login Password" TextMode="Password"></asp:TextBox>
<%--    <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="Password length must be between 6 to 8 characters" ControlToValidate="txtLoginPassword" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,8}$" />--%>
    </div>
                  </div>
          </div>
          <div class="col-md-6">
  <div class="form-group">
    <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp  Re-enter Login Password</label>
    <div class="col-sm-6 col-xs-12">
<asp:TextBox ID="txtReenterLogin" CssClass="form-control" runat="server" TextMode="Password" placeholder="Re-enter Login Password"></asp:TextBox>
    </div>
  </div>
          </div>
      </div>
    
    <div class="row">
        <div class="col-md-6">
  <div class="form-group">
<label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp First Name </label>
    <div class="col-sm-6 col-xs-12">
<asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" placeholder="First Name "></asp:TextBox>
    </div>
  </div>
        </div>
        <div class="col-md-6">
  <div class="form-group">
<label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Last Name</label>
    <div class="col-sm-6 col-xs-12 ">
<asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
    </div>
  </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Father/Husband </label>
                <div class="col-sm-6 col-xs-12 ">
                    <asp:TextBox ID="txtFatherHusband" CssClass="form-control" runat="server" placeholder="Father/Husband "></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Date of Birth</label>
                <div class="col-sm-6 col-xs-12">
                    <asp:TextBox ID="txtDateofBirth" CssClass="form-control" runat="server" placeholder="Date of Birth" Style="padding-left:6px;"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtDateofBirth"></asp:CalendarExtender>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Address</label>
                <div class="col-sm-6 col-xs-12">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp City</label>
                <div class="col-sm-6 col-xs-12">
                    <asp:TextBox ID="txtcity" CssClass="form-control" runat="server" placeholder="City"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp State</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtState" CssClass="form-control" runat="server" placeholder="State"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Country</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtCountry" CssClass="form-control" Text="India" ReadOnly="true" runat="server" placeholder="Country"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp District</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtDistrict" CssClass="form-control" runat="server" placeholder="District"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Pin Code:</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server" placeholder="Pin Code"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="txtPinCode" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Mobile No</label>
                <div class="col-sm-6 col-xs-12">
                    <asp:TextBox ID="txtMobileNo" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No" onchange="MobileNo();"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers" TargetControlID="txtMobileNo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="*" ValidationGroup="vg3" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Invalid Number! Must be ten Digits" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Email ID</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtEmailID" CssClass="form-control" runat="server" placeholder="Email ID"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Bank Name</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtBankName" CssClass="form-control" runat="server" placeholder="Bank Name"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Account No</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtAccountNo" CssClass="form-control" runat="server" placeholder="Account No"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp IFS Code</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtIFSCode" CssClass="form-control" runat="server" placeholder="IFS Code"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp PAN No</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtPANNo" CssClass="form-control" runat="server" placeholder="PAN No" onchange="PANNo();"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Nominee First </label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtNomineeFirst" CssClass="form-control" runat="server" placeholder="Nominee First"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Nominee Last Name</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtNomineeLastName" CssClass="form-control" runat="server" placeholder="Nominee Last Name"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Nominee Relation</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtRelation" CssClass="form-control" runat="server" placeholder="Nominee Relation"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="psw" class="control-label col-sm-6 col-xs-12 text-left"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Nominee Father/Husband</label>
                <div class="col-sm-6 col-xs-12">
                <asp:TextBox ID="txtNomineeFatherHusband" CssClass="form-control" runat="server" placeholder="Nominee Father/Husband"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
</div>

        <div class="checkbox">
            <span class="btn  btn-block snlogin"  style="background-color: #5cb85c;width:250px;  color: white;">

                <span>Submit<br />
                   
                </span></span>
            &nbsp;<%--<label>
                                    <input type="checkbox" value="" checked>Remember me</label>--%></div>

    </asp:Panel>
        </div>

    <asp:Panel ID="Panel2" runat="server"  style="display:none;">
        <a><img src="img/logo.png" style="height: 58px" /></a>
        <div class="form-group">
            Congratulations! You are now an associate with Diwakar Retails
        </div>

        <div class="form-group">
            <label for="psw"><span class="glyphicon glyphicon-user"></span>&nbsp Your MemberId is:</label>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <div class="form-group">
            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>&nbsp Password:</label>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </div>
        <br />
        
         
        <div class="form-group">
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx"  runat="server">Home</asp:HyperLink>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <asp:HyperLink ID="HyperLink2" NavigateUrl="~/login.aspx" runat="server">Log In</asp:HyperLink>
        </div>
          <br />
          <br />
          <br />
          <br />
         
    </asp:Panel>

    </center>
</asp:Content>
