using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for BALPin
/// </summary>
public class BALPin
{
	public BALPin()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int insertPin(BOPin objPin)
    {

        DALPin objDALPin = new DALPin();
        try
        {
            return objDALPin.InsertPin(objPin);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALPin = null;
        }
    }
    public int insertPinNew(BOPin objPin)
    {

        DALPin objDALPin = new DALPin();
        try
        {
            return objDALPin.InsertPinNew(objPin);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALPin = null;
        }
    }

    public BOPin checkPinAvalability(BOPin objPin)
    {

        DALPin objDALPin = new DALPin();
        try
        {
            return objDALPin.CheckPinAvalability(objPin);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALPin = null;
        }
    }

   
}
