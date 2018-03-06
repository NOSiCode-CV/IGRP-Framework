function isIE () {
  var myNav = navigator.userAgent.toLowerCase();
  return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}
(function ( jQ ) { 
    jQ.fn.Desanexacao = function() {
    	var id = this.attr('id');
		var wSplit = new Widget(id);
		wSplit.Layers = [];
		wSplit.shapeLayers = [];

		wSplit.position = this.attr('position');
		wSplit.LayersEvent = [];

		wSplit.drawTool = null;

		wSplit.field_main_name = null;
		wSplit.field_split_name = null;
		wSplit.SplitGeometries = [];
		wSplit.mainGraphic = null;
		
		wSplit.mainGraphicHtml = null;
		wSplit.mainGraphicAreaHtml = null;
		
		wSplit.fileLoadedHtml = null;

		wSplit.uploadStatusHtml = null;
		
		wSplit.stepClass = 'desanex-step';
		wSplit.currentStep = 1;
		
		wSplit.onInit = function(){
			wSplit.includeCss('desanexacao.style');
			wSplit.uploadStatusHtml = wSplit.Html.find('#upload-status');
			wSplit.mainGraphicHtml = wSplit.Html.find('#main-polygon-id');
			wSplit.fileLoadedHtml = wSplit.Html.find('#file-loaded');
			wSplit.mainGraphicAreaHtml = wSplit.Html.find('#main-area');
			wSplit.getLayers();
			wSplit.InterfaceControl();
			wSplit.configDraw();
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
			
			try{				
				wSplit.configShapeLoad(); //config add shape file settings
			}catch(e){ 
				console.log(e) 
			}
		};
		
		wSplit.onActivate = function(){
			LayersManager.hideLayerMenu();//hide layers menu
			LayersManager.lock();
			Mapp.isEditing = true;
			wSplit.addLayersEvents();// listen to layers events
			wSplit.setActiveStep(1);
			
			if(LayersManager.currentFeature){
				wSplit.Layers.forEach(function(layer){
					if(layer == LayersManager.currentFeature.getLayer().id){
						wSplit.setGraphic(LayersManager.currentFeature);
					}else{
						LayersManager.deselectAll();
					}
				})
				//console.log(wSplit.mainGraphic.attributes)
			}
			
		}
		wSplit.onDeactivate = function(){
			Mapp.isEditing = false;
			Mapp.isDrawing = false;
			jQ.each(wSplit.Html.find('.'+wSplit.stepClass),function(i,step){
				wSplit.unsetActiveStep(jQ(this).attr('step'));
				wSplit.unsetStepDone(jQ(this).attr('step'));	
			});

			wSplit.removeLayersEvents();
			wSplit.unsetGraphic();
			wSplit.removeShapeFile();
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
		}

		wSplit.onLayersAddResult = function(layers){
			//var SplitGeometries = [];
			var SplitGraphs = [];
			var AreaPai = 0;
			var AreaSplit = 0;
			var MainGeometry = wSplit.mainGraphic.geometry;
			
			var shapelayer = [];

			var areaTotal = 0;
			var ext = MainGeometry.getExtent();

			var symbol = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color('red'));

			layers.forEach(function(_l){
				shapelayer.push(_l.layer);
				_l.layer.graphics.forEach(function(graph){
					SplitGraphs.push(graph)
					wSplit.SplitGeometries.push(graph.geometry);
					var sgeo = graph.geometry;
					var shapeArea = graph.attributes['SHAPE_AREA'];

					areaTotal = areaTotal+shapeArea;

					if(!ext.contains(sgeo.getExtent())){
						//graph.setSymbol(symbol)
					}
				});
			
			});
			
			jQ(wSplit.Html.find('#total-graphs')).text(SplitGraphs.length);
			jQ(wSplit.Html.find('#total-area')).text(areaTotal);
			//wSplit.getGraphicInfo(SplitGraphs,2)

			wSplit.setStepDone(2);
			
			wSplit.setActiveStep(3);
		}
		wSplit.fillStepList = function(list,step){
			/*
				list = [ [{label,value}] ] ,
				step
			*/
			var ul = jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"] .step-info-list'));
			list.forEach(function(_l){

				var info = jQ(document.createElement('li'));
				try{
				_l.forEach(function(item,i){

					//if(item.label && item.value){
						var holder = jQ(document.createElement('div'));
						holder.addClass('item-field '+i);
						
						if(i == 0){
							holder.addClass('details-toggler');
						}else{
							holder.addClass('details');
						}

						var label = jQ(document.createElement('span'));
						label.addClass('label');
						label.text(item.label);
						holder.append(label);

						var value = jQ(document.createElement('span'));
						value.addClass('value');
						value.text(item.value)
						holder.append(value);
						info.append(holder);
					//}
				})
				}catch(e){ console.log(e) }

				ul.append(info);
			});
		}

		wSplit.setStepDone = function(step){
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"]')).addClass('done');
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"] .step-help')).hide();
		}
		wSplit.unsetStepDone = function(step){
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"]')).removeClass('done');
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"] .step-help')).show();
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"] .step-info-list')).html('');
		}
		
		wSplit.setActiveStep = function(step){
			jQ('.'+wSplit.stepClass+'[step="'+step+'"]').addClass('active');
			jQ('.'+wSplit.stepClass+'[step="'+step+'"] .step-help').show();
		}
		
		wSplit.unsetActiveStep = function(step){
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"]')).removeClass('active');
			jQ(wSplit.Html.find('.'+wSplit.stepClass+'[step="'+step+'"] .step-help')).hide();
		}
		
		wSplit.removeShapeFile = function(){
			wSplit.shapeLayers.forEach(function(_l){
				map.removeLayer(_l);
			})
		}
		
		wSplit.getGraphicInfo = function(graphics,step){
			var list = [];
			
			graphics.forEach(function(graphic){
				var g = [];
				for(var att in graphic.attributes){
					var obj = {
						label:att,
						value:graphic.attributes[att]
					}
					g.push(obj)
				}
				list.push(g);
			});
			wSplit.fillStepList(list,step)
		}

		wSplit.setGraphic = function(graphic){
			wSplit.mainGraphic = graphic;

			GeometryService.getAreaAndLenght({
				layerid: wSplit.mainGraphic.getLayer().id,
				objectid: wSplit.mainGraphic.attributes['OBJECTID'],
				callback:function(result){
					wSplit.mainGraphicAreaHtml.text(result.area);
				}
			});

			wSplit.getGraphicInfo([wSplit.mainGraphic],1)
			wSplit.setStepDone(1);
			wSplit.setActiveStep(2);
			
			
		}
		wSplit.unsetGraphic = function(){
			wSplit.mainGraphic = null;	
			wSplit.mainGraphicHtml.text('');
		}
		
		wSplit.addLayersEvents = function(){
			try{
				if(wSplit.Layers.length > 0){
					wSplit.Layers.forEach(function(_l){
						var selectionClear = LayersManager.setEventListener({
							layerid:_l,
							_event:'selection-clear',
							callback:function(){
								//WidgetManager.deactivateWidget(wSplit.id);
								//wSplit.removeLayersEvents();
							}
						});
						
						wSplit.LayersEvent.push(selectionClear);
					});
				};
			}catch(e){
				console.log(e)	
			}
		}
		wSplit.removeLayersEvents = function(){
			wSplit.LayersEvent.forEach(function(e){
				LayersManager.unsetEventListener(e);	
			})
			wSplit.LayersEvent = [];
		}
		wSplit.setMenu = function(layerid){
			var menu = {
				id:wSplit.id+'-widget',
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
				wSplit.Layers.push(layer);
				wSplit.field_main_name = jQ(_layer).find('field_main').attr('name');
				wSplit.field_split_name = jQ(_layer).find('field_split').attr('name');
			});
		};		

		wSplit.startDrawing = function(){
			wSplit.drawTool.activate(esri.toolbars.Draw.POLYLINE);
			Mapp.isDrawing = true;
		}

		wSplit.drawEnd = function(e){
			wSplit.drawTool.deactivate();
			Mapp.isDrawing = false;
			console.log(e);
		}
		
		wSplit.configDraw = function(){
			wSplit.drawTool = new esri.toolbars.Draw(map, {
				showTooltips:false
			});
			wSplit.drawTool.on('draw-end',wSplit.drawEnd);
		}

		wSplit.InterfaceControl = function(){
			wSplit.Html.find('#re-add-shape').on('click',function(){//cancel current shape file
				wSplit.unsetActiveStep(3);
				wSplit.unsetStepDone(2);

				wSplit.removeShapeFile();
				return false;
			});
			
			wSplit.Html.find('#confirm-split').on('click',function(){//confirm
				try{
					jQ('input[name="'+wSplit.field_main_name+'"]').val(wSplit.mainGraphic.attributes['OBJECTID']);
					var rtn = GeometryService.convertRings(wSplit.SplitGeometries,'|');
					jQ('input[name="'+wSplit.field_split_name+'"]').val(rtn);

					WidgetManager.deactivateWidget(wSplit.id);

				}catch(err){ 
					console.log(err) 
				}
				return false;
			});	

			wSplit.Html.find('ul.step-info-list').on('click','.item-field.details-toggler',function(){
				$(this).parent().toggleClass('active');
			});


			wSplit.Html.find('#btn-load').on('click',function(){
				wSplit.Html.find('input[type="file"]#inFile').click();
			});

			wSplit.Html.find('#draw-split').on('click',function(){
				wSplit.startDrawing();
			});
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
				  
				  var portalUrl = "//www.arcgis.com";
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
						  wSplit.uploadStatusHtml.html('<p style="color:red">Adicione um shapefile .zip</p>');
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
					
					request({
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
					});
				  }
				  var errorHandler = function(error) {
					dom.byId('upload-status').innerHTML =
					"<p style='color:red'>" + error.message + "</p>";
				  }
				  var addShapefileToMap = function(featureCollection) {
					var fullExtent;
					//var layers = [];
					wSplit.shapeLayers  = [];
					arrayUtils.forEach(featureCollection.layers, function (layer) {
					var infoTemplate = new InfoTemplate("Details", "${*}");
					
					 featureLayer = new esri.layers.FeatureLayer(layer, {
		                //infoTemplate: infoTemplate
		            });

					featureLayer.on('click', function (event) {
               		//	map.infoWindow.setFeatures([event.graphic]);
               			console.log(event)
                	});

					changeRenderer(featureLayer);
					fullExtent = fullExtent ?
						fullExtent.union(featureLayer.fullExtent) : featureLayer.fullExtent;
					  	wSplit.shapeLayers.push(featureLayer);
					});					
					LayersManager.addLayers(wSplit.shapeLayers)
					//map.addLayers(wSplit.shapeLayers);
					//map.setExtent(fullExtent.expand(1.25), true);
					
					
					dom.byId('upload-status').innerHTML = "";
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
		}


	}
}( jQuery ));
