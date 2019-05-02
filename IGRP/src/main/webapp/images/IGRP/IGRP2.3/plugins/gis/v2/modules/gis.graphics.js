(function(){
	
	var Graphics = {
			
		create : function(params){
			
			var type = Graphics.utils.getGraphicType( params.geometry.type );
						
			if( L[type] ){
				
				try{
					
					var graphic = new L[type]( params.geometry.coordinates );
			
					return graphic;
					
				}catch(err){
					
					console.log(err);
					
				}
				
				
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