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

			UnHighLightFeatures();
			
			$('.search-widget-no-data-msg').hide();
			
			$('.search-clear', widget.html).hide();
		
		};
		
		function SetResults(results){
			
			try{
	
				var template 	 = Handlebars.compile(widget.templates.results),
				
			 	 	resultsHtml = template({
			 	 		
			 	 		total  	      : results.length,
			 	 		
			 	 		noResultsMessage : 'Não foram encontrados resultados.',
			 	 		
			 	 		searchResults : results
			 	 		
			 	 	});
				
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
				
				var reqs    = [],
				
					Results = [];
				
				//$('.search-clear', widget.html).show();
				
				Layers.forEach(function(l){
					
					var layer  = l.layer,
					
						attributes = l.attributes,

						req = layer.query({ attributes : attributes, value : val });
					
					req.then(function(f){
						
						if(f.totalFeatures){
							
							var results = {
									
								layer    : layer.data(),
								
								total    : f.totalFeatures,
								
								features : f.features,
								
								attributes   : attributes
									
							};
							
							Results.push(results);
							
						}
						
					});
					
					reqs.push( req );
					
				});
				
				$.when.apply(undefined,reqs).then(function(){
					
					SetResults( Results );
			
				}).always(function(v){

					Loading(false);
					
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
				
			});
			
		}
		
		function GetLayers(){
			
			if(data){
				
				if(data.layers && data.layers[0]){
					
					data.layers.forEach(function(l){
				
						var layer = app.layers.get( l.layer );
			
						if(layer)
							
							Layers.push({
								
								layer : layer,
								
								attributes : l.attributes ? l.attributes.split(' ') : []
								
							});
						
					});
					
				}
				
			}
			
		};
		
		function SetEvents(){
			
			input = $('input',widget.html);
			
			widget.html.on('click', '.search-item', function(){
				
				var item    = $(this),
				
					bounds  = item.attr('bounds'),
				
					id 	    = item.attr('feature-id'),
					
					layerid = item.attr('layer-id'),
					
					layer   = app.layers.get(layerid);
				
				widget.html.find('.search-item').removeClass('active');
				
				try{
					
					if(bounds){
						
						bounds = JSON.parse(bounds);
						
						var ne = L.latLng([bounds._northEast.lng, bounds._northEast.lat]),//??
							
							sw = L.latLng([bounds._southWest.lng, bounds._southWest.lat]);//?? lat lng switched
						
						app.viewer().fitBounds( L.latLngBounds(sw,ne) );
						
						layer.highlight( id, function(){
							
							item.addClass('active');
							
						});

					}
					
				}catch(err){
					
					console.log(err)
					
				}

			});
			
			input.on('keyup', function(){
				
				clearTimeout(timeout);
			    	
				timeout = setTimeout(Search, 600 );
				
				Loading(true);
				
			});
			
			$('.search-clear', widget.html).on('click', ClearResults);
			
			/*$(document).on('mouseup',function(e) {
			    
				var container = widget.html;

			    if (!container.is(e.target) && container.has(e.target).length === 0)
			        
			    	ClearResults();
			 
			});*/

		};
		
		(function(){
			
			widget.on( 'load-html', SetEvents );
			
			widget.on( 'deactivate', UnHighLightFeatures)
			
			GetLayers();
			
		})();
		
	}

	GIS.widgets.register('search', {
		
		init : SearchWidget
		
	});
	
})();