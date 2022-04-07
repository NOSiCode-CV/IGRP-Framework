(function () {

	var com,
        isNav = $('body[app]')[0];

	$.IGRP.component('inputmask', {

        notValid : ['currency'],

        valid : {

            monthYear : function (v) {

                let valid = true;

                if(v && v!= undefined){

                    var str = v.split('-');

                    valid = (eval(/(0[1-9]|1[0-2])/).test(str[0]) && eval(/[1-9]\d{3}/).test(str[1]))
                }

                return valid;
            },

            date : function (v) {

                let valid = true;

                if(v && v!= undefined){

                    valid = eval(/^(0?[1-9]|[1-2][0-9]|3[01])[-](0?[1-9]|1[0-2])[-][1-9]\d{3}$/).test(v);

                    if(valid){
                        let ListofDays  = [31,28,31,30,31,30,31,31,30,31,30,31]; 
                        let datepart    = v.split('-'); 
                        let month       = parseInt(datepart[1]);      
                        let day         = parseInt(datepart[0]);      
                        let year        = parseInt(datepart[2]); 

                        if (month === 1 || month > 2){ 

                            valid = (day <= ListofDays[month-1]);

                        }else if (month === 2){ 

                            let leapYear = ( (!(year % 4) && year % 100) || !(year % 400));

                            valid = !leapYear ? day <= ListofDays[1] : day <= 29;
                        }

                    }
                }

                return valid;
            }
        },

        message : {
            monthYear   : 'Data inv&aacute;lida. Formato deve ser MM-YYYY ex: (01-2022)',
            date        : "Data inv&aacute;lida. Formato deve ser DD-MM-YYYY ex: (01-01-2022)"
        },

		mask : {

            currency : function(field) {

                field.mask("#.##0", {
                    reverse: true,
                    translation: {
                        '#': {
                          pattern: /-|\d/,
                          recursive: true
                        }
                    },
                    onKeyPress: function(cep, event, currentField){
                        cep = (cep.replaceAll('.', '').replaceAll(',', '')*1);
                        currentField.attr('data-value',cep);
                        
                        var field = currentField.parents('table')[0] ? $('input[name="'+currentField.attr('field-name')+'"]',currentField.parents('td:first')) : $('input[name="'+currentField.attr('field-name')+'"]');
                        field.val(cep);
                    }
                });

            },

            monthYear : function(field){

                field.mask('MM-YYYY', {
                    placeholder: "MM-YYYY",
                    translation: {
                        M: {pattern: /[0-9]/},
                        Y: {pattern: /[0-9]/}
                    }
                });

            },

            date : function (field) {
                field.mask("DD-MM-YYYY", {
                    placeholder: "DD-MM-YYYY",
                    translation: {
                        D: {pattern: /[0-9]/},
                        M: {pattern: /[0-9]/},
                        Y: {pattern: /[0-9]/}
                    }
                });
            },

            time : function (field) {
                field.mask('00:00:00',{
                    placeholder: "hh:mm:ss"
                });
            },

            datetime : function(field) {
                field.mask('DD-MM-YYYY hh:mm:ss', {
                    placeholder: "DD-MM-YYYY hh:mm:ss"
                });
            },

            percent : function (field) {
                field.mask('##0,00%', {reverse: true});
            },

            ipaddress : function (field) {
                field.mask('0ZZ.0ZZ.0ZZ.0ZZ', {
                    translation: {
                      'Z': {
                        pattern: /[0-9]/, 
                        optional: true
                      }
                    }
                });
            }

		},
        start : function(obj){
            
            if($.fn.mask  && isNav){
                obj = obj ? $('[inputmask]:not([inputmask=""])',obj) : $('form [inputmask]:not([inputmask=""])');

                if(obj[0]){
                    obj.each(function(){
                        
                        var actions = $(this).attr('inputmask');

                        com.mask[actions]($(this));

                    });
                }
            }
        },
		init: function () {

			com = this;

            com.start();
		}
	}, true);


    /** 
     * Add method in jquery validate for validate inputmask
     */
    $.validator.addMethod("inputmask", function(value, element) {

        let valid = true;

        if($.IGRP.components.inputmask && isNav){

            let method   = $(element).attr('inputmask');
            let notValid = $.IGRP.components.inputmask.notValid || [];

            if(method && method !== undefined && !notValid.includes(method))
                valid = $.IGRP.components.inputmask.valid[method](value);
        }

        return this.optional(element) || valid;
        
    },function(value, element){
        let msg = "Corrija este campo.";

        if($.IGRP.components.inputmask){

            let method = $(element).attr('inputmask');
            let notValid = $.IGRP.components.inputmask.notValid || [];

            if(method && method !== undefined && !notValid.includes(method))
                msg = $.IGRP.components.inputmask.message[method];
        }

        return msg
    });



})();