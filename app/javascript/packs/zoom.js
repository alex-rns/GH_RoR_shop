$( document ).on('turbolinks:load', function() {
    $('.zoom').magnify({
        speed: 300,
        touchBottomOffset: 90
    });
});