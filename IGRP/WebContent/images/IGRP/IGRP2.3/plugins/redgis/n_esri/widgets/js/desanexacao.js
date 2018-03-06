function isIE () {
  var myNav = navigator.userAgent.toLowerCase();
  return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}
(function ( jQ ) { 
    jQ.fn.Desanexacao = function() {

    	var geometryEngine;

    	var id = this.attr('id');
		var wSplit = new Widget(id);
		
		wSplit.Layers = []; //layers id array
		wSplit.shapeLayers = [];
		wSplit.SplitGeometries = [];

		wSplit.field_main_name = null;
		wSplit.field_split_name = null;

		wSplit.mainGraphic = null; //graphic on desanx
		wSplit.mainGraphicAreaHtml = null;

		/*DRAWING*/
		wSplit.drawLayer = null;
		wSplit.drawTool = null;
		wSplit.drawHStarted = false;

		/* to subscribe */
		wSplit.onSplitConfirm = function(){}

		wSplit.onInit = function(){

			require(["esri/geometry/geometryEngine"], function(gEngine) {

    			geometryEngine = gEngine;

				wSplit.includeCss('desanexacao.style');
				wSplit.getLayers();
				wSplit.uploadStatusHtml    = wSplit.Html.find('#upload-status');
				wSplit.mainGraphicAreaHtml = wSplit.Html.find('#main-area');	

				wSplit.sfGraphicsInfo = wSplit.Html.find('#sf-graphcs-info')

				wSplit.InterfaceControl();
				wSplit.configDraw();
				wSplit.configShapeLoad();

			})
		};
		
		wSplit.onActivate = function(){
			LayersManager.hideLayerMenu();
			LayersManager.lock();

			wSplit.setActiveStep('get',1);
			
			if(LayersManager.currentFeature){
				wSplit.Layers.forEach(function(layer){
					if(layer == LayersManager.currentFeature.getLayer().id){
						wSplit.setGraphic(LayersManager.currentFeature);
					}else{
						LayersManager.deselectAll();
					}
				})
			}

		}
		wSplit.onDeactivate = function(){
			LayersManager.deselectAll();
			wSplit.removeShapeFile();
			wSplit.drawLayer.clear();
			wSplit.drawTool.deactivate();
			wSplit.unsetGraphic();
		}

		wSplit.onMapClick = function(e){
			if(!wSplit.mainGraphic){
				if(e.graphic){
					if(e.graphic.getLayer()){
						var layerId = e.graphic.getLayer().id;
						wSplit.Layers.forEach(function(l){
							if(l == layerId){
								LayersManager.selectFeatures({
									graphic:e.graphic,
									type:'id',
									callback:function(){
										wSplit.setGraphic(LayersManager.currentFeature);
									}
								})

							}else{
								alert('Invalid Layer Id')
							}
						})
					}
				}
			}
			if(wSplit.drawHStarted){
				wSplit.unsetActiveStep('draw',1);
				wSplit.setActiveStep('draw',2);
				wSplit.drawHStarted = false;
			}
		}

		wSplit.onLayersAddResult = function(layers){

			wSplit.unsetActiveStep('tool',1);//hide tools selection

			var SplitGraphs = [];
			var AreaPai = 0;
			var AreaSplit = 0;
			var MainGeometry = wSplit.mainGraphic.geometry;
			
			var shapelayer = [];

			var areaTotal = 0;

			var splitGeometriesArea = 0;

			var ext = MainGeometry.getExtent();

			var errorSymbol  = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color('red'));
			var ovlpsSymbol  = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color('yellow'));
			
			var withinSymbol =  new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
						  		new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID,
								new dojo.Color([112, 112, 112]), 1), new dojo.Color([136, 136, 136, 0.25]));

			var union;

				try{	
					layers.forEach(function(_l){
						
						shapelayer.push(_l.layer);
						
						_l.layer.graphics.forEach(function(graph){

							SplitGraphs.push(graph);
							wSplit.SplitGeometries.push(graph.geometry);

							var sgeo      = graph.geometry;
							
							var shapeArea = graph.attributes['SHAPE_AREA'] ? graph.attributes['SHAPE_AREA'] : 
											graph.attributes['SHAPE_Area'];

							shapeArea = shapeArea ? shapeArea : graph.attributes['shape_area'];
						
							areaTotal = areaTotal+shapeArea;
							
							//console.log(geometryEngine.planarArea(MainGeometry))
							splitGeometriesArea += geometryEngine.geodesicArea(sgeo);
							//console.log(shapeArea);
							
							if(!geometryEngine.intersects(sgeo,MainGeometry)){
								graph.setSymbol(errorSymbol);	
								//wSplit.canSplit = false;
							}

							//console.log(geometryEngine.crosses(sgeo,MainGeometry))
							if(geometryEngine.overlaps(sgeo,MainGeometry)){
								//graph.setSymbol(ovlpsSymbol);	
								//console.log(graph)
							}

							//graph.show();
							/*LayersManager.query({
								layerid:wSplit.mainGraphic.getLayer().id,
								geometry:sgeo,
								spatialRelationship:esri.tasks.Query.SPATIAL_REL_WITHIN,
								callback:function(re){
									re.features.forEach(function(f){
										var idField = wSplit.mainGraphic.getLayer().objectIdField;
										if(f.attributes[idField] == wSplit.mainGraphic.attributes[idField])
											graph.setSymbol(withinSymbol);
									});
									graph.show();
								},
								error:function(){
									graph.show();
								}
							});*/
							

							if(!ext.contains(sgeo.getExtent())){
								//graph.setSymbol(symbol)
							}

						});
					});
			
					console.log(wSplit.canSplit)

					if(wSplit.canSplit){
						wSplit.Html.find('#confirm-split').show();
					}else{
						wSplit.Html.find('#confirm-split').hide();
					}

					jQ(wSplit.Html.find('#total-graphs')).text(SplitGraphs.length);
					jQ(wSplit.Html.find('#total-area')).text(splitGeometriesArea);

					wSplit.setActiveStep('shapefile',1);//show shapefile graphics info
					wSplit.setStepDone('shapefile',1);

					wSplit.setActiveStep('shapefile',2);//show buttons

					//console.log(Math.round(splitGeometriesArea) - Math.round(geometryEngine.geodesicArea(MainGeometry)));
					//console.log();
					//console.log(areaTotal);
					//console.log(geometryEngine.geodesicArea(MainGeometry));
					//console.log(splitGeometriesArea - geometryEngine.geodesicArea(MainGeometry))

				}catch(qe){
					//graph.show();
					console.log(qe)
				}



			



			
		
		}

		
		wSplit.removeShapeFile = function(){
			wSplit.shapeLayers.forEach(function(_l){
				map.removeLayer(_l);
			})
		}
		
		wSplit.getGraphicInfo = function(graphics,step){
		}
		wSplit.setGraphic = function(graphic){
			wSplit.mainGraphic = graphic;
			
			wSplit.mainGraphicAreaHtml.text(geometryEngine.geodesicArea(graphic.geometry));
			
			wSplit.setStepDone('get',1);
			wSplit.setActiveStep('tool',1);
			/*GeometryService.getAreaAndLenght({
				layerid: wSplit.mainGraphic.getLayer().id,
				objectid: wSplit.mainGraphic.attributes['OBJECTID'],
				callback:function(result){
					wSplit.mainGraphicAreaHtml.text(result.area);
					wSplit.setStepDone('get',1);
					wSplit.setActiveStep('tool',1);
				}
			});*/
		}
		wSplit.unsetGraphic = function(){
			wSplit.mainGraphic = null;	
		}
		wSplit.setMenu = function(layerid){
			var menu = {
				id:wSplit.id+'-widget',
				icon:'desanexacao_icon.png',
				label:'Desanexar',
				text:'Desanexar',
				//icon:'desanexacao_icon.png',
				onClick:function(e){
					WidgetManager.activateWidget(wSplit.id);
				}
			}
			LayersManager.setLayerMenu({
				layerId:layerid,
				menu:[menu]
			});
		}
		wSplit.getLayers = function(){
			jQ.each(wSplit.Html.find('layers layer'),function(idx,_layer){
				var layer = jQ(_layer).attr('id');
				layer.topology = {
					rules:''
				}
				
				wSplit.Layers.push(layer);
				wSplit.field_main_name = jQ(_layer).find('field_main').attr('name');
				wSplit.field_split_name = jQ(_layer).find('field_split').attr('name');
			});
			
			if(wSplit.Layers.length > 0){ //add menu to polygons
				wSplit.Layers.forEach(function(_l){
					LayersManager.onLayerAddResult({
						layerid:_l,
						callback:function(layer){	
							wSplit.setMenu(layer.id);
						}	
					});
				});
			};
		};		

		wSplit.initDrawing = function(){
			wSplit.drawLayer.clear();
			wSplit.drawTool.activate(esri.toolbars.Draw.POLYLINE);
			Mapp.isDrawing = true;
			wSplit.drawHStarted = true;
			wSplit.unsetActiveStep('tool',1);//hide tools selection
			wSplit.setActiveStep('draw',1);//hide tools selection
		}

		wSplit.drawEnd = function(e){
			wSplit.drawHStarted = false;
			wSplit.drawTool.deactivate();
			
			var symbol = new esri.symbol.SimpleLineSymbol();

			var graphic = new esri.Graphic(esri.geometry.webMercatorToGeographic(e.geometry),symbol);
			
			wSplit.drawLayer.add(graphic);

			wSplit.unsetActiveStep('draw',2);
			wSplit.setActiveStep('draw',3);
			wSplit.performSplit();
		}


		wSplit.performSplit = function(){
			var _cutter = wSplit.drawLayer.graphics[0].geometry;

			GeometryService.split({
				geometry:esri.geometry.webMercatorToGeographic(wSplit.mainGraphic.geometry),
				splitter:_cutter,
				callback:function(e){
					wSplit.drawLayer.clear();
					
					var gSymb = new esri.symbol.SimpleFillSymbol().setStyle(esri.symbol.SimpleFillSymbol['STYLE_SOLID']);

					e.geometries.forEach(function(g){
						var graphic = new esri.Graphic(g,gSymb);
						wSplit.drawLayer.add(graphic);
					});
					wSplit.SplitGeometries = e.geometries;
					wSplit.setStepDone('draw',3);

				},
				error:function(err){
					console.log(err)
				}
			});
		}
		

		wSplit.configDraw = function(){
			wSplit.drawTool = new esri.toolbars.Draw(map, {
				showTooltips:false
			});
			wSplit.drawTool.on('draw-end',wSplit.drawEnd);

			var dlayer = new esri.layers.GraphicsLayer({
				id:wSplit.id+'-drawlayer'
			});
			wSplit.drawLayer = dlayer;
			map.addLayer(wSplit.drawLayer);

		}

		wSplit.InterfaceControl = function(){
			/* click to upload shapefile */
			wSplit.Html.find('#btn-load').on('click',function(){
				wSplit.canSplit = true;

				wSplit.drawTool.deactivate();
				wSplit.Html.find('input[type="file"]#inFile').val('');
				wSplit.Html.find('input[type="file"]#inFile').click();
			});

			/*cancel shapefile*/
			wSplit.Html.find('div[rel="shapefile"] #cancel').on('click',function(){
				wSplit.removeShapeFile();
				wSplit.unsetStepDone('shapefile',1);
				wSplit.unsetActiveStep('shapefile',2);
				wSplit.unsetActiveStep('shapefile',1);

				wSplit.setActiveStep('tool',1);//show tools selection
				return false;
			});

			/*confirm shapefile split*/
			wSplit.Html.find('div[rel="shapefile"] #confirm-split').on('click',function(){
				try{
					jQ('input[name="'+wSplit.field_main_name+'"]').val(wSplit.mainGraphic.attributes['OBJECTID']);
					
					wSplit.SplitGeometries.forEach(function(sg,i){
						if(!sg.spatialReference.isWebMercator()){
							wSplit.SplitGeometries[i] = esri.geometry.geographicToWebMercator(sg)
						}
					});

					//console.log(wSplit.SplitGeometries);
					var rtn = GeometryService.convertRings(wSplit.SplitGeometries,'|');

					jQ('input[name="'+wSplit.field_split_name+'"]').val(rtn);
					
					wSplit.Html.removeClass('active');

					wSplit.onSplitConfirm({
						method:'shapefile',
						objectId:wSplit.mainGraphic.attributes['OBJECTID'],
						result:rtn,
						fieldName:wSplit.field_split_name
					});
					
					//WidgetManager.deactivateWidget(wSplit.id);
				}catch(err){ 
					console.log(err) 
				}
				return false;
			});
			/*drawing split click*/
			wSplit.Html.find('#draw-split').on('click',function(){
				wSplit.initDrawing();
			});
			/* draw confirmation */
			wSplit.Html.find('#confirm-draw-split').on('click',function(){
				try{
					console.log(map.spatialReference);
					console.log(wSplit.mainGraphic);
					jQ('input[name="'+wSplit.field_main_name+'"]').val(wSplit.mainGraphic.attributes['OBJECTID']);
					
					console.log('before Convert:')
					console.log(wSplit.SplitGeometries);
					

					wSplit.SplitGeometries.forEach(function(sg,i){
						if(!sg.spatialReference.isWebMercator()){
							wSplit.SplitGeometries[i] = esri.geometry.geographicToWebMercator(sg)
						}
					});

					console.log('after Convert:')
					console.log(wSplit.SplitGeometries);

					var rtn = GeometryService.convertRings(wSplit.SplitGeometries,'|');
					console.log(rtn)
					jQ('input[name="'+wSplit.field_split_name+'"]').val(rtn);
					
					//wSplit.drawLayer.clear();
					//LayersManager.deselectAll();
					wSplit.drawTool.deactivate();
					//wSplit.unsetGraphic();
					//wSplit.clearSteps();
					//wSplit.setActiveStep('get',1);
					wSplit.Html.removeClass('active');

					wSplit.onSplitConfirm({
						method:'draw',
						objectId:wSplit.mainGraphic.attributes['OBJECTID'],
						result:rtn,
						fieldName:wSplit.field_split_name
					});

				}catch(err){ 
					console.log(err) 
				}
				return false;
			});
			/* draw cancel */
			wSplit.Html.find('#cancel-draw-split').on('click',function(){
				wSplit.drawLayer.clear();
				wSplit.unsetStepDone('draw',3);
				wSplit.unsetActiveStep('draw',3);

				//wSplit.Html.find('#draw-split').click();
				wSplit.setActiveStep('tool',1);//show tools selection
				return false;
			});
			
		}

		var convert = function(geometries){

		}

		wSplit.configShapeLoad = function(){
			require([
				"esri/request",
				"esri/InfoTemplate",
				"esri/renderers/SimpleRenderer",
				"esri/symbols/SimpleLineSymbol",
				"dojo/dom",
				"dojo/json",
				"dojo/on",
				"dojo/parser",
				"dojo/sniff",
				"dojo/_base/array",
				"dojo/_base/lang",
				"dojo/domReady!"
			  ],
				function (
				request,InfoTemplate,
				SimpleRenderer, SimpleLineSymbol,
				dom, JSON, on, parser, sniff, arrayUtils, lang
			  ) {
				  parser.parse();
				  
				  var portalUrl = "https://www.arcgis.com";
				  var fileName;
				  on(dom.byId("inFile"), "change", function (event) {
				  	try{
						wSplit.removeShapeFile(); 
						fileName = event.target.value.toLowerCase();
						
						if (sniff("ie")) { //filename is full path in IE so extract the file name
						  var arr = fileName.split("\\");
						  fileName = arr[arr.length - 1];
						}
						
						if (fileName.indexOf(".zip") !== -1 ) {//is file a zip - if not notify user
						  generateFeatureCollection(fileName);
						}else {
						  //wSplit.uploadStatusHtml.html('<p style="color:red">Adicione um shapefile .zip</p>');
						}
					}catch(erro){ console.log(erro) }

				  });
							
				  var  generateFeatureCollection = function(fileName) {
					var name = fileName.split(".");

					name = name[0].replace("c:\\fakepath\\", "");

					wSplit.Html.find('#btn-load').addClass('loading');
					
					 //wSplit.uploadStatusHtml.text('Loading:' + name);
					var params = {
					  'name': name,
					  'targetSR': map.spatialReference,
					  'maxRecordCount': 1000,
					  'enforceInputFileSizeLimit': true,
					  'enforceOutputJsonSizeLimit': true
					};
					var extent = esri.geometry.getExtentForScale(map, 40000);
					var resolution = extent.getWidth() / map.width;
					var formId = jQ('.default_form').attr('id');
					
					params.generalize = true;
					params.maxAllowableOffset = resolution;
					params.reducePrecision = true;
					params.numberOfDigitsAfterDecimal = 0;
		
					var myContent = {
					  'filetype': 'shapefile',
					  'publishParameters': JSON.stringify(params),
					  'f': 'json',
					  'callback.html': 'textarea'
					};

					var xhr       = new XMLHttpRequest(),
						vFormData = new FormData(),
						found     = false;

					vFormData.append('file', jQuery( '#inFile' )[0].files[0], name+".zip");

					for(var i in myContent){
						vFormData.append(i, myContent[i] );
					}

					xhr.open( 'POST', portalUrl + '/sharing/rest/content/features/generate', true );

				    xhr.onreadystatechange = function ( ev ) {
						if(!found){
							var jsonF;
						    	try{
					    		if(ev.target.response.indexOf('<html><body><textarea>') == 0){

					    			var str = ev.target.response.replace('<html><body><textarea>','');
						    			str = str.replace('</textarea></body></html>','');

						    		jsonF = jQuery.parseJSON(str);
					    		}
					    		else{
					    			jsonF = ev.target.response;
					    		}

					    		if(jsonF && jsonF.featureCollection){
					    			
					    			var layerName = jsonF.featureCollection.layers[0].layerDefinition.name;
		
									wSplit.Html.find('#btn-load').removeClass('loading');

									addShapefileToMap(jsonF.featureCollection);

									found = true;
					    		}

					    		

					    	}catch(err){
					    		console.log(err);
					    	}
						}				    	
				    	
				    };
				    
				    xhr.send( vFormData );
					
					/*request({
					  url: portalUrl + '/sharing/rest/content/features/generate',
					  content: myContent,
					  form: dom.byId(formId),
					  handleAs: 'json',
					  load: lang.hitch(this, function (response) {
						if (response.error) {
						  errorHandler(response.error);
						  return;
						}
						var layerName = response.featureCollection.layers[0].layerDefinition.name;
						//dom.byId('upload-status').innerHTML = '<b>Loaded: </b>' + layerName;
						wSplit.Html.find('#btn-load').removeClass('loading');
						addShapefileToMap(response.featureCollection);
					  }),
					  error: lang.hitch(this, errorHandler)
					});*/


				  }
				  var errorHandler = function(error) {
				  	console.log(error);
				  	try{
				  		wSplit.Html.find('div[rel="shapefile"] #cancel').click();
				  		/*dom.byId('upload-status').innerHTML =
						"<p style='color:red'>" + error.message + "</p>";*/
				  	}catch(e){}
				  }
				  var addShapefileToMap = function(featureCollection) {
					var fullExtent;
					//var layers = [];
					wSplit.shapeLayers  = [];
					arrayUtils.forEach(featureCollection.layers, function (layer) {
						var infoTemplate = new InfoTemplate("Details", "${*}");
						
						//console.log(layer)
						
						featureLayer = new esri.layers.FeatureLayer(layer, {
			                //infoTemplate: infoTemplate
			            });

						featureLayer.on('click', function (event) {
	               		//	map.infoWindow.setFeatures([event.graphic]);
	               			console.log(event)
	                	});

						changeRenderer(featureLayer);

						infoGraphics(featureLayer);

						fullExtent = fullExtent ?
							fullExtent.union(featureLayer.fullExtent) : featureLayer.fullExtent;
						  	wSplit.shapeLayers.push(featureLayer);
					});				

					console.log( wSplit.shapeLayers );

					LayersManager.addLayers(wSplit.shapeLayers)
					//map.addLayers(wSplit.shapeLayers);
					//map.setExtent(fullExtent.expand(1.25), true);
					
					
					//dom.byId('upload-status').innerHTML = "";
				  }
				  var changeRenderer = function (layer) {
					var symbol = null;
					switch (layer.geometryType) {
					  case 'esriGeometryPoint':
						symbol = new esri.symbol.PictureMarkerSymbol({
						  'angle': 0,
						  'xoffset': 0,
						  'yoffset': 0,
						  'type': 'esriPMS',
						  'url': 'http://static.arcgis.com/images/Symbols/Shapes/BluePin1LargeB.png',
						  'contentType': 'image/png',
						  'width': 20,
						  'height': 20
						});
						break;
					  case 'esriGeometryPolygon':
						symbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
						  new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID,
							new dojo.Color([112, 112, 112]), 1), new dojo.Color([136, 136, 136, 0.25]));
						break;
					}
					if (symbol) {
					  layer.setRenderer(new SimpleRenderer(symbol));
					}
				  }
				});

				var infoGraphics = function(featureLayer){
					var set= false;
					
					if(featureLayer && featureLayer.graphics){
						
						var h = wSplit.sfGraphicsInfo;
						
						h.html('');

						var removeHoverClass = function(){
							jQuery('path.hover').attr('class','');
							jQuery('.sf-info-h').removeClass('active');
						}

						var addHoverClass = function(path){
							removeHoverClass();
							jQuery(path).attr('class','hover');
						}

						featureLayer.on('mouse-over',function(e){
							var g = e.graphic;
							var pos = g.SF_POS;

							addHoverClass(g.getNode());
							jQuery('.sf-info-h[pos="'+pos+'"]').addClass('active');
						});

						featureLayer.on('mouse-out',removeHoverClass);

						var getGraph = function(pos){
							var rtn = false;
							for(var i = 0; i < featureLayer.graphics.length; i++){
								var g = featureLayer.graphics[i];
	
								if(g.SF_POS == parseInt(pos)){
									rtn = g;
									break;
								}
							}
							return rtn;
						}

						map.on('layers-add-result',function(e){
							if(!set){
								featureLayer.graphics.forEach(function(g,pos){
									g.SF_POS = pos;
						
									var area   = geometryEngine.geodesicArea(g.geometry);
									
									var item = jQuery('<div pos="'+pos+'" class="sf-info-h"><span text="template" class="i-pos">'+(pos+1)+': </span><span class="i-area">'+area+'</span></div>')
									
									item.mouseover(function(){

										var pos = jQuery(this).attr('pos');
										var graph = getGraph(pos);
									
										if(graph) addHoverClass(graph.getNode());

										jQuery(this).addClass('active');

									}).mouseout(function(){
										removeHoverClass();
										jQuery(this).removeClass('active');
									});

									h.append(item);
								});
								set = true;
							}
						});
						
					}
		
				}
		}


	}
}( jQuery ));
