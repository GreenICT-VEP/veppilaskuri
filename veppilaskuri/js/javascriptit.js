$(document).ready(function () {
    $(".ohje").hide();

    $("input").hover(
      function () {
          $("#ohje-perus").fadeIn();
      }, function () {
          $("#ohje-perus").fadeOut();
      }
    );

    $("input #eclass").hover(
      function () {
          $("#ohje-talokoko").fadeIn();
      }, function () {
          $("#ohje-talokoko").fadeOut();
      }
    );

});

