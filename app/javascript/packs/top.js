// smoothly jump to #introduction
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