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

public partial class NewStudent_Maps : System.Web.UI.Page
{
    public string campus;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["campus"] != null)
        {
            campus = Request.Params["campus"].ToString();
        }
        else
        {
            campus = "daxuecheng";
        }
    }
}
