<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CyraShop.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        p{
            text-align:justify;
            font-size:15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="spacer200" style="background: #00b050;height:200px!important"></div>
 <section>
     <center style="margin-top:5em;margin-bottom:2em;"><img src="img/abouticon.png" /></center>
  <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <h1>About Our Company</h1>         
        </div>
      </div>     
    </div>
    <div class="spacer30"></div>
        
    <div class="container">
      <div class="row" style="margin:0px;">
          <p>Diwakar Retail Ltd. focuses on helping our customers build their business faster by providing top quality prospects who are serious about starting a home business of their own, just like you.</p>
          <p>Responsive Data is a lead generation firm. Responsive Data is widely recognized as a leading voice for generating top quality leads that have and continue to help thousands of home business professionals rapidly grow their business.</p>
          <br />
          <div class="clearfix"></div>
          <hr style="background-color:#00b050;" />
          <div class="col-md-4">
              <img src="img/people.jpg"  style="border-radius:0px;"/>
          </div>
          <div class="col-md-8">
          <h2>Our Passion</h2>
<p>Our company thrives on three core values.</p>
          <ul>
              <li>Curiosity - We never stop seeking better answers, seeking interesting perspectives, and generating practical new ideas.</li>
              <li>Loyalty - There are things more important than gain at the expense of compromised values and divisiveness.</li>
              <li>Integrity - We have a passion for uncovering what is true, real, and knowable even when it's not the conclusion we hoped for.</li>
          </ul>
        </div>
<div class="clearfix"></div>
          <br /><br />
      </div>
    </div>

 </section>
</asp:Content>
