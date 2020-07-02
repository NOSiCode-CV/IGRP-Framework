(function(){
	
	var utils = GIS.module('Utils');
	
	function SearchWidget( widget, app ){
		
		var input, check, txtCql, submitSearch, inputParent,
		
			Layers  = [],
			
			cqlFilters = '',
			
			data    = widget.data(),
			
			timeout = function(){};
			
		widget.activeFilter = false;			
		
		widget.templateParams = {
			
			layers 		     : [],
			
			total  	      	 : 0,
 	 		
 	 		noResultsMessage : 'Não foram encontrados resultados.',
 	 		
 	 		searchResults 	 : [],
 	 		
 	 		layerAttributes  : []
				
		};
		
		function ClearResults(){

			UnHighLightFeatures();
			
			$('.search-widget-no-data-msg').hide();
			
			$('.search-clear', widget.html).hide();
			
			$('.search-widget-results',widget.html).hide();
		
		};
		
		function SetResults(results){
			
			try{

				widget.setTemplateParam('results', {
					
					total  	      	 : results.length,
		 	 		
		 	 		noResultsMessage : 'Não foram encontrados resultados.',
		 	 		
		 	 		searchResults 	 : results
					
				});
								
				ClearResults();
				 
				$('.search-widget-results', widget.html).show();
				
				$('.search-clear', widget.html).show();
								
			}catch(err){
				
				console.log(err)
				
			}
			
		};

		function Search(){
			
			var val = input.val();
			
			GetLayers();
			
			getCqlFilter();
							
			if( (val && val.length >= 1 || cqlFilters ) && Layers.length >= 1){
				
				var reqs    = [],
				
					Results = [];
				
				////cql_filter
				Layers.forEach(function(l){
										
					var layer  = l.layer,
					
						attributes = l.attributes,

						req = layer.query({ attributes : attributes, value : val, cql : cqlFilters });
					
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
					
					widget.loading(false);
					
				});
				
			}else{
				
				ClearResults();
				
				widget.loading(false);
				
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
			
			var layer_id = $('select#layers-select').val(),
			
			    attributes = $('select#layer-atts-select').val();
			
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
			
			Layers = [];
			
			var layer = app.layers.get( layer_id );
									
			if(layer && (attributes.length >= 1 || isSearchAdvanced() )){
				
				Layers.push({
					
					layer : layer,
					
					attributes : attributes
					
				});
				
			}
			
		};
		
		function LoadFields(){
			
			var _layers = [],
			
				_grouplayers = app.layers.getLayers();
						
			_grouplayers.forEach(function(l){
				
				var layer  =  l.data();
				
				_layers.push({
					name : layer.name,
					id   : layer.id
				});
				
			});
			
			try{
				
				widget.setTemplateParams( {
					
					'layers': _layers
					
				} );
				
			}catch(err){
				
				console.log(err)
				
			}
		};
		
		function AttributesToSelect(json){
			
			var attributes = [];
			
			for(var key in json){
				
	            attributes.push({
	            	
	            	id : key,
	            	
	            	name : key.toUpperCase()
	            	
	            });
	            
	        }
			
			return attributes;
		};
		
		function isSearchAdvanced(){
			
			return check.is(":checked");
			
		}
		
		function genCqlFilter(v){
			
			if (!v) return '';
			
			var value = txtCql.val() +' '+ v;
			 
			txtCql.val(value);
		};
		
		function getCqlFilter(){
			
			var teste = '',
				
				attrReplaced = [];
			
			cqlFilters = " " + txtCql.val();
			
			if (isSearchAdvanced()){
				
				Layers.forEach(function(l){
					
					var attributes = l.layer.Description.attributes;
										
					for(var attr in attributes){
						
						if(attrReplaced.indexOf(attr) == -1 && cqlFilters.includes(attr))
														
							cqlFilters = cqlFilters.replace(" "+attr+" ", ' strToLowerCase('+attr+') ');
						
					};
										
				});
				
			}
						
		};
				
		function clearSearch(){
			
			input.val('').trigger('keyup');
			
			input[0].focus();
			
			txtCql.val('');
			
			//ClearResults();
			
		};
		
		function SetEvents(){
			
			input = $('.search-input-wrapper input', widget.html);
			
			inputParent = $('.search-input-wrapper', widget.html);
			
			check = $('#search-ckeck-advanced :checkbox', widget.html);
			
			checkParent = $('#search-ckeck-advanced', widget.html);
			
			txtCql = $('#search-txt-cql textarea', widget.html);

			submitSearch= $('#search-form-submit', widget.html);
						
			if(!data.advanced) checkParent.hide();
			
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
				
				widget.loading(true);
				
			});
			
			
			widget.action("search", function(){
				
				clearTimeout(timeout);

				timeout = setTimeout(Search, 600 );
				
				widget.loading(true);
				
			})
			
			$('.search-clear', widget.html).on('click', function(){
				
				clearSearch();
								
			});
			
			submitSearch.on('click', function(){				
				
				clearTimeout(timeout);

				timeout = setTimeout(Search, 600 );
				
				widget.loading(true);
				
			});
			
			widget.html.on('change', 'select#layers-select',function(){
				
				var val = $(this).val();
				
				$('#layer-atts-select', widget.html).hide();
								
				if (!val) return;
						
				var layer       = app.layers.get(val)
				
					_attributes = layer.Description.attributes,
					
					attributes  = [];				
			
				attributes = AttributesToSelect(_attributes);
								
				widget.setTemplateParam('attributes', {
					
					'layerAttributes': attributes
					
				});
				
				$('#layer-atts-select', widget.html).show();	
								
			});
			
			check.on('change', function(){
				
				inputParent.show();
		    	
		    	clearSearch();
		    	
				if (this.checked) {
					 					 
					 inputParent.hide();
					 
					 widget.activeFilter = true;
					 
					 widget.steps.filter.activate();

			    }else{
			    	
			    	$("#search-form-advanced").removeClass('active');
			    	
			    	widget.activeFilter = false;
			    	
			    }
			});
						
			widget.html.on('click', '#search-grid-operators button',function(){
								 
				 genCqlFilter($(this).data('operator'));
				 				 				 
			});
			
			widget.html.on('click', 'select#layer-atts-select',function(){
				
				if(isSearchAdvanced()){
					
					genCqlFilter($(this).val());
					
				}
			});
			
		};
		
		
		(function(){
			
			widget.on( 'activate', function(){
								
				SetEvents();
				
				LoadFields();
								
			});
			
			widget.on( 'deactivate', function(){
				
				UnHighLightFeatures();
				
				clearSearch();
				
				check.trigger("click");
				
			})
									
		})();
		
	}

	GIS.widgets.register('search', {
		
		init : SearchWidget
		
	});
	
})();