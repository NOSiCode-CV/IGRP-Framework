(function () {
  const DatePicker = {
    list: {},
    get: (id) => DatePicker.list[id],
    init: (parent) => {
      
			const elements = parent
        ? parent.find(".gen-date-picker")
        : $(".gen-date-picker");
				
      elements.each((i, el) => {
        if (!$(el).data("datepicker-set")) {
          const definedId = $(el).attr("id");
          
					if (!definedId) {
            const id = "datapicker-" + $.IGRP.utils?.unique();
            $(el).attr("id", id);
          }

          const picker = (DatePicker.list[$(el).attr("id")] = flatpickr(el, {
            ...$(el).data(),
            locale: $.IGRP.locale.current,
          }));

					$('.gen-date-icon', $(el).parent()).on('click', picker.toggle )

          $(el).data("datepicker-set", true);

        }
      });
    },
  };

  $.IGRP.component("datepicker", DatePicker, true);
})();
