(function(){

	var com;

	$.IGRP.component('bsRange',{

		render : function(rg){
			
			var ranges = rg || $('.igrp-range');
			
			ranges.bootstrapSlider();
		},

		renderOnEvents : function(){

			$('.IGRP_formlist').on('formlist:add-row', function(e,p){
				
				if($('.igrp-range',p.row)[0]){
					
					var range = $('.igrp-range',p.row),
						val   = range.data('slider-min');

					$('.slider.slider-horizontal',p.row).remove();
					
					range.attr({ 'data-slider-value' : val, 'data-value' : val});

					com.render(range);

				}
				
			});

			if($('.IGRP-separatorlist')[0] && $('.IGRP-separatorlist .igrp-range')[0]){

				var sl = $('.IGRP-separatorlist')[0];

				sl.events.on('row-add',function(p){

			        var $sl = p.row.parents('.IGRP-separatorlist:first');

			        $('.igrp-range',$sl).bootstrapSlider('refresh');
			    });

			    sl.events.on('row-edit',function(p){
			        var $row  = $(p.row),
			        	$sl   = $(p.row).parents('.IGRP-separatorlist:first');
			        
			        $('.igrp-range',$sl).each(function(i,el){
			        	var $el  = $(el),
			        		val  = $(':input[name="'+$el.attr('name')+'_fk"]',$row).val();
			        	
			        	$el.val(val).bootstrapSlider('setValue',val,true);
			        });
			    });
			}
		},

		init:function(){
			com = this;
			
			com.render();

			com.renderOnEvents();
		}

	},true);


})();