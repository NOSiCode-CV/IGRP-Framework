(function(){

	var com;

	$.IGRP.component('bsRange',{

		init:function(rg){
			
			var ranges = rg || $('.igrp-range');

			ranges.bootstrapSlider();

		}

	},true);


})();