(function(){
	
	var utils = GIS.module('Utils');
	
	function SearchWidget( widget, app ){
		
		var input, check, txtCql, submitSearch, inputParent,
		
			Layers  = [],
			
			cqlFilters = '',
			
			data    = widget.data(),
			
			timeout = function(){},
			
			Map = app.viewer();
			
		widget.activeFilter = false;		
		
		widget.activeDivAdmin = false;		
		
		widget.templateParams = {
			
			layers 		     : [],
			
			total  	      	 : 0,
 	 		
 	 		noResultsMessage : 'Não foram encontrados resultados.',
 	 		
 	 		searchResults 	 : [],
 	 		
 	 		layerAttributes  : []
				
		};
		
		widget.results = {};
		
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
										
			if( (val && val.length >= 1 || cqlFilters ) && Layers[0]){
				
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
			
			Layers = [];
			
			if(data.layers && data.layers[0]){
				
				data.layers.forEach(function(l){
			
					var layer = app.layers.get( l.layer );
		
					if(layer)
						
						Layers.push({
							
							layer : layer,
							
							attributes : l.fields ? l.fields.split(',') : []
							
						});
										
				});
				
			}else{
				
				var layer_id = $('select#layers-select').val(),
				
					layer = app.layers.get( layer_id ),
								
			    	attributes = $('select#layer-atts-select').val();
				
				if(layer && (attributes[0] || isSearchAdvanced() ))
					
					Layers.push({
						
						layer : layer,
						
						attributes : attributes
						
					});
			}
						
		};
		
		function LoadFields(){
			
			var _layers = [], _grouplayers = app.layers.getLayers();
			
			if(!data.layers[0] ){
				
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
				
				$('.search-input-layer', widget.html).show();
				
			}else
				$('.search-input-layer', widget.html).hide();		
				
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
			
			var attrReplaced = [];
			
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
			
			input[0].removeAttribute('disabled');
			
			widget.activeDivAdmin =  false;		
			
			widget.steps.divAdmin.activate();

			if(widget.request)						
				widget.request.abort();
			
			widget.loading(false);
			
			var selects = $('.search-div-admin select', widget.html);
				   
			for ( var i = 0; i < selects.length; i++) {			
				selects[i].value = '';				
			}
			
		};
		
		function setRemoteComobox(o){
			
			try{
			
				var cql_filter = '', strUrl = '';
				
				for(var key in o.tipo_obj){
					cql_filter += (cql_filter ? " or " : "") + "strToLowerCase(TIPO_OBJ) LIKE '%"+o.tipo_obj[key].toLowerCase()+"%'";
					strUrl += o.tipo_obj[key].toLowerCase() + '_';
				}
				
				cql_filter = ("(" + cql_filter + ")" ) + (o.id ?  ' and strToLowerCase(UNIDADE_ADMIN_ID) = ' + o.id:  '');
								
				options = {
					cql_filter : cql_filter
				}
				
				if(widget.request)
					
					widget.request.abort();
				
				if ( o.source == 'LOCAL' ){
				
					//clear
					if (!o.parent && o.id == '' ){
						
						try{
							
							widget.setTemplateParam( 'div-admin-'+o.target, {'divData': [] } );			
																												
							$('#'+o.target, widget.html).select2();
							
							$('#'+o.target, widget.html).trigger("change");

							
						}catch(e){
							console.log(e)
						}
						
						widget.loading(false);
						
						return false;
					}
					
					$.getJSON(path+'/plugins/gis/data/'+strUrl+'.json', function(json) {
						
						var data    = json.features,
						
							results = [];		
					    
						data.forEach(function(feature, i){
														
							var properties = feature.properties,
							
							    id = (properties['id'] || properties['ID']) ? (properties['id'] || properties['ID'])  : ( feature.id ? feature.id.split('.')[1] : '' );
							    		
							if( ( o.tipo_obj == 'ILH' && o.tipo_obj.includes(properties['TIPO_OBJ']) ) || ( o.id ==  properties['UNIDADE_ADMIN_ID']  && o.tipo_obj.includes(properties['TIPO_OBJ']) ) ){								
								
								results.push({
									name    : properties['NOME'] || properties['nome'],
									id      : id,
									feature : feature
								});
							}
							
							json.features[i].properties['ID'] = id;
							
						});
						
						widget.results[o.target] = json
						
						try{
							
							widget.setTemplateParam( 'div-admin-'+o.target, {'divData': results} );			
																												
							$('#'+o.target, widget.html).select2();
							
							$('#'+o.target, widget.html).trigger("change");

							
						}catch(e){
							console.log(e)
						}
						
						widget.loading(false);
						
					});
					
				}else{	
					
					widget.request = $.get(widget.divAdminLayer.Info.owsURL+'?service=WFS&request=GetFeature&typeName='+widget.divAdminLayer.Info.workspaceLayer+'&version=1.0.0&outputFormat=application/json', options);
				
				    widget.request.then(function(json){				    	
				    		
			    		var data    = json.features,
						
						results = [];
						
						data.forEach(function(feature){
							
							var properties = feature.properties,
							
								id = properties['id'] ? properties['id']  : ( feature.id ? feature.id.split('.')[1] : '' );
										
							results.push({
								name    : properties['NOME'] || properties['nome'],
								id      : id,
								feature : feature
							});
						});	
				    							
						
						try{
							widget.setTemplateParam( 'div-admin-'+o.target, {'divData': results} );
					
							$('.select2', widget.html).select2();
						}catch(e){
							console.log(e)
						}
						
						widget.loading(false);
		
					});
				}
				
			}catch(e){
				console.log(e)
				widget.loading(false);
			}
		}
		
		function SetEvents(){
						
			input = $('.search-input-wrapper input', widget.html);
			
			inputParent = $('.search-input-wrapper', widget.html);
			
			check = $('#search-ckeck-advanced :checkbox', widget.html);
			
			checkParent = $('#search-ckeck-advanced', widget.html);
			
			txtCql = $('#search-txt-cql textarea', widget.html);

			submitSearch= $('#search-form-submit', widget.html);
			
			//$('.select2', widget.html).select2();
						
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
						
						layer.show();

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
			
			if(!data.advanced)
				
				checkParent.hide();
			
			else
			
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
			
			/*SEARCH LAYERS MENU*/
			widget.html.on('click', '#search-layers', function(){
								
				clearSearch();
			})
			
			/*DIV ADMIN*/
			widget.html.on('click', '#search-div-admin', function(){
				
				input[0].setAttribute('disabled', true);
								
				if (!widget.activeDivAdmin){
					
					layers = app.layers.getLayers();
					
					widget.activeDivAdmin =  true;
					
					widget.steps.divAdmin.activate();
										
					if(layers && layers[0]){
						
						layers.forEach(function(layer, i){
							
							var layerData  = layer.data();
							
							if( layerData.options.divAdmin ){
																
								widget.divAdminLayer = layer;
								
								opt = {
									target   : 'ilh',
									tipo_obj : ['ILH']
								}
								
								
								clearTimeout(timeout);

								timeout = setTimeout(setRemoteComobox(opt), 600 );
								
								widget.loading(true);																

							}
							
						});
					}
				}else{
					
					clearSearch();
				}
				
				//static file json 
				if( widget.divAdminLayer == null && widget.activeDivAdmin){
					
					var opt = {
						target   : 'ilh',
						tipo_obj : ['ILH'],
						source   : 'LOCAL',
						parent   : true
					}
					
					clearTimeout(timeout);

					timeout = setTimeout(setRemoteComobox(opt), 600 );
					
					widget.loading(true);	
					
				}
			});
			
			widget.html.on('change', '.remote-change', function(){
				
				var field  = $(this),
				
					obj    = $('select[id="'+field.data('target')+'"]').data('value'),
					
					bounds = field.find(':selected').attr('bounds'),
					
					featureId = field.find(':selected').attr('feature-id'),
					
					objIn  = field.data('value');
								
				if(obj)
					obj = obj.split(',');
								
				opt = {
					target   : field.data('target'),
					id		 : field.val(),
					tipo_obj : obj,
					source   : 'LOCAL'
				}
				
				//if(!field.val()) return false,
				
				clearTimeout(timeout);

				timeout = setTimeout(setRemoteComobox(opt), 600 );
				
				widget.loading(true);	
												
				
				try{
									
					if(bounds){
						
						bounds = JSON.parse(bounds);
						
						var ne = L.latLng([bounds._northEast.lng, bounds._northEast.lat]),//??
							
							sw = L.latLng([bounds._southWest.lng, bounds._southWest.lat]);//?? lat lng switched
						
						app.viewer().fitBounds( L.latLngBounds(sw, ne) );
												
						if ( widget.results[objIn.toLowerCase()] &&  opt.id !== '' ){
							
							if(widget.highlight)
								
								Map.removeLayer(widget.highlight);
							
							var jsonObject = widget.results[objIn.toLowerCase()];
																
							widget.highlight = L.geoJson(jsonObject, {
							    filter: function(feature, layer) {
							        return feature.properties['ID'] === opt.id;
							    }
							}).addTo(Map);
							
							var strUrl = '';
							
							if(objIn)
								
								objIn = objIn.split(',');
							
							for(var key in objIn)
								
								strUrl += objIn[key].toLowerCase() + '_';
							
							
							Map.highlightdivadmin = {'feature-id' : featureId, 'url' : path+'/plugins/gis/data/'+strUrl+'.json'}
							
						}

					}
					
				}catch(err){
					
					console.log(err)
					
				}
			})			

			//$('.remote-change', widget.html).trigger("change");
				
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
		
		dependencies : {
			
			js  : [ 
				path + '/plugins/select2/select2.full.min.js',
				path + '/plugins/select2/select2.init.js'
			],
			
			css  : [
				path + '/plugins/select2/select2.min.css',
				path + '/plugins/select2/select2.style.css'
			]
		
		},
		
		
		init : SearchWidget
		
	});
	
})();