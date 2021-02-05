using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BALTreeMaster
/// </summary>
public class BALTreeMaster
{
	public BALTreeMaster()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public BOTreeMaster checkSponsorAndParent(BOTreeMaster objTreeMaster)
    {

        DALTreeMaster objDALTreeMaster = new DALTreeMaster();
        try
        {
            return objDALTreeMaster.CheckSponsorAndParent(objTreeMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALTreeMaster = null;
        }
    }
    
}
