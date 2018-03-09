(function ( jQ ) { 
    jQ.fn.DropShape = function() {
    	var id = this.attr('id');
		var dShape = new Widget(id);
		
		dShape.Layers = [];
		dShape.inputFile = null;
		dShape.shapeLayers = [];

		dShape.onInit = function(){
			dShape.getLayers();
			dShape.inputFile = dShape.Html.find('#d-s-file');
			dShape.configShapeLoad();
			dShape.configInterface();
		}

		dShape.onActivate = function(){
			dShape.inputFile.val('');
			jQ('.widget-controller[widgetid="dropshape"]').removeClass('active');
			dShape.inputFile.click();
		}

		dShape.onDeactivate = function(){
			dShape.removeShapes();
		}

		dShape.configInterface = function(){
			dShape.Html.find('#confirm-shape').on('click',function(){
				try{
					var layer = LayersManager.getLayer(dShape.Layers[0]);
					if(layer){
						var graphics = [];
						dShape.shapeLayers.forEach(function(shape){
							graphics.push(shape.graphics)
						});

						/*graphics[0].forEach(function(g){
							console.log(g);
						})*/
						//console.log(graphics[0][0])
						layer.applyEdits(graphics[0],null,null,function(a,u,d){
							layer.refresh();
							dShape.removeShapes();
							console.log(a);
						},function(err){
							layer.refresh();
							dShape.removeShapes();
							console.log(err)
						});

						//WidgetManager.deactivateWidget(dShape.id);
					}else{
						Mapp.errorHandler({
							text:'Layer indefinido.'
						})
					}
				}catch(err){
					console.log(err)
				}
				
				
				return false;
			})
		}
		dShape.removeShapes = function(){
			dShape.shapeLayers.forEach(function(_l){
				map.removeLayer(_l);
			})
		}
		dShape.getLayers = function(){
			jQ.each(dShape.Html.find('layers layer'),function(idx,_layer){
				var layer = jQ(_layer).attr('id');
				dShape.Layers.push(layer);
			});
		}
		dShape.configShapeLoad = function(){
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
				  
				  on(dom.byId(dShape.inputFile.attr('id')), "change", function (event) {
				  	
				  	try{
						
						fileName = event.target.value.toLowerCase();
						
						if (sniff("ie")) { //filename is full path in IE so extract the file name
						  var arr = fileName.split("\\");
						  fileName = arr[arr.length - 1];
						}
						
						if (fileName.indexOf(".zip") !== -1 ) {//is file a zip - if not notify user
						  generateFeatureCollection(fileName);
						}else {
						  
						}
					}catch(erro){ console.log(erro) }

				  });
							
				  var  generateFeatureCollection = function(fileName) {
					var name = fileName.split(".");

					name = name[0].replace("c:\\fakepath\\", "");
					//wSplit.Html.find('#btn-load').addClass('loading');
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

					jQ('.widget-controller[widgetid="dropshape"]').addClass('active');
					
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
						
						addShapefileToMap(response.featureCollection);
					  }),
					  error: lang.hitch(this, errorHandler)
					});
				  }
				  var errorHandler = function(error) {
				  	Mapp.errorHandler({
				  		text:error.message
				  	});

				  	WidgetManager.deactivateWidget(dShape.id);
					
					/*dom.byId('d-s-status').innerHTML =
					"<p style='color:red'>" + error.message + "</p>";*/
				  }
				  var addShapefileToMap = function(featureCollection) {
				  
					var fullExtent;
					//var layers = [];

					dShape.shapeLayers  = [];

					arrayUtils.forEach(featureCollection.layers, function (layer) {
					var infoTemplate = new InfoTemplate("Details", "${*}");
					
					 featureLayer = new esri.layers.FeatureLayer(layer, {
		                infoTemplate: infoTemplate
		            });

					featureLayer.on('click', function (event) {
               			map.infoWindow.setFeatures([event.graphic]);
               			console.log(event)
                	});

					changeRenderer(featureLayer);
					fullExtent = fullExtent ?
						fullExtent.union(featureLayer.fullExtent) : featureLayer.fullExtent;
				
						dShape.shapeLayers.push(featureLayer);
						map.addLayer(featureLayer);
					});			

					
					
					dShape.setActiveStep('confirm',1)

					//map.addLayers(wSplit.shapeLayers);
					//map.setExtent(fullExtent.expand(1.25), true);
					
					
					dom.byId('d-s-status').innerHTML = "";
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
