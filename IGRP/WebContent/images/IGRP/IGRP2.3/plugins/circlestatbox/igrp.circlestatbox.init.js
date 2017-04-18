(function(){

	$.IGRP.component('circlestatbox',{

		init:function(o){

			o = o || {};

			var selector = o.selector || '.circlestats-chart';

            $(selector).each(function() {

                var $this = $(this);

                var vwidth = 100;
                var vheight = 100;

                var value = $this.attr("value");
                var circlesize = $this.attr("size");

                switch (circlesize){

                    case "small": vwidth = 110; vheight = 110; break;
                    case "medium": vwidth = 140; vheight = 140; break;
                    case "big": vwidth = 170; vheight = 170; break;

                    default: break;
                }

                $this.knob({
                    'readOnly': true,
                    'width': vwidth,
                    'height': vheight,
                    'thickness': 0.2,
                    'inputColor': 'rgba(255,255,255,0.9)',
                    'fgColor': 'rgba(255,255,255,0.9)',
                    'bgColor': 'rgba(255,255,255,0.5)',
                    'step' : 0.1
                });

                $({value: 0}).animate({
                    value: value
                }, {

                    duration: 1500,
                    easing: 'swing',
                    step: function() {
                        $this.val(this.value).trigger('change');
                    }
                });
            });
		}

	},true);

})();