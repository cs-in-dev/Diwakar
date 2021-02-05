<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="Kyc.aspx.cs" Inherits="helpurself.user.Kyc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="submenu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="server">--%>
    
<%--</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
        <script type="text/javascript">
        function showimagepreview(input) {
           
            if (input.files && input.files[0]) {

                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_Image2').attr('src', e.target.result);
                   
                }
                filerdr.readAsDataURL(input.files[0]);


            }
        }
        function showimagepreview01(input) {

            if (input.files && input.files[0]) {

                var filerdr = new FileReader();
                filerdr.onload = function (e4) {

                    $('#ContentPlaceHolder1_Image5').attr('src', e4.target.result);

                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showimagepreview1(input) {
            
            if (input.files && input.files[0]) {

                var filerdr = new FileReader();
                filerdr.onload = function (e1) {

                    $('#ContentPlaceHolder1_Image1').attr('src', e1.target.result);

                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function ShowPreview2(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e2) {

                    $('#ContentPlaceHolder1_Image3').attr('src', e2.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function ShowPreview3(input) {
            
            if (input.files && input.files[0]) {
        
                var filerdr = new FileReader();
                filerdr.onload = function (e3) {

                    $('#ContentPlaceHolder1_Image4').attr('src', e3.target.result);
                   
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
       
       </script>
    <table>
        <tr>
        <td class="style38" style="vertical-align:top">Aadhaar / Voter Card</td>
                                <td class="style31" style="vertical-align:top">
                                    <asp:FileUpload ID="fuImage1" runat="server" onchange="showimagepreview(this)" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="upload" />
                                </td>
                                <td>
                                   
                                    <asp:HiddenField ID="hdImage1" runat="server" />
                                    </td>
                                <td>
                                    <asp:Image ID="Image2" runat="server" Height="100px" style="margin-bottom: 0px" Width="100px" />
                                </td>
                            </tr>
           <tr>
        <td class="style38" style="vertical-align:top">Aadhaar Card Back</td>
                                <td class="style31" style="vertical-align:top">
                                    <asp:FileUpload ID="FileUpload3" runat="server" onchange="showimagepreview01(this)" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="upload" />
                                </td>
                                <td>
                                   
                                    <asp:HiddenField ID="HiddenField3" runat="server" />
                                    </td>
                                <td>
                                    <asp:Image ID="Image5" runat="server" Height="100px" style="margin-bottom: 0px" Width="100px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style38" style="vertical-align:top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pan Card</td>
                                <td class="style31" style="vertical-align:top">
                                    <asp:FileUpload ID="fuImage" runat="server" onchange="showimagepreview1(this)" />
                                    <br />
                                    <br />
                                    <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click" Text="upload" />
                                </td>
                                <td>
                                    
                                    <asp:HiddenField ID="hdImage" runat="server" />
                                   </td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" Height="100px" style="margin-bottom: 0px" Width="100px" />
                                </td>
                                </tr>

         <tr>
                                <td class="style38" style="vertical-align:top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Photo Upload</td>
                                <td class="style31" style="vertical-align:top">
                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="ShowPreview2(this)" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button2" runat="server" Text="upload" OnClick="Button2_Click" />
                                </td>
                                <td>
                                    
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                   </td>
                                <td>
                                    <asp:Image ID="Image3" runat="server" Height="100px" style="margin-bottom: 0px" Width="100px" />
                                </td>
                                </tr>
                   <tr>
                                 <td class="style38" style="vertical-align:top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bank Copy/Cheque book</td>
                                <td class="style31" style="vertical-align:top">
                                    <asp:FileUpload ID="FileUpload2" runat="server" onchange="ShowPreview3(this)" />
                                    <br />
                                    <br />
                                    <asp:Button ID="btnbankupload" runat="server" Text="upload" OnClick="btnbankupload_Click" />
                                </td>
                                <td>
                                    
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                   </td>
                                <td>
                                    <asp:Image ID="Image4" runat="server" Height="100px" style="margin-bottom: 0px" Width="100px" />
                                </td>

                    </tr>
    </table>
</asp:Content>
