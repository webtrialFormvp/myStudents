﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Utils 的摘要说明
/// </summary>
public class Utils
{

    #region String字符串类  

    /**/
    /// <summary>  
    /// 过滤字符  
    /// </summary>  

    public static string Replace(string strOriginal, string oldchar, string newchar)
    {
        if (string.IsNullOrEmpty(strOriginal))
            return "";
        string tempChar = strOriginal;
        tempChar = tempChar.Replace(oldchar, newchar);

        return tempChar;
    }

    /**/
    /// <summary>  
    /// 过滤非法字符  
    /// </summary>  
    /// <param name="str"></param>  
    /// <returns></returns>  
    public static string ReplaceBadChar(string str)
    {
        if (string.IsNullOrEmpty(str))
            return "";
        string strBadChar, tempChar;
        string[] arrBadChar;
        strBadChar = "@@,+,',--,%,^,&,?,(,),<,>,[,],{,},/,\\,;,:,\",\"\",";
        arrBadChar = SplitString(strBadChar, ",");
        tempChar = str;
        for (int i = 0; i < arrBadChar.Length; i++)
        {
            if (arrBadChar[i].Length > 0)
                tempChar = tempChar.Replace(arrBadChar[i], "");
        }
        return tempChar;
    }


    /**/
    /// <summary>  
    /// 检查是否含有非法字符  
    /// </summary>  
    /// <param name="str">要检查的字符串</param>  
    /// <returns></returns>  
    public static bool ChkBadChar(string str)
    {
        bool result = false;
        if (string.IsNullOrEmpty(str))
            return result;
        string strBadChar, tempChar;
        string[] arrBadChar;
        strBadChar = "@@,+,',--,%,^,&,?,(,),<,>,[,],{,},/,\\,;,:,\",\"\"";
        arrBadChar = SplitString(strBadChar, ",");
        tempChar = str;
        for (int i = 0; i < arrBadChar.Length; i++)
        {
            if (tempChar.IndexOf(arrBadChar[i]) >= 0)
                result = true;
        }
        return result;
    }


    /**/
    /// <summary>  
    /// 分割字符串  
    /// </summary>  
    public static string[] SplitString(string strContent, string strSplit)
    {
        if (string.IsNullOrEmpty(strContent))
        {
            return null;
        }
        int i = strContent.IndexOf(strSplit);
        if (strContent.IndexOf(strSplit) < 0)
        {
            string[] tmp = { strContent };
            return tmp;
        }
        //return Regex.Split(strContent, @strSplit.Replace(".", @"\."), RegexOptions.IgnoreCase);  

        return Regex.Split(strContent, @strSplit.Replace(".", @"\."));
    }


    /**/
    /// <summary>  
    /// string型转换为int型  
    /// </summary>  
    /// <param name="strValue">要转换的字符串</param>  
    /// <returns>转换后的int类型结果.如果要转换的字符串是非数字,则返回-1.</returns>  
    public static int StrToInt(object strValue)
    {
        int defValue = -1;
        if ((strValue == null) || (strValue.ToString() == string.Empty) || (strValue.ToString().Length > 10))
        {
            return defValue;
        }

        string val = strValue.ToString();
        string firstletter = val[0].ToString();

        if (val.Length == 10 && IsNumber(firstletter) && int.Parse(firstletter) > 1)
        {
            return defValue;
        }
        else if (val.Length == 10 && !IsNumber(firstletter))
        {
            return defValue;
        }


        int intValue = defValue;
        if (strValue != null)
        {
            bool IsInt = new Regex(@"^([-]|[0-9])[0-9]*$").IsMatch(strValue.ToString());
            if (IsInt)
            {
                intValue = Convert.ToInt32(strValue);
            }
        }

        return intValue;
    }

    /**/
    /// <summary>  
    /// string型转换为int型  
    /// </summary>  
    /// <param name="strValue">要转换的字符串</param>  
    /// <param name="defValue">缺省值</param>  
    /// <returns>转换后的int类型结果</returns>  
    public static int StrToInt(object strValue, int defValue)
    {
        if ((strValue == null) || (strValue.ToString() == string.Empty) || (strValue.ToString().Length > 10))
        {
            return defValue;
        }

        string val = strValue.ToString();
        string firstletter = val[0].ToString();

        if (val.Length == 10 && IsNumber(firstletter) && int.Parse(firstletter) > 1)
        {
            return defValue;
        }
        else if (val.Length == 10 && !IsNumber(firstletter))
        {
            return defValue;
        }


        int intValue = defValue;
        if (strValue != null)
        {
            bool IsInt = new Regex(@"^([-]|[0-9])[0-9]*$").IsMatch(strValue.ToString());
            if (IsInt)
            {
                intValue = Convert.ToInt32(strValue);
            }
        }

        return intValue;
    }



    /**/
    /// <summary>  
    /// string型转换为时间型  
    /// </summary>  
    /// <param name="strValue">要转换的字符串</param>  
    /// <param name="defValue">缺省值</param>  
    /// <returns>转换后的时间类型结果</returns>  
    public static DateTime StrToDateTime(object strValue, DateTime defValue)
    {
        if ((strValue == null) || (strValue.ToString().Length > 20))
        {
            return defValue;
        }

        DateTime intValue;

        if (!DateTime.TryParse(strValue.ToString(), out intValue))
        {
            intValue = defValue;
        }
        return intValue;
    }


    /**/
    /// <summary>  
    /// 判断给定的字符串(strNumber)是否是数值型  
    /// </summary>  
    /// <param name="strNumber">要确认的字符串</param>  
    /// <returns>是则返加true 不是则返回 false</returns>  
    public static bool IsNumber(string strNumber)
    {
        return new Regex(@"^([0-9])[0-9]*(\.\w*)?$").IsMatch(strNumber);
    }


    /**/
    /// <summary>  
    /// 检测是否符合email格式  
    /// </summary>  
    /// <param name="strEmail">要判断的email字符串</param>  
    /// <returns>判断结果</returns>  
    public static bool IsValidEmail(string strEmail)
    {
        return Regex.IsMatch(strEmail, @"^([\w-\.]+)@((
[0−9]1,3\.[0−9]1,3\.[0−9]1,3\.)|(([\w−]+\.)+))([a−zA−Z]2,4|[0−9]1,3)(
?)$");
    }


    /**/
    /// <summary>  
    /// 检测是否符合url格式,前面必需含有http://  
    /// </summary>  
    /// <param name="url"></param>  
    /// <returns></returns>  
    public static bool IsURL(string url)
    {
        return Regex.IsMatch(url, @"^http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$");
    }

    /**/
    /// <summary>  
    /// 检测是否符合电话格式  
    /// </summary>  
    /// <param name="phoneNumber"></param>  
    /// <returns></returns>  
    public static bool IsPhoneNumber(string phoneNumber)
    {
        return Regex.IsMatch(phoneNumber, @"^(\d3|\d{3}-)?\d{7,8}$");
    }



    /**/
    /// <summary>  
    /// 检测是否符合身份证号码格式  
    /// </summary>  
    /// <param name="num"></param>  
    /// <returns></returns>  
    public static bool IsIdentityNumber(string num)
    {
        return Regex.IsMatch(num, @"^\d{17}[\d|X]|\d{15}$");
    }




    #endregion

    #region Sql类  

    /**/
    /// <summary>  
    /// 检测是否有Sql危险字符  
    /// </summary>  
    /// <param name="str">要判断字符串</param>  
    /// <returns>判断结果</returns>  
    public static bool IsSafeSqlString(string str)
    {

        return !Regex.IsMatch(str, @"[-|;|,|\/|||
|
|\}|\{|%|@|\*|!|\']");
    }


    /**/
    /// <summary>  
    /// 替换sql语句中的单引号  
    /// </summary>  
    public static string ReplaceBadSQL(string str)
    {
        string str2;

        if (str == null)
        {
            str2 = "";
        }
        else
        {
            str = str.Replace("'", "''");
            str2 = str;
        }
        return str2;
    }



    #endregion

    #region Html类  

    /**/
    /// <summary>  
    /// 返回 HTML 字符串的解码结果  
    /// </summary>  
    /// <param name="str">字符串</param>  
    /// <returns>解码结果</returns>  
    public static string HtmlDecode(string str)
    {
        //str = str.Replace("''", "'");  
        return HttpUtility.HtmlDecode(str);
    }

    /**/
    /// <summary>  
    /// 替换html字符  
    /// </summary>  
    public static string EncodeHtml(string strHtml)
    {
        if (strHtml != "")
        {
            strHtml = strHtml.Replace(",", "&def");
            strHtml = strHtml.Replace("'", "&dot");
            strHtml = strHtml.Replace(";", "&dec");
            return strHtml;
        }
        return "";
    }

    /**/
    /// <summary>  
    /// 替换回车换行符为html换行符  
    /// </summary>  
    public static string StrFormat(string str)
    {
        string str2;

        if (str == null)
        {
            str2 = "";
        }
        else
        {
            str = str.Replace("\r\n", "<br />");
            str = str.Replace("\n", "<br />");
            str2 = str;
        }
        return str2;
    }
    #endregion

    #region DateTime类  
    /**/
    /// <summary>  
    /// 返回当前服务器时间的 yyyy-MM-dd 日期格式string    
    /// </summary>  
    public static string GetDate()
    {
        return DateTime.Now.ToString("yyyy-MM-dd");
    }

    /**/
    /// <summary>  
    ///返回当前服务器时间的标准时间格式string HH:mm:ss  
    /// </summary>  
    public static string GetTime()
    {
        return DateTime.Now.ToString("HH:mm:ss");
    }
    /**/
    /// <summary>  
    /// 返回当前服务器时间的标准时间格式string yyyy-MM-dd HH:mm:ss  
    /// </summary>  
    public static string GetDateTime()
    {
        return DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    }

    /**/
    /// <summary>  
    /// 返回当前服务器时间的标准时间格式string yyyy-MM-dd HH:mm:ss:fffffff  
    /// </summary>  
    public static string GetDateTimeF()
    {
        return DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:fffffff");
    }

    /**/
    /// <summary>  
    /// 将string类型的fDateTime转换为formatStr格式的日期类型  
    /// </summary>        
    public static string GetStandardDateTime(string fDateTime, string formatStr)
    {
        DateTime s = Convert.ToDateTime(fDateTime);
        return s.ToString(formatStr);
    }

    /**/
    /// <summary>  
    ///将string类型的fDateTime转换为日期类型 yyyy-MM-dd HH:mm:ss  
    /// </sumary>  
    public static string GetStandardDateTime(string fDateTime)
    {
        return GetStandardDateTime(fDateTime, "yyyy-MM-dd HH:mm:ss");
    }
    /**/
    /// <summary>  
    /// 返回相差的秒数  
    /// </summary>  
    /// <param name="Time"></param>  
    /// <param name="Sec"></param>  
    /// <returns></returns>  
    public static int StrDateDiffSeconds(string Time, int Sec)
    {
        TimeSpan ts = DateTime.Now - DateTime.Parse(Time).AddSeconds(Sec);
        if (ts.TotalSeconds > int.MaxValue)
        {
            return int.MaxValue;
        }
        else if (ts.TotalSeconds < int.MinValue)
        {
            return int.MinValue;
        }
        return (int)ts.TotalSeconds;
    }

    /**/
    /// <summary>  
    /// 返回相差的分钟数  
    /// </summary>  
    /// <param name="time"></param>  
    /// <param name="minutes"></param>  
    /// <returns></returns>  
    public static int StrDateDiffMinutes(string time, int minutes)
    {
        if (time == "" || time == null)
            return 1;
        TimeSpan ts = DateTime.Now - DateTime.Parse(time).AddMinutes(minutes);
        if (ts.TotalMinutes > int.MaxValue)
        {
            return int.MaxValue;
        }
        else if (ts.TotalMinutes < int.MinValue)
        {
            return int.MinValue;
        }
        return (int)ts.TotalMinutes;
    }

    /**/
    /// <summary>  
    /// 返回相差的小时数  
    /// </summary>  
    /// <param name="time"></param>  
    /// <param name="hours"></param>  
    /// <returns></returns>  
    public static int StrDateDiffHours(string time, int hours)
    {
        if (time == "" || time == null)
            return 1;
        TimeSpan ts = DateTime.Now - DateTime.Parse(time).AddHours(hours);
        if (ts.TotalHours > int.MaxValue)
        {
            return int.MaxValue;
        }
        else if (ts.TotalHours < int.MinValue)
        {
            return int.MinValue;
        }
        return (int)ts.TotalHours;
    }

    #endregion

    #region file类  
    /**/
    /// <summary>  
    /// 文件是否存在  
    /// </summary>  
    /// <param name="filePath">相对路径</param>  
    /// <returns></returns>  
    public static bool FileExists(string filePath)
    {
        if (string.IsNullOrEmpty(filePath))
            return false;
        filePath = HttpContext.Current.Server.MapPath(filePath);
        DirectoryInfo dirInfo = new DirectoryInfo(filePath);
        if (dirInfo.Exists)
            return true;
        return false;
    }

    // 对象转换成json 
    public static string ObjectToJson(object obj)
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(obj);
    }

    #endregion
}
