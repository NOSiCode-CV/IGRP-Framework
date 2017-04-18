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
       
        formListConfig:function(parent){
            var select   = $('.select2',parent);
            var formlist = select.parents('.IGRP_formlist');
            
            if(formlist[0]){
              $.each(formlist,function(i,fl){

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