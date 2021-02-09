using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BOMemberMaster
/// </summary>
public class BOMemberMaster
{
	public BOMemberMaster()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    String _UserCode = "";
    String _FatherName = "";
    String _UserName = "";
    //String _BAName = "";
    String _LoginName = "";
    String _LoginPassword = "";
    String _TransectionPassword = "";
    DateTime _DOB;
    String _Address = "";
    String _city = "";
    String _State = "";
    String _Country = "";
    String _PostalCode = "";
    String _TelephoneNo = "";
    String _MobileNo = "";
    String _EMailID = "";
    String _PanNo = "";
    String _NomineeName = "";
    String _NomineeRelation = "";
    String _NomineeContact = "";
    String _BankName = "";
    String _BranchName = "";

    String _AccountNo = "";
    String _Amount = "";
    String _IFSCCode = "";
    String _ParentID = "";
    String _SponsorID = "";
    String _PinCode = "";
    String _ConnectingSide = "";
    String _Pin = "";
    String _PinAmount = "";
    String _LastJoinSide = "";
    String _Status = "";
    String _OwnerName = "";
    String _RegistrationFrom = "";
    String _AadharCard = "";
    public string Landmark;
    public string District;
    public string UserType;
    public string Cadre;
    public string Rank;
    public string AddressProof;
    public string Pancard;


    public String OwnerName
    {
        get
        {
            return _OwnerName;
        }
        set
        {
            _OwnerName = value;
        }
    }
    public String Status
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

    public String LastJoinSide
    {
        get
        {
            return _LastJoinSide;
        }
        set
        {
            _LastJoinSide = value;
        }
    }

    public String Amount
    {
        get
        {
            return _Amount;
        }
        set
        {
            _Amount = value;
        }
    }
    public String FatherName
    {
        get
        {
            return _FatherName;
        }
        set
        {
            _FatherName = value;
        }
    }
    public String BranchName
    {
        get
        {
            return _BranchName;
        }
        set
        {
            _BranchName = value;
        }
    }
    
    public String UserCode
    {
        get
        {
            return _UserCode;
        }
        set
        {
            _UserCode = value;
        }
    }
    //    public String BAName
    //{
    //    get
    //    {
    //        return _BAName;
    //    }
    //    set
    //    {
    //        _BAName = value;
    //    }
    //}
    
    public String UserName
    {
        get
        {
            return _UserName;
        }
        set
        {
            _UserName = value;
        }
    }

    public String LoginName
    {
        get
        {
            return _LoginName;
        }
        set
        {
            _LoginName = value;
        }
    }

    public String LoginPassword
    {
        get
        {
            return _LoginPassword;
        }
        set
        {
            _LoginPassword = value;
        }
    }

    public String TransectionPassword
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

    public DateTime DOB
    {
        get
        {
            return _DOB;
        }
        set
        {
            _DOB = value;
        }
    }
    
    public String Address
    {
        get
        {
            return _Address;
        }
        set
        {
            _Address = value;
        }
    }

    public String city
    {
        get
        {
            return _city;
        }
        set
        {
            _city = value;
        }
    }

    public String State
    {
        get
        {
            return _State;
        }
        set
        {
            _State = value;
        }
    }

    public String Country
    {
        get
        {
            return _Country;
        }
        set
        {
            _Country = value;
        }
    }

    public String PostalCode
    {
        get
        {
            return _PostalCode;
        }
        set
        {
            _PostalCode = value;
        }
    }

    public String TelephoneNo
    {
        get
        {
            return _TelephoneNo;
        }
        set
        {
            _TelephoneNo = value;
        }
    }

    public String MobileNo
    {
        get
        {
            return _MobileNo;
        }
        set
        {
            _MobileNo = value;
        }
    }

    public String EMailID
    {
        get
        {
            return _EMailID;
        }
        set
        {
            _EMailID = value;
        }
    }

    public String PanNo
    {
        get
        {
            return _PanNo;
        }
        set
        {
            _PanNo = value;
        }

    }

    public String NomineeName
    {
        get
        {
            return _NomineeName;
        }
        set
        {
            _NomineeName = value;
        }

    }

    public String NomineeRelation
    {
        get
        {
            return _NomineeRelation;
        }
        set
        {
            _NomineeRelation = value;
        }

    }

    public String NomineeContact
    {
        get
        {
            return _NomineeContact;
        }
        set
        {
            _NomineeContact = value;
        }

    }

    public String BankName
    {
        get
        {
            return _BankName;
        }
        set
        {
            _BankName = value;
        }

    }

    public String AccountNo
    {
        get
        {
            return _AccountNo;
        }
        set
        {
            _AccountNo = value;
        }
    }

    public String IFSCCode
    {
        get
        {
            return _IFSCCode;
        }
        set
        {
            _IFSCCode = value;
        }
    }

    public String ParentID
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

    public String SponsorID
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

    public String ConnectingSide
    {
        get
        {
            return _ConnectingSide;
        }
        set
        {
            _ConnectingSide = value;
        }
    }

    public String Pin
    {
        get
        {
            return _Pin;
        }
        set
        {
            _Pin = value;
        }
    }

    public String PinAmount
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

    public String RegistrationFrom
    {
        get
        {
            return _RegistrationFrom;
        }
        set
        {
            _RegistrationFrom = value;
        }
    }
    public String AadharCard
    {
        get
        {
            return _AadharCard;
        }
        set
        {
            _AadharCard = value;
        }

    }

}
