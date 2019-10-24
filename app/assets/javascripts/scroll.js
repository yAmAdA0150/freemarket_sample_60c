$(function() {
    $('a[href^="#"]').click(function() {
        var href = $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        var speed = 500; // スクロールの速度（ミリ秒）
        $('body,html').animate({ scrollTop: position }, speed, 'swing'); // スクロール方式
        return false;
    });
});

$(function() {
    $(document).on("keypress", "input:not(.allow_submit)", function(event) {
        return event.which !== 13;
    });
});