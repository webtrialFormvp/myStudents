<%@ WebHandler Language="C#" Class="getCourseInfos" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Collections.Generic;
public class getCourseInfos :IHttpHandler,IRequiresSessionState {

    public void ProcessRequest(HttpContext context) {
        String usertype = HttpContext.Current.Session["utype"].ToString();
        String userid = HttpContext.Current.Session["userid"].ToString();
        String name = HttpContext.Current.Session["usename"].ToString();
        String sql = String.Empty;

        CourseInfo cinfo = new CourseInfo();
        cinfo.Username = name;

        List<DayCourse> dlist = new List<DayCourse>();
        for (int i = 0; i < 8; i++)
        {
            DayCourse dy = new DayCourse();
            SetTime(i, dy);
            List<String> needList = new List<string>();
            for(int j=0;j<6;j++)
            {
                needList.Add(String.Empty);
            }
            dy.IsNedd = needList;
            dlist.Add(dy);
        }
        sql = "select * from course where teacherid='" + userid + "'";
        DataTable dt = MyDB.Query(sql).Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            String courseTime = dt.Rows[i]["coursetime"].ToString();
            String place = dt.Rows[i]["courseplace"].ToString();
            string isnedd = dt.Rows[i]["courseneed"].ToString();
            string cname = dt.Rows[i]["coursename"].ToString();
            if (courseTime.Contains(","))
            {
                String[] tempArray = courseTime.Split(',');
                for (int j = 0; j < tempArray.Length; j++)
                {
                    string temp = tempArray[i];
                    if (temp.Equals(string.Empty))
                        ;
                    else
                    {
                        SetCourse(temp, dlist, place, isnedd,cname);
                    }
                }
            } else
            {
                SetCourse(courseTime, dlist, place, isnedd,cname);
            }

        }
        cinfo.CouseList = dlist;
        context.Response.ContentType = "text/json";
        context.Response.Write(Utils.ObjectToJson(cinfo));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    /// <summary>
    /// 赋值
    /// </summary>
    /// <param name="dys"></param>
    /// <param name="day"></param>
    /// <param name="place"></param>
    /// <param name="isnedd"></param>
    public void SetValues(DayCourse dys,String day,String place,String isnedd)
    {
        switch(day)
        {
            case "01":
                dys.Dy1 = place;
                break;
            case "02":
                dys.Dy2 = place;
                break;
            case "03":
                dys.Dy3= place;
                break;
            case "04":
                dys.Dy4= place;
                break;
            case "05":
                dys.Dy5 = place;
                break;
            case "06":
                dys.Dy6 = place;
                break;
        }
        string color = string.Empty;
        if (isnedd.Equals("必修"))
            color = "khaki";
        else if(isnedd.Equals(string.Empty))
        { color = "white"; }
        else
            color = "gray";
        int t = Convert.ToInt32(day);
        dys.IsNedd[t-1] = color;
    }
    /// <summary>
    /// 设置时间
    /// </summary>
    /// <param name="i"></param>
    /// <param name="dy"></param>
    private void SetTime(int i,DayCourse dy)
    {
        switch (i)
        {
            case 0:
                dy.Time = "8：00-8：45";
                break;
            case 1:
                dy.Time = "8：50-9：35";
                break;
            case 2:
                dy.Time = "9：55-10：40";
                break;
            case 3:
                dy.Time = "10：45-11：30";
                break;
            case 4:
                dy.Time = "13：40-14：25";
                break;
            case 5:
                dy.Time = "14：30-15：15";
                break;
            case 6:
                dy.Time = "15：35-16：20";
                break;
            case 7:
                dy.Time = "16：25-17：10";
                break;
        }
    }
    /// <summary>
    /// 设置课程信息
    /// </summary>
    /// <param name="courseTime"></param>
    /// <param name="dlist"></param>
    /// <param name="place"></param>
    /// <param name="isnedd"></param>
    private void SetCourse(String courseTime, List<DayCourse> dlist, String place, String isnedd,String cname)
    {
        string day = courseTime.Substring(0, 2);
        string time1 = courseTime.Substring(2, 2);
        string time2 = courseTime.Substring(4, 2);
        //第一节课
        int t1 = Convert.ToInt32(time1);
        DayCourse dys = dlist[t1 - 1];
        SetValues(dys, day, place, isnedd);
        dlist[t1 - 1] = dys;
        //第二节课
        int t2 = Convert.ToInt32(time2);
        DayCourse dyx = dlist[t2 - 1];
        SetValues(dyx, day, cname, isnedd);
        dlist[t2 - 1] = dyx;
    }

}