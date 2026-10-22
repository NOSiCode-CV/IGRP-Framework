$(function () {
    'use strict';

    var searcher = $('#searcher input'),
        appsHolder = $('#igrp-apps-1'),
        apps = appsHolder.find('.apps-col a'),
        appSections = appsHolder.children(),
        // Keep results under the original holder so theme card styles still apply.
        searchResults = $('<div id="igrp-home-search-results" class="igrp-home-search-res clearfix" style="display: none;"></div>').appendTo(appsHolder);

    function cleanResults() {
        searchResults.empty().hide();
        appSections.show();
    }

    function search() {
        var text = searcher.val().trim().toLocaleLowerCase();
        if (text.length < 2) {
            cleanResults();
            return;
        }
        // Treat search text as text, including quotes and selector characters.
        var results = apps.filter(function () {
            return $(this).text().toLocaleLowerCase().indexOf(text) !== -1;
        });
        appSections.hide();
        searchResults.empty();
        results.parent().clone(true).appendTo(searchResults);
        searchResults.show();
    }

    searcher.on('input keyup', search);
    $('#searcher button:not(.searcher-clean)').on('click', function () {
        search();
        searcher.trigger('focus');
    });
    $('.searcher-clean').on('click', function () {
        searcher.val('');
        cleanResults();
        searcher.trigger('focus');
    });
});
