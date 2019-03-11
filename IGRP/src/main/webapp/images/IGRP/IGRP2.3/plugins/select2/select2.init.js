(function(){


    //open select on TAB click
    $(document).on('focusin', '[item-type="select"]>.select2-container:not(.select2-container--disabled)', function (e) {

        var container = this;

        if (e.originalEvent) {

            if(!$(container).is('.select2-container--open'))
                setTimeout(function(){
                    $(container).siblings('select').select2('open');    
                },150)
            
             e.stopPropagation();

        }

        return false;
 
    });

    $(document).on('formlist:fields-draw', function (e, element) {

        $.IGRP.components.select2.init( element ); 

        return false;
 
    });

    var com = $.IGRP.component('select2',{
     
        setOptions:function(o){
        
            var select = o.select;
           
            if(select[0]){

                var isRules  = o.isRules ? true : false,
                    isChange = select.hasClass('IGRP_change') || select.attr('change') == true || isRules;

                $("option",select).remove();

                try{

                    if(select.data('select2'))

                        select.select2("destroy");
                                            
                }catch(err){

                    console.log(err)

                }

                o.options.forEach(function(op){
              
                    var option = new Option(op.text,op.value);

                    if(op.selected)
                        option.selected = true;

                    select.append(option);

                });

                com.select2Init({
                    field : select
                });

                //select.select2();

                if(isChange)
                    select.trigger('change');
            }
        },

        formListSubmit:function(formlist){
            //multiple select submit
            //var mSelects = $(formlist).find('>tbody>tr>td select.select2');

            var triggerEv = function(e){
  
                var sel    = $(e.target),

                    rel    = sel.attr('input-rel'),

                    valArr = sel.val(),

                    valStr = valArr ? valArr : '';

                if (sel.attr('multiple'))

                    valStr = valArr ? valArr.join(';') : '';

                var inputRel = $('[name="'+rel+'"]',sel.parent());

                inputRel.val(valStr);

            }

            $(formlist).on('change', '>tbody>tr>td select.select2', triggerEv );

            $(formlist).on('select2:unselect', '>tbody>tr>td select.select2', triggerEv ); 


            
        },
       
        formListConfig:function(parent){

            var select   = $('.select2',parent),
            
                formlist = select.parents('.IGRP_formlist');
            
            if(formlist[0]){

                $.each(formlist,function(i,fl){

                    com.formListSubmit(fl);

                    fl.events.on('row-add',function(row){

                        $('.select2-container',row).remove();

                        $('.select2',row).select2();

                    },true);

                    fl.events.on('row-clone',function(row){

                        //console.log(row);

                    },true);

                    fl.events.on('fields-draw',function(row){

                        //console.log(row)
                        //console.log(row);


                    },true);

                });
            }
        },

        setClear : function(select){

            $.each(select,function(i,s){

                var holder   = $(s).parent(),

                    clearBtn = $('<div class="select2-clear"><i class="fa fa-times"></i></div>').on('click',function(){
                  
                        $(s).select2('val', '');

                    });

                holder.addClass('select2-holder');

                holder.append(clearBtn);
            });
        },

        select2Init : function(p){

            var properties = p.properties || {
                allowClear : true,
                placeholder: {
                    id : "",
                    placeholder: ""
                }
            };

            if(p.field.is('[multiple]'))
                $('option[value=""]:first',p.field).remove();

            if (p.field.is('[tags]'))

                properties.tags = true;

            p.field.select2(properties);

           

        },
        init:function(parent){
           
            com = this;

            var select   = $('.select2',parent);

            select.each(function(i,e){

                com.select2Init({
                    field : $(e)
                });
            });

            com.formListConfig(parent);

            $.IGRP.on('js-change-success',function(o){
            
              com.init( o.itemHTML );

            });
        }

    },true);

})();