using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* https://stackoverflow.com/questions/20151556/how-to-get-the-http-post-data-in-c */
        string[] keys = Request.Form.AllKeys;
        for (int i = 0; i < keys.Length; i++)
        {
            Response.Write(keys[i] + ": " + Request.Form[keys[i]] + "<br>");
        }
    }
}