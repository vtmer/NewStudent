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
using System.Data;

public partial class NewStudent_Default : System.Web.UI.Page
{
    public string[] columns;
    public string campus;
    public string[] hottitle = new string[3];
    public string[] hotlink = new string[3];
    protected void Page_Load(object sender, EventArgs e)
    {
        campus = Request.Params["campus"] == null ? "daxuecheng" : Request.Params["campus"].ToString();//获取campus参数，默认大学城
        columns = ConfigurationManager.AppSettings[campus].ToString().Split(',');
        all.condition = "AND catid in (" + ConfigurationManager.AppSettings[campus].ToString() + ") AND isrecommemd='True' ";
        kaixue.condition = " AND catid="+columns[0];
        xuexi.condition = " AND catid=" + columns[1];
        shenghuo.condition = " AND catid=" + columns[2];
        xiaoyuan.condition = " AND catid=" + columns[3];

        NewsInfoImpl pl = new NewsInfoImpl();
        DataSet ds = pl.GetNewsInfoByCondition(3, 1, " AND catid in (" + ConfigurationManager.AppSettings[campus].ToString() + ") AND ispic='True'");
        for (int i = 0; i < 3&&i<ds.Tables[0].Rows.Count; i++)
        {
            hottitle[i] = ds.Tables[0].Rows[i]["title"].ToString();
            hotlink[i] = "Detail.aspx?id=" + ds.Tables[0].Rows[i]["id"].ToString();
        }
    }
}
