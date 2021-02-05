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
/// Summary description for BOTreeMaster
/// </summary>
public class BOTreeMaster
{
	public BOTreeMaster()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    string _MemberID = "";
    string _SponsorID = "";
    string _ParentID = "";
    string _LeftChild= "";
    string _RightChild = "";
    string _Message = "";

    public string MemberID
    {
        get
        {
            return _MemberID;
        }
        set
        {
            _MemberID = value;
        }
    }

    public string SponsorID
    {
        get
        {
            return _SponsorID;
        }
        set
        {
            _SponsorID = value;
        }
    }

    public string ParentID
    {
        get
        {
            return _ParentID;
        }
        set
        {
            _ParentID = value;
        }
    }

    public string LeftChild
    {
        get
        {
            return _LeftChild;
        }
        set
        {
            _LeftChild = value;
        }
    }

    public string RightChild
    {
        get
        {
            return _RightChild;
        }
        set
        {
            _RightChild = value;
        }
    }

    public string Message
    {
        get
        {
            return _Message;
        }
        set
        {
            _Message = value;
        }
    }
}
