(function(){
	
	var utils = GIS.module('utils');
	
	function AddPointWidget( widget, app ){
		
		var data   = widget.data(), 
			
			Map    = app.map.view,
		
			Layers = [];
		
		//widget.dependencies = "";
		
		var novoFoco;

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
		
		(function(){
			
			GetLayers();

			widget.on('ready', function(){
				
				var pontosMarcados = new L.FeatureGroup();
				
				Map.addLayer(pontosMarcados);
				
				var drawControl = new L.Control.Draw({
				  
					position: 'topright',
					
				    draw: {
				        marker: true,
				        circlemarker:false,
				        polygon: false,
				        polyline: false,
				        circle: false,
				        rectangle: false
				    },
				    edit: {
				        featureGroup: pontosMarcados
				    }
				});
				
				Map.addControl(drawControl);
				
				//new L.Draw.Polyline(Map, drawControl.options.polyline).enable();
				
				Map.on(L.Draw.Event.CREATED, function (e) {
					
					novoFoco = e.layer;
					
					$.IGRP.components.globalModal.set({
						
						title : 'Marcar Novo Ponto',
						
						content : function(){
							
							var c = '<div>';
							
								c+='<div class="form-group " required="true">'+
										'<label for="name">Nome</label>'+
										'<input id="name" name="name" type="text" required="required" class="form-control" placeholder="">'+
									'</div>';
							
								c+='</div>'
							
							return c;
							
						},
						
						buttons : [
							
							{
								class : 'primary',
								
								text   : 'Confirmar',
								
								icon   : 'check',
								
								attr   : {},
								
								onClick: function(){
									
									novoFoco.options.categoria = $('#igrp-global-modal [name="name"]').val() ;
									
									//console.log(novoFoco)
									var layer = Layers[0].layer;
									
									var layerData = layer.data();
									
									var geoserver = {
											
											workSpace : layerData.options.typeName.split(':')[0],
											
											workSpaceLayer : layerData.options.typeName,
											
											linkWorkSpace : 'https:/www.nosi.cv/INSP_GIS'
											//linkWorkSpace : 'https://rai-tst-osg-02.gov.cv:8443/geoserver/INSP_GIS'
											
									};
									
									var servicos = {
										
										wfs : layerData.url
										
									}
									
									console.log(geoserver);
									
									console.log(novoFoco.options.categoria)
									
									 var postData =
								            '<wfs:Transaction\n'
								            + '  service="WFS"\n'
								            + '  version="1.0.0"\n'
								            + '  xmlns="http://www.opengis.net/wfs"'
								            + '  xmlns:'+geoserver.workSpace+'="'+geoserver.linkWorkSpace+'"\n'
								            + '  xmlns:wfs="http://www.opengis.net/wfs"\n'
								            + '  xmlns:gml="http://www.opengis.net/gml"\n'
								            + '  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"\n'
								            + '  xsi:schemaLocation="http://www.opengis.net/wfs\n'
								            + '                      http://schemas.opengis.net/wfs/1.0.0/WFS-transaction.xsd\n'
								            + '                      '+servicos.wfs+'?service=wfs&amp;request=DescribeFeatureType&amp;typeName=INSP_GIS:insp_foco_mosquito&amp;version=1.0.0">\n'
								            + '  <wfs:Insert>\n'
								            + '    <gml:featureMember>'
								            + '      <'+geoserver.workSpace+':insp_foco_mosquito>'
								            + '        <'+geoserver.workSpace+':categoria>' + novoFoco.options.categoria + '</'+geoserver.workSpace+':categoria>'
								            + '        <'+geoserver.workSpace+':geom>'
								            + '          <gml:Point srsName="http://www.opengis.net/gml/srs/epsg.xml#4326">'
								            + '            <gml:coordinates xmlns:gml="http://www.opengis.net/gml" decimal="." cs="," ts=" ">' + novoFoco.getLatLng().lng + ',' + novoFoco.getLatLng().lat + '</gml:coordinates>'
								            + '          </gml:Point>'
								            + '        </'+geoserver.workSpace+':geom>'
								            + '      </'+geoserver.workSpace+':insp_foco_mosquito>'
								            + '    </gml:featureMember>'
								            + '  </wfs:Insert>\n'
								            + '</wfs:Transaction>';
									
									//console.log(Layers[0].layer.data())
									 console.log(postData)
									 $.ajax({
									        type: "POST",
									        url: servicos.wfs,
									        dataType: "xml", // json xml
									        contentType: "text/xml",
									        data: postData,
									        success: function (xml) {
									        	console.log(xml)
									        	
									        	//novoFoco.addTo(pontosMarcados);
									        	
									        	layer.updateData();
									        	
									        	$.IGRP.components.globalModal.hide();
									           /* console.log(xml);

									            var objetoResposta = xmlToJson(xml);  
									            console.log('Id: ' + objetoResposta['wfs:WFS_TransactionResponse']['wfs:InsertResult']['ogc:FeatureId']['@attributes']['fid']);
									            
									            console.log('categoria ins:'+novoFoco.options.categoria);
									            novoFoco.options.pid = objetoResposta['wfs:WFS_TransactionResponse']['wfs:InsertResult']['ogc:FeatureId']['@attributes']['fid'].replace(geoserver.layerMosquito+'.', '');
									            novoFoco.options.gid = novoFoco.options.pid;

									            adicionarPopup(novoFoco);
									            pontosMarcados.addLayer(novoFoco); */
									        },
									        error: function (xhr) {
									            alert("Ocorreu um erro: " + xhr.status + " " + xhr.statusText);
									        },
									        complete: function (xml) {
									            console.log("Done");
									        }
									    });
									
									return false;
									
								}
								
							}
							
						]
						
					})
					
					//e.layer.addTo(pontosMarcados)
					
				});

			});
			
			console.log(L.Control.Draw)
			
			
		})();
		
	}

	GIS.widgets.register('addpoint', {
		
		dependencies : {
			
			js : ['https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.js'],
			
			css : [ 'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css' ]
				
		},
		
		init : AddPointWidget
	});
	
})();