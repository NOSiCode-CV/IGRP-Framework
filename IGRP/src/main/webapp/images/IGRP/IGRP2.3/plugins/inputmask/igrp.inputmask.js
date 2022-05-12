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
                }
            },

            message : {
                monthYear   : 'Data inv&aacute;lida. Formato deve ser MM-YYYY ex: (01-2022)',
                date        : "Data inv&aacute;lida. Formato deve ser DD-MM-YYYY ex: (01-01-2022)"
            },

            mask : {

                currency : function(field) {
                    let name        = field.attr('name') || field.attr('field-name'),
                        val         = field.val() || '',
                        decimal     = '',
                        hasAuxField = function(){
                            return field.parents('table')[0] ? $(`.currency-control[name="${name}"]`,field.parents('td:first')) : $(`.currency-control[name="${name}"]`)
                        };
                    
                    if(val.indexOf('.')){
                        const v = val.split('.');
                    
                        if(v[1] && v[1].length > 0){
                            decimal = '';
                            for (let i = 0; i < v[1].length; i++) {
                                decimal += '0';
                            }

                            field.val(val.replaceAll('.', ',')).attr('data-value',val);
                        }
                    }

                    if(!hasAuxField()[0]){
                        field.parents('*:first').append(`<input type="hidden" name="${name}" class="currency-control" value="${val}"/>`);

                        field.removeAttr('name').attr('field-name',name).attr('data-value',val);
                    }

                    const controlValue = function(value){
                        value = value ? (value.replaceAll('.', '').replaceAll(',', '.')*1) : '';

                        field.attr('data-value',value);

                        hasAuxField().val(value);
                    }

                    field.inputmask({
                        alias:'numeric',
                        inputmode:'decimal',
                        positionCaretOnClick: "radixFocus",
                        radixPoint: ",",
                        groupSeparator:'.',
                        digits:decimal.length,
                        digitsOptional:false,
                        onBeforePaste: function (pastedValue, opts) {
                            controlValue(pastedValue);
                        }, 
                        oncomplete : function(f){
                            controlValue($(f.currentTarget).val());
                        },
                        oncleared : function(f){
                            controlValue($(f.currentTarget).val());
                        }
                    });

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

                    if(obj[0]){
                        obj.each(function(){
                            
                            var actions = $(this).attr('inputmask');
                            console.log(actions);
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

    } catch (error) {
        console.log('ERROR INPUTMASK COMPONENT:: ',error);
    }

})();