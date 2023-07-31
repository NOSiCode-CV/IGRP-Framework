(function(){
	var com;
	
    $.IGRP.component('circlestatbox',{
    	
    	render : function(o){
    		o = o || {};

            var selector = o.selector || '.circlestats-chart';

            $(selector).each(function() {

                var $this      = $(this),

                    vwidth     = 100,

                    vheight    = 100,

                    value      = $this.attr("value"),

                    max        = value > 100 ? value*1 : 100,

                    circlesize = $this.attr("size"),

                    valAux     = 0;

                switch (circlesize){

                    case "small"  : vwidth = 110; vheight = 110; break;
                    case "medium" : vwidth = 140; vheight = 140; break;
                    case "big"    : vwidth = 170; vheight = 170; break;

                    default: break;
                }

                $this.knob({
                    'readOnly'  : true,
                    'width'     : vwidth,
                    'height'    : vheight,
                    'thickness' : 0.2,
                    'inputColor': 'rgba(255,255,255,0.9)',
                    'fgColor'   : 'rgba(255,255,255,0.9)',
                    'bgColor'   : 'rgba(255,255,255,0.5)',
                    'step'      : 0.01,
                    'max'       : max
                });

                $('.dial').animate({
                    value: value
                }, {

                    duration: 1500,
                    easing: '_default',
                    step: function() {
                        $this.val(this.value).trigger('change');
                    }
                });

            });
    	},

        init:function(o){
        	com = this;
            
        	$.IGRP.components.circlestatbox.render(o);
        	
            $.IGRP.events.on('element-transform',function(p){
				
				if($('.circlestats-chart',p.content)[0]){
					
					$.IGRP.components.circlestatbox.render($('.circlestats-chart',p.content));
				}
			});
        }

    },true);

})();