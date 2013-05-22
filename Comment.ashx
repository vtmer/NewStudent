<%@ WebHandler Language="C#" Class="GetData" %>
using System;
using System.Web;
using System.Data;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Web.SessionState;

public class GetData : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context)
    {
        int count=0;
        string name,comment,action = context.Request.Params["action"] != null ? (context.Request.Params["action"].ToString()) : "select"; 
        int id = Convert.ToInt32(context.Request.Params["id"]);
        CommentImpl pl = new CommentImpl();
        DataSet ds = null;
        try
        {
            if (action == "select")
            {
                context.Response.Write(DataTableToJson(pl.GetCommentbyNewsId(id), 100));
            }
            else if (action == "insert")
            {
                if (context.Session["CheckCode"] != null)
                {
                    if (context.Session["CheckCode"].ToString().ToLower() == context.Request["checkcode"].ToLower())
                    {
                        NewsInfoImpl npl = new NewsInfoImpl();
                        Comment com = new Comment();
                        com.addtime = DateTime.Now;
                        com.email = "";
                        com.status = 1;
                        com.title = "["+npl.GetNewsInfoById(id).categoryName+"]"+npl.GetNewsInfoById(id).title;
                        com.newsId = Convert.ToInt32(context.Request["id"]);
                        com.username = Common.DelHTML(context.Request["name"].ToString());
                        com.comcontent = Common.DelHTML(context.Request["comment"].ToString());
                        if (pl.AddComment(com) == 1)
                            context.Response.Write("发表成功！");
                        else
                            context.Response.Write("发表失败！");

                    }
                    else
                    {
                        context.Response.Write("验证码错误！");
                    }
                }
                else
                {
                    context.Response.Write("请输入验证码！");
                } 
                      
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("未知错误："+ex.Message+"\n"+ex.Source);
        }
        //Admin admin = new Admin();
        //AdminImpl pl=new AdminImpl();
        //admin=pl.GetAdminById(3);
        //context.Response.Write(ClassToJason(admin));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    private string ClassToJason<T>(T obj)
    {
        Type pt = obj.GetType();
        PropertyInfo[] pis = pt.GetProperties();
        string classdata = "[[";
        string  propertyname="[";
        for (int i = 0; i < pis.Length; i++)
        {
            if (i == 0) { propertyname += ("'" + pis[i].Name + "'"); classdata += ("'" + pis[i].GetValue(obj, null).ToString().Replace("'", "") + "'"); }
            else { propertyname += (",'" + pis[i].Name + "'"); classdata += (",'" + pis[i].GetValue(obj, null).ToString().Replace("'", "") + "'"); }
        }
        classdata += "]]";
        propertyname += "]";
        string retuenstring = "({'table':" + classdata + ",'column':" + propertyname + ",'type':'class'})";
        return retuenstring.Replace("\n", "").Replace("\r", "");
    } 

    private string DataTableToJson(DataTable dt,int count)
    {
        string columns = "[";
        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if(i==0)
            columns += ("'"+dt.Columns[i].ColumnName+"'");
            else
            columns += (","+"'"+dt.Columns[i].ColumnName +"'");            
        }
        columns += "]";
        
        string maindata = "[";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i == 0) maindata += "[";
            else maindata += ",[";
            for(int j=0;j<dt.Columns.Count;j++)
            {
                if (j == 0)
                    maindata += ("'" + dt.Rows[i][j].ToString().Replace("'", "") + "'"); 
                else
                    maindata += ("," + "'" + dt.Rows[i][j].ToString().Replace("'", "") + "'"); 
            }
            maindata += "]";
        }
        maindata += "]";

        string returnstring = "({'table':" + maindata + ",'count':" + count + ",'column':" + columns + ",'type':'datatable'})";
        return returnstring.Replace("\n", "").Replace("\r", "");
    }

}