(function () {

	var com,
        isNav = $('body[app]')[0];
    
    try {

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

                        valid = v.igrpValidateDateFormat();
                    }

                    return valid;
                },

                currency : function (v) {
                    let valid = true;

                    if(v && v !== undefined){
                        v       = v.toString().replaceAll(',', '.');
                        valid   = eval(/^([-]?(?=\.\d|\d)(?:\d+)?(?:\.?\d*))(?:[eE]([+-]?\d+))?$/).test(v);
                    }

                    return valid;
                }
            },

            message : {
                monthYear   : 'Data inv&aacute;lida. Formato deve ser MM-YYYY ex: (01-2022)',
                date        : "Data inv&aacute;lida. Formato deve ser DD-MM-YYYY ex: (01-01-2022)",
                currency    : "Valor inv&aacute;lido."
            },

            mask : function(x) {
                return x ? x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") : 0;
            },

            formatValue : function(val) {
                let auxVal = com.mask(val);

                val = val.toString().replaceAll('.', ',');

                if(val && val.indexOf(',')){
                    const v = val.split(',');
                    auxVal  = com.mask(v[0]);

                    if(v[1] && v[1].length > 0)
                    auxVal +=','+v[1];
                }

                return auxVal;
            },

            isFormat : function() {
                $('.isFormat').each(function(){
                    $(this).removeClass('isFormat');
                    com.method.currency($(this));
                });
            },

            getControlField : function (field) {
                const name = field.attr('name') || field.attr('field-name')
                return field.parents('table')[0] ? $(`.currency-control[name="${name}"]`,field.parents('td:first')) : $(`.currency-control[name="${name}"]`);
            },

            getControlValue : function(field) {
                let val = field.attr('data-value')*1;

                val = val > 0 ? val.toString().replaceAll('.', ',') : '';

                return val;
            },

            method : {

                currency : function(field) {
                    let name        = field.attr('name') || field.attr('field-name'),
                        val         = field.val() || '',
                        auxVal      = '',
                        hasAuxField = com.getControlField(field);
                    
                    if(val && val !== undefined){
                        auxVal  = val;
                        field.val(com.formatValue(val));

                        auxVal = auxVal.toString().replaceAll(',', '.');
                    }

                    if(com.valid.currency(auxVal)){

                        if(!hasAuxField[0]){
                            field.parents('*:first').append(`<input type="hidden" name="${name}" class="currency-control" value="${auxVal}"/>`);
                            field.removeAttr('name').attr('field-name',name);
                        }
                        else
                            hasAuxField.val(auxVal);

                        field.attr('data-value',auxVal);
                    }

                },

                monthYear : function(field){

                    field.inputmask('MM-YYYY', {
                        placeholder: "MM-YYYY",
                        definitions: {
                            M: {validator: "[0-9]"},
                            Y: {validator: "[0-9]"}
                        }
                    });

                },

                date : function (field) {
                    field.inputmask("DD-MM-YYYY", {
                        placeholder: "DD-MM-YYYY",
                        definitions: {
                            D: {validator: "[0-9]"},
                            M: {validator: "[0-9]"},
                            Y: {validator: "[0-9]"}
                        }
                    });
                },

                time : function (field) {
                    field.inputmask('00:00:00',{
                        placeholder: "hh:mm:ss",
                        definitions: {
                            h: {validator: "[0-9]"},
                            m: {validator: "[0-9]"},
                            s: {validator: "[0-9]"}
                        }
                    });
                },

                datetime : function(field) {
                    field.inputmask('DD-MM-YYYY hh:mm:ss', {
                        placeholder: "DD-MM-YYYY hh:mm:ss",
                        definitions: {
                            D: {validator: "[0-9]"},
                            M: {validator: "[0-9]"},
                            Y: {validator: "[0-9]"},
                            h: {validator: "[0-9]"},
                            m: {validator: "[0-9]"},
                            s: {validator: "[0-9]"}
                        }
                    });
                },

                percent : function (field) {
                    field.inputmask('##0,00%');
                },

                ipaddress : function (field) {
                    field.inputmask('0ZZ.0ZZ.0ZZ.0ZZ', {
                        definitions: {
                            Z: {validator: "[0-9]"}
                        }
                    });
                }

            },
            start : function(obj){
                
                if($.fn.inputmask  && isNav){
                    obj = obj ? $('[inputmask]:not([inputmask=""])',obj) : $('form [inputmask]:not([inputmask=""])');

                    $(document).on('click','[inputmask="currency"]:not([readonly])',function(){
                        com.isFormat();

                        const val = com.getControlValue($(this));

                        $(this).addClass('isFormat').val(val);
                    });

                    $(document).on('input','[inputmask="currency"]',function(){
                        let val     = $(this).val();
                
                        if(com.valid.currency(val)){
                            val = val ? val.replaceAll(',', '.') : '';

                            $(this).attr('data-value',val);

                            com.getControlField($(this)).val(val);

                        }else{
                            val = com.getControlValue($(this));
                            $(this).val(val);
                        }

                    });
    
                    $(document).click(function(e){
                        if(!$(e.target).is('[inputmask="currency"]'))
                            com.isFormat();
                    });


                    if(obj[0]){
                        obj.each(function(){
                            
                            var actions = $(this).attr('inputmask');

                            com.method[actions]($(this));

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

    } catch (error) {
        console.log('ERROR INPUTMASK COMPONENT:: ',error);
    }

})();