(function () {

    const selectorPlus = '.plus';
    const selectorMinus = '.minus';


    $.IGRP.component('inputspin', {

        list: {},

        get: (id) => {
            return $.IGRP.components.inputspin.list[id]
        },

        init: (parent = null) => {

            const plusButtons = parent
                ? parent.find(selectorPlus)
                : $(selectorPlus);

            const minusButtons = parent
                ? parent.find(selectorMinus)
                : $(selectorMinus);

            plusButtons &&
                Array.from(plusButtons).forEach(
                    function (plusButton) {
                        plusButton.addEventListener("click",
                            function (e) {
                                parseInt(e.target.previousElementSibling.value) < e.target.previousElementSibling.getAttribute("max")
                                    && e.target.previousElementSibling.value++

                            })
                    })

            minusButtons &&
                Array.from(minusButtons).forEach(function (minusButton) {
                    minusButton.addEventListener("click", function (e) {
                        parseInt(e.target.nextElementSibling.value) >
                            e.target.nextElementSibling.getAttribute("min") &&
                            e.target.nextElementSibling.value--
                    });
                });
        }

    }, true)

})();