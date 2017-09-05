$(function(){
  if($.IGRP && !$.IGRP.components.select2){
      $.IGRP.components.select2 = {

       /* separatorListConfig:function(parent){
            var select        = $('.select2',parent);
            var separatorlist = select.parents('.IGRP-separatorlist');
            
            if(separatorlist[0]){
              $.each(separatorlist,function(i,sl){

                sl.events.on('row-add',function(row){
                    
                },true);

              });

            }
        },*/

        setOptions:function(o){
            
            var select = o.select;
           
           if(select[0]){

                $("option",select).remove();

                select.select2("destroy");

                o.options.forEach(function(op){
                  
                  var option = new Option(op.text,op.value);

                  if(op.selected)
                    option.selected = true;

                  select.append(option);

                });

                select.select2();
            }
           
        },

        formListSubmit:function(formlist){
          //multiple select submit
          var mSelects = $(formlist).find('>tbody>tr>td select.select2');

          if(mSelects[0]){

            var triggerEv = function(e){
      
              var sel    = $(e.target);

              var rel    = sel.attr('input-rel');

              var valArr = sel.val();

              var valStr = valArr ? valArr : '';

              if (sel.attr('multiple'))
                valStr = valArr ? valArr.join(';') : '';

              var inputRel = $('[name="'+rel+'"]',sel.parent());

              inputRel.val(valStr);
              
            }
            
            mSelects.on('change',triggerEv);

            mSelects.on('select2:unselect',triggerEv);
          
          }

        },
       
        formListConfig:function(parent){
            var select   = $('.select2',parent);
            var formlist = select.parents('.IGRP_formlist');
            
            if(formlist[0]){

              $.each(formlist,function(i,fl){

                $.IGRP.components.select2.formListSubmit(fl);

                fl.events.on('row-add',function(row){
                    $('.select2-container',row).remove();
                    $('.select2',row).select2();
                },true);

              });

            }
        },
        init:function(parent){
          var select   = $('.select2',parent);
          $('.select2',parent).select2();

          $.IGRP.components.select2.formListConfig(parent);

        }
      }
      
      $.IGRP.components.select2.init();
    }
});