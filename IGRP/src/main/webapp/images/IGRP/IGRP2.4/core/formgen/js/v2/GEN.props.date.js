(function () {
    var GEN = VARS.getGen();


    GEN.defineGlobalProperty("date-options", (object, defaults = {}) => {

        object.setPropertyGroup({
            name:'dateconfig',
            label : 'Opções de Data',
            order: 1,
            properties : [
                {
                    name  : 'format',
                    label : $.IGRP.locale.get('date-format'),
                    value : {
                        value:'d-m-Y',
                        options : [
                            {value: 'd-m-Y', label:'Dia-Mês-Ano (dd-mm-yyyy'},
                            {value: 'm-Y', label:'Mês-Ano (mm-yyyy'},
                            {value: 'd-m', label:'Dia-Mês (dd-mm)'}
                        ]
                    },
                    //editable: false
                },
                {
                    name  	: 'enableTime',
                    label 	: $.IGRP.locale.get('enable-time'),
                    value 	: false,
                    //xslValue: 'data-enable-time="true"'
                },
                {
                    name  : 'range',
                    label : 'From/To',
                    value : false 
                },
                {
                    name  : 'disableWeekends',
                    label : 'Disable Weekends',
                    value : false 
                },
                {
                    name  : 'disabledBeforetoday',
                    label : 'Disable Before Today',
                    value : false 
                },
                {
                    name  	: 'daysoff',
                    label 	: 'Days Off',
                    value 	: false,
                    //xslValue: 'daysoff=""'
                }

            ]
        })
     
      /*  object.setPropriety();

		object.setPropriety();

		object.setPropriety();

		object.setPropriety();

		object.setPropriety();

		object.setPropriety();*/

    });

})();
