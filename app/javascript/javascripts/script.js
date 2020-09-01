// タブ
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

// FAQ accordion
$(document).on("turbolinks:load", function () {
  $(".card-question").click(function () {
    $(this).children("p.question").toggleClass("ans-open");
    $(this).children("p.ans").slideToggle();
  });
});

// テキストカウント
$(document).on("turbolinks:load", function () {
  $(".newpost-area").on("keydown keyup keypress", function () {
    let count = $(this).val().length;
    countDif(250, count);
  });
});

function countDif(limit, count) {
  let dif = limit - count;
  $(".count").text(count);
  if (dif >= 0 && dif < 250) {
    $("#count").removeClass("red");
    $("#count").addClass("green");
    $("input[type='submit']").prop("disabled", false);
  } else {
    $("#count").removeClass("green");
    $("#count").addClass("red");
    $("input[type='submit']").prop("disabled", true);
  }
  console.log(dif);
}
