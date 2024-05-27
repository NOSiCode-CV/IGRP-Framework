(function(){
	
	var Graphics = {
			
		create : function(params){
			
			var type = Graphics.utils.getGraphicType( params.geometry.type );
						
			if( L[type] && params.geometry.coordinates && params.geometry.coordinates[0] != null){

				var graphic = new L[type]( params.geometry.coordinates );
			
				return graphic;
					
			}
			
		},
		
		utils : {
			
			getGraphicType : function(type){
				
				var rtn = type;

				switch(type.toLowerCase()){
					
				case 'point':
					
					rtn = 'Marker'
						
				break;
				
				}
				
				return rtn;
				
			}
			
		}
			
	};
	
	GIS.module('Graphics', Graphics)
	
})();