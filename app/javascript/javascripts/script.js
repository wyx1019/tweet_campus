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

// 文字数カウント
$(document).on("turbolinks:load", function () {
  $(".newpost-area").on("keydown keyup keypress", function () {
    let count = $(this).val().length;
    countDif(400, count);
  });
});
$(document).on("turbolinks:load", function () {
  $(".comment-area").on("keydown keyup keypress", function () {
    let count = $(this).val().length;
    countDif(250, count);
  });
});
$(document).on("turbolinks:load", function () {
  $(".detail-area").on("keydown keyup keypress", function () {
    let count = $(this).val().length;
    console.log(count);
    countDif(300, count);
  });
});

function countDif(limit, count) {
  let dif = limit - count;
  $(".count").text(count);
  if (dif >= 0 && dif < limit) {
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

// textareaのheightを入力内容に応じて自動的に伸ばす
$(document)
  .one("focus.comment-area", "textarea.comment-area", function () {
    var savedValue = this.value;
    this.value = "";
    this.baseScrollHeight = this.scrollHeight;
    this.value = savedValue;
  })
  .on("input.comment-area", "textarea.comment-area", function () {
    var minRows = this.getAttribute("data-min-rows") | 0,
      rows;
    this.rows = minRows;
    rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 16);
    this.rows = minRows + rows;
  });

//modal
$(document).on("turbolinks:load", function () {
  var winScrollTop;
  $(".modal-open").each(function () {
    $(this).on("click", function () {
      var target = $(this).data("target"); // 通过data-target="modal01"和id一一对应
      var modal = document.getElementById(target); //获取对应的id
      $(modal).fadeIn();
      winScrollTop = $(window).scrollTop();
    });
  });
  $(".modal-close").on("click", function () {
    $(".modal").fadeOut();
    $("body,html").stop().animate({
        scrollTop: winScrollTop,
      },
      1000
    );
  });
});

// stop event
$(document).on("turbolinks:load", function () {
  $(".stopEvent").click(function (e) {
    e.stopPropagation();
  });
});