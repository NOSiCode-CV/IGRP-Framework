(function () {

  $.IGRP.on('init', () => {

    var finder = $('#igrp-app-finder'),
        list = $('.igrp-card-app'),
        cleaner = $('.search-clean'),
        notFound = $('.not-found'),
        iconCleaner = $('.search-clean i');

    cleaner.on('click', e => {
      finder.val('').trigger('keyup').focus();
    });

    finder.on('keyup', function (e) {

      e.preventDefault();

      var name = $(this).val();

      var filter = list.filter(function () {
        var reg = new RegExp(name, "i");

        return reg.test($(this).attr('search-content'));
      });

      iconCleaner.removeClass('fa-search').addClass("fa-times");

      list.hide();

      if (filter[0]) {
        filter.show();

        notFound.addClass('d-none');

      } else {
        notFound.removeClass('d-none');

      }

      if (name.length == 0) {
        list.show();

        iconCleaner.removeClass('fa-times').addClass("fa-search");
      }

    })

  })

})();
