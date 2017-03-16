$(document).ready(function () {

    $("#ohje-perus").fadeIn();

    $("#size")
        .hover(function () {
            $("#ohje-talokoko").fadeIn();
        }, function(){
            $("#ohje-talokoko").hide()
        })
        .focus(function () {
            $("#ohje-talokoko").fadeIn();
        }, function(){
            $("#ohje-talokoko").hide()
        });

    $("#eclass")
        .hover(function () {
            $("#ohje-energialuokka").fadeIn();
        }, function () {
            $("#ohje-energialuokka").hide()
        })
        .focus(function () {
            $("#ohje-energialuokka").fadeIn();
        }, function () {
            $("#ohje-energialuokka").hide()
        });

    $("#temperature")
        .hover(function () {
            $("#ohje-lampotila").fadeIn();
        }, function () {
            $("#ohje-lampotila").hide()
        })
        .focus(function () {
            $("#ohje-lampotila").fadeIn();
        }, function () {
            $("#ohje-lampotila").hide()
        });

    $("#days")
        .hover(function () {
            $("#ohje-paivat").fadeIn();
        }, function () {
            $("#ohje-paivat").hide()
        })
        .focus(function () {
            $("#ohje-paivat").fadeIn();
        }, function () {
            $("#ohje-paivat").hide()
        });

    $("#town")
        .hover(function () {
            $("#ohje-kunta").fadeIn();
        }, function () {
            $("#ohje-kunta").hide()
        })
        .focus(function () {
            $("#ohje-kunta").fadeIn();
        }, function () {
            $("#ohje-kunta").hide()
        });
});