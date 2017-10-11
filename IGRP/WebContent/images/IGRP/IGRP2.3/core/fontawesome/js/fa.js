(function(){

	var icons;

	var getData = function(){

		$.IGRP.request(path+'/core/fontawesome/fa.icons.json',{

			success:function(data){
				
				for(var c in data){
					var category = data[c];

					for(var i in category){

						console.log(i);

					}

				}

			}

		});

	}();



})();