$( document ).ready(function() {
    $('#query').autocomplete({
        source: $('#query').data('autocomplete-source')
    });
});
