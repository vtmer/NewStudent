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

public partial class NewStudent_Detail : System.Web.UI.Page
{
    public string id,title, datetime, scource, content,catname,catid,author,introduction,keywords,campus;
    protected void Page_Load(object sender, EventArgs e)
    {
        NewsInfo news = new NewsInfo();
        NewsInfoImpl pl = new NewsInfoImpl();
        news = pl.GetNewsInfoById(Convert.ToInt32(Request.Params["id"]));
        id = news.id.ToString();
        title = news.title;
        datetime = news.addtime.ToShortDateString();
        scource = news.source == "" ? "不详" : news.source;
        content = news.newscontent;
        catname = news.categoryName;
        catid = news.catid.ToString();
        author = news.author == "" ? "工大在线运营团队" : news.author;
        introduction = Common.CutString((news.introduce == "" ? Common.DelHTML(news.newscontent) : news.introduce), 200);   
        keywords = news.keyword;

        Page.Title = title;

        //找出校区

        if (ConfigurationManager.AppSettings["daxuecheng"].ToString().IndexOf(catid) != -1)
            campus = "daxuecheng";
        else if (ConfigurationManager.AppSettings["longdong"].ToString().IndexOf(catid) != -1)
            campus = "longdong";
        else
            campus = "dongfenglu";
        xuexi.catid = Convert.ToInt32(ConfigurationManager.AppSettings[campus].ToString().Split(',')[0]);
        shenghuo.catid = Convert.ToInt32(ConfigurationManager.AppSettings[campus].ToString().Split(',')[1]);
        xiaoyuan.catid = Convert.ToInt32(ConfigurationManager.AppSettings[campus].ToString().Split(',')[3]);

        //增加点击量
        pl.UpdateNewsInfoHit(news.id);
        

        //相关新闻
        string str = "select DISTINCT top 5 n.id,n.title,n.addtime from((dc_keyword k join dc_getnewsid g on k.id=g.keyword_id) join dc_newsinfo n on g.title_id=n.id) where n.catid in (" + ConfigurationManager.AppSettings[campus].ToString() + ") and g.title_id!= " + news.id.ToString() + " and k.keyword in ( '" + keywords.Replace("，", ",").Replace(@",", @"','") + " ')";
        RepeaterRelate.DataSource = SqlHelper.ExecuteReader(SqlHelper.ConnString, CommandType.Text, str, null);
        RepeaterRelate.DataBind();

        //评论部分
        //CommentImpl cpl = new CommentImpl();
        //commentpl.DataSource = cpl.GetCommentbyNewsId(news.id);
        //commentpl.DataBind();
    }
}
