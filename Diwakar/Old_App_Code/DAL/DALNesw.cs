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
/// Summary description for DALNesw
/// </summary>
public class DALNesw
{
	public DALNesw()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    DatabaseHelper objDatabaseHelper = new DatabaseHelper();
    SqlCommand dCmd = null;
    int returnValue = 0;

    public int InsertNews(BONews objNews)
    {
        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_InsertNews";
        dCmd.CommandType = CommandType.StoredProcedure;
        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@NewsHeadLine", objNews.NewsHeadLine, SqlDbType.NVarChar);
            objDatabaseHelper.AddParameter("@NewsDetail", objNews.NewsDetail, SqlDbType.NVarChar);

            returnValue = Convert.ToInt32(objDatabaseHelper.ExecuteNonQuery(dCmd.CommandText, dCmd.CommandType, DatabaseHelper.ConnectionState.KeepOpen));
            objDatabaseHelper.CommitTransaction();
        }
        catch
        {
            objDatabaseHelper.RollbackTransaction();
        }

        finally
        {
            if (objDatabaseHelper.Connection.State == System.Data.ConnectionState.Open)
            {
                objDatabaseHelper.Connection.Close();
            }
        }
        return returnValue;
    }

    public int UpdateNews(BONews objNews)
    {
        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_UpdateNews";
        dCmd.CommandType = CommandType.StoredProcedure;

        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@NewsID", objNews.NewsID, SqlDbType.Int);
            objDatabaseHelper.AddParameter("@NewsHeadLine", objNews.NewsHeadLine, SqlDbType.NVarChar);
            objDatabaseHelper.AddParameter("@NewsDetail", objNews.NewsDetail, SqlDbType.NVarChar);

            returnValue = Convert.ToInt32(objDatabaseHelper.ExecuteNonQuery(dCmd.CommandText, dCmd.CommandType, DatabaseHelper.ConnectionState.KeepOpen));

            objDatabaseHelper.CommitTransaction();


        }
        catch
        {
            objDatabaseHelper.RollbackTransaction();
        }
        finally
        {
            if (objDatabaseHelper.Connection.State == System.Data.ConnectionState.Open)
            {
                objDatabaseHelper.Connection.Close();
            }
        }
        return returnValue;

    }

    public int DeleteNews(BONews objNews)
    {
        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_DeleteNews";
        dCmd.CommandType = CommandType.StoredProcedure;
        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@NewsID", objNews.NewsID, SqlDbType.Int);

            returnValue = Convert.ToInt32(objDatabaseHelper.ExecuteNonQuery(dCmd.CommandText, dCmd.CommandType, DatabaseHelper.ConnectionState.KeepOpen));

            objDatabaseHelper.CommitTransaction();
        }
        catch
        {
            objDatabaseHelper.RollbackTransaction();
        }
        finally
        {
            if (objDatabaseHelper.Connection.State == System.Data.ConnectionState.Open)
            {
                objDatabaseHelper.Connection.Close();
            }
        }
        return returnValue;
    }
}
