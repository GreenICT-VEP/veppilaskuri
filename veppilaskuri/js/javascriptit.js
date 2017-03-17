/*
    GreenICT - VEP 
    veppilaskuri javascriptit.js

*/
$(document).ready(function () {

    $("#ohje-perus").fadeIn();

    $("#size")
        .mouseenter(function () {
            $("#ohje-talokoko").fadeIn();
        })
        .focusin(function () {
            $("#ohje-talokoko").fadeIn();
        })
        .focusout(function () {
            $("#ohje-talokoko").hide();
        })
        .mouseout(function () {
            $("#ohje-talokoko").hide()
        });

    $("#eclass")
        .mouseenter(function () {
            $("#ohje-energialuokka").fadeIn();
        })
        .focusin(function () {
            $("#ohje-energialuokka").fadeIn();
        })
        .focusout(function () {
            $("#ohje-energialuokka").hide();
        })
        .mouseout(function () {
            $("#ohje-energialuokka").hide()
        });

    $("#temperature")
        .mouseenter(function () {
            $("#ohje-lampotila").fadeIn();
        })
        .focusin(function () {
            $("#ohje-lampotila").fadeIn();
        })
        .focusout(function () {
            $("#ohje-lampotila").hide();
        })
        .mouseout(function () {
            $("#ohje-lampotila").hide()
        });

    $("#days")
        .mouseenter(function () {
            $("#ohje-paivat").fadeIn();
        })
        .focusin(function () {
            $("#ohje-paivat").fadeIn();
        })
        .focusout(function () {
            $("#ohje-paivat").hide();
        })
        .mouseout(function () {
            $("#ohje-paivat").hide()
        });

    $("#town")
        .mouseenter(function () {
            $("#ohje-kunta").fadeIn();
        })
        .focusin(function () {
            $("#ohje-kunta").fadeIn();
        })
        .focusout(function () {
            $("#ohje-kunta").hide();
        })
        .mouseout(function () {
            $("#ohje-kunta").hide()
        });
});