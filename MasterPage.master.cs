using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class NewStudent_MasterPage : System.Web.UI.MasterPage
{
    public string[] columns;
    public string campus;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Page.Title +" - "+ ConfigurationManager.AppSettings["WebTitle"].ToString();

        string catid, id;
        if (Request.Params["campus"] != null)
        {
            campus = Request.Params["campus"].ToString();
        }
        else if (Request.Params["catid"] != null)
        {
            catid = Request["catid"].ToString();
            if (ConfigurationManager.AppSettings["daxuecheng"].ToString().IndexOf(catid)!=-1)
                campus = "daxuecheng";
            else if (ConfigurationManager.AppSettings["longdong"].ToString().IndexOf(catid)!=-1)
                campus = "longdong";
            else
                campus = "dongfenglu";         
        }
        else if (Request.Params["id"] != null)
        {
            NewsInfo news = new NewsInfo();
            NewsInfoImpl pl = new NewsInfoImpl();
            news = pl.GetNewsInfoById(Convert.ToInt32(Request.Params["id"]));
            catid = news.catid.ToString();
            if (ConfigurationManager.AppSettings["daxuecheng"].ToString().IndexOf(catid) != -1)
                campus = "daxuecheng";
            else if (ConfigurationManager.AppSettings["longdong"].ToString().IndexOf(catid) != -1)
                campus = "longdong";
            else
                campus = "dongfenglu";   
        }
        else
        {
            campus="daxuecheng"; 
        }
        columns = ConfigurationManager.AppSettings[campus].ToString().Split(',');
    } 
}
