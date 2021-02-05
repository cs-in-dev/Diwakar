<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tree.aspx.cs"  MasterPageFile ="~/User/UserMasterPage.master" Inherits="WGRL.User.UserTree" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="dhtmltooltip"></div>
<script type="text/javascript">

    /***********************************************
    * Cool DHTML tooltip script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
    * This notice MUST stay intact for legal use
    * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
    ***********************************************/

    var offsetxpoint = -260 //Customize x offset of tooltip
    var offsetypoint = 20 //Customize y offset of tooltip
    var ie = document.all
    var ns6 = document.getElementById && !document.all
    var enabletip = false
    if (ie || ns6)
        var tipobj = document.all ? document.all["dhtmltooltip"] : document.getElementById ? document.getElementById("dhtmltooltip") : ""

    function ietruebody() {
        return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
    }

    function ddrivetip(thetext, thecolor, thewidth) {
        if (ns6 || ie) {
            if (typeof thewidth != "undefined") tipobj.style.width = thewidth + "px"
            if (typeof thecolor != "undefined" && thecolor != "") tipobj.style.backgroundColor = thecolor
            tipobj.innerHTML = thetext
            enabletip = true
            return false
        }
    }

    function positiontip(e) {
        if (enabletip) {
            var curX = (ns6) ? e.pageX : event.clientX + ietruebody().scrollLeft;
            var curY = (ns6) ? e.pageY : event.clientY + ietruebody().scrollTop;
            //Find out how close the mouse is to the corner of the window
            var rightedge = ie && !window.opera ? ietruebody().clientWidth - event.clientX - offsetxpoint : window.innerWidth - e.clientX - offsetxpoint - 20
            var bottomedge = ie && !window.opera ? ietruebody().clientHeight - event.clientY - offsetypoint : window.innerHeight - e.clientY - offsetypoint - 20

            var leftedge = (offsetxpoint < 0) ? offsetxpoint * (-1) : -1000

            //if the horizontal distance isn't enough to accomodate the width of the context menu
            if (rightedge < tipobj.offsetWidth)
            //move the horizontal position of the menu to the left by it's width
                tipobj.style.left = ie ? ietruebody().scrollLeft + event.clientX - tipobj.offsetWidth + "px" : window.pageXOffset + e.clientX - tipobj.offsetWidth + "px"
            else if (curX < leftedge)
                tipobj.style.left = "5px"
            else
            //position the horizontal position of the menu where the mouse is positioned
                tipobj.style.left = curX + offsetxpoint + "px"

            //same concept with the vertical position
            if (bottomedge < tipobj.offsetHeight)
                tipobj.style.top = ie ? ietruebody().scrollTop + event.clientY - tipobj.offsetHeight - offsetypoint + "px" : window.pageYOffset + e.clientY - tipobj.offsetHeight - offsetypoint + "px"
            else
                tipobj.style.top = curY + offsetypoint + "px"
            tipobj.style.visibility = "visible"
        }
    }

    function hideddrivetip() {
        if (ns6 || ie) {
            enabletip = false
            tipobj.style.visibility = "hidden"
            tipobj.style.left = "-1000px"
            tipobj.style.backgroundColor = ''
            tipobj.style.width = ''
        }
    }

    document.onmousemove = positiontip

</script>
    
    <center>
 <div>
 
 
 
     <br />
 <center style="font-size: x-large;"><strong>My Tree</strong></center>
 <table align="center" >
 
 <tr>
 <td>
     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
         Text="Show Genelogy" />
    
     </td></tr>
     <tr>
     <td> <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
     </td></tr>
     <tr>
     <td> &nbsp;</td></tr>
 </table>
 
     <table style="width: 700px; height: 388px">
        <tr>
            <td style="width: 197px" valign="top">
                <table style="width: 700px">
                    <tbody>
                        <tr style="color: #000000">
                            
                            <td align="center" colspan="8" valign="top" width="100%">
                                <table align="center" style="width: 700px">
                                    <tr>
                                   <%-- <td style="width:25%;">
                                            <table class="style3">
                                                <tr>
                                                    <td class="style6">
                                                        Total Left :
                                                        <asp:Label ID="MyLeft" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                </table>
                                        </td>--%>
                                        <td rowspan="3" align="center">
                                            <img id="img1" runat="server"/><br />
                                            
                                            <asp:LinkButton ID="id1" runat="server" onclick="id1_Click1"></asp:LinkButton>
                                            <br />
                                            <asp:Label ID="name1" runat="server"></asp:Label><br />
                                            <br />
                                        </td>
                                       <%-- <td style="width:25%;">
                                            <table class="style3">
                                                <tr>
                                                    <td class="style6">
                                                        Total Right :
                                                        <asp:Label ID="MyRight" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                </table>
                                        </td>--%>
                                    </tr>
                                    <tr>
                                   <%-- <td style="width:25%;">
                                            <table class="style3">
                                                <tr>
                                                    <td class="style6">
                                                        Total Left Pv :
                                                        <asp:Label ID="totalleftpv" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                </table>
                                        </td>
                                        <td style="width:25%;">
                                            <table class="style3">
                                                <tr>
                                                    <td class="style6">
                                                        Total Right Pv :
                                                        <asp:Label ID="totalrightpv" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                </table>
                                        </td>--%>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="8" style="text-align: center" valign="top" width="100%">
                                &nbsp;<img src="images/Lines11.gif" /></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4" style="height: 92px; text-align: center" valign="top"
                                width="50%">
                                <span class="style1">
                                <img id="img2" runat="server"/><br />
                                                                   
                                    <asp:LinkButton ID="lb2" runat="server" onclick="lb2_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name2" runat="server"></asp:Label></span></td>
                            
                            <td align="center" colspan="4" style="height: 92px; text-align: center" valign="top"
                                width="46%">
                                <img id="img3" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb3" runat="server" onclick="lb3_Click"></asp:LinkButton>
                                    <span class="style1"><br />
                                <asp:Label ID="name3" runat="server"></asp:Label></span></td>
                        </tr>
                        <tr class="style1">
                            <td align="center" colspan="4" style="text-align: center" valign="top" width="50%">
                                &nbsp;<img src="images/Lines11.gif" style="width: 200px; height: 16px" /></td>
                            
                            <td align="center" colspan="4" style="text-align: center" valign="top" width="50%">
                                <img src="images/Lines11.gif" style="width: 200px; height: 16px" /></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <span class="style1">
                                <img id="img4" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb4" runat="server" onclick="lb4_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name4" runat="server"></asp:Label></span></td>
                            
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <img id="img5" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb5" runat="server" onclick="lb5_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name5" runat="server"></asp:Label></span></td>
                            
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <img id="img6" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb6" runat="server" onclick="lb6_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name6" runat="server"></asp:Label></span></td>
                            
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <img id="img7" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb7" runat="server" onclick="lb7_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name7" runat="server"></asp:Label></span></td>
                        </tr>
                        <tr class="style1">
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                &nbsp;<img src="images/Lines11.gif" style="width: 72px; height: 16px" /></td>
                            
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <img src="images/Lines11.gif" style="width: 72px; height: 16px" /></td>
                            
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <img src="images/Lines11.gif" style="width: 72px; height: 16px" /></td>
                            
                            <td align="center" colspan="2" style="text-align: center" valign="top" width="25%">
                                <img src="images/Lines11.gif" style="width: 72px; height: 16px" /></td>
                        </tr>
                        
                        <tr>
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="12%">
                                <span class="style1">
                                <img id="img8" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb8" runat="server" onclick="lb8_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name8" runat="server"></asp:Label></span></td>
                            
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="13%">
                                <img id="img9" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb9" runat="server" onclick="lb9_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name9" runat="server"></asp:Label></span></td>
                            
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="11%">
                                <img id="img10" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb10" runat="server" onclick="lb10_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name10" runat="server"></asp:Label></span></td>
                            
                            <td align="center" style="height: 96px; text-align: center" valign="top">
                                <img id="img11" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb11" runat="server" onclick="lb11_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name11" runat="server"></asp:Label></span></td>
                           
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="11%">
                                <img id="img12" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb12" runat="server" onclick="lb12_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name12" runat="server"></asp:Label></span></td>
                           
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="14%">
                                <img id="img13" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb13" runat="server" onclick="lb13_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name13" runat="server"></asp:Label></span></td>
                            
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="12%">
                                <img id="img14" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb14" runat="server" onclick="lb14_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name14" runat="server"></asp:Label></span></td>
                            
                            <td align="center" style="height: 96px; text-align: center" valign="top" width="13%">
                                <img id="img15" runat="server"/><br />
                                
                                    <asp:LinkButton ID="lb15" runat="server" onclick="lb15_Click"></asp:LinkButton>
                                <span class="style1"><br />
                                <asp:Label ID="name15" runat="server"></asp:Label></span></td>
                        </tr>
                    </tbody>
                </table>
                <p>
                </p>
            </td>
        </tr>
    </table>
    </div>
    </center>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">#dhtmltooltip { BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; Z-INDEX: 100; FILTER: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135); LEFT: -300px; VISIBILITY: hidden; PADDING-BOTTOM: 2px; BORDER-LEFT: black 1px solid; WIDTH: 300px; PADDING-TOP: 2px; BORDER-BOTTOM: black 1px solid; POSITION: absolute; BACKGROUND-COLOR: lightyellow }

	#dhtmlpointer { Z-INDEX: 101; LEFT: -300px; VISIBILITY: hidden; POSITION: absolute }

	</style>
</asp:Content>


