<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeBehind="ListView.aspx.cs" Inherits="WGRL.User.ListView" %>
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
 
       <div align="center" style="font-family:@Arial Unicode MS; font-size:large; width:100%"> MY <%=Request.QueryString["Side"].ToString() %></div>
  
  <center>
  <table>
  <tr>
  <td>
  Date From :<asp:TextBox ID="txtfrom" runat="server" format="yyyy/MM/dd" Placeholder="Enter Date From"></asp:TextBox> 
  <cc1:CalendarExtender ID="calen1" runat="server"  TargetControlID="txtfrom"></cc1:CalendarExtender>
  <asp:RequiredFieldValidator ID="rqrd1" runat="server" ControlToValidate="txtfrom" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
  </td>
  </tr>
  <tr>
  <td align="right">
  Date To :<asp:TextBox ID="txtTo" runat="server" format="yyyy/MM/dd" Placeholder="Enter Date To"></asp:TextBox> 
  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtTo"></cc1:CalendarExtender>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTo" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
  </td>
  </tr>
  <tr>
  <td align="center"><asp:Button ID="btn" runat="server" Text="Search" 
          onclick="btn_Click" /></td>
  </tr>
  </table>
  </center>
   <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
        <obout:Grid ID="Grid1" runat="server" AllowAddingRecords="False" 
            AllowFiltering="True"  Width="100" onrowdatabound="Grid1_RowDataBound" >
            <Columns>
                <obout:Column DataField="" ReadOnly="true" HeaderText="NO." Width="50" runat="server">
                    <TemplateSettings TemplateId="tplNumbering"/></obout:Column>
                <obout:Column DataField="JoinDate" HeaderText="JoinDate" Width="100" runat="server"/> 
                 <obout:Column  DataField="ConfirmDate" HeaderText="ConfirmDate" Width="150" runat="server"/>
                <obout:Column DataField="MemberID" HeaderText="MemberID" Width="95" runat="server"/>
                 <obout:Column  DataField="SponserId" HeaderText="SponsorID" Width="95" runat="server"/>
                <obout:Column DataField="MemberName" HeaderText="MemberName" Width="150" runat="server"/>
                <obout:Column  DataField="CurrentRank" HeaderText="CurrentRank" Width="120" runat="server"/>
                <obout:Column DataField="Pinamount" HeaderText="Pinamount" Width="120" runat="server"/>
               <%-- <obout:Column DataField="MyPV" HeaderText="MyPV" Width="70" DataFormatString="{0:f}" runat="server"/>--%>
                <obout:Column DataField="MobileNo" HeaderText="MobileNo" Width="120" runat="server"/>
               <%-- <obout:Column DataField="Cadre" HeaderText="Cadre" Width="120" runat="server"/>--%>
              <%--  <obout:Column DataField="Status" HeaderText="Status" Width="120" runat="server"/>--%>
               <%-- <obout:Column DataField="Rank" HeaderText="Rank" Width="120" runat="server"/>--%>
                
            </Columns>
               <Templates>
                <obout:GridTemplate runat="server" ID="tplNumbering">
                    <Template>
                        <b><%# (Container.RecordIndex + 1) %>.</b>
                    </Template>
                </obout:GridTemplate>
            </Templates>    
        </obout:Grid>
        <%--<asp:SqlDataSource ID="Left" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
            SelectCommand="Select CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,[dbo].[MySponsor](usercode )as SponserId,UserName,CurrentRank,MobileNo,MyInvestment as MyPV from tblmemberMaster  where  UserCode in(SELECT MemberID FROM TblMatrixtreeMaster
WHERE     (MemberId = @UserCode)ORDER BY JoinDate ASC)" 
            onselected="Left_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        <br />
        <obout:Grid ID="Grid2" runat="server" AllowAddingRecords="False" AllowFiltering="True"  Width="100">
            <Columns>
                <obout:Column  DataField="" ReadOnly="true" HeaderText="NO." Width="50" runat="server">
                    <TemplateSettings TemplateId="GridTemplate1"/></obout:Column>
              <obout:Column  DataField="JoinDate" HeaderText="JoinDate" Width="100" runat="server"/> 
                  <obout:Column  DataField="ConfirmDate" HeaderText="ConfirmDate" Width="150" runat="server"/>
                <obout:Column  DataField="MemberID" HeaderText="MemberID" Width="95" runat="server"/>
                <obout:Column  DataField="SponserId" HeaderText="SponsorID" Width="95" runat="server"/>
                <obout:Column  DataField="MemberName" HeaderText="MemberName" Width="150" runat="server"/>
                <obout:Column  DataField="CurrentRank" HeaderText="CurrentRank" Width="120" runat="server"/>
                <obout:Column  DataField="Pinamount" HeaderText="Pinamount" Width="120" runat="server"/>

                <%--<obout:Column DataField="MyPV" HeaderText="MyPV" Width="70" DataFormatString="{0:f}" runat="server"/>--%>
                <obout:Column  DataField="MobileNo" HeaderText="MobileNo" Width="115" runat="server"/>
                <%--<obout:Column  DataField="Cadre" HeaderText="Cadre" Width="120" runat="server"/>--%>
              <%--  <obout:Column  DataField="Status" HeaderText="Status" Width="120" runat="server"/>--%>
                <%--<obout:Column  DataField="Rank" HeaderText="Rank" Width="120" runat="server"/>--%>
                 
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
   
   
      <%--  <asp:SqlDataSource ID="Right" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
           SelectCommand="Select CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,[dbo].[MySponsor](usercode )as SponserId,UserName,CurrentRank,MobileNo,MyInvestment as MyPV from tblmemberMaster  where  UserCode in(SELECT MemberID FROM         TblMatrixtreeMaster
WHERE     (SponserID IN(SELECT RightChild FROM tblTreeMaster WHERE MemberID = @UserCode)))
union
Select CONVERT(varchar(10), DOJ, 103)as JoinDate,UserCode,UserName,CurrentRank,MobileNo,MyInvestment as MyPV from tblmemberMaster  where  UserCode in(SELECT     RightChild
                            FROM          tblTreeMaster
                            WHERE      (MemberID = @UserCode))" 
           onselected="Right_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
   
    
   

</asp:Content>
