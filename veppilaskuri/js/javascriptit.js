$(document).ready(function () {
    $("#ohje-perus").fadeIn();

    $("#size").on('focus hover',
      function (e) {
          $(".ohje").hide();
          $("#ohje-talokoko").fadeIn();
      }
    );

    $("#eclass").on('focus hover',
      function (e) {
          $(".ohje").hide();
          $("#ohje-energialuokka").fadeIn();
      }
    );

    $("#temperature").on('focus hover',
      function (e) {
          $(".ohje").hide();
          $("#ohje-lampotila").fadeIn();
      }
    );

    $("#days").on('focus hover',
      function (e) {
          $(".ohje").hide();
          $("#ohje-paivat").fadeIn();
      }
    );

    $("#town").on('focus hover',
      function (e) {
          $(".ohje").hide();
          $("#ohje-kunta").fadeIn();
      }
    );
});

