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
 
       <div align=center style="font-family:@Arial Unicode MS; font-size:large; width=100%"> My <%=Request.QueryString["Side"].ToString() %></div>
   <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
        <obout:Grid ID="Grid1" runat="server" AllowAddingRecords="False" AllowFiltering="True" DataSourceID="Left" Width="100">
            <Columns>
                <obout:Column DataField="" ReadOnly="true" HeaderText="NO." Width="50" runat="server">
                    <TemplateSettings TemplateId="tplNumbering"/></obout:Column>
                <obout:Column DataField="JoinDate" HeaderText="Join Date" Width="100" runat="server"/> 
                <obout:Column DataField="Name" HeaderText="Name"  runat="server"/>
                <obout:Column DataField="UserCode" HeaderText="UserCode" Width="100" runat="server"/>
                <obout:Column DataField="Rank" HeaderText="Rank" Width="100" runat="server"/>
                <obout:Column DataField="City" HeaderText="City" Width="100" runat="server"/>
                <obout:Column DataField="State" HeaderText="State" Width="100" runat="server"/>
             
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
            
            SelectCommand="SELECT derivedtbl_1.JoinDate, derivedtbl_1.Name, derivedtbl_1.[User Name] as UserCode,RanksMaster.Rank, derivedtbl_1.City, derivedtbl_1.State  FROM         RanksMaster INNER JOIN (SELECT     TOP (100) PERCENT CONVERT(varchar(10), DOJ, 103) AS JoinDate, UserCode AS [User Name], UserName AS Name, MyRank, City, State, MobileNo FROM          tblMemberMaster WHERE      (UserCode IN     (SELECT     UserCode FROM          esc.MyLeftDownLine(@UserCode) AS MyLeftDownLine_1)) ORDER BY [User Name]) AS derivedtbl_1 ON RanksMaster.RankID = derivedtbl_1.MyRank" 
            onselected="Left_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="userCode" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <obout:Grid ID="Grid2" runat="server" AllowAddingRecords="False" AllowFiltering="True" DataSourceID="Right" Width="100">
             
            <Columns>

                <obout:Column DataField="" ReadOnly="true" HeaderText="NO." Width="50" runat="server">
                    <TemplateSettings TemplateId="tplNumberings"/>
                </obout:Column>
                <obout:Column  DataField="JoinDate" HeaderText="Join Date" Width="100" runat="server"/> 
                <obout:Column  DataField="Name" HeaderText="Name" runat="server"/>
                <obout:Column  DataField="UserCode" HeaderText="User Name" Width="100" runat="server"/>
                <obout:Column  DataField="Rank" HeaderText="Rank" Width="100" runat="server"/>
                <obout:Column  DataField="City" HeaderText="City" Width="100" runat="server"/>
                <obout:Column  DataField="State" HeaderText="State" Width="100" runat="server"/>
              
            </Columns>
            <Templates>
                <obout:GridTemplate runat="server" ID="tplNumberings">
                    <Template>
                        <b><%# (Container.RecordIndex + 1) %>.</b>
                    </Template>
                </obout:GridTemplate>
            </Templates> 
                  
        </obout:Grid>
           <span class="style1"><strong>Total Records:<asp:Label ID="Label2" 
            runat="server"></asp:Label>
        </strong></span>
       <br />
        <obout:Grid ID="Grid3" runat="server" AllowAddingRecords="False" AllowFiltering="True" DataSourceID="Both" Width="100" visible="false">
            
              <Columns>
                  <obout:Column DataField="" ReadOnly="true" HeaderText="NO." Width="50" runat="server">
                    <TemplateSettings TemplateId="tplNumberingss"/></obout:Column>
               
                <obout:Column  DataField="JoiningDate" HeaderText="Join Date" Width="100" runat="server"/> 
                <obout:Column  DataField="Name" HeaderText="Name" runat="server"/>
                <obout:Column  DataField="UserCode" HeaderText="User Name" Width="100" runat="server"/>
                <obout:Column  DataField="City" HeaderText="City" Width="100" runat="server"/>
                <obout:Column  DataField="State" HeaderText="State" Width="100" runat="server"/>
              
            </Columns>
               <Templates>
                <obout:GridTemplate runat="server" ID="tplNumberingss">
                    <Template>
                        <b><%# (Container.RecordIndex + 1) %>.</b>
                    </Template>
                </obout:GridTemplate>
            </Templates>    
        </obout:Grid>
        <%--<span visible="false"><strong>Total Records:<asp:Label ID="lblBoth" 
            runat="server"></asp:Label>
        </strong></span>--%>
       <asp:Label ID="check" runat="server" Visible="false"><strong>Total Records:<asp:Label ID="lblBoth" 
            runat="server"></asp:Label>
        </strong></asp:Label>
    </asp:Panel>
   
   
        <asp:SqlDataSource ID="Right" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
           SelectCommand="SELECT  derivedtbl_1.JoinDate, derivedtbl_1.Name, derivedtbl_1.[User Name] as UserCode, RanksMaster.Rank, derivedtbl_1.City, derivedtbl_1.State FROM  RanksMaster INNER JOIN (SELECT     TOP (100) PERCENT CONVERT(varchar(10), DOJ, 103) AS JoinDate, UserCode AS [User Name], UserName AS Name, MyRank, City, State, MobileNo FROM          tblMemberMaster WHERE      (UserCode IN     (SELECT     UserCode FROM          esc.MyRightDownLine(@UserCode) AS MyLeftDownLine_1)) ORDER BY [User Name]) AS derivedtbl_1 ON RanksMaster.RankID = derivedtbl_1.MyRank" 
           onselected="Right_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:SqlDataSource ID="Both" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
           SelectCommand="SELECT [DOJ] as JoiningDate, [UserName] as Name, [UserCode], [City], [State] FROM [tblMemberMaster] WHERE usercode in (select *  from esc.MyLeftDownLine(@UserCode) union select *  from esc.MyrightDownLine(@UserCode))" OnSelected="Both_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="UserCode" SessionField="UserCode" />
            </SelectParameters>
        </asp:SqlDataSource>
   
  
</asp:Content>
