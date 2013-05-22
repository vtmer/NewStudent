<%@ WebHandler Language="C#" Class="Handler"  %>

using System;
using System.Web;
using System.Web.SessionState;

//注意一个地方，一般处理程序使用Session，继承IRequiresSessionState接口
public class Handler : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest (HttpContext context) {
       if (context.Request.Params["checkcode"].ToLower()== context.Session["CheckCode"].ToString().ToLower())
            context.Response.Write("true");
        else
            context.Response.Write("false"); 
        context.Response.ContentType = "text/plain";
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}