<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tree.ascx.cs" Inherits="futureway.user.tree" %>

<div class="module" style="border:1px solid blue">
              <h2><span>overview</span></h2>
<div style="clear:both;"></div>              
              <div>
                    <table>
                        <tr>
                            <td  style="text-align: left; width:50%">
                                 <img src="~/user/images/eggblack.png" width="40" height="40" alt="image" id="img1" runat="server" /></td>
                            <td   style="text-align: left; width:50%">
                                <strong> 
                    <asp:Label ID="txtName" runat="server" style="color: #FF3300">Registered</asp:Label>
                    </strong>
                            </td>
                        </tr>
                       <%-- <tr>
                            <td  style="text-align: left; width:50%">
                    <img src="~/user/images/Blue.png" width="40" height="40" alt="image" id="img2" runat="server" />
                            </td>
                            <td   style="text-align: left; width:50%">
                    <strong>
                    <asp:Label ID="UserCode" runat="server"  ForeColor="Blue">Enrolled</asp:Label>
                    </strong>
                            </td>
                        </tr>--%>
                        <tr>
                            <td  style="text-align: left; width:50%">
                    <img src="~/user/images/egg.png" width="40" height="40" alt="image" id="img3" runat="server" />
                            </td>
                            <td   style="text-align: left; width:50%">
                    <strong> <asp:Label ID="MemberSince" runat="server" ForeColor="Green" 
                       >Active</asp:Label></strong> 
                            </td>
                        </tr>
                        <%--<tr>
                            <td  style="text-align: left; width:50%">
                     <img src="~/user/images/Black.png" width="40" height="40" alt="image" id="img4" runat="server" />
                            </td>
                            <td   style="text-align: left; width:50%">
                    <strong> <asp:Label ID="AccountStatus" runat="server" 
                        >InActive</asp:Label> </strong>
                            </td>
                        </tr>--%>
                       <%-- <tr>
                         <td  style="text-align: left; width:50%">
                    <strong>Total Business : </strong>
                            </td>
                            <td   style="text-align: left; width:50%">
                                <span class="style3">Left PV:</span><strong><asp:Label ID="lblleftpv" 
                                    runat="server" Text="" 
                        style="color: #1122CC"></asp:Label> </strong>
                                &nbsp;<span class="style3">Right PV:</span><strong><asp:Label ID="lblrightpv" runat="server" Text="" style="color: #1122CC"></asp:Label></strong>
                            </td>
                           
                        </tr>--%>
                        </table>
         
              </div>
</div>
<div style="clear:both;"></div>