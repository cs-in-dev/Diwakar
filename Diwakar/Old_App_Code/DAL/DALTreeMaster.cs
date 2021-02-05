using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DALTreeMaster
/// </summary>
public class DALTreeMaster
{
	public DALTreeMaster()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    DatabaseHelper objDatabaseHelper = new DatabaseHelper();
    SqlCommand dCmd = null;

    public BOTreeMaster CheckSponsorAndParent(BOTreeMaster objTreeMaster)
    {
        SqlDataReader rdTree = null;

        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_CheckSponsorAndParent";
        dCmd.CommandType = CommandType.StoredProcedure;
        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@SponsorCode", objTreeMaster.SponsorID, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@ParentCode", objTreeMaster.ParentID, SqlDbType.NVarChar, 50);

            rdTree = objDatabaseHelper.ExecuteReader(dCmd.CommandText, dCmd.CommandType, DatabaseHelper.ConnectionState.KeepOpen);
            if (rdTree.HasRows)
            {
                while (rdTree.Read())
                {
                    objTreeMaster.Message = rdTree["CheckSponsorAndParent"].ToString();
                }
                rdTree.Close();
            }
            objDatabaseHelper.CommitTransaction();
        }
        catch
        {
            objDatabaseHelper.RollbackTransaction();
        }
        finally
        {
            if (objDatabaseHelper.Connection.State == System.Data.ConnectionState.Open)
                objDatabaseHelper.Connection.Close();
        }
        return objTreeMaster;
    }
}
