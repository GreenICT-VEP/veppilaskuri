<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Energialaskuri kotitalouksille</title>
    <link rel="stylesheet" type="text/css" href="css/StyleSheet.css" />
</head>
<body>

    <header>
        <img src="pics/energia_logo.png" alt="Energia Logo"/>
        <h1>Energialaskuri</h1>
    </header>
    <div id="Esittely">
        <p>Tervetuloa</p>
    </div>

    <div id="Lomake">
        <form id="form1" runat="server">
        <!-- Joni laittaa tänne formin -->
            
        </form>
    </div>
    <div id="Ohjeita">
        <div id="ohje-perus">
            <h3>Lomakkeen täyttö</h3>
        </div>
        <div id="ohje-talokoko">
            <h3>Talon koko</h3>
        </div>
        <div id="ohje-kunta">
            <h3>Kunta</h3>
        </div>
        <div id="ohje-energialuokka">
            <h3>Energialuokka</h3>
        </div>
    </div>
    <footer>
        &copy; 2017 GreenICT - VEP - Sampo Harjula, Joni Juntunen, Niko Pafitis, Taina Rytkönen
    </footer>
</body>
</html>
