$(document).ready(function () {
    $("#ohje-perus").fadeIn();

    $("#size")
        .hover(function () {
            $(".ohje").hide();
            $("#ohje-talokoko").fadeIn();
        })
        .focus(function () {
            $(".ohje").hide();
            $("#ohje-talokoko").fadeIn();
        });

    $("#eclass")
        .hover(function () {
            $(".ohje").hide();
            $("#ohje-energialuokka").fadeIn();
        })
        .focus(function () {
            $(".ohje").hide();
            $("#ohje-energialuokka").fadeIn();
        });

    $("#temperature")
        .hover(function () {
            $(".ohje").hide();
            $("#ohje-lampotila").fadeIn();
        })
        .focus(function () {
            $(".ohje").hide();
            $("#ohje-lampotila").fadeIn();
        });

    $("#days")
        .hover(function () {
            $(".ohje").hide();
            $("#ohje-paivat").fadeIn();
        })
        .focus(function () {
            $(".ohje").hide();
            $("#ohje-paivat").fadeIn();
        });

    $("#town")
        .hover(function () {
            $(".ohje").hide();
            $("#ohje-kunta").fadeIn();
        })
        .focus(function () {
            $(".ohje").hide();
            $("#ohje-kunta").fadeIn();
        });
});

