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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
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
        <div id="Lomake" class="col-md-8">
            <form id="form1" runat="server">
            <!-- Joni laittaa tänne formin -->
                
            </form>
        </div>

        <div id="Ohjeita" class="col-md-4">
        
            <div id="ohje-perus" class="col-md-12">
                <h3>Lomakkeen täyttö</h3>
            </div>
            <div id="ohje-talokoko" class="col-md-12">
                <h3>Talon koko</h3>
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
</html>
