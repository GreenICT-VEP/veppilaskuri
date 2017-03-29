<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Energialaskuri kotitalouksille</title>

    <!-- Bootstrap 3.3.7 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <!-- IonIcons -->
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

    <!-- Omat stylesheetit ja javascriptit -->
    <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
    <script src="js/javascriptit.js"></script>
</head>
<body>
    <div id="content-wrapper">
        <header>
            <div id="header" class="col-sm-10 col-sm-offset-1">
                <img src="pics/energia_logo.png" alt="Energia Logo"/>
                <h1>Energialaskuri</h1>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row" id="title">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <div id="Esittely" class="col-sm-12">
                        <p>
                            Energialaskuri osa Lahden ammattikorkeakoulun GreenICT-projektia. 
                            Sivuston tarkoituksena on osoittaa opiskelijoiden kyky hakea tietoa käyttäjän antamista ja ulkoisista lähteistä.
                            Projektin tarkoituksena on luoda käyttäjäystävällinen ja intuitiivinen käyttöliittymä tiedon syöttämiseen ja tulostamiseen. 
                        </p>
                        <p>
                            VEP-ryhmä on suunnitellut sivuston käyttöliittymän ja toiminnallisuuden Pencil-ohjelmalla ja toteuttanut sivuston toiminnallisuuden C#-kielellä .NET-ympäristössä.
                            Sivuston layout on asetettu Bootstrap-kirjaston avulla. Ohjetekstit tuodaan esille jQuery-kirjaston eventeillä. Lomake on HTML5 koodia lisättynä Glyphiconeilla.
                            Lopputuloksen esittely Canvas-elementillä on kirjoitettu alusta loppuun projektin sisällä.
                        </p>
                        <p>
                            Sivuston ohjelmakoodi on nähtävissä Githubissa. Projektin lopputulos ajetaan LAMK:n sisäverkossa IISi-palvelimella osoitteessa <a href="http://iis01.lamk.fi">iisi01.lamk.fi</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="row" id="results">
                <%
                    if(consumption_data != null)
                    {
                        float average = 0;
                        foreach(ConsumptionData item in consumption_data)
                        {
                            average += item.consumption_avg;
                        }
                        /* HEADER */
                        Response.Write(string.Format("<div class='col-sm-9 col-md-8 col-md-offset-1'><div class='result-graph average'>{0}, energialuokka: {1}", Request["town"], Request["eclass"]));
                        /* GRAPH */
                        Response.Write("<canvas id='result_graph'>Seilaimessasi ei ole Canvas tukea</canvas>\n</div>\n</div>\n");
                        /* DETAILS */
                        Response.Write(string.Format("<div class='col-sm-3 col-md-2'><div class='result average'>Keskikulutus<br /><span id='final_avg'>{0:0} kWh</span></div><div id='day-details' class='result'><br />Vie kursori päivän kohdalle kaaviossa nähdäksesi päivän tarkemmat tiedot</div></div>", (average / consumption_data.Count())));
                    }
                %>
            </div>
            <div class="row" id="main">
                <div class="col-sm-6 col-md-5 col-md-offset-1">
                    <div id="Lomake" class="col-sm-12">
                        <form id="form1" class="form-horizontal" method="post" runat="server">
                            <div class="form-group">
                                <div class="col-sm-12 form-item">
                                    <!--<label for="size" class="col-sm-3 control-label">Talon koko</label>-->
                                    <div class="input-group col-sm-10 col-sm-offset-1">
                                        <span class="input-group-addon"><i class="icon ion-home"></i></span>
                                        <input name="size" id="size" type="number" step="0.1" class="form-control" required <% if (Request["size"] != null) { Response.Write(string.Format("value={0}", Request["size"])); } %> />
                                    </div>
                                </div>
                                <div class="col-sm-12 form-item">                            
                                    <!--<label for="eclass" class="col-sm-3 control-label">Energialuokka</label>-->
                                     <div class="input-group col-sm-10 col-sm-offset-1">
                                        <span class="input-group-addon"><i class="icon ion-flash"></i></span>
                                       <select name="eclass" id="eclass" class="form-control" autocomplete="off" > <!-- Firefox needs the autocomplete to show the selection -->
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "A") { Response.Write("selected='selected'"); }} %>>A</option>
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "B") { Response.Write("selected='selected'"); }} %>>B</option>
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "C") { Response.Write("selected='selected'"); }} %>>C</option>
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "D") { Response.Write("selected='selected'"); }} %>>D</option>
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "E") { Response.Write("selected='selected'"); }} %>>E</option>
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "F") { Response.Write("selected='selected'"); }} %>>F</option>
                                            <option <% if (Request["eclass"] != null) { if (Request["eclass"] == "G") { Response.Write("selected='selected'"); }} %>>G</option>
                                        </select>
                                    </div>
                                </div>                            
                                <div class="col-sm-12 form-item">
                                    <!--<label for="temperature" class="col-sm-3 control-label">Sisälämpötila</label>-->
                                    <div class="input-group col-sm-10 col-sm-offset-1">
                                        <span class="input-group-addon"><i class="icon ion-thermometer"></i></span>
                                        <input name="temperature" id="temperature" type="number" <% if (Request["temperature"] != null) { Response.Write(string.Format("value={0}", Request["temperature"])); } else { Response.Write("value='20'"); } %> step="0.1" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="col-sm-12 form-item">
                                    <!--<label for="days" class="col-sm-3 control-label">Päivät</label>-->
                                    <div class="input-group col-sm-10 col-sm-offset-1">
                                        <span class="input-group-addon"><i class="icon ion-android-calendar"></i></span>
                                        <input name="days" id="days" type="number" <% if (Request["days"] != null) { Response.Write(string.Format("value={0}", Request["days"])); } else { Response.Write("value='7'"); } %> min="1" max="16" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-sm-12 form-item">
                                    <!--<label for="town" class="col-sm-3 control-label">Kunta</label>-->
                                    <div class="input-group col-sm-10 col-sm-offset-1">
                                        <span class="input-group-addon"><i class="icon ion-ios-location"></i></span>
                                        <input name="town" id="town" placeholder="Kunta" class="form-control" required <% if (Request["town"] != null) { Response.Write(string.Format("value={0}", Request["town"])); } %> />
                                    </div>
                                </div>
                                <br />
                                <input id="submit" type="submit" value="Laske" class="btn btn-primary" <%if (consumption_data == null) { Response.Write("disabled"); } %>/>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-6 col-md-5">
                    <div id="Ohjeita" class="col-sm-12">
                        <div id="ohje-perus" class="ohje col-md-12">
                            <h3>Lomakkeen täyttö</h3>
                            <p>Syötä pelkkiä numeroita ja valitse alasvetolaatikoista oikea vaihtoehto.</p>
                        </div>
                        <div id="ohje-talokoko" class="ohje col-md-12">
                            <h3>Talon koko</h3>
                            <p>Talon koko annetaan neliömetreinä. Omakotitalojen keskikoko on 110m<sup>2</sup>. Kerrostaloasunnon keskikoko on 55m<sup>2</sup>. Rivitaloasunnon keskikoko on 70m<sup>2</sup></p>
                        </div>
                        <div id="ohje-energialuokka" class="ohje col-md-12">
                            <h3>Energialuokka</h3>
                            <p>Talon energialuokka saadaa laskennallisesti energiatodistuksen yhteydessä. Talon energialuokkaan vaikuttaa talon lämmitysmuoto, eristysten paksuus, ilmastointi ja ikkunoiden koko.</p>
                        </div>                    
                        <div id="ohje-lampotila" class="ohje col-md-12">
                            <h3>Sisälämpötila</h3>
                            <p>Anna haluttu sisälämpötila. Rakennuksien ja asuntojen halutut sisälämpötilat vaihtelevat 15 asteesta ylöspäin tyhjissä asunnoissa ja aktiivikäytössä aina 30 asteeseen asti.</p>
                        </div>

                        <div id="ohje-paivat" class="ohje col-md-12">
                            <h3>Päivät</h3>
                            <p>Valitse kuinka monta päivää haluat nähdä ennusteessa. Oletus 7 päivää.</p>
                        </div>
                        <div id="ohje-kunta" class="ohje col-md-12">
                            <h3>Kunta</h3>
                            <p>Kirjoita kunnan nimestä muutama ensimmäinen kirjain ja valitse kunta valikosta</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <a href="http://reppu.lamk.fi/course/view.php?id=12778" target="_blank"><img src="pics/lamk_merkki_nega.png" alt="LAMK" class="logo" /></a>
        <a href="http://openweathermap.org/" target="_blank"><img src="pics/OpenWeatherMap_logo.png" alt="LAMK" class="logo" /></a>
        <a href="https://github.com/GreenICT-VEP/veppilaskuri/" target="_blank"><img src="pics/github-gray.png" alt="Github" class="logo" /></a>
        <br />
        &copy; 2017 GreenICT - VEP - Sampo Harjula, Joni Juntunen, Niko Pafitis, Taina Rytkönen
    </footer>
    <script>
        var town_data = ["Akaa", "Alajärvi", "Alavieska", "Alavus", "Asikkala", "Askola", "Aura", "Enonkoski", "Enontekiö", "Espoo", "Eura", "Eurajoki", "Evijärvi", "Forssa", "Haapajärvi", "Haapavesi", "Hailuoto", "Halsua", "Hamina", "Hankasalmi", "Hanko", "Harjavalta", "Hartola", "Hattula", "Hausjärvi", "Heinola", "Heinävesi", "Helsinki", "Hirvensalmi", "Hollola", "Honkajoki", "Huittinen", "Humppila", "Hyrynsalmi", "Hyvinkää", "Hämeenkyrö", "Hämeenlinna", "Ii", "Iisalmi", "Iitti", "Ikaalinen", "Ilmajoki", "Ilomantsi", "Imatra", "Inari", "Inkoo", "Isojoki", "Isokyrö", "Janakkala", "Joensuu", "Jokioinen", "Joroinen", "Joutsa", "Juuka", "Juupajoki", "Juva", "Jyväskylä", "Jämijärvi", "Jämsä", "Järvenpää", "Kaarina", "Kaavi", "Kajaani", "Kalajoki", "Kangasala", "Kangasniemi", "Kankaanpää", "Kannonkoski", "Kannus", "Karijoki", "Karkkila", "Karstula", "Karvia", "Kaskinen", "Kauhajoki", "Kauhava", "Kauniainen", "Kaustinen", "Keitele", "Kemi", "Kemijärvi", "Keminmaa", "Kemiönsaari", "Kempele", "Kerava", "Keuruu", "Kihniö", "Kinnula", "Kirkkonummi", "Kitee", "Kittilä", "Kiuruvesi", "Kivijärvi", "Kokemäki", "Kokkola", "Kolari", "Konnevesi", "Kontiolahti", "Korsnäs", "KoskiTl", "Kotka", "Kouvola", "Kristiinankaupunki", "Kruunupyy", "Kuhmo", "Kuhmoinen", "Kuopio", "Kuortane", "Kurikka", "Kustavi", "Kuusamo", "Kyyjärvi", "Kärkölä", "Kärsämäki", "Lahti", "Laihia", "Laitila", "Lapinjärvi", "Lapinlahti", "Lappajärvi", "Lappeenranta", "Lapua", "Laukaa", "Lemi", "Lempäälä", "Leppävirta", "Lestijärvi", "Lieksa", "Lieto", "Liminka", "Liperi", "Lohja", "Loimaa", "Loppi", "Loviisa", "Luhanka", "Lumijoki", "Luoto", "Luumäki", "Maalahti", "Marttila", "Masku", "Merijärvi", "Merikarvia", "Miehikkälä", "Mikkeli", "Muhos", "Multia", "Muonio", "Mustasaari", "Muurame", "Mynämäki", "Myrskylä", "Mäntsälä", "Mänttä-Vilppula", "Mäntyharju", "Naantali", "Nakkila", "Nivala", "Nokia", "Nousiainen", "Nurmes", "Nurmijärvi", "Närpiö", "Orimattila", "Oripää", "Orivesi", "Oulainen", "Oulu", "Outokumpu", "Padasjoki", "Paimio", "Paltamo", "Parainen", "Parikkala", "Parkano", "Pedersöre", "Pelkosenniemi", "Pello", "Perho", "Pertunmaa", "Petäjävesi", "Pieksämäki", "Pielavesi", "Pietarsaari", "Pihtipudas", "Pirkkala", "Polvijärvi", "Pomarkku", "Pori", "Pornainen", "Porvoo", "Posio", "Pudasjärvi", "Pukkila", "Punkalaidun", "Puolanka", "Puumala", "Pyhtää", "Pyhäjoki", "Pyhäjärvi", "Pyhäntä", "Pyhäranta", "Pälkäne", "Pöytyä", "Raahe", "Raasepori", "Raisio", "Rantasalmi", "Ranua", "Rauma", "Rautalampi", "Rautavaara", "Rautjärvi", "Reisjärvi", "Riihimäki", "Ristijärvi", "Rovaniemi", "Ruokolahti", "Ruovesi", "Rusko", "Rääkkylä", "Saarijärvi", "Salla", "Salo", "Sastamala", "Sauvo", "Savitaipale", "Savonlinna", "Savukoski", "Seinäjoki", "Sievi", "Siikainen", "Siikajoki", "Siikalatva", "Siilinjärvi", "Simo", "Sipoo", "Siuntio", "Sodankylä", "Soini", "Somero", "Sonkajärvi", "Sotkamo", "Sulkava", "Suomussalmi", "Suonenjoki", "Sysmä", "Säkylä", "Taipalsaari", "Taivalkoski", "Taivassalo", "Tammela", "Tampere", "Tervo", "Tervola", "Teuva", "Tohmajärvi", "Toholampi", "Toivakka", "Tornio", "Turku", "Tuusniemi", "Tuusula", "Tyrnävä", "Ulvila", "Urjala", "Utajärvi", "Utsjoki", "Uurainen", "Uusikaarlepyy", "Uusikaupunki", "Vaala", "Vaasa", "Valkeakoski", "Valtimo", "Vantaa", "Varkaus", "Vehmaa", "Vesanto", "Vesilahti", "Veteli", "Vieremä", "Vihti", "Viitasaari", "Vimpeli", "Virolahti", "Virrat", "Vöyri", "Ylitornio", "Ylivieska", "Ylöjärvi", "Ypäjä", "Ähtäri", "Äänekoski"];
        $("#town").autocomplete({
            minLength: 2,
            delay: 333,
            source: function(req, response) { 
            var re = $.ui.autocomplete.escapeRegex(req.term); 
            var matcher = new RegExp( "^" + re, "i" ); 
            response($.grep( town_data, function(item){ 
                return matcher.test(item); }) ); 
            },
            select: function () {
                $("#submit").prop("disabled", false);
            }
        });
        $("#show_details").click(function () {
            $("#details").toggle();
        });
        <%
        if (consumption_data != null)
        {
            Response.Write(string.Format("var consumption_data = {0};\n", ConvertToJSON(consumption_data)));
            Response.Write(string.Format("var highest_temperature = {0};\n", max_temperature).Replace(',','.'));
            Response.Write(string.Format("var highest_consumption = {0};\n", max_consumption_avg).Replace(',','.'));
        }
        %>
        var graph = document.getElementById("result_graph");
        if(graph)
        {
            /* Canvas settings */
            graph.height = $("#result_graph").height();
            graph.width = $("#result_graph").width();
            var context = graph.getContext("2d");
            /* Graph settings */
            var legend_padding = 50;
            var text_size = 16;
            var line_count = 4;
            var temperature_line_count = 4;
            var temperature_line_size = 3;
            var dot_size = 3;
            var consumption_step = 50;
            var temperature_step = 10;
            var decimal_count = 0;
            /* Colors */
            var temperature_color = "#C30000";
            var temperature_text_color = "#C30000";
            var bar_color = "#3137FD";
            var bar_text_color = "#3137FD";
            var line_color = "#BCBCBC";
            var date_color = "#000000";
            /* Scaling */
            var graph_area_width = graph.width - legend_padding * 2;
            var graph_area_height = graph.height - legend_padding * 2;
            var bar_max = (Math.floor(highest_consumption / consumption_step) + 1) * consumption_step;
            var bar_scale = graph_area_height / bar_max;
            var temperature_max = (Math.floor(highest_temperature / temperature_step) + 1) * temperature_step;
            var temperature_scale = graph_area_height / temperature_max / 2;
            /* Legend */
            var legend_center = legend_padding / 2;
            context.font = text_size + "px Arial";
            context.textAlign = "center";
            /* Consumption legend */
            context.fillStyle = bar_text_color;
            context.fillText("kWh", legend_center, legend_center);
            var line_gap = graph_area_height / line_count;
            context.lineWidth = 1;
            context.strokeStyle = line_color;
            context.beginPath();
            for (i = 0; i <= line_count; i++) {
                context.fillText((bar_max - i * (bar_max / line_count)).toFixed(decimal_count), legend_center, legend_padding + i * line_gap + (text_size / 4));
                context.moveTo(legend_padding, legend_padding + i * line_gap);
                context.lineTo(graph.width - legend_padding, legend_padding + i * line_gap);
                context.stroke();
            }
            /* Temperature legend */
            context.fillStyle = temperature_text_color;
            context.fillText("C", graph.width - legend_center, legend_center);
            var temperature_line_gap = graph_area_height / temperature_line_count;
            for (i = 0; i <= temperature_line_count; i++)
            {
                context.fillText((temperature_max - i * temperature_max / (temperature_line_count / 2)).toFixed(decimal_count), graph.width - legend_center, legend_padding + i * temperature_line_gap + (text_size / 4));
            }
            /* Draw Shared variables */
            var items_count = consumption_data.length;
            var bar_count = graph_area_width / items_count;
            var bar_width = bar_count / 2;
            var bar_center = bar_count / 4 + bar_width / 2;
            /* consumption bar variables */
            var y_consumption = graph.height - legend_padding;
            context.fillStyle = bar_color;
            /* Draw consumption bars */
            for (i = 0; i < items_count; i++)
            {
                // Bar
                context.fillStyle = bar_color;
                context.fillRect(bar_width / 2 + legend_padding + bar_count * i, y_consumption, bar_width, -consumption_data[i].consumption_avg * bar_scale);
                // Date
                var date = new Date(parseInt(consumption_data[i].date.replace("\/Date(", "").replace(")\/", "")));
                context.fillStyle = date_color;
                context.fillText(date.getDate() + "." + (date.getMonth() + 1), legend_padding + bar_count * i + bar_center, y_consumption + legend_center);
            }
            /* Temperature line variables */
            var x_begin = legend_padding + bar_center;
            var y_begin = graph.height / 2;
            context.strokeStyle = temperature_color;
            context.lineWidth = temperature_line_size;
            /* Draw Temperature line */
            context.beginPath();
            context.moveTo(x_begin, y_begin - consumption_data[0].temperature * temperature_scale);
            for (i = 0; i < items_count; i++)
            {
                var x_temperature = legend_padding + bar_count * i + bar_center;
                var y_temperature = y_begin - consumption_data[i].temperature * temperature_scale;
                context.lineTo(x_temperature, y_temperature);
                context.arc(x_temperature, y_temperature, dot_size, 0, 2 * Math.PI);
            }
            context.lineTo(graph.width - legend_padding - bar_width, y_temperature);
            context.stroke();
            $("#result_graph").mousemove(function(event){
                var rect = graph.getBoundingClientRect();
                var x = (event.clientX - rect.left) / (rect.right - rect.left) * graph.width;
                if (x > legend_padding && x < (graph.width - legend_padding))
                {
                    var id = Math.floor((x - legend_padding) / (graph.width - legend_padding * 2) * items_count);
                    var date = new Date(parseInt(consumption_data[id].date.replace("\/Date(", "").replace(")\/", "")));
                    $("#day-details").html("<span class='average'>Päivän tiedot</span><br /><img src='" + consumption_data[id].img_url + "' class='image_weather'><br /><span class='day-details'>" + date.toDateString() + "<br />Lämpötila: " + consumption_data[id].temperature.toFixed(decimal_count) + " &#8451;<br />Kulutus: " + consumption_data[id].consumption_avg.toFixed(decimal_count) + " kWh</span>");
                }
            });
        }
    </script>
</body>
</html>