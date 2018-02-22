function isIE () {
  var myNav = navigator.userAgent.toLowerCase();
  return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}
(function ( jQ ) { 
    jQ.fn.Desanexacao = function() {
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

		wSplit.onInit = function(){
			wSplit.includeCss('desanexacao.style');
			wSplit.getLayers();
			wSplit.uploadStatusHtml    = wSplit.Html.find('#upload-status');
			wSplit.mainGraphicAreaHtml = wSplit.Html.find('#main-area');	

			wSplit.InterfaceControl();
			wSplit.configDraw();
			wSplit.configShapeLoad();

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
			var ext = MainGeometry.getExtent();

			var symbol = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color('red'));

			layers.forEach(function(_l){
				shapelayer.push(_l.layer);
				_l.layer.graphics.forEach(function(graph){
					SplitGraphs.push(graph)
					wSplit.SplitGeometries.push(graph.geometry);
					var sgeo = graph.geometry;
					var shapeArea = graph.attributes['SHAPE_AREA'];
					console.log(graph.attributes)
					areaTotal = areaTotal+shapeArea;
					/*if(!ext.contains(sgeo.getExtent())){
						graph.setSymbol(symbol)
					}*/
				});
			});
			
			jQ(wSplit.Html.find('#total-graphs')).text(SplitGraphs.length);
			jQ(wSplit.Html.find('#total-area')).text(areaTotal);

			wSplit.setActiveStep('shapefile',1);//show shapefile graphics info
			wSplit.setStepDone('shapefile',1);

			wSplit.setActiveStep('shapefile',2);//show buttons
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

			GeometryService.getAreaAndLenght({
				layerid: wSplit.mainGraphic.getLayer().id,
				objectid: wSplit.mainGraphic.attributes['OBJECTID'],
				callback:function(result){
					wSplit.mainGraphicAreaHtml.text(result.area);
					wSplit.setStepDone('get',1);
					wSplit.setActiveStep('tool',1);
				}
			});
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
					var rtn = GeometryService.convertRings(wSplit.SplitGeometries,'|');
					jQ('input[name="'+wSplit.field_split_name+'"]').val(rtn);
					WidgetManager.deactivateWidget(wSplit.id);
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
					jQ('input[name="'+wSplit.field_main_name+'"]').val(wSplit.mainGraphic.attributes['OBJECTID']);
					
					var rtn = GeometryService.convertRings(wSplit.SplitGeometries,'|');
					console.log(rtn)
					jQ('input[name="'+wSplit.field_split_name+'"]').val(rtn);
					
					wSplit.drawLayer.clear();
					LayersManager.deselectAll();
					wSplit.drawTool.deactivate();
					wSplit.unsetGraphic();
					wSplit.clearSteps();
					wSplit.setActiveStep('get',1);

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
