<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="showkyc.aspx.cs" Inherits="Sabaic._19111973.showkyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <strong>Show Kyc</strong>
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
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td colspan="2">


            </td>
        </tr>
    </table>
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>

            <table class="webgrid-table" style="width: 100%;">

                <tr class="webgrid-header" style="color: black;">


                    <th scope="col" style="text-align: center;">Aadhaar / Voter Card</th>
                    <th scope="col" style="text-align: center;">Aadhaar Card Back	</th>
                    <th scope="col" style="text-align: center;">PanCard</th>
                    <th scope="col" style="text-align: center;">Photo Upload</th>
                    <th scope="col" style="text-align: center;">Bank Copy/Cheque book</th>


                </tr>
        </HeaderTemplate>

        <ItemTemplate>
            <tr class="webgrid-footer" style="background-color: #EFF3FB;">


                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:Image ID="Image1" runat="server" class="img-circle" ImageUrl='<%# Eval("VoterCard") %>' Width="150px" Height="150px" /></td>
                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:Image ID="Image5" runat="server" class="img-circle" ImageUrl='<%# Eval("AdharCardBack") %>' Width="150px" Height="150px" /></td>

                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:Image ID="Image2" runat="server" class="img-circle" ImageUrl='<%# Eval("PanCardProof") %>' Width="150px" Height="150px" /></td>
                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:Image ID="Image3" runat="server" class="img-circle" ImageUrl='<%# Eval("UploadPhoto") %>' Width="150px" Height="150px" /></td>
                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:Image ID="Image4" runat="server" class="img-circle" ImageUrl='<%# Eval("Checkbook") %>' Width="150px" Height="150px" /></td>

            </tr>

            <tr class="webgrid-footer" style="background-color: #EFF3FB;">

                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl='<%# Bind("VoterCard") %>'
                        Text="Download"></asp:HyperLink>
                </td>

                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" NavigateUrl='<%# Bind("AdharCardBack") %>'
                        Text="Download"></asp:HyperLink>
                </td>
                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Bind("PanCardProof") %>'
                        Text="Download"></asp:HyperLink></td>
                </td>
                            <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                                <asp:HyperLink ID="hyDownload1" runat="server" Target="_blank" NavigateUrl='<%# Bind("UploadPhoto") %>'
                                    Text="Download"></asp:HyperLink></td>
                <td style="color: Black; text-align: center; border-bottom: 1px solid black; border-left: 1px solid black; padding: 10px;">
                    <asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" NavigateUrl='<%# Bind("Checkbook") %>'
                        Text="Download"></asp:HyperLink></td>

            </tr>

        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
