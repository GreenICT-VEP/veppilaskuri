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
        <h1>Energialaskuri</h1>
    </header>
    <div class="container">

        <div class="row">
            <div id="Esittely" class="col-md-12">
                <p>Tervetuloa</p>
            </div>

        </div>

        <div class="row">
            <div id="Lomake" class="col-md-4">
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
            <% if(HttpContext.Current.Request.HttpMethod == "POST")
                {
                    Response.Write("<div class='col-md-4'>");
                    Response.Write(string.Format("Kulutuksesi on välillä {0:0.00} kWh/päivä - {1:0.00} kWh/päivä.<br />", daily_lower, daily_upper));
                    Response.Write("</div>");
                };
            %>
            <div id="Ohjeita" class="col-md-4">
        
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
    <footer>
        &copy; 2017 GreenICT - VEP - Sampo Harjula, Joni Juntunen, Niko Pafitis, Taina Rytkönen
    </footer>
</body>
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
</script>
</html>
