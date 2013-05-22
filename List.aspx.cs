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
using System.Data.SqlClient;

public partial class NewStudent_List : System.Web.UI.Page
{
    public string[] columns;
    public string campus;
    public int catid;
    NewsInfoImpl op = new NewsInfoImpl();
    protected void Page_Load(object sender, EventArgs e)
    {

        string sql;
        sql = @"SELECT Top 100 PERCENT  * FROM dc_newsinfo  WHERE status=1 ";
        if (Request.Params["campus"] != null)
        {
            campus = Request.Params["campus"].ToString();//获取campus参数
            columns = ConfigurationManager.AppSettings[campus].ToString().Split(',');
            sql += " AND (catid=" + columns[0] + " OR catid=" + columns[1] + " OR catid=" + columns[2] + " OR catid=" + columns[3] + ")";
            catid = 99;
        }
        else
        {
            catid = Convert.ToInt32(Request.Params["catid"]);
            sql += " AND (catid=" + catid.ToString() + ")";
            if (ConfigurationManager.AppSettings["daxuecheng"].ToString().IndexOf(catid.ToString()) != -1)
                campus = "daxuecheng";
            else if (ConfigurationManager.AppSettings["longdong"].ToString().IndexOf(catid.ToString()) != -1)
                campus = "longdong";
            else
                campus = "dongfenglu";
            columns = ConfigurationManager.AppSettings[campus].ToString().Split(',');
        }
        sql += " ORDER BY addtime DESC";
        DataSet ds = SqlHelper.DataSplit(sql, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        rp.DataSource = ds.Tables[1];
        rp.DataBind();
        AspNetPager1.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);
    }
}
