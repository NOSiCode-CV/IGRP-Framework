(function(){

	if(!window.GIS){

		window.GIS = {

			class : {

				map : {}

			},

			init : function(id, json){
				
				var map = new GIS.class.map( id, JSON.parse(json) );

			} 

		};

	}
	
})();