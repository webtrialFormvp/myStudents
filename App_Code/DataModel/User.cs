using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// User 的摘要说明
/// </summary>
public class User
{
    private string username;//用户名
    private string usertype;//用户类型

    public string Username
    {
        get
        {
            return username;
        }

        set
        {
            username = value;
        }
    }

    public string Usertype
    {
        get
        {
            return usertype;
        }

        set
        {
            usertype = value;
        }
    }

    public string Userid
    {
        get
        {
            return userid;
        }

        set
        {
            userid = value;
        }
    }

    public string Usernation
    {
        get
        {
            return usernation;
        }

        set
        {
            usernation = value;
        }
    }

    public string Sex
    {
        get
        {
            return sex;
        }

        set
        {
            sex = value;
        }
    }

    public string Clsid
    {
        get
        {
            return clsid;
        }

        set
        {
            clsid = value;
        }
    }

    public string Telephone
    {
        get
        {
            return telephone;
        }

        set
        {
            telephone = value;
        }
    }

    public string Address
    {
        get
        {
            return address;
        }

        set
        {
            address = value;
        }
    }

    public string Remark
    {
        get
        {
            return remark;
        }

        set
        {
            remark = value;
        }
    }

    private string userid;//用户id
    private string usernation;
    private string sex;
    private string clsid;
    private string telephone;
    private string address;
    private string remark;
}