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
/// Summary description for BALMemberMaster
/// </summary>
public class BALMemberMaster
{
	public BALMemberMaster()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public String insertMember(BOMemberMaster objMemberMaster)
    {
        DALMemberMaster objDALMemberMaster = new DALMemberMaster();

        try
        {
            return objDALMemberMaster.InsertMember(objMemberMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALMemberMaster = null;
        }
    }

    public String updateMember(BOMemberMaster objMemberMaster)
    {
        DALMemberMaster objDALMemberMaster = new DALMemberMaster();

        try
        {
            return objDALMemberMaster.UpdateMember(objMemberMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALMemberMaster = null;
        }
    }

    public String updateMemberAdmin(BOMemberMaster objMemberMaster)
    {
        DALMemberMaster objDALMemberMaster = new DALMemberMaster();

        try
        {
            return objDALMemberMaster.UpdateMemberAdmin(objMemberMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALMemberMaster = null;
        }
    }

    public String InsertMember_Admin(BOMemberMaster objMemberMaster)
    {
        DALMemberMaster objDALMemberMaster = new DALMemberMaster();

        try
        {
            return objDALMemberMaster.InsertMember_Admin(objMemberMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALMemberMaster = null;
        }
    }

    public BOMemberMaster getMemberProfileByMemberCode(BOMemberMaster objMemberMaster)
    {

        DALMemberMaster objDALMemberMaster = new DALMemberMaster();
        try
        {
            return objDALMemberMaster.GetMemberProfileByMemberCode(objMemberMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALMemberMaster = null;
        }
    }

    public BOMemberMaster userAuthentication(BOMemberMaster objMemberMaster)
    {

        DALMemberMaster objDALMemberMaster = new DALMemberMaster();
        try
        {
            return objDALMemberMaster.UserAuthentication(objMemberMaster);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALMemberMaster = null;
        }
    }

    //internal string updateMemberAdmin(BOMemberMaster objMemberMaster)
    //{
    //    throw new NotImplementedException();
    //}
}
