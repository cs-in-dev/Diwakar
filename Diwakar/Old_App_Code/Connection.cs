using System;
using System.Collections.Generic;
using System.Web;

using System.Configuration;

/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    public static String connString;

    static Connection()
    {
        connString = ConfigurationManager.ConnectionStrings["conn"].ToString();
    }

    public String GetConnectionString()
    {
        return connString;
    }
}