(function(){
	
	var utils = GIS.module('utils');
	
	function SearchWidget( widget, app ){
		
		var input, 
		
			Layers  = [],
			
			data    = widget.data(),
			
			timeout = function(){};
		
		function Loading(v){
			
			if(v)
				
				widget.html.addClass('loading');
			
			else
				
				widget.html.removeClass('loading');
			
		};
		
		function ClearResults(){
			
			$('.search-widget-results').html('').hide();
			
			UnHighLightFeatures();
		
		}
		
		function SetResults(results){
			
			try{
				
				var template 	 = Handlebars.compile(widget.templates.results),
				
			 	 	resultsHtml = template(results);
				
				ClearResults();
			 
				$('.search-widget-results', widget.html).replaceWith( resultsHtml );
				 
				$('.search-widget-results', widget.html).show();
				
			}catch(err){
				
				console.log(err)
				
			}
			
		};

		function Search(){
			
			var val = input.val();
			
			if( val && val.length >= 1){
				
				Loading(true);
				
				var reqs = [];
				
				Layers.forEach(function(l){
					
					var layer  = l.layer,
					
						fields = l.fields,
						
						failed = false;
	
					var req = layer.query({ fields : fields, value : val }).then(function(f){
						
						var results = {
								
							layer    : layer,
							
							total    : f.totalFeatures,
							
							features : f.features,
							
							fields   : fields
								
						};
						
						SetResults( results );
							
						Loading(false);

					});
					
					//reqs.push( req );
					
				});
				
				$.when.apply($, reqs).then(function(){
					try{
						if(arguments.length){
							
							for(var i=0; i < arguments.length; i++){
								
								console.log(arguments[i][0])
								
							}
							
						}
					}catch(err){
						
						console.log(err)
						
					}
					
					
				});
				
			}else{
				
				ClearResults();
				
				Loading(false);
				
			}

		};
		
		function UnHighLightFeatures(){
			
			Layers.forEach(function(l){
				
				try{
					
					l.layer.unHighlightAll();
					
				}catch(err){
					
					console.log(err);
					
				}
				
			})
			
		}
		
		function GetLayers(){
			
			if(data){
				
				if(data.layers && data.layers[0]){
					
					data.layers.forEach(function(l){
				
						var layer = app.layers.get( l.layer );
			
						if(layer)
							
							Layers.push({
								
								layer : layer,
								
								fields : l.fields ? l.fields.split(' ') : []
								
							});
						
					});
					
				}
				
			}
			
		};
		
		function SetEvents(){
			
			input = $('input',widget.html);
			
			widget.html.on('click', '.search-item', function(){
				
				var bounds  = $(this).attr('bounds'),
				
					id 	    = $(this).attr('feature-id'),
					
					layerid = $(this).attr('layer-id'),
					
					layer   = app.layers.get(layerid);
				
				try{
					
					if(bounds){
						
						bounds = JSON.parse(bounds);
						
						var ne = L.latLng([bounds._northEast.lng, bounds._northEast.lat]),//??
							
							sw = L.latLng([bounds._southWest.lng, bounds._southWest.lat]);//?? lat lng switched
						
						app.viewer().fitBounds( L.latLngBounds(sw,ne) );
						
						layer.highlight( id );

					}
					
				}catch(err){
					
					console.log(err)
					
				}

			});
			
			input.on('keyup', function(){
				
				clearTimeout(timeout);
			    	
				timeout = setTimeout(Search, 600 );
				
			});
			
			/*$(document).on('mouseup',function(e) {
			    
				var container = widget.html;

			    if (!container.is(e.target) && container.has(e.target).length === 0)
			        
			    	ClearResults();
			 
			});*/

		};
		
		(function(){
			
			//get feature center helper to use inside widget html
			Handlebars.registerHelper('getFeatureData', function(feature, v) {
				
				var object = utils.feature.getData( feature );
				
				return object[v] || '';
				
			  
			});
			
			widget.on( 'load-html', SetEvents );
			
			widget.on( 'deactivate', UnHighLightFeatures)
			
			GetLayers();
			
		})();
		
	}

	GIS.widgets.register('search', SearchWidget);
	
})();