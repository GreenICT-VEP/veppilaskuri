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
    public float max_temperature = 0;
    public float max_consumption_avg = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.HttpMethod == "POST")
        {
            int days = 7;
            int.TryParse(Request["days"], out days);
            dynamic weather_data = get_weather_data(Request["town"], days);
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
            float eclass_lower_multiplier = (eclass_lower / 365) * size / 16.7f;
            float eclass_upper_multiplier = (eclass_upper / 365) * size / 16.7f;
            int days_count = 0;
            foreach (dynamic day in weather_data.list)
            {
                float day_average = (float)day.temp.day;
                ConsumptionData data = new ConsumptionData();
                data.date = DateTime.Now.AddDays(days_count);
                data.temperature = (float)day.temp.day;
                data.img_url = string.Format("http://openweathermap.org/img/w/{0}.png", day.weather[0].icon);
                if (Math.Abs(data.temperature) > max_temperature)
                {
                    max_temperature = Math.Abs(data.temperature);
                }
                float temp_difference = (temp_in - day_average);
                if (temp_difference > 0)
                {
                    data.consumption_low = temp_difference * eclass_lower_multiplier;
                    data.consumption_up = temp_difference * eclass_upper_multiplier;
                    data.consumption_avg = (data.consumption_low + data.consumption_up) / 2;
                    if (data.consumption_avg > max_consumption_avg)
                    {
                        max_consumption_avg = data.consumption_avg;
                    }
                }
                else
                {
                    data.consumption_low = 0;
                    data.consumption_up = 0;
                    data.consumption_avg = 0;
                }
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

    public string ConvertToJSON(ConsumptionData[] obj)
    {
        return new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(obj);
    }
}

public class ConsumptionData
{
    public DateTime date;
    public float temperature;
    public float consumption_low;
    public float consumption_up;
    public float consumption_avg;
    public string img_url;
}