<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="updatekyc.aspx.cs" Inherits="Sabaic.updatekyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>

    <script type="text/javascript">

        function showimagepreview1(input) {

            if (input.files && input.files[0]) {

                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_Image1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);


            }
        } 


        function showimagepreview2(input) {

            if (input.files && input.files[0]) {

                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_Image2').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);


            }
        } 

        function showimagepreview3(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {

                    $('#ContentPlaceHolder1_Image3').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showimagepreview4(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {

                    $('#ContentPlaceHolder1_Image4').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showimagepreview5(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {

                    $('#ContentPlaceHolder1_Image5').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <center>
        <table>

            <tr>
                <br />
                <br />
                <td>Enter Member Id <%--<a href="../assets/images/article 01.png">Cancellation/Refund Policy</a>--%></td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>

                <td></td>
                <td>
                    <asp:Button ID="Button0" runat="server" Text="Submit" OnClick="Button0_Click" />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style38" style="vertical-align: top">Aadhaar / Voter Card</td>
                <td class="style31" style="vertical-align: top">
                    <asp:FileUpload ID="AadharCardandVoter" class="btn btn-success div_btn_margin" runat="server" onchange="showimagepreview1(this)" />

                    <asp:Button ID="Button1" class="btn btn-success div_btn_margin" runat="server" OnClick="Button1_Click" Text="upload" />
                    <br />
                    <br />
                </td>
                <td>

                    <asp:HiddenField ID="hdImage1" runat="server" />
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="100px" Style="margin-bottom: 0px" Width="100px" />
                </td>
            </tr>

            <tr>
                <td class="style38" style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aadhaar Card Back</td>
                <td class="style31" style="vertical-align: top">
                    <asp:FileUpload ID="AadharCrdBack" class="btn btn-success div_btn_margin" runat="server" onchange="showimagepreview2(this)" />

                    <asp:Button ID="Button2" class="btn btn-success div_btn_margin" runat="server" Text="Update" OnClick="Button2_Click1" />
                    <br />
                    <br />
                </td>
                <td>

                    <asp:HiddenField ID="HiddenField2" runat="server" />
                </td>
                <td>
                    <asp:Image ID="Image2" runat="server" Height="100px" Style="margin-bottom: 0px" Width="100px" />
                </td>
            </tr>
            <tr>
                <td class="style38" style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pan Card</td>
                <td class="style31" style="vertical-align: top">
                    <asp:FileUpload ID="PanCard" runat="server" class="btn btn-success div_btn_margin" onchange="showimagepreview3(this)" />

                    <asp:Button ID="Button3" class="btn btn-success div_btn_margin" runat="server" OnClick="Button3_Click" Text="Update" />
                    <br />
                    <br />
                </td>
                <td>

                    <asp:HiddenField ID="hdImage" runat="server" />
                </td>
                <td>
                    <asp:Image ID="Image3" runat="server" Height="100px" Style="margin-bottom: 0px" Width="100px" />
                </td>
            </tr>
            <tr>
                <td class="style38" style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Photo Upload</td>
                <td class="style31" style="vertical-align: top">
                    <asp:FileUpload ID="PhotoUpload" class="btn btn-success div_btn_margin" runat="server" onchange="showimagepreview4(this)" />

                    <asp:Button ID="Button4" class="btn btn-success div_btn_margin" runat="server" Text="Update" OnClick="Button4_Click" />
                    <br />
                    <br />
                </td>
                <td>

                    <asp:HiddenField ID="HiddenField3" runat="server" />
                </td>
                <td>
                    <asp:Image ID="Image4" runat="server" Height="100px" Style="margin-bottom: 0px" Width="100px" />
                </td>
            </tr>
            <tr>
                <td class="style38" style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bank Copy/Cheque book</td>
                <td class="style31" style="vertical-align: top">
                    <asp:FileUpload ID="BankDetails" class="btn btn-success div_btn_margin" runat="server" onchange="showimagepreview5(this)" />

                    <asp:Button ID="Button5" class="btn btn-success div_btn_margin" runat="server" Text="Update" OnClick="Button5_Click" />
                    <br />
                    <br />
                </td>
                <td>

                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </td>
                <td>
                    <asp:Image ID="Image5" runat="server" Height="100px" Style="margin-bottom: 0px" Width="100px" />
                </td>
            </tr>

           
          
            <%--<tr>
             <td class="style38" style="vertical-align:top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Upload Link</td>
             

             <td class="style31" style="vertical-align:top">
                                    <asp:TextBox ID="TextBox2" Width="100%" runat="server"></asp:TextBox>
                                    
                                    <br />
                                     <br />
                                    <asp:Button ID="Button4" class="btn btn-success div_btn_margin" runat="server" Text="upload" OnClick="Button4_Click"/>
                                    <br />
                                    <br />
                                </td>
                                </tr>
         <tr>
                                <td class="style38" style="vertical-align:top">&nbsp;</td>
                                <td class="style31" style="vertical-align:top">
                                    
                                        <asp:HyperLink ID="HyperLink1" Target="_blank" runat="server">Click Here</asp:HyperLink>
                                </td>
                                <td>
                                    
                                    
                                </tr>--%>
        </table>
    </center>
</asp:Content>
