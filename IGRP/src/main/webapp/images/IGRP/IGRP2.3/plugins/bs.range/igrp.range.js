(function(){

    // Plugins replace the native field; keep its accessible name on their controls.
    function fieldName(field) {
        const references = (field.attr('aria-labelledby') || '').trim();
        if (references) {
            const text = references.split(/\s+/).map(function (id) {
                const label = document.getElementById(id);
                return label ? label.textContent.trim() : '';
            }).filter(Boolean).join(' ');
            if (text) return text;
        }
        const explicit = (field.attr('aria-label') || '').trim();
        if (explicit) return explicit;
        return Array.from(field[0].labels || []).map(function (label) {
            return label.textContent.trim();
        }).filter(Boolean).join(' ');
    }


	var com;

	$.IGRP.component('bsRange',{

        labelRanges : function(ranges){
            ranges.each(function(){
                const field = $(this), name = fieldName(field),
                    instance = field.data('bootstrapSlider');
                if (!name || !instance) return;
                // Preserve a plugin-configured aria-labelledby when one exists.
                $(instance.sliderElem).find('[role="slider"]').each(function(){
                    if (!this.hasAttribute('aria-labelledby')) {
                        $(this).attr('aria-label', name);
                    }
                });
            });
        },

		render : function(rg){
			
			var ranges = rg || $('.igrp-range');
			
			ranges.bootstrapSlider();
            $.IGRP.components.bsRange.labelRanges(ranges);
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
                    com.labelRanges($('.igrp-range',$sl));
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