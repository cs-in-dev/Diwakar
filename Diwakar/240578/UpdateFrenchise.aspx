<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="UpdateFrenchise.aspx.cs" Inherits="WGRL.Super19111973.UpdateFranchise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <h2>Update Branch</h2>    <br />    <br />
    <asp:Label ID="lblTotalFranchise" runat="server" Text=""></asp:Label>
        <br />    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="FrenchiseID" Width="100%" 
        AllowPaging="True" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="FrenchiseID" HeaderText="Frenchise ID" 
                ReadOnly="True" SortExpression="FrenchiseID" />
            <asp:BoundField DataField="FranchiseName" HeaderText="Franchise Name" 
                SortExpression="FranchiseName" />
             <asp:BoundField DataField="ContactName" HeaderText="Contact Name" 
                SortExpression="ContactName" />
                 <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Name" HeaderText="Frenchise Type" SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
           
            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" 
                SortExpression="MobileNo" />
             <asp:BoundField DataField="Level" HeaderText="Level" 
                SortExpression="Level" />
            <%--<asp:BoundField DataField="Parent" HeaderText="Parent" 
                SortExpression="Parent" ReadOnly="True" />--%>
            
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
        <RowStyle HorizontalAlign="Left" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conn %>"
         DeleteCommand="DELETE FROM [tblFrenchiseMaster] WHERE [FrenchiseID] = @original_FrenchiseID" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblFrenchiseMaster]" 
        UpdateCommand="UPDATE [tblFrenchiseMaster] Set [Password] = @Password, [Address] = @Address, [City] = @City, [State] = @State, [Country] = @Country, [Email] = @Email, [MobileNo] = @MobileNo, [Date] = @Date,  [Level] = @Level, [Position] = @Position, [Parent] = @Parent, [FranchiseName] = @FranchiseName, [ContactName] = @ContactName WHERE [FrenchiseID] = @original_FrenchiseID">
        <DeleteParameters>
            <asp:Parameter Name="original_FrenchiseID" Type="String" />
           
        </DeleteParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="MobileNo" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="Level" Type="Int32" />
            <asp:Parameter Name="Position" Type="Boolean" />
            <asp:Parameter Name="Parent" Type="String" />
            <asp:Parameter Name="FranchiseName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="PinAmount" Type="String" />
            <asp:Parameter Name="original_FrenchiseID" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_MobileNo" Type="String" />
            <asp:Parameter Name="original_Date" Type="DateTime" />
            <asp:Parameter Name="original_Status" Type="Boolean" />
            <asp:Parameter Name="original_Level" Type="Int32" />
            <asp:Parameter Name="original_Position" Type="Boolean" />
            <asp:Parameter Name="original_Parent" Type="String" />
            <asp:Parameter Name="original_FranchiseName" Type="String" />
            <asp:Parameter Name="original_ContactName" Type="String" />
            <asp:Parameter Name="original_PinAmount" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
