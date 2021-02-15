<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="InsertLevelsData.aspx.cs" Inherits="SSRPPL._19111973.InsertLevelsData" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*.style1
        {
             width: 70%;
            height: 12px;
        }*/

        .style6 {
            color: #990000;
            width: 231px;
        }

        .style7 {
            height: 22px;
            width: 231px;
        }

        .style8 {
            height: 26px;
            width: 231px;
        }

        .style9 {
            height: 23px;
            color: #990000;
            width: 231px;
        }

        .style10 {
            text-align: center;
        }

        .style20 {
            text-align: center;
            width: 254px;
        }

        .GridView td {
            padding: 2px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Add/Delete Levels Data</h4>
    <table class="style1">
        <tr>
            <td style="text-align: right; width: 50%">Level :
            </td>
            <td style="text-align: left; width: 50%">
                <asp:TextBox ID="txtlevel" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtlevel" ForeColor="Red" ValidationGroup="vg1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 50%">Income %:
            </td>
            <td style="text-align: left; width: 50%">
                <asp:TextBox ID="txtincomepercent" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtincomepercent" ForeColor="Red" ValidationGroup="vg1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; width: 50%"></td>
            <td style="text-align: left; width: 50%">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="vg1" />
            </td>
        </tr>

        <tr>

            <td align="right">&nbsp;</td>
            <td>
                <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>

    </table>

    <div>
      
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                    DataKeyNames="Levels" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                    OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                    Width="50%">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#EFF3FB" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />

                    <Columns>
                      
                        <asp:TemplateField HeaderText="Levels" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lbllevel" runat="server" Text='<%# Eval("Levels") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Level Income Percent" ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:Label ID="lblLevelIncomePercent" runat="server" Text='<%# Eval("LevelIncomePercent") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="grdtxtLevelIncomePercent" runat="server" Text='<%# Eval("LevelIncomePercent") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                            ItemStyle-Width="150" />

                    </Columns>

                </asp:GridView>
            
        <div>
            <asp:Label ID="errormsg" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>
