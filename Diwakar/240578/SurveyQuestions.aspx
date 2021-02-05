<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="SurveyQuestions.aspx.cs" Inherits="ukinvestorNEW.Admin.SurveyQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<table align="center">
<tr>
<td align="center" colspan="3">
   <h2 class="style1">!! Add Questions !!</h2></td>
</tr>
<tr>
<td align="center" colspan="3">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <br /></td>
</tr>
<tr>
<td align="center" colspan="3">Choose Survey:-&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Details" 
        DataValueField="SurveyId" AutoPostBack="True">
        </asp:DropDownList>
    </td>
    <tr>
    <td>&nbsp;</td></tr>

</tr>
<tr>
<td align="left">
    Question</td>
<td align="left">
    <asp:TextBox ID="txtQusetion" runat="server" Width="300px"></asp:TextBox>
</td>
<td align="left">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtQusetion" ErrorMessage="Enter Question" 
        style="color: #FF0000" ValidationGroup="loveleen"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="left">
&nbsp;Answer 1:-</td>
<td align="left">
    <asp:TextBox ID="txtanswer1" runat="server" Width="250px"></asp:TextBox>
</td>
<td align="left">
</td>
</tr>
<tr>
<td align="left">
&nbsp;Answer 2:-</td>
<td align="left">
    <asp:TextBox ID="txtanswer2" runat="server" Width="250px"></asp:TextBox>
</td>
<td align="left">
</td>
</tr>
<tr>
<td align="left">
&nbsp;Answer 3:-</td>
<td align="left">
    <asp:TextBox ID="txtanswer3" runat="server" Width="250px"></asp:TextBox>
</td>
<td align="left">
</td>
</tr>
<tr>
<td align="left">
&nbsp;Answer 4:-</td>
<td align="left">
    <asp:TextBox ID="txtanswer4" runat="server" Width="250px"></asp:TextBox>
</td>
<td align="left">
</td>
</tr>
<tr>
<td colspan="3">
    <asp:Button ID="button1" runat="server" Text="Submit" 
        onclick="button1_Click" ValidationGroup="loveleen" /></td>
</tr>
<tr>
<td colspan="3"><asp:Label ID="label1" runat="server"></asp:Label></td>
</tr>
</table>


   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            
    SelectCommand="SELECT [SurveyId], [Details] FROM [tblsurvey] WHERE ([Type] = @Type)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Survey" Name="Type" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        

  

    
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="RowId" DataSourceID="SqlDataSource2" 
        ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RowId" HeaderText="RowId" InsertVisible="False" 
                ReadOnly="True" SortExpression="RowId" />
            <asp:BoundField DataField="SurveyID" HeaderText="SurveyID" 
                SortExpression="SurveyID" />
            <asp:BoundField DataField="QuesId" HeaderText="QuesId" 
                SortExpression="QuesId" />
            <asp:BoundField DataField="Question" HeaderText="Question" 
                SortExpression="Question" />
            <asp:BoundField DataField="Answer1" HeaderText="Answer1" 
                SortExpression="Answer1" />
            <asp:BoundField DataField="Answer2" HeaderText="Answer2" 
                SortExpression="Answer2" />
            <asp:BoundField DataField="Answer3" HeaderText="Answer3" 
                SortExpression="Answer3" />
            <asp:BoundField DataField="Answer4" HeaderText="Answer4" 
                SortExpression="Answer4" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
        

  

    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        DeleteCommand="DELETE FROM [tblSurveyQuestions] WHERE [RowId] = @original_RowId AND (([SurveyID] = @original_SurveyID) OR ([SurveyID] IS NULL AND @original_SurveyID IS NULL)) AND (([QuesId] = @original_QuesId) OR ([QuesId] IS NULL AND @original_QuesId IS NULL)) AND (([Question] = @original_Question) OR ([Question] IS NULL AND @original_Question IS NULL)) AND (([Answer1] = @original_Answer1) OR ([Answer1] IS NULL AND @original_Answer1 IS NULL)) AND (([Answer2] = @original_Answer2) OR ([Answer2] IS NULL AND @original_Answer2 IS NULL)) AND (([Answer3] = @original_Answer3) OR ([Answer3] IS NULL AND @original_Answer3 IS NULL)) AND (([Answer4] = @original_Answer4) OR ([Answer4] IS NULL AND @original_Answer4 IS NULL))" 
        InsertCommand="INSERT INTO [tblSurveyQuestions] ([SurveyID], [QuesId], [Question], [Answer1], [Answer2], [Answer3], [Answer4]) VALUES (@SurveyID, @QuesId, @Question, @Answer1, @Answer2, @Answer3, @Answer4)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [tblSurveyQuestions] WHERE ([SurveyID] = @SurveyID)" 
        UpdateCommand="UPDATE [tblSurveyQuestions] SET [SurveyID] = @SurveyID, [QuesId] = @QuesId, [Question] = @Question, [Answer1] = @Answer1, [Answer2] = @Answer2, [Answer3] = @Answer3, [Answer4] = @Answer4 WHERE [RowId] = @original_RowId AND (([SurveyID] = @original_SurveyID) OR ([SurveyID] IS NULL AND @original_SurveyID IS NULL)) AND (([QuesId] = @original_QuesId) OR ([QuesId] IS NULL AND @original_QuesId IS NULL)) AND (([Question] = @original_Question) OR ([Question] IS NULL AND @original_Question IS NULL)) AND (([Answer1] = @original_Answer1) OR ([Answer1] IS NULL AND @original_Answer1 IS NULL)) AND (([Answer2] = @original_Answer2) OR ([Answer2] IS NULL AND @original_Answer2 IS NULL)) AND (([Answer3] = @original_Answer3) OR ([Answer3] IS NULL AND @original_Answer3 IS NULL)) AND (([Answer4] = @original_Answer4) OR ([Answer4] IS NULL AND @original_Answer4 IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_RowId" Type="Int64" />
            <asp:Parameter Name="original_SurveyID" Type="Int64" />
            <asp:Parameter Name="original_QuesId" Type="Int64" />
            <asp:Parameter Name="original_Question" Type="String" />
            <asp:Parameter Name="original_Answer1" Type="String" />
            <asp:Parameter Name="original_Answer2" Type="String" />
            <asp:Parameter Name="original_Answer3" Type="String" />
            <asp:Parameter Name="original_Answer4" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SurveyID" Type="Int64" />
            <asp:Parameter Name="QuesId" Type="Int64" />
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="SurveyID" 
                PropertyName="SelectedValue" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SurveyID" Type="Int64" />
            <asp:Parameter Name="QuesId" Type="Int64" />
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="original_RowId" Type="Int64" />
            <asp:Parameter Name="original_SurveyID" Type="Int64" />
            <asp:Parameter Name="original_QuesId" Type="Int64" />
            <asp:Parameter Name="original_Question" Type="String" />
            <asp:Parameter Name="original_Answer1" Type="String" />
            <asp:Parameter Name="original_Answer2" Type="String" />
            <asp:Parameter Name="original_Answer3" Type="String" />
            <asp:Parameter Name="original_Answer4" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
        

  

    
    <br />
        

  

    
</asp:Content>
