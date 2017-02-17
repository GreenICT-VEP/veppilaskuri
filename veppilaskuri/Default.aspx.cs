using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using System.Globalization;
using System.Net;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    public ConsumptionData[] consumption_data;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.HttpMethod == "POST")
        {
            int days = 7;
            dynamic temp_data = get_weather_data(Request["town"], days);
            consumption_data = new ConsumptionData[days];
            float eclass_lower = 0;
            float eclass_upper = 150;
            float temp_in = 20;
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
            int days_count = 0;
            foreach (dynamic day in temp_data.list)
            {
                ConsumptionData data = new ConsumptionData();
                data.date = DateTime.Now.AddDays(days_count).Date;
                data.temperature = (float)day.temp.day;
                data.consumption_low = (temp_in - (float)day.temp.day) * (eclass_lower_daily * size / 16.7f);
                data.consumption_up = (temp_in - (float)day.temp.day) * (eclass_upper_daily * size / 16.7f);
                consumption_data[days_count] = data;
                days_count++;
            }
        }
    }
    public dynamic get_weather_data(string town, int days)
    {
        town = town.ToLower().Replace('ä', 'a').Replace('ö', 'o');
        string url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=" + town + ",fi&units=metric&cnt=" + days + "&appid=01adb891d220d1e34fa40c7ebcc1b120";
        string json;
        dynamic result;
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream))
        {
            json = reader.ReadToEnd();
        }
        return result = Json.Decode(json);
    }
}

public class ConsumptionData
{
    public DateTime date;
    public float temperature;
    public float consumption_low;
    public float consumption_up;
}