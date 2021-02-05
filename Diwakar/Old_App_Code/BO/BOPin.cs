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
/// Summary description for BOPin
/// </summary>
public class BOPin
{
	public BOPin()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    int _PinID = 0;
    string _PinCode = "";
    decimal _PinAmount = 0.0M;
    DateTime _CreationDate;
    string _CreatedBy = "";
    string _CreatedTo = "";
    bool _Status;
    string _TransectionPassword = "";
    int _NumberOfPin = 0;
    string _Message = "";
    int _OrderId1 = 0;
    int _ProductId = 0;

    public int PinID
    {
        get
        {
            return _PinID;
        }
        set
        {
            _PinID = value;
        }
    }
    public int OrderId1
    {
        get
        {
            return _OrderId1;
        }
        set
        {
            _OrderId1 = value;
        }
    }
    public int ProductId
    {
        get
        {
            return _ProductId;
        }
        set
        {
            _ProductId = value;
        }
    }
    public String PinCode
    {
        get
        {
            return _PinCode;
        }
        set
        {
            _PinCode = value;
        }
    }

    public decimal PinAmount
    {
        get
        {
            return _PinAmount;
        }
        set
        {
            _PinAmount = value;
        }
    }

    public DateTime CreationDate
    {
        get
        {
            return _CreationDate;
        }
        set
        {
            _CreationDate = value;
        }
    }

    public string CreatedBy
    {
        get
        {
            return _CreatedBy;
        }
        set
        {
            _CreatedBy = value;
        }
    }

    public string CreatedTo
    {
        get
        {
            return _CreatedTo;
        }
        set
        {
            _CreatedTo = value;
        }
    }

    public bool Status
    {
        get
        {
            return _Status;
        }
        set
        {
            _Status = value;
        }
    }

    public string TransectionPassword
    {
        get
        {
            return _TransectionPassword;
        }
        set
        {
            _TransectionPassword = value;
        }
    }

    public int NumberOfPin
    {
        get
        {
            return _NumberOfPin;
        }
        set
        {
            _NumberOfPin = value;
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
