using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;

///</summary>
/// Summary description for DatabaseHelper
/// </summary>
public class DatabaseHelper : IDisposable//,IError
{

    //public DatabaseHelper()
    //{
    //    //
    //    // TODO: Add constructor logic here
    //    //
    //}

    private SqlConnection objConnection;
    private SqlCommand objCommand;
    private bool boolHandleErrors;
    private string strLastError;
    private bool boolLogError;
    private string strLogFile;


    protected void ErrorOccured(string Reason, string Message, string Location)
    {
        //Transactions.BusinessLogic.ErrorLog.HandleError(Reason, Message, Location, Transactions.BusinessLogic.ErrorLog.ErrorType.Critical)
        ////if (OnExecuteError != null)
        ////OnExecuteError(Reason, Message, Location);
    }


    //Public Sub New(ByVal connectionstring As String)

    //End Sub
    //Public Function ExecuteNonQuery(ByVal objCommand As SqlCommand, ByVal connectionstate As ConnectionState) As Integer
    //    Dim i As Integer = -1
    //    Try
    //        If objConnection.State = System.Data.ConnectionState.Closed Then
    //            objConnection.Open()
    //        End If
    //        i = objCommand.ExecuteNonQuery
    //    Catch ex As Exception
    //        HandleExceptions(ex)
    //    Finally
    //        objCommand.Parameters.Clear()
    //        If ConnectionState = ConnectionState.CloseOnExit Then
    //            objConnection.Close()
    //        End If
    //    End Try
    //    Return i
    //End Function


    public DatabaseHelper()
    {
        //MyClass.New(ConfigurationManager.ConnectionStrings(DatabaseConstants.SAS_SECURITY).ConnectionString)
        objConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        objCommand = new SqlCommand();
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        objCommand.Connection = objConnection;
    }

    //This constructor is added for connecting to reports database
    //INSTANT C# TODO TASK: This method is a constructor, but no class name was found
    public DatabaseHelper(String DatabaseName)
    {

        objConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        objCommand = new SqlCommand();
        objConnection.ConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        objCommand.Connection = objConnection;
    }

    public bool HandleErrors
    {
        get
        {
            return boolHandleErrors;
        }
        set
        {
            boolHandleErrors = value;
        }
    }
    public string LastError
    {
        get
        {
            return strLastError;
        }
    }

    public bool LogErrors
    {
        get
        {
            return boolLogError;
        }
        set
        {
            boolLogError = value;
        }
    }


    public string LogFile
    {
        get
        {
            return strLogFile;
        }
        set
        {
            strLogFile = value;
        }
    }

    public object AddParameter(SqlParameter parameter)
    {
        return objCommand.Parameters.Add(parameter);
    }

    public object AddParameter(string name)
    {
        SqlParameter p = new SqlParameter();
        p.ParameterName = name;
        p.SqlDbType = SqlDbType.Int;
        p.Direction = ParameterDirection.Output;
        return objCommand.Parameters.Add(p);
    }


    public object AddParameter(string name, object value, SqlDbType StrSqlDbType, int IntSize)
    {
        return AddParameter(name, value, StrSqlDbType, IntSize, ParameterDirection.Input);
    }

    public object AddParameter(string name, object value, SqlDbType StrSqlDbType)
    {
        return AddParameter(name, value, StrSqlDbType, 0, ParameterDirection.Input);
    }

    //INSTANT C# NOTE: C# does not support optional parameters. Overloaded method(s) are created above.
    //ORIGINAL LINE: Public Function AddParameter(ByVal name As String, ByVal value As Object, ByVal StrSqlDbType As SqlDbType, Optional ByVal IntSize As Integer = null, Optional ByVal StrDirection As ParameterDirection = ParameterDirection.Input)
    public object AddParameter(string name, object value, SqlDbType StrSqlDbType, int IntSize, ParameterDirection StrDirection)
    {
        SqlParameter p = new SqlParameter();
        p.ParameterName = name;
        p.Value = value;
        p.SqlDbType = StrSqlDbType;
        p.Direction = StrDirection;
        p.Size = IntSize;

        return objCommand.Parameters.Add(p);
    }



    public object AddOptionalParameter(string name, ParameterDirection StrDirection, SqlDbType StrSqlDbType)
    {
        return AddOptionalParameter(name, StrDirection, StrSqlDbType, 0);
    }

    public object AddOptionalParameter(string name, ParameterDirection StrDirection)
    {
        return AddOptionalParameter(name, StrDirection, SqlDbType.Int, 0);
    }

    public object AddOptionalParameter(string name)
    {
        return AddOptionalParameter(name, ParameterDirection.Output, SqlDbType.Int, 0);
    }

    //INSTANT C# NOTE: C# does not support optional parameters. Overloaded method(s) are created above.
    //ORIGINAL LINE: Public Function AddOptionalParameter(ByVal name As String, Optional ByVal StrDirection As ParameterDirection = ParameterDirection.Output, Optional ByVal StrSqlDbType As SqlDbType = SqlDbType.Int, Optional ByVal IntSize As Integer = null)
    public object AddOptionalParameter(string name, ParameterDirection StrDirection, SqlDbType StrSqlDbType, int IntSize)
    {
        SqlParameter p = new SqlParameter();
        p.ParameterName = name;
        p.SqlDbType = StrSqlDbType;
        p.Direction = StrDirection;
        p.Size = IntSize;

        return objCommand.Parameters.Add(p);
    }

    public SqlCommand Command
    {
        get
        {
            return objCommand;
        }
    }

    public SqlConnection Connection
    {
        get
        {
            return objConnection;
        }
    }
    public SqlParameter GetObjParameter
    {
        get
        {
            SqlParameter p = new SqlParameter();
            return p;
        }
    }


    public void BeginTransaction()
    {
        if (objConnection.State == System.Data.ConnectionState.Closed)
        {
            objConnection.Open();
        }
        objCommand.Transaction = objConnection.BeginTransaction();
    }

    public void CommitTransaction()
    {
        objCommand.Transaction.Commit();
        objConnection.Close();
    }

    public void RollbackTransaction()
    {
        objCommand.Transaction.Rollback();
        objConnection.Close();
    }

    public int ExecuteNonQuery(string query)
    {
        return ExecuteNonQuery(query, CommandType.Text, ConnectionState.CloseOnExit);
    }

    public int ExecuteNonQuery(string query, CommandType commandtype)
    {
        return ExecuteNonQuery(query, commandtype, ConnectionState.CloseOnExit);
    }

    public int ExecuteNonQuery(string query, ConnectionState connectionstate)
    {
        return ExecuteNonQuery(query, CommandType.Text, connectionstate);
    }
    public int ExecuteNonQuery(SqlCommand objCommand, ConnectionState connectionstate)
    {
        int i = -1;
        try
        {
            if (objConnection.State == System.Data.ConnectionState.Closed)
            {
                objConnection.Open();
            }
            i = objCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HandleExceptions(ex);
        }
        finally
        {
            objCommand.Parameters.Clear();
            if (connectionstate == ConnectionState.CloseOnExit)
            {
                objConnection.Close();
            }
        }
        return i;
    }


    public int ExecuteNonQuery(string query, CommandType commandtype, ConnectionState connectionstate)
    {
        objCommand.CommandText = query;
        objCommand.CommandType = commandtype;
        int i = -1;
        try
        {
            if (objConnection.State == System.Data.ConnectionState.Closed)
            {
                objConnection.Open();
            }
            i = objCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HandleExceptions(ex);
        }
        finally
        {
            objCommand.Parameters.Clear();
            if (connectionstate == ConnectionState.CloseOnExit)
            {
                objConnection.Close();
            }
        }
        return i;
    }

    public object ExecuteScalar(string query)
    {
        return ExecuteScalar(query, CommandType.Text, ConnectionState.CloseOnExit);
    }

    public object ExecuteScalar(string query, CommandType commandtype)
    {
        return ExecuteScalar(query, commandtype, ConnectionState.CloseOnExit);
    }

    public object ExecuteScalar(string query, ConnectionState connectionstate)
    {
        return ExecuteScalar(query, CommandType.Text, connectionstate);
    }

    public object ExecuteScalar(string query, CommandType commandtype, ConnectionState connectionstate)
    {
        objCommand.CommandText = query;
        objCommand.CommandType = commandtype;
        objCommand.CommandTimeout = 0;
        object o = null;
        try
        {
            if (objConnection.State == System.Data.ConnectionState.Closed)
            {
                objConnection.Open();
            }
            o = objCommand.ExecuteScalar();
        }
        catch (Exception ex)
        {
            HandleExceptions(ex);
        }
        finally
        {
            objCommand.Parameters.Clear();
            if (connectionstate == ConnectionState.CloseOnExit)
            {
                objConnection.Close();
            }
        }
        return o;
    }

    public SqlDataReader ExecuteReader(string query)
    {

        return ExecuteReader(query, CommandType.Text, ConnectionState.CloseOnExit);
    }

    public SqlDataReader ExecuteReader(string query, CommandType commandtype)
    {
        return ExecuteReader(query, commandtype, ConnectionState.CloseOnExit);
    }

    public SqlDataReader ExecuteReader(string query, ConnectionState connectionstate)
    {
        return ExecuteReader(query, CommandType.Text, connectionstate);
    }

    public SqlDataReader ExecuteReader(string query, CommandType commandtype, ConnectionState connectionstate)
    {
        objCommand.CommandText = query;
        objCommand.CommandType = commandtype;
        SqlDataReader reader = null;
        try
        {
            if (objConnection.State == System.Data.ConnectionState.Closed)
            {
                objConnection.Open();
            }
            if (connectionstate == ConnectionState.CloseOnExit)
            {
                reader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
            }
            else
            {
                reader = objCommand.ExecuteReader();
            }
        }
        catch (Exception ex)
        {
            HandleExceptions(ex);
        }
        finally
        {
            objCommand.Parameters.Clear();
        }
        return reader;
    }

    public SqlDataReader ExecuteReader(SqlCommand cmd, ConnectionState connectionstate)
    {
        SqlDataReader reader = null;
        try
        {
            if (objConnection.State == System.Data.ConnectionState.Closed)
            {
                objConnection.Open();
            }
            if (connectionstate == ConnectionState.CloseOnExit)
            {
                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            else
            {
                reader = cmd.ExecuteReader();
            }
        }
        catch (Exception ex)
        {
            //HandleExceptions(ex)
            throw ex;
        }
        finally
        {
            // cmd.Parameters.Clear()

        }
        return reader;
    }


    public DataSet ExecuteDataSet(string query)
    {
        return ExecuteDataSet(query, CommandType.Text, ConnectionState.CloseOnExit);
    }

    public DataSet ExecuteDataSet(string query, CommandType commandtype)
    {
        return ExecuteDataSet(query, commandtype, ConnectionState.CloseOnExit);
    }

    public DataSet ExecuteDataSet(string query, ConnectionState connectionstate)
    {
        return ExecuteDataSet(query, CommandType.Text, connectionstate);
    }

    public DataSet ExecuteDataSet(string query, CommandType commandtype, ConnectionState connectionstate)
    {
        SqlDataAdapter adapter = new SqlDataAdapter();
        objCommand.CommandText = query;
        objCommand.CommandType = commandtype;
        adapter.SelectCommand = objCommand;
        DataSet ds = new DataSet();
        try
        {
            adapter.Fill(ds);
        }
        catch (Exception ex)
        {
            HandleExceptions(ex);
        }
        finally
        {
            objCommand.Parameters.Clear();
            if (connectionstate == ConnectionState.CloseOnExit)
            {
                if (objConnection.State == System.Data.ConnectionState.Open)
                {
                    objConnection.Close();
                }
            }
        }
        return ds;
    }

    private void HandleExceptions(Exception ex)
    {
        if (LogErrors)
        {
            WriteToLog(ex.Message);
        }
        if (HandleErrors)
        {
            strLastError = ex.Message;
        }
        else
        {
            throw ex;
        }
    }

    private void WriteToLog(string msg)
    {
        StreamWriter writer = File.AppendText(LogFile);
        writer.WriteLine(DateTime.Now.ToString() + " - " + msg);
        writer.Close();
    }

    public void Dispose()
    {
        this.Dispose1();
    }
    public void Dispose1()
    {
        objConnection.Close();
        objConnection.Dispose();
        objCommand.Dispose();
    }


    public enum Providers : int
    {
        SqlServer,
        OleDb,
        Oracle,
        ODBC,
        ConfigDefined
    }

    public enum ConnectionState : int
    {
        KeepOpen,
        CloseOnExit
    }

    //public interface IError
    //{
    //    //INSTANT C# TODO TASK: Delegates within interfaces are not allowed in C#. Move this delegate elsewhere.
    //    delegate void OnExecuteErrorEventHandler(string Reason, string Message, string Location);
    //    event OnExecuteErrorEventHandler OnExecuteError;
    //}
}

