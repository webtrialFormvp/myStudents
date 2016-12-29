using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Couse 的摘要说明
/// </summary>

public class CourseInfo
{
    private string username;
    private List<DayCourse> couseList;

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

    public List<DayCourse> CouseList
    {
        get
        {
            return couseList;
        }

        set
        {
            couseList = value;
        }
    }
}

public class DayCourse
{
    private string dy1="";
    private string dy2 = "";
    private string dy3 = "";
    private string dy4 = "";
    private string dy5 = "";
    private string dy6 = "";
    private string time = "";
    private List<string> isNedd =new List<string>();
   
    public string Dy1
    {
        get
        {
            return dy1;
        }

        set
        {
            dy1 = value;
        }
    }

    public string Dy2
    {
        get
        {
            return dy2;
        }

        set
        {
            dy2 = value;
        }
    }

    public string Dy3
    {
        get
        {
            return dy3;
        }

        set
        {
            dy3 = value;
        }
    }

    public string Dy4
    {
        get
        {
            return dy4;
        }

        set
        {
            dy4 = value;
        }
    }

    public string Dy5
    {
        get
        {
            return dy5;
        }

        set
        {
            dy5 = value;
        }
    }

    public string Dy6
    {
        get
        {
            return dy6;
        }

        set
        {
            dy6 = value;
        }
    }

    public string Time
    {
        get
        {
            return time;
        }

        set
        {
            time = value;
        }
    }

  
    public List<string> IsNedd
    {
        get
        {
            return isNedd;
        }

        set
        {
            isNedd = value;
        }
    }
}