$(document).on("turbolinks:load", function () {
  $('a[href*="#introduction"]').click(function () {
    var adjust = 0;
    var speed = 700;
    var href = $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top + adjust;
    $('body,html').animate({
      scrollTop: position
    }, speed, 'swing');
    return false;
  });
});

$(document).on("turbolinks:load", function () {
  $('.movie-open').click(function () {
    $('.movie').fadeIn();
  });
  $('.movie-close').click(function () {
    $('.movie').fadeOut();
  });
});

function showCount() {
  var nowDate = new Date(); //Date() 現在の日付を取得する
  var now = nowDate.getTime(); //日時データをミリ秒に変化する
  var tDate = new Date("2020/8/26 10:00:00"); //日付を指定する monthは０からカウントする
  var t = tDate.getTime();
  var diffDate = t - now; //指定した日時と現在の日時の差分

  var day = Math.floor(diffDate / (1000 * 60 * 60 * 24)); //diffDate の中に何日ある
  diffDate = diffDate % (1000 * 60 * 60 * 24); // diffDate の中に何日ある？割れない分を新たなdiffDateにする
  var hour = Math.floor(diffDate / (1000 * 60 * 60)); //diffDate の中に何時間ある
  diffDate = diffDate % (1000 * 60 * 60); //diffDate の中に何時間ある 割れない分を新たなdiffDateにする
  var min = Math.floor(diffDate / (1000 * 60));
  diffDate = diffDate % (1000 * 60);
  var sec = Math.floor(diffDate / 1000);

  if (t > now) {
    if (day < 10) {
      document.getElementById("day").innerHTML = "0" + day;
    } else {
      document.getElementById("day").innerHTML = day;
    };
    if (hour < 10) {
      document.getElementById("hour").innerHTML = "0" + hour;
    } else {
      document.getElementById("hour").innerHTML = hour;
    };

    if (min < 10) {
      document.getElementById("min").innerHTML = "0" + min;
    } else {
      document.getElementById("min").innerHTML = min;
    };
    if (sec < 10) {
      document.getElementById("sec").innerHTML = "0" + sec;
    } else {
      document.getElementById("sec").innerHTML = sec;
    };

  } else if (day == -1 && (hour <= 0) | (min <= 0) && sec <= 0) {
    document.getElementById("countdown").innerHTML = "<span><b>開催日です</b></span>";
  } else {
    document.getElementById("countdown").innerHTML = "<span>終了しました</span>";
  }
}

window.onload = function () {
  setInterval("showCount()", 1000);
};