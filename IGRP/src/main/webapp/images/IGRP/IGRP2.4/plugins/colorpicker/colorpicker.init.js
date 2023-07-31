$(function(){
	if($.IGRP && !$.IGRP.components.colorpicker){
  		$.IGRP.components.colorpicker = {

        //config color picker events when placed in a separatorlst
        separatorListConfig:function(parent){
          var cp            = $('.form-color-picker',parent);
          var slist = cp.parents('.IGRP-separatorlist');

          if(slist[0]){

            var events = ['color-field-add'/*,'color-field-reset'*/,'color-field-edit'];

            $.each(slist,function(i,sl){
              
           //   console.log(sl);

              sl.events.declare(events);

              sl.events.on('color-field-add',function(o){
                return '<span class="separator-list-td-val color" style="background-color:'+o.value+';height: 10px;display: block;"></span>'
              },true);

              sl.events.on('color-field-edit',function(o){
                o.field.parents('.form-color-picker').colorpicker('setValue',o.value);
              },true);

              /*sl.events.on('color-field-reset',function(o){
                o.parents('.form-color-picker').colorpicker('setValue','');
              },true);*/

            });
            
          }
            
        },
        //config color picker events when placed in a formlist
        formListConfig:function(parent){
          var cp       = $('.form-color-picker',parent);
          var formlist = cp.parents('.IGRP_formlist');

          if(formlist[0]){
            $.each(formlist,function(i,fl){

              fl.events.on('row-add',function(row){
                $('.form-color-picker',row).colorpicker();
              },true);

              fl.events.on('row-reset',function(row){
                $('.form-color-picker .input-group-addon i',row).css('background-color','')
              },true);

            });

          }

        },
  			init:function(parent){
          var cp = $('.form-color-picker',parent);
  				
          if($.fn.colorpicker){

            if(cp[0]) {
              $('input[format]',cp).each(function(){
                $(this).parents('.form-color-picker').colorpicker({ format:$(this).attr('format') });
              });
              /*var format = $('input[format]',cp).attr('format');
              cp.colorpicker({ format:format });*/
            }

            this.formListConfig(parent);
            this.separatorListConfig(parent);
          
            
          }else{
            console.log('please include colorpicker library!')
          }

  			}
  		}
  		
  		$.IGRP.components.colorpicker.init();
  	}
});