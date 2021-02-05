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
/// Summary description for DALPin
/// </summary>
public class DALPin
{
	public DALPin()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    DatabaseHelper objDatabaseHelper = new DatabaseHelper();
    SqlCommand dCmd = null;
    int returnValue = 0;

    public int InsertPin(BOPin objPin)
    {
        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_InserPin";
        dCmd.CommandType = CommandType.StoredProcedure;
        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@PinAmount", objPin.PinAmount, SqlDbType.Decimal);
            objDatabaseHelper.AddParameter("@CreationDate", objPin.CreationDate, SqlDbType.DateTime);
            objDatabaseHelper.AddParameter("@CreatedBy", objPin.CreatedBy, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@CreatedFor", objPin.CreatedTo, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@TransPassword", objPin.TransectionPassword, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@PinCount", objPin.NumberOfPin, SqlDbType.NVarChar, 50);


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
    public int InsertPinNew(BOPin objPin)
    {
        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_InserPin";
        dCmd.CommandType = CommandType.StoredProcedure;
        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@PinAmount", objPin.PinAmount, SqlDbType.Decimal);
            objDatabaseHelper.AddParameter("@CreationDate", objPin.CreationDate, SqlDbType.DateTime);
            objDatabaseHelper.AddParameter("@CreatedBy", objPin.CreatedBy, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@CreatedFor", objPin.CreatedTo, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@TransPassword", objPin.TransectionPassword, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@PinCount", objPin.NumberOfPin, SqlDbType.NVarChar, 50);
            objDatabaseHelper.AddParameter("@OrderId", objPin.OrderId1, SqlDbType.BigInt, 8);
            objDatabaseHelper.AddParameter("@ProductId", objPin.ProductId, SqlDbType.BigInt, 8);
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
    public BOPin CheckPinAvalability(BOPin objPin)
    {
        SqlDataReader rdPin = null;

        dCmd = objDatabaseHelper.Command;
        dCmd.CommandText = "SP_CheckPinValidity";
        dCmd.CommandType = CommandType.StoredProcedure;
        try
        {
            objDatabaseHelper.BeginTransaction();

            objDatabaseHelper.AddParameter("@PinCode", objPin.PinCode, SqlDbType.NVarChar, 50);

            rdPin = objDatabaseHelper.ExecuteReader(dCmd.CommandText, dCmd.CommandType, DatabaseHelper.ConnectionState.KeepOpen);
            if (rdPin.HasRows)
            {
                while (rdPin.Read())
                {
                    objPin.Message = rdPin["PinValidation"].ToString();
                   
                    
                }
                rdPin.Close();
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
        return objPin;
    }


    //public DataSet GetAllPin()
    //{

    //    DataSet dsGetAllpin = new DataSet();
    //    dCmd = objDatabaseHelper.Command;
    //    dCmd.CommandText = "SP_GetAllPin";
    //    dCmd.CommandType = CommandType.StoredProcedure;

    //    try
    //    {
    //        objDatabaseHelper.BeginTransaction();

    //        dsGetAllpin = objDatabaseHelper.ExecuteDataSet(dCmd.CommandText, dCmd.CommandType, DatabaseHelper.ConnectionState.KeepOpen);

    //        objDatabaseHelper.CommitTransaction();
    //    }
    //    catch
    //    {
    //        objDatabaseHelper.RollbackTransaction();
    //    }
    //    finally
    //    {
    //        if (objDatabaseHelper.Connection.State == System.Data.ConnectionState.Open)
    //            objDatabaseHelper.Connection.Close();
    //    }

    //    return dsGetAllpin;
    //}

}
