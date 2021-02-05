<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="~/240578/UploadPDF.aspx" Inherits="GyanTechnologies._240578.Photoupload" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div>

            <table class="style1">
                
                <tr>
                    <td> <table class="style1x">
                                        <tr>
                                            <td style="font-size: x-small">
                                            </td>
                                        </tr>
                                         <tr><td> <asp:Label ID="Label2" Font-Size="Large" runat="server" Text="Choose category"></asp:Label></td></tr>
                                        <tr>
                                            <td style="font-size: x-small">

                                                <asp:TextBox ID="TextBox1"   runat="server" Style="text-transform: lowercase;"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Font-Size="X-Large" ValidationGroup="vg1" ErrorMessage="*" style="color:red;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <td style="font-size: x-small">
                                                <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="Upload Pdf"></asp:Label></td>
                                        </tr>--%>
                                        <tr>
                                            <td>
                                                 <asp:FileUpload ID="FileUpload1" runat="server" onchange="showimagepreview1(this)" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Font-Size="X-Large" ValidationGroup="vg1" ErrorMessage="*" style="color:red;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                        
                                        <tr>
                                           <%-- <td class="style2">
                 <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                                                </td>--%>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="UpdateNews" runat="server" 
                                                    Text="Upload PDF" ValidationGroup="vg1" OnClick="UpdateNews_Click" />
                                            </td>
                                        </tr>

                        <tr><td>



                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="154px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                                   <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                            
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="View PDF" SortExpression="content">
                                       
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl='<%# Eval("Link") %>' runat="server">View Pdf</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [UploadPdf] WHERE [ID] = @original_ID AND (([content] = @original_content) OR ([content] IS NULL AND @original_content IS NULL))" InsertCommand="INSERT INTO [UploadPdf] ([content]) VALUES (@content)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ID], [content],'http://diwakarretail.com'+content as Link FROM [UploadPdf]" UpdateCommand="UPDATE [UploadPdf] SET [content] = @content WHERE [ID] = @original_ID AND (([content] = @original_content) OR ([content] IS NULL AND @original_content IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                    <asp:Parameter Name="original_content" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="content" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="content" Type="String" />
                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                    <asp:Parameter Name="original_content" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            </td></tr>
                                    </table>
                      
                    </td>
                </tr>
            </table>

        </div>
    </center>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1x
        {
            width: 100%;
            height: 488px;
        }
                        
    .style2
    {
        height: 39px;
        font-size: xx-small;
        color: #000000;
    }
                        
    </style>





     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
      

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


        



    </script>







</asp:Content>