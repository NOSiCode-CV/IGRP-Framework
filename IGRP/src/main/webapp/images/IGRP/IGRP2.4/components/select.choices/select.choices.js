(function () {

    const selector = '.select-choices';

    $.IGRP.component('choices', {

        list: {},

        get: (id) => {
            return $.IGRP.components.choices.list[id]
        },

        init: (elements = null, options) => {

            var elements = elements ? elements : $(selector);

            elements.each((i, el) => {
                const id = $(el).attr('id') || $.IGRP.utils.unique() + '-select';

                const choiceElement = el.hasAttribute('data-choice') && el.getAttribute('data-choice') === 'active';

                //if (!$.IGRP.components.choices.list[id] ||

                if (!choiceElement) {
                    $(el).attr(id);
                    $.IGRP.components.choices.list[id] =  new Choices(el);
                }

            });
        }

    }, true)

})();