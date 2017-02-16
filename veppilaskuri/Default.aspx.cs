using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class _Default : System.Web.UI.Page
{
    public float daily_lower, daily_upper;
    protected void Page_Load(object sender, EventArgs e)
    {
        /* https://stackoverflow.com/questions/20151556/how-to-get-the-http-post-data-in-c */
        string[] keys = Request.Form.AllKeys;
        for (int i = 0; i < keys.Length; i++)
        {
            Response.Write(keys[i] + ": " + Request.Form[keys[i]] + "<br>");
        }
        if (HttpContext.Current.Request.HttpMethod == "POST")
        {
            float eclass_lower = 0;
            float eclass_upper = 150;
            float temp_in = 0;
            float temp_out = 0;
            float.TryParse(Request["temperature"].Replace(',','.'), NumberStyles.Any, CultureInfo.InvariantCulture, out temp_in);
            float size;
            float.TryParse(Request["size"].Replace(',','.'), NumberStyles.Any, CultureInfo.InvariantCulture, out size);
            switch (Request["eclass"])
            {
                case "A":
                    break;
                case "B":
                    eclass_lower = 151;
                    eclass_upper = 170;
                    break;
                case "C":
                    eclass_lower = 171;
                    eclass_upper = 190;
                    break;
                case "D":
                    eclass_lower = 191;
                    eclass_upper = 230;
                    break;
                case "E":
                    eclass_lower = 231;
                    eclass_upper = 270;
                    break;
                case "F":
                    eclass_lower = 271;
                    eclass_upper = 320;
                    break;
                case "G":
                    eclass_lower = 321;
                    eclass_upper = 370;
                    break;
            }
            float eclass_lower_daily = eclass_lower / 365;
            float eclass_upper_daily = eclass_upper / 365;
            Response.Write(string.Format("Energialuokka {0} : {1} - {2} kWh/m2/Vuosi<br />", Request["eclass"], eclass_lower, eclass_upper));
            daily_lower = (temp_in - temp_out) * (eclass_lower_daily * size / 16.7f);
            daily_upper = (temp_in - temp_out) * (eclass_upper_daily * size / 16.7f);
        }
    }
}