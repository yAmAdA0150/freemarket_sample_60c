$(function() {
    var itemSearch = function() {
        if (window.location.href.match(/\/items\/search/)) {
            $('.item').addClass('is-show');
        }
    };
    $(".selectbox").on("change", function() {
        Rails.fire($('#search-form')[0], 'submit');
        setTimeout(itemSearch, 500);
    });
});