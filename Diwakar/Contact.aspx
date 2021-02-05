<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CyraShop.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <%--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script>
       
                $(document).on('click', '#addTo', function () {
                                                
                $('#name').removeAttr('style');
                $('#email').removeAttr('style');
                $('#Sub').removeAttr('style');
                $('#discription').removeAttr('style');

                var Query = {};

                Query.name = $('#name').val();
                Query.email = $('#email').val();
                Query.Sub = $('#Sub').val();
                Query.discription = $('#discription').val();

                if (Query.name == '' || Query.name == undefined || Query.name == null) {
                    $('#name').attr('style', 'border:2px solid red;');
                    $('#name').focus();
                    return;
                }
                if (Query.email == '' || Query.email == undefined || Query.email == null) {
                    $('#email').attr('style', 'border:2px solid red;');
                    $('#email').focus();
                    return;
                }
                if (!ValidateEmail(Query.email)) {
                    alert("Invalid email address.");
                    return
                }
                if (Query.Sub == '' || Query.Sub == undefined || Query.Sub == null) {
                    $('#Sub').attr('style', 'border:2px solid red;');
                    $('#Sub').focus();
                    return;
                }

                
                if (Query.discription == '' || Query.discription == undefined || Query.discription == null) {
                    $('#discription').attr('style', 'border:2px solid red;');
                    $('#discription').focus();
                    return;
                }
               
                

                 $.ajax({
                type: "POST",

                url: "Contact.aspx/InsertQuery",
                data: "{Query: " + JSON.stringify(Query) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var Result = data.d;

                    if (Result == 'success')
                    {
                          $('#name').val('');
                          $('#email').val('');
                          $('#Sub').val('');
                         $('#discription').val('');

                         alert('Message Successfully Submit');
                    }
                    //else {
                    //    alert('Error');
                    //}
                
                },
                error: function (data) {
                    alert(data.d);
                    alert(data.status);
                    alert(Error);
                },

            });

            });


        //});

         

     </script>
    <script type = "text/javascript">
        function ValidateEmail(email) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(email);
        };

</script>
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
 <div class="spacer200" style="background: #00b050;height:200px!important"></div>
 <section>
    

  <div class="spacer60"></div> 


  <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <h1>Contact us</h1>         
        </div>
      </div>     
    </div>
    <div class="spacer30"></div>
        
    <div class="container">
       
      <div class="row">
          <div class="col-sm-8">
           
            <div class="r-bg">
                  
          <div role="form" id="ajax-form" class="form-main">
 
           
            <div class="row">            
              <div class="form-group col-xs-6">
                  
                <label for="name">Name</label>
                <input class="form-control input-lg" id="name"  placeholder="Name" name="name" type="text"/>
     
              </div>
              <div class="form-group col-xs-6">
                <label for="email">Email</label>
                <input class="form-control input-lg" id="email" placeholder="E-Mail" name="email" type="text"/ >
                 <%-- <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="First Name "></asp:TextBox>--%>
             
              </div>
                  <div class="form-group col-xs-6">
                <label for="subject">Subject</label>
                <input class="form-control input-lg" id="Sub" placeholder="Subject" name="subject" type="text"/ >
         
              </div>
              
           
            
            <div class="row">            
              <div class="form-group col-xs-12">
                <label for="message">Message</label>
                   <textarea rows="4" id="discription" placeholder="Message" class="form-control"></textarea>
                          </div>
                
            </div> 
               <%--  <span id="addTo" class="btn btn-default">SUBMIT</span>--%>
                   <a href="#" id="addTo"  class="btn btn-default"><i></i>Send Message</a>
            
               </div>
              
            

            <div class="row">            
              <div class="col-xs-12">
            <div id="ajaxsuccess">E-mail was successfully sent.</div>
            <div class="error" id="err-form" style="display: none;">There was a problem validating the form please check!</div>
            <div class="error" id="err-timedout">The connection to the server timed out!</div>
            <div class="error" id="err-state"></div>
              
             
                 
              </div>
            </div>
          </div>
          </div> 
          </div> 
     
          
          <div class="col-sm-4">
            <div class="r-bg">
              <h3>Address</h3>
              <ul class="list-1">
                <li style="padding-bottom:5px;"><i class="fa fa-home" aria-hidden="true" style="color:#00b050;width: 20px;"></i> 26, UGF Unique Shopping Mall, Near GVM Girls College,</li>
               <%-- <li style="padding-bottom:5px;"><i class="fa fa-phone" aria-hidden="true" style="color:#00b050;width: 20px;"></i> +91 7617522212, +91 7617622212</li>--%>
                <li style="padding-bottom:5px;"><a href="#"><i class="fa fa-envelope-o" aria-hidden="true" style="color:#00b050;width: 20px;"></i>diwakarretail2017@gmail.com </a></li>
              </ul>          
            </div>
          <div class="r-bg">
            <h3>Share</h3>
            <ul class="colored-social-icons">
              <li><a href="#" rel="external" class="facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#" rel="external" class="google-plus" target="_blank"><i class="fa fa-google-plus"></i></a></li>
              <li><a href="#" rel="external" class="twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#" rel="external" class="pinterest" target="_blank"><i class="fa fa-pinterest"></i></a></li>              
              <li><a href="#" rel="external" class="youtube" target="_blank"><i class="fa fa-youtube"></i></a></li>
              <li><a href="#" rel="external" class="dribbble" target="_blank"><i class="fa fa-dribbble"></i></a></li>
              <li><a href="#" rel="external" class="tumblr" target="_blank"><i class="fa fa-tumblr"></i></a></li>
              <li><a href="#" rel="external" class="instagram" target="_blank"><i class="fa fa-instagram"></i></a></li>                           
            </ul>
          </div>           
            
          </div> 
       
      </div>      

      
      
  <div class="spacer60"></div>      
<iframe class="google-map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d19735.62079337257!2d77.65447976862352!3d29.02297476787801!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390c6f58913ae8a7%3A0x980f0738f8d5ae!2sKankar+Khera%2C+Sainik+Vihar%2C+Nangla+Tashi%2C+Meerut%2C+Uttar+Pradesh+250001!5e0!3m2!1sen!2sin!4v1479273801581" frameborder="0" style="border:0" allowfullscreen></iframe>         


     
  </section>
</asp:Content>
