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

public partial class NewStudent_ul_list_detail : System.Web.UI.UserControl
{
    private int _catid;
    public int catid {
        get { return _catid; }
        set { _catid = value; }
    }
    public string catname;
    protected void Page_Load(object sender, EventArgs e)
    {
        NewsInfoImpl pl = new NewsInfoImpl();
        rp.DataSource = pl.GetNewsBy_hit(5, " AND catid =" + catid);
        rp.DataBind();
        CategoryImpl catpl = new CategoryImpl();
        catname = catpl.GetCategoryById(catid).catname;
    }
}
