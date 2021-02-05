<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMasterPage.master" CodeBehind="DownlineRewardStatus.aspx.cs" Inherits="Starlinenetworking.user.DownlineRewardStatus" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="obout_Grid_NET" namespace="Obout.Grid" tagprefix="obout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div align="center" style="font-family:@Arial Unicode MS; font-size:large;width:100%"> My Downline Honour <%=Request.QueryString["Side"].ToString() %></div>
 <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
        <obout:Grid ID="Grid1" runat="server" AllowAddingRecords="False" AllowFiltering="True" DataSourceID="Left" Width="100">
            <Columns>
                <obout:Column ID="Column1" DataField="" ReadOnly="true" HeaderText="NO." Width="60" runat="server">
                    <TemplateSettings TemplateId="tplNumbering"/></obout:Column>
                <obout:Column  DataField="JoinDate" HeaderText="JoinDate" Width="120" runat="server"/> 
                <obout:Column  DataField="UserCode" HeaderText="UserCode" Width="120" runat="server"/>
                <obout:Column  DataField="UserName" HeaderText="UserName" Width="170" runat="server"/>
                <%--<obout:Column  DataField="CurrentReward" HeaderText="CurrentReward" Width="130" runat="server"/>--%>
                <obout:Column  DataField="CurrentRank" HeaderText="CurrentRank" Width="150" runat="server"/>
            </Columns>
               <Templates>
                <obout:GridTemplate runat="server" ID="tplNumbering">
                    <Template>
                        <b><%# (Container.RecordIndex + 1) %>.</b>
                    </Template>
                </obout:GridTemplate>
            </Templates>    
        </obout:Grid>
        <asp:SqlDataSource ID="Left" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
            SelectCommand="SELECT   CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,UserName,CurrentRank  FROM tblMemberMaster 
WHERE(MyRank != 1) AND (UserCode IN(SELECT MemberID FROM TblMatrixMaster 
WHERE(SponserID IN(SELECT LeftChild FROM tblTreeMaster WHERE(MemberID = @UserCode)))))
union
SELECT    CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,UserName,CurrentRank  FROM tblMemberMaster 
WHERE(MyRank != 1) AND (UserCode IN(SELECT  LeftChild FROM tblTreeMaster WHERE(MemberID = @UserCode)))"
                      onselected="Left_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>
<br />
        <obout:Grid ID="Grid2" runat="server" AllowAddingRecords="False" AllowFiltering="True" DataSourceID="Right" Width="100">
            <Columns>
                <obout:Column ID="Column2"  DataField="" ReadOnly="true" HeaderText="NO." Width="60" runat="server">
                    <TemplateSettings TemplateId="GridTemplate1"/></obout:Column>
               <obout:Column ID="Column3"  DataField="JoinDate" HeaderText="JoinDate" Width="120" runat="server"/> 
                <obout:Column ID="Column4"  DataField="UserCode" HeaderText="UserCode" Width="120" runat="server"/>
                <obout:Column ID="Column5"  DataField="UserName" HeaderText="UserName" Width="170" runat="server"/>
                <%--<obout:Column ID="Column6"  DataField="CurrentReward" HeaderText="CurrentReward" Width="130" runat="server"/>--%>
                <obout:Column ID="Column7"  DataField="CurrentRank" HeaderText="CurrentRank" Width="150" runat="server"/>
            </Columns>
               <Templates>
                <obout:GridTemplate runat="server" ID="GridTemplate1">
                    <Template>
                        <b><%# (Container.RecordIndex + 1) %>.</b>
                    </Template>
                </obout:GridTemplate>
            </Templates>    
        </obout:Grid>
           <span class="style1"><strong>Total Records:<asp:Label ID="Label2" 
            runat="server"></asp:Label>
        </strong></span>
    </asp:Panel>
   
   
        <asp:SqlDataSource ID="Right" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
           SelectCommand="SELECT    CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,UserName,CurrentRank  FROM tblMemberMaster 
WHERE(MyRank != 1) AND (UserCode IN(SELECT MemberID FROM TblMatrixMaster 
WHERE(SponserID IN(SELECT RightChild FROM tblTreeMaster WHERE(MemberID = @UserCode)))))
union
SELECT   CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,UserName,CurrentRank  FROM tblMemberMaster 
WHERE(MyRank != 1) AND (UserCode IN(SELECT  RightChild FROM tblTreeMaster WHERE(MemberID = @UserCode)))"
                      onselected="Right_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>
   
</asp:Content>