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
        //Lomake on lähetetty
        if (HttpContext.Current.Request.HttpMethod == "POST")
        {
            int days = 7;
            int.TryParse(Request["days"], out days);

            //Kutsutaan funktioita joka hakee Json säätiedot
            dynamic weather_data = get_weather_data(Request["town"], days);

            //Luodaan uusi objekti kaikelle kulutustiedolle
            consumption_data = new ConsumptionData[days];
            float eclass_lower = 0;
            float eclass_upper = 150;
            float temp_in = 20;
            float.TryParse(Request["temperature"].Replace(',','.'), NumberStyles.Any, CultureInfo.InvariantCulture, out temp_in);
            float size = 100;
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

            //Käydään säätiedot läpi päivittäin
            foreach (dynamic day in weather_data.list)
            {
                float day_average = Convert.ToSingle(day.temp.day);
                if (Math.Abs(day_average) > max_temperature)
                {
                    max_temperature = Math.Abs(day_average);
                }
                float temp_difference = (temp_in - day_average);

                //Estetään negatiiviset sisälämpötilat ja virran kulku väärän suuntaan.
                if (temp_difference > 0)
                {
                    consumption_data[days_count] = new ConsumptionData(DateTime.Now.AddDays(days_count),
                    Convert.ToSingle(day.temp.day),
                    temp_difference * eclass_lower_multiplier,
                    temp_difference * eclass_upper_multiplier,
                    string.Format("http://openweathermap.org/img/w/{0}.png", day.weather[0].icon));
                    if(consumption_data[days_count].consumption_avg > max_consumption_avg)
                    {
                        max_consumption_avg = consumption_data[days_count].consumption_avg;
                    }
                }
                else
                {
                    consumption_data[days_count] = new ConsumptionData(DateTime.Now.AddDays(days_count),
                    Convert.ToSingle(day.temp.day),
                    0,
                    0,
                    string.Format("http://openweathermap.org/img/w/{0}.png", day.weather[0].icon));
                }
                days_count++;
            }
        }
    }

    public dynamic get_weather_data(string town, int days)
    {
        town = town.ToLower().Replace('ä', 'a').Replace('ö', 'o');
        string url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=" + town + ",fi&units=metric&cnt=" + days + "&appid=01adb891d220d1e34fa40c7ebcc1b120";
        string json;
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream))
        {
            json = reader.ReadToEnd();
        }
        return Json.Decode(json);
    }

    public string ConvertToJSON(ConsumptionData[] obj)
    {
        return new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(obj);
    }
}

public class ConsumptionData
{
    private DateTime _date;
    private float _temperature;
    private float _consumption_low;
    private float _consumption_up;
    private float _consumption_avg;
    private string _img_url;
    public ConsumptionData(DateTime date, float temperature, float consumption_low, float consumption_up, string img_url)
    {
        _date = date;
        _temperature = temperature;
        _consumption_low = consumption_low;
        _consumption_up = consumption_up;
        _consumption_avg = (consumption_low + consumption_up) / 2;
        _img_url = img_url;
    }
    public DateTime date
    {
        get { return _date; }
    }
    public float temperature
    {
        get { return _temperature; }
    }
    public float consumption_low
    {
        get { return _consumption_low; }
    }
    public float consumption_up
    {
        get { return _consumption_up; }
    }
    public float consumption_avg
    {
        get { return _consumption_avg; }
    }
    public string img_url
    {
        get { return _img_url; }
    }
}