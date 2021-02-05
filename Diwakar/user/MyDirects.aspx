<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true"
    CodeBehind="MyDirects.aspx.cs" Inherits="WGRL.User.MyDirects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    td
    {
        border:1px;
    }
  
</style>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="Title" runat="server">
Sponsor Matrix
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label110" runat="server" Text="Label"><span style="color:#9c6b06;font-weight:bold;font-size:larger;">MY DIRECT</span></asp:Label>
    <%--   <asp:TreeView ID="TreeView1" runat="server" onselectednodechanged="TreeView1_SelectedNodeChanged">
</asp:TreeView>--%>
                                       <div>
                                       </div>
                                    <div style="overflow:scroll;">
    <asp:TreeView ID="TreeView1" runat="server" ImageSet="Arrows" ShowLines="true" ExpandDepth="0"  
                                            Style="text-align: left" ShowExpandCollapse="true"  
                                            onselectednodechanged="TreeView1_SelectedNodeChanged" Width="100%" 
                                            Height="501px">

        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px"
            NodeSpacing="0px" VerticalPadding="0px" />
        <ParentNodeStyle Font-Bold="False" />
        <RootNodeStyle ForeColor="Black" />
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
            VerticalPadding="0px" />  
    </asp:TreeView></div>
  
</asp:Content>
