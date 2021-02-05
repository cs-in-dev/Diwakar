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
/// Summary description for BONews
/// </summary>
public class BONews
{
	public BONews()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    int _NewsID = 0;
    string _NewsHeadLine = "";
    string _NewsDetail = "";

    public int NewsID
    {
        get
        {
            return _NewsID;
        }
        set
        {
            _NewsID = value;
        }
    }

    public String NewsHeadLine
    {
        get
        {
            return _NewsHeadLine;
        }
        set
        {
            _NewsHeadLine = value;
        }
    }

    public String NewsDetail
    {
        get
        {
            return _NewsDetail;
        }
        set
        {
            _NewsDetail = value;
        }
    }
}
