$(function () {
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