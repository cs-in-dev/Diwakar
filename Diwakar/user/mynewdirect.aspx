<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserMasterPage.master" AutoEventWireup="true" CodeBehind="mynewdirect.aspx.cs" Inherits="mynewdirect" %>
<%@ Register Src="~/user/tree.ascx" TagName="InformationBlock" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">#dhtmltooltip { BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; Z-INDEX: 100; FILTER: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135); LEFT: -300px; VISIBILITY: hidden; PADDING-BOTTOM: 2px; BORDER-LEFT: black 1px solid; WIDTH: 300px; PADDING-TOP: 2px; BORDER-BOTTOM: black 1px solid; POSITION: absolute; BACKGROUND-COLOR: lightgrey }

	#dhtmlpointer { Z-INDEX: 101; LEFT: -300px; VISIBILITY: hidden; POSITION: absolute }

	.style2 { FONT-SIZE: 12px }
	
	
	
	</style>
     <div id="dhtmltooltip"></div>
    <script type="text/javascript">

        /***********************************************
        * Cool DHTML tooltip script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
        * This notice MUST stay intact for legal use
        * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
        ***********************************************/

        var offsetxpoint = -60 //Customize x offset of tooltip
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
        .container-outer { overflow: scroll; width: 500px; height: 210px; }
        .container-inner { width: 10000px; }
        $(document).ready(function() {
           var container_width = SINGLE_IMAGE_WIDTH * $(".container-inner a").length;
           $(".container-inner").css("width", container_width);
        });

</script>
    <style type="text/css">
        .style1
        {
            height: 37px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<h2><%--LOOoot The Deal Team--%></h2>
<div class="tabBody" style="height:100%">
                            <table align="center">
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Enabled="True"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Show Genelogy" 
                            onclick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
       <%--  <div class="container-outer">--%>
   <div class="container-inner1" style=" overflow:scroll; width:105%">


            <table style="text-align: center;width:100%;" align="center">
                <tr>
                    <td style="width:100%; text-align: center;font-size: large;" valign="top" align="center">
                        <table width="100%" ><%-- style="margin-left:180px"--%>
                            <tbody>
                            <tr align="center">
                            <td colspan="9"> 
                                <asp:Label ID="Label1" runat="server" Text="" Font-Bold="True" 
                                    Font-Size="Medium"></asp:Label></td>
                            </tr>
                                <tr style="color: #000000;">
                                  
                                                <td colspan="3" style="text-align: left" class="style1">
                                                    <asp:LinkButton ID="LinkButton2" ForeColor="Blue" runat="server" 
                                                        onclick="LinkButton2_Click" >Prev</asp:LinkButton>
                                                </td>
                                            
                                                <td colspan="3" style="text-align: right" class="style1">
                                                    <asp:HiddenField ID="CurrentPage" runat="server" />
                                                </td>
                                            
                                                <td colspan="3" style="text-align: right" class="style1">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
                                                        onclick="LinkButton1_Click" >NEXT</asp:LinkButton>
                                                       <%-- <uc1:InformationBlock ID="InformationBlock1" runat="server" />--%>
                                                </td>
                                            
                                </tr>
                                <tr style="color: #000000">
                                  
                                                <td colspan="25">
                                                    <img  width="10" height="10" alt="image" id="img1" runat="server" />
                                                    <br /><asp:LinkButton ID="id1" runat="server" onclick="id1_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name1" runat="server" Font-Size="12px"></asp:Label>
                                                </td>
                                            
                                </tr>
                                <tr>
                                     <td align="center" colspan="8" style="text-align: center" valign="top" width="100%">
                                  <%--  <td align="right" colspan="7" style="text-align: right" valign="top">--%>
                                        <img src="images/Lines11.GIF" style="width: 180%; right: auto; margin-left:140px""  height="16px"/></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img  width="10" height="10" alt="image" id="img2" runat="server" />
                                        <br /><asp:LinkButton ID="lb2" runat="server" onclick="lb2_Click" 
                                            Font-Size="12px" ></asp:LinkButton>
                                        <br />
                                        <asp:Label ID="name2" runat="server" Font-Size="11px"></asp:Label>
                                    </td>
                                    <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img width="10" height="10" alt="image" id="img3" runat="server" />
                                        <br /><asp:LinkButton ID="lb3" runat="server" onclick="lb3_Click" 
                                            Font-Size="12px" ></asp:LinkButton>
                                        <br />
                                        <asp:Label ID="name3" runat="server" Font-Size="12px"></asp:Label>
                                    </td>
                                    <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img width="10" height="10" alt="image" id="img4" runat="server" />
                                        <br /><asp:LinkButton ID="lb4" runat="server" onclick="lb4_Click" 
                                            Font-Size="12px" ></asp:LinkButton>
                                        <br />
                                        <asp:Label ID="name4" runat="server" Font-Size="12px"></asp:Label>
                                    </td>
                                     <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img width="10" height="10" alt="image" id="img14" runat="server" />
                                        <br /><asp:LinkButton ID="lb14" runat="server" onclick="lb14_Click" 
                                             Font-Size="12px" ></asp:LinkButton>
                                        <br />
                                        <asp:Label ID="name14" runat="server" Font-Size="12px"></asp:Label>
                                    </td>
                                        <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img width="10" height="10" alt="image" id="img15" runat="server" />
                                        <br /><asp:LinkButton ID="lb15" runat="server" onclick="lb15_Click" 
                                                Font-Size="12px" ></asp:LinkButton>
                                        <br />
                                        <asp:Label ID="name15" runat="server" Font-Size="12px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img src="images/Lines11.GIF" style="width: 95%; height: 16px" />
                                    </td>
                                    <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img alt="image" src="images/Lines11.gif" 
                                            style="width: 95%; height: 16px" />
                                    </td>
                                    <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img alt="image" src="images/Lines11.gif" style="width: 95%; height: 16px" />
                                    </td>
                                      <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img alt="image" src="images/Lines11.gif" style="width: 95%; height: 16px" />
                                    </td>
                                      <td align="center" colspan="5" style="text-align: center" valign="top">
                                        <img alt="image" src="images/Lines11.gif" style="width: 95%; height: 16px" />
                                    </td>
                                </tr>
                                <tr >
                                                <td style="text-align: center;" valign="top">
                                                    <img width="10" height="10" alt="image" id="img5" runat="server" />
                                                    <br /><asp:LinkButton ID="lb5" runat="server" onclick="lb5_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name5" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img6" runat="server" />
                                                    <br /><asp:LinkButton ID="lb6" runat="server" onclick="lb6_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name6" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10"  alt="image" id="img7" runat="server" />
                                                    <br /><asp:LinkButton ID="lb7" runat="server" onclick="lb7_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name7" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img16" runat="server" />
                                                    <br /><asp:LinkButton ID="lb16" runat="server" onclick="lb16_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name16" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img17" runat="server" />
                                                    <br /><asp:LinkButton ID="lb17" runat="server" onclick="lb17_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name17" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img8" runat="server" />
                                                    <br /><asp:LinkButton ID="lb8" runat="server" onclick="lb8_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name8" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img9" runat="server" />
                                                    <br /><asp:LinkButton ID="lb9" runat="server" onclick="lb9_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name9" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img10" runat="server" />
                                                    <br /><asp:LinkButton ID="lb10" runat="server" onclick="lb10_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name10" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img18" runat="server" />
                                                    <br /><asp:LinkButton ID="lb18" runat="server" onclick="lb18_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name18" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img19" runat="server" />
                                                    <br /><asp:LinkButton ID="lb19" runat="server" onclick="lb19_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name19" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img11" runat="server" />
                                                    <br /><asp:LinkButton ID="lb11" runat="server" onclick="lb11_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name11" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img12" runat="server" />
                                                    <br /><asp:LinkButton ID="lb12" runat="server" onclick="lb12_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name12" runat="server" Font-Size="12px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img13" runat="server" />
                                                    <br /><asp:LinkButton ID="lb13" runat="server" onclick="lb13_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name13" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                 <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img20" runat="server" />
                                                    <br /><asp:LinkButton ID="lb20" runat="server" onclick="lb20_Click" 
                                                         Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name20" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                 <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img21" runat="server" />
                                                    <br /><asp:LinkButton ID="lb21" runat="server" onclick="lb21_Click" 
                                                         Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name21" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img22" runat="server" />
                                                    <br /><asp:LinkButton ID="lb22" runat="server" onclick="lb22_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name22" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img23" runat="server" />
                                                    <br /><asp:LinkButton ID="lb23" runat="server" onclick="lb23_Click" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name23" runat="server" Font-Size="12px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img24" runat="server" />
                                                    <br /><asp:LinkButton ID="lb24" runat="server" onclick="lb24_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name24" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                 <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img25" runat="server" />
                                                    <br /><asp:LinkButton ID="lb25" runat="server" onclick="lb25_Click" 
                                                         Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name25" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                 <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img26" runat="server" />
                                                    <br /><asp:LinkButton ID="lb26" runat="server" onclick="lb26_Click" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name26" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                
                                           
                                            <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img27" runat="server" />
                                                    <br /><asp:LinkButton ID="lb27" runat="server" onclick="lb27_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name27" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img  width="10" height="10" alt="image" id="img28" runat="server" />
                                                    <br /><asp:LinkButton ID="lb28" runat="server" onclick="lb28_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name28" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img29" runat="server" />
                                                    <br /><asp:LinkButton ID="lb29" runat="server" onclick="lb29_Click" 
                                                        Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name29" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                 <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img30" runat="server" />
                                                    <br /><asp:LinkButton ID="lb30" runat="server" onclick="lb30_Click" 
                                                         Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name30" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                 <td align="center" style="text-align: center" valign="top">
                                                    <img width="10" height="10" alt="image" id="img31" runat="server" />
                                                    <br /><asp:LinkButton ID="lb31" runat="server" onclick="lb31_Click" 
                                                         Font-Size="12px" ></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="name31" runat="server" Font-Size="11px"></asp:Label>
                                                </td>
                                                

                                   
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                
                  
                           </table>
                           </div>
                       <%-- </div>--%>
</asp:Content>
