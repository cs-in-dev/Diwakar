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
/// Summary description for BALNews
/// </summary>
public class BALNews
{
	public BALNews()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int insertNews(BONews objNews)
    {
        DALNesw objDALNesw = new DALNesw();

        try
        {
            return objDALNesw.InsertNews(objNews);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALNesw = null;
        }
    }

    public int updateNews(BONews objNews)
    {
        DALNesw objDALNesw = new DALNesw();

        try
        {
            return objDALNesw.UpdateNews(objNews);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALNesw = null;
        }
    }

    public int deleteNews(BONews objNews)
    {
        DALNesw objDALNesw = new DALNesw();

        try
        {
            return objDALNesw.DeleteNews(objNews);
        }
        catch
        {
            throw;
        }
        finally
        {
            objDALNesw = null;
        }
    }
}
