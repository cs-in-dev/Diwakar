<%@ Page Title="" Language="C#" MasterPageFile="~/240578/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="WalletReport.aspx.cs" Inherits="MoneyMagnet.SuperAdmin.WalletReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="obout_Grid_NET" namespace="Obout.Grid" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 58%;
        }
        .style2
        {
            width: 559px;
        }
        .style5
        {
        }
        .style6
        {
            width: 279px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <cc1:Grid ID="Grid3" runat="server" AllowFiltering="True" 
        AllowGrouping="True" DataSourceID="SqlDataSource3">
    </cc1:Grid>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
         ConnectionString="Data Source=107.151.2.55;Initial Catalog=takeover;User ID=takeover;Password=hello1takeover@@@" 
        ProviderName="System.Data.SqlClient" 
        
               SelectCommand="SELECT     derivedtbl_1.UserCode, derivedtbl_1.UserName, derivedtbl_1.TaskEFund, derivedtbl_2.RewardEFund, derivedtbl_3.VoucherEFund
FROM         (SELECT     tblMemberMaster.UserCode, tblMemberMaster.UserName, ISNULL(derivedtbl_1_1.IBA, 0) AS TaskEFund
                       FROM          tblMemberMaster LEFT OUTER JOIN
                                                  (SELECT     SUM(Credit) - SUM(Debit) AS IBA, MemberID
                                                    FROM          AccountMaster
                                                    WHERE      (TxnType IN (13, 14, 15)) AND (DateofTransaction <= GETDATE())
                                                    GROUP BY MemberID) AS derivedtbl_1_1 ON tblMemberMaster.UserCode = derivedtbl_1_1.MemberID) AS derivedtbl_1 INNER JOIN
                          (SELECT     tblMemberMaster_1.UserCode, tblMemberMaster_1.UserName, ISNULL(derivedtbl_1_2.LTA, 0) AS RewardEFund
                            FROM          tblMemberMaster AS tblMemberMaster_1 LEFT OUTER JOIN
                                                       (SELECT     SUM(Credit) - SUM(Debit) AS LTA, MemberID
                                                         FROM          AccountMaster AS AccountMaster_1
                                                         WHERE      (TxnType IN (4,3,8,6)) AND (DateofTransaction <= GETDATE())
                                                         GROUP BY MemberID) AS derivedtbl_1_2 ON tblMemberMaster_1.UserCode = derivedtbl_1_2.MemberID) AS derivedtbl_2 ON 
                      derivedtbl_1.UserCode = derivedtbl_2.UserCode INNER JOIN
                          (SELECT     tblMemberMaster_2.UserCode, tblMemberMaster_2.UserName, ISNULL(derivedtbl_1_1_1.IBA, 0) AS VoucherEFund
                            FROM          tblMemberMaster AS tblMemberMaster_2 LEFT OUTER JOIN
                                                       (SELECT     SUM(Credit) - SUM(Debit) AS IBA, MemberID
                                                         FROM          AccountMaster AS AccountMaster_2
                                                         WHERE      (TxnType IN (7,6,15,5)) AND (DateofTransaction <= GETDATE())
                                                         GROUP BY MemberID) AS derivedtbl_1_1_1 ON tblMemberMaster_2.UserCode = derivedtbl_1_1_1.MemberID) AS derivedtbl_3 ON 
                      derivedtbl_2.UserCode = derivedtbl_3.UserCode">
           </asp:SqlDataSource>
    
    </asp:Content>
