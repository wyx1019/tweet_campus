$(document).on("turbolinks:load", function () {
  $(".tab").click(function () {
    if (!$(this).hasClass("active")) {
      $(".tab").removeClass("active");
      $(this).addClass("active");
      $(".tab-pane").hide();
      const index = $(this).index();
      $(".tab-pane").eq(index).fadeIn("slow"); //fadeIn(1200)
    }
  });
});

// $(document).on("turbolinks:load", function () {
//   $(".card-question").click(function () {
//     $(this).children("p.question").toggleClass("ans-open");
//     $(this).children("p.ans").slideToggle();
//   });
// });

// $(document).on('turbolinks:load', function () {
//     $(".movie").colorbox({
//         iframe: true,
//         width: "80%",
//         height: "80%",
//         opacity: 0.7
//     });
// });
