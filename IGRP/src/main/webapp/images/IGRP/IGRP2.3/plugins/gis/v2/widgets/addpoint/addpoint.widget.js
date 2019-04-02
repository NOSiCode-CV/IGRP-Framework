(function(){
	
	var utils = GIS.module('utils');
	
	function AddPointWidget( widget, app ){

		var data   = widget.data(), 
			
			Map    = app.map.view,
		
			Layers = {},
			
			LayerController, DrawLayer, DrawControl, DrawTool, EditTool, DeleteTool, CurrentLayer;
		
		widget.events.declare(['draw-end']);
		
		widget.addedObject = null;
		
		widget.action('cancel', function(){

			Clear();	
			
			widget.steps.select.activate();
			
		});
		
		widget.action('select-layer', function(){
			
			var val 	= LayerController.val();
			
			CurrentLayer = null;
			
			if( DrawTool && DrawTool.disable)
				
				DrawTool.disable();
			
			if(val){
				
				var layer = data.layers[val];
				
				if( layer )
				
					StartDrawing( layer );
			}
			
		});
		
		widget.action('edit', function(){

			EditTool.enable();
			
		});
		
		widget.action('confirm-edition', function(){

			EditTool.save();
			
			EditTool.disable();
			
		});
		
		widget.action('cancel-edition', function(){

			EditTool.revertLayers();
			
			EditTool.disable();
			
		});
		
		widget.action('delete', function(){

			DeleteTool.enable();
			
			DeleteTool.removeAllLayers();
			
		});
		
		widget.action('confirm-delete', function(){
			
			DeleteTool.save();
			
			DeleteTool.disable();
			
			widget.addedObject = null;
			
		});
		
		widget.action('cancel-deleting', function(){
			
			DeleteTool.revertLayers();
			
			DeleteTool.disable();
	
		});
		
		widget.action('save', function(){
			
			if(CurrentLayer && widget.addedObject){
				
				console.log(CurrentLayer.layer.Info)
				
				/*var layerData = CurrentLayer.data,
				
					workSpaceLayer = layerData.options.typeName || layerData.options.layers || '',
				
					workSpace = workSpaceLayer.split(':')[0],
					
					linkWorkSpace = 'https:/www.nosi.cv/Divisao_Administrativa',
					
					categoria 	 = 	widget.html.find('form [name="categoria"]').val(),
					
					layerUrl  	 = layerData.url,
				
					indexOfWMS   =  layerData.url.lastIndexOf('/wms'),
					
					postData;
				
				if(indexOfWMS >= 0)
					
					layerUrl = layerData.url.substring(0,indexOfWMS)+'/ows';

				postData =
		            '<wfs:Transaction\n'
		            + '  service="WFS"\n'
		            + '  version="1.0.0"\n'
		            + '  xmlns="http://www.opengis.net/wfs"'
		            + '  xmlns:'+workSpace+'="'+linkWorkSpace+'"\n'
		            + '  xmlns:wfs="http://www.opengis.net/wfs"\n'
		            + '  xmlns:gml="http://www.opengis.net/gml"\n'
		            + '  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"\n'
		            + '  xsi:schemaLocation="http://www.opengis.net/wfs\n'
		            + '                      http://schemas.opengis.net/wfs/1.0.0/WFS-transaction.xsd\n'
		            + '                      '+layerUrl+'?service=wfs&amp;request=DescribeFeatureType&amp;typeName='+workSpaceLayer+'&amp;version=1.0.0">\n'
		            + '  <wfs:Insert>\n'
		            + '    <gml:featureMember>'
		            + '      <'+workSpace+':casa_cidadao_nacional>'
		            + '        <'+workSpace+':nome>' + categoria + '</'+workSpace+':nome>'
		            + '        <'+workSpace+':geom>'
		            + '          <gml:Point srsName="http://www.opengis.net/gml/srs/epsg.xml#4326">'
		            + '            <gml:coordinates xmlns:gml="http://www.opengis.net/gml" decimal="." cs="," ts=" ">' + widget.addedObject.getLatLng().lng + ',' + widget.addedObject.getLatLng().lat + '</gml:coordinates>'
		            + '          </gml:Point>'
		            + '        </'+workSpace+':geom>'
		            + '      </'+workSpace+':casa_cidadao_nacional>'
		            + '    </gml:featureMember>'
		            + '  </wfs:Insert>\n'
		            + '</wfs:Transaction>';
				
				$.ajax({
			        type: "POST",
			        url: layerUrl,
			        dataType: "xml", 
			        contentType: "text/xml",
			        data: postData,
			        success: function (xml) {
			        	
			        	var $xml 		  = $(xml),
			        		
			        		insertResults = $xml.find('wfs\\:InsertResult');
			        	
			        	if(insertResults[0]){
			        		
			        		widget.events.trigger('save-success', {
			        			
			        			layer : CurrentLayer,
			        			
			        			added : widget.addedObject
			        			
			        		});
			        		
			        		$.IGRP.notify({
			        			
			        			message : 'Criado com sucesso!',
			        			
			        			type    : 'success'
			        			
			        		});
			        		
			        		CurrentLayer.layer.updateData();
			        		
			        		widget.actions.cancel();
			        		
			        	}

			        },
			        error: function (xhr) {
			            alert("Ocorreu um erro: " + xhr.status + " " + xhr.statusText);
			        },
			        complete: function (xml) {
			            console.log("Done");
			        }
			    });*/
				
				
			}
			
		});
		
		function InitDraw(){

			DrawLayer   = new L.FeatureGroup();
			
			DrawControl = new L.Control.Draw({
			    
			    edit: {
			    	
			        featureGroup: DrawLayer
			        
			    }
			    
			});
			
			EditTool   = new L.EditToolbar.Edit( Map, DrawControl.options.edit);
			
			DeleteTool = new L.EditToolbar.Delete( Map, DrawControl.options.edit);

			Map.on( L.Draw.Event.CREATED, function (e) {
				
				e.layer.addTo(DrawLayer);

				widget.addedObject = e.layer;
				
				widget.events.trigger('draw-end', e);				
				
			});
			
			DrawLayer.addTo( Map );
			
		};
		
		function StartDrawing( l ){
			
			var type = l.layer.getGeometryType();
			
			console.log(l.layer)
			
			if(type == 'Point')
				
				type = 'Marker';
			
			DrawTool = new L.Draw[type]( Map );
			
			CurrentLayer = l;
			
			DrawTool.enable();
			
		};
		
		function CheckLayersOptions(){
			
			
			
		};
		
		function GetLayersLength(){
			
			return Object.keys(Layers).length;
			
		};
		
		function Clear(){
			
			if(DrawTool && DrawTool.disable)
				
				DrawTool.disable();
			
			if(EditTool && EditTool.disable)
				
				EditTool.disable();
			
			DrawLayer.clearLayers();
			
			widget.addedObject = null;
			
			CurrentLayer = null;
			
		};
	
		function GetLayers(){
			
			if(data){
				
				if(data.layers && data.layers[0]){
					
					data.layers.forEach(function(l){
				
						var layer = app.layers.get( l.layer );
			
						if(layer){
							
							var layerData = layer.data();
							
							Layers[ layerData.id ] = {
								
								layer : layer,
								
								data : layerData
							}
							
						}
						
					});
					
	
					data.layers = Layers;
					
				}
				
			}
			
		};
		
		function SetControllers(){
		
			LayerController = widget.html.find('select.form-control');

			widget.steps.select.on('activate', function(){
				
				widget.actions['select-layer']();
				
			});
			
			
			widget.steps.attributes.on('activate', function(step){
				
				if(!step.html.find(':input').first().val())
					
					step.html.find(':input').first()[0].focus()

			});
			
			widget.steps.attributes.on('deactivate', function(step){
				
				step.html.find(':input').val('');
				
			});
				
		};
		
		(function(){
			
			GetLayers();
			
			InitDraw();
			
			widget.on('activate', CheckLayersOptions);
			
			widget.on('deactivate', Clear);
			
			widget.on('load-html', SetControllers);
			
		})();
		
	};

	GIS.widgets.register('addpoint', {
		
		dependencies : {
				
			js  : [ 'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.js' ],
			
			css : [ 'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css' ]
				
		},
		
		init : AddPointWidget
		
	});
	
})();
