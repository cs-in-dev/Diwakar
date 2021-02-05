<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="MatrixView.aspx.cs" Inherits="OpinionWorldGroup.Admin.MatrixView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            font-family: Verdana;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style4">
        <tr>
            <td class="style5">
                Sponsor Matrix</td>
        </tr>
        <tr>
            <td>
                <asp:TreeView ID="TreeView1" runat="server" Width="100%" ExpandDepth="0" 
        Height="100%" ImageSet="Arrows" ShowLines="True" style="text-align: left" 
                    onselectednodechanged="TreeView1_SelectedNodeChanged">
        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
            HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
        <ParentNodeStyle Font-Bold="False" />
        <RootNodeStyle ForeColor="Black" />
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
            HorizontalPadding="0px" VerticalPadding="0px" />
    </asp:TreeView>
            </td>
        </tr>
    </table>
</asp:Content>
