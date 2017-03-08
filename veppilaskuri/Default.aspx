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
    
    <!-- Omat stylesheetit ja javascriptit -->
    <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
</head>
<body>

    <header>
        <img src="pics/energia_logo.png" alt="Energia Logo"/>
        <h1>ENERGIALASKURI</h1>
    </header>
    <div class="container-fluid">

        <div class="row" id="title">
            <div id="Esittely" class="col-md-4">
                
                <p>Energialaskuri osa Lahden ammattikorkeakoulun GreenICT-projektia. Sivuston tarkoituksena on osoittaa opiskelijoiden kyky hakea tietoa käyttäjän antamista ja ulkoisista lähteistä.</p>
            </div>
            <div id="#Esittely-kuva" class="col-md-8">
                <img src="pics/taustallinen2.png" alt="Esittelykuva" style="max-width: 600px;"/>
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
                    Response.Write(string.Format("<div class='col-sm-12'><div class='result average'>{0} päivän<br />keskiarvo: {1:0} kWh<button id='show_details' style='float:right'>+</button></div></div>\n", consumption_data.Count(), (average / consumption_data.Count())));
                    /* GRAPH */
                    Response.Write("<div class='col-sm-12'><canvas id='result_graph'>Seilaimessasi ei ole Canvas tukea</canvas></div>");
                    /* DETAILS */
                    Response.Write("<div id='details' class='col-sm-12' style='display:none'>");
                    foreach(ConsumptionData item in consumption_data)
                    {
                        Response.Write(string.Format("<div class='col-sm-2'><div class='result'>{0}<br />{1} C<br />{2:0} kWh</div></div>\n", item.date.ToShortDateString(), item.temperature, item.consumption_avg));
                    }
                    Response.Write("</div>");
                }
            %>
        </div>
        <div class="row" id="main">
            <div class="col-sm-6">
                <div id="Lomake" class="col-sm-12">
                    <form id="form1" method="post" runat="server">
                        <div class="form-group">
                            <label for="size">Talon koko</label>
                            <input name="size" id="size" type="number" step="0.1" class="form-control" required />
                            <label for="eclass">Energialuokka</label>
                            <select name="eclass" id="eclass" class="form-control">
                                <option>A</option>
                                <option>B</option>
                                <option>C</option>
                                <option>D</option>
                                <option>E</option>
                                <option>F</option>
                                <option>G</option>
                            </select>
                            <label for="temperature">Sisälämpötila</label>
                            <input name="temperature" id="temperature" type="number" value="20" step="0.1" class="form-control" required/><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                <input name="town" id="town" placeholder="Kunta" class="form-control" required/>
                            </div><br />
                            <input id="submit" type="submit" value="Laske" class="btn btn-primary" disabled />
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-6">
                <div id="Ohjeita" class="col-sm-12">
                    <div id="ohje-perus" class="col-md-12">
                        <h3>Lomakkeen täyttö</h3>
                    </div>
                    <div id="ohje-talokoko" class="col-md-12">
                        <h3>Talon koko</h3>
                        <p>Talon koko annetaan neliömetreinä.</p>
                    </div>
                    <div id="ohje-kunta" class="col-md-12">
                        <h3>Kunta</h3>
                    </div>
                    <div id="ohje-energialuokka" class="col-md-12">
                        <h3>Energialuokka</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
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
            Response.Write(string.Format("var max_temperature = {0};\n", max_temperature).Replace(',','.'));
            Response.Write(string.Format("var max_consumption = {0};\n", max_consumption_avg).Replace(',','.'));
        }
        %>
        var graph = document.getElementById("result_graph");
        if(graph)
        {
            /* Canvas settings */
            graph.height = $("#result_graph").height();
            graph.width = $("#result_graph").width();
            var context = graph.getContext("2d");
            /* Legend */
            var legend_padding = 50;
            var legend_center = legend_padding / 2;
            context.font = "16px Arial";
            context.textAlign = "center";
            /* Consumption legend */
            context.fillStyle = "#0033CC";
            context.fillText("kWh", legend_center, legend_center);
            context.fillText("300", legend_center, legend_padding);
            context.fillText("150", legend_center, graph.height / 2);
            context.fillText("0", legend_center, graph.height - legend_padding);
            /* Temperature legend */
            context.fillStyle = "#FF0000";
            context.fillText("C", graph.width - legend_center , legend_center);
            context.fillText("+15", graph.width - legend_center, legend_padding);
            context.fillText("0", graph.width - legend_center, graph.height / 2);
            context.fillText("-15", graph.width - legend_center, graph.height - legend_padding);
            /* Lines */
            context.lineWidth = 1;
            context.strokeStyle = "#000000";
            context.beginPath();
            context.moveTo(legend_padding, legend_padding)
            context.lineTo(graph.width - legend_padding, legend_padding);
            context.stroke();
            context.moveTo(legend_padding, graph.height / 2)
            context.lineTo(graph.width - legend_padding, graph.height / 2);
            context.stroke();
            context.moveTo(legend_padding, graph.height - legend_padding)
            context.lineTo(graph.width - legend_padding, graph.height - legend_padding);
            context.stroke();
            /* Draw Shared variables */
            var items_count = consumption_data.length;
            var bar_count = (graph.width - legend_padding * 2) / items_count;
            var bar_width = bar_count / 2;
            var bar_center = bar_count / 4 + bar_width / 2;
            /* consumption bar variables */
            var y_consumption = graph.height - legend_padding;
            context.fillStyle = "#0033CC";
            /* Draw consumption bars */
            for (i = 0; i < items_count; i++)
            {
                // Bar
                context.fillRect(bar_width / 2 + legend_padding + bar_count * i, y_consumption, bar_width, -consumption_data[i].consumption_avg);
                // Dates
                var date = new Date(parseInt(consumption_data[i].date.replace("\/Date(", "").replace(")\/", "")));
                context.fillText(date.getDate() + "." + date.getMonth(), legend_padding + bar_count * i + bar_center, y_consumption + legend_center);
            }
            /* Temeperature line variables */
            var x_begin = legend_padding;
            var y_begin = graph.height / 2;
            var dot_size = 3;
            var temperature_scale = max_temperature; // TO BE DONE
            context.strokeStyle = "#FF0000";
            context.lineWidth = 2;
            /* Draw Temperature line */
            context.beginPath();
            context.moveTo(x_begin, y_begin);
            for (i = 0; i < items_count; i++)
            {
                var x_temperature = legend_padding + bar_count * i + bar_center;
                var y_temperature = y_begin - consumption_data[i].temperature * temperature_scale;
                context.lineTo(x_temperature, y_temperature);
                context.arc(x_temperature, y_temperature, dot_size, 0, 2 * Math.PI);
            }
            context.lineTo(graph.width - legend_padding - bar_width, y_temperature);
            context.stroke();
        }
    </script>
</body>
</html>