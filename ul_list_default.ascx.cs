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

public partial class NewStudent_ul_list_default : System.Web.UI.UserControl
{
    private string _condition;
    public string condition {
        get { return _condition; }
        set { _condition = value; }
    }

   private int _sum;
    public int sum
    {
        get { return _sum; }
        set { _sum = value; }
    }

    private int _istop=0;
    public int istop
    {
        get { return _istop; }
        set { _istop = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        NewsInfoImpl op = new NewsInfoImpl();
        DataSet ds = op.GetNewsInfoByCondition(sum, _istop, condition);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }
}
