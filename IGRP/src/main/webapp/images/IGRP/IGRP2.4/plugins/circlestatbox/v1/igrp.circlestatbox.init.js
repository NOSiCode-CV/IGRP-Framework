(function(){

	$.IGRP.component('circlestatbox',{

		init:function(o){

			o = o || {};
			
			var selector = o.selector || '.circlestats-chart';

			$(selector).knob({
                'min':0,
                'max':100,
                'readOnly': true,
                'width': 120,
                'height': 120,
                'bgColor': 'rgba(255,255,255,0.5)',
                'fgColor': 'rgba(255,255,255,0.9)',
                'dynamicDraw': true,
                'thickness': 0.2,
                'tickColorizeValues': true
            });
		}

	},true);

})();
