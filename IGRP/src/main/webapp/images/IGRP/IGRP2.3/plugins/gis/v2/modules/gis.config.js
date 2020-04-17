(function(){

	GIS.module('Config', {
		
		getOptions : function(widget){
			
			var config = {
					
	            css: false, html: false, js: false
				
			}
						
			switch(widget){
				
				case 'search':
					
					config.css = true; config.js = true;  config.html = true; 
					
				break;
				
				case 'legend':
									
					config.css = true; config.js = true;  config.html = true; 
					
				break;
								
				case 'infowindow':
					
					config.css = true; config.js = true; 
					
				break;
				
				case 'measurement':
					
					config.css = true; config.js = true;  config.html = true; 
					
				break;
				
				case 'edition':
					
					config.css = true; config.js = true;  config.html = true; 
					
				break;
				
				case 'getcoordinates':
					
					config.css = true; config.js = true;  config.html = true; 
					
				break;
				
			}
						
			return config;
			
		},


	});

})();