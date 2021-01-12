$( document ).on('turbolinks:load', function() {
    $('#query').autocomplete({
        source: $('#query').data('autocomplete-source')
    });
});
