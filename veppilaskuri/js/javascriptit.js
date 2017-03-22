/*
    GreenICT - VEP 
    veppilaskuri javascriptit.js

*/
$(document).ready(function () {

    $("#ohje-perus").fadeIn();

    $("#size")
        .mouseover(function () {
            $("#ohje-perus").hide();
            $("#ohje-talokoko").show();
        })
        .focusin(function () {
            $("#ohje-perus").hide();
            $("#ohje-talokoko").show();
        })
        .focusout(function () {
            $("#ohje-perus").show();
            $("#ohje-talokoko").hide();
        })
        .mouseout(function () {
            $("#ohje-perus").show();
            $("#ohje-talokoko").hide()
        });

    $("#eclass")
        .mouseover(function () {
            $("#ohje-perus").hide();
            $("#ohje-energialuokka").show();
        })
        .focusin(function () {
            $("#ohje-perus").hide();
            $("#ohje-energialuokka").show();
        })
        .focusout(function () {
            $("#ohje-perus").show();
            $("#ohje-energialuokka").hide();
        })
        .mouseout(function () {
            $("#ohje-perus").show();
            $("#ohje-energialuokka").hide()
        });

    $("#temperature")
        .mouseover(function () {
            $("#ohje-perus").hide();
            $("#ohje-lampotila").show();
        })
        .focusin(function () {
            $("#ohje-perus").hide();
            $("#ohje-lampotila").show();
        })
        .focusout(function () {
            $("#ohje-perus").show();
            $("#ohje-lampotila").hide();
        })
        .mouseout(function () {
            $("#ohje-perus").show();
            $("#ohje-lampotila").hide()
        });

    $("#days")
        .mouseover(function () {
            $("#ohje-perus").hide();
            $("#ohje-paivat").show();
        })
        .focusin(function () {
            $("#ohje-perus").hide();
            $("#ohje-paivat").show();
        })
        .focusout(function () {
            $("#ohje-perus").show();
            $("#ohje-paivat").hide();
        })
        .mouseout(function () {
            $("#ohje-perus").show();
            $("#ohje-paivat").hide()
        });

    $("#town")
        .mouseover(function () {
            $("#ohje-perus").hide();
            $("#ohje-kunta").show();
        })
        .focusin(function () {
            $("#ohje-perus").hide();
            $("#ohje-kunta").show();
        })
        .focusout(function () {
            $("#ohje-perus").show();
            $("#ohje-kunta").hide();
        })
        .mouseout(function () {
            $("#ohje-perus").show();
            $("#ohje-kunta").hide()
        });
});