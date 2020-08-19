$(document).on("turbolinks:load", function () {
  $(".card-question").click(function () {
    $(this).children("p.question").toggleClass("ans-open");
    $(this).children("p.ans").slideToggle();
  });
});
