(function(){

	this[VARS.name].declareContainer({

		name:'leafletmap',

		container:function(name,params){

			var com = this;

			CONTAINER.call(com ,name,params);


			com.includes = {

				css : [

					{ path : "/plugins/leaflet/library/css/leaflet.css" }

				],

				js : [

					{ path : "/plugins/leaflet/library/js/leaflet.js" },

					{ path : "/plugins/leaflet/library/js/leaflet.ajax.min.js"},

					{ path : "/plugins/leaflet/library/js/proj4.js"},

					{ path : "/plugins/leaflet/library/js/proj4leaflet.js"},

					{ path : "/plugins/leaflet/igrp.leaflet.js"}

				],

				xsl : [ 'leaflet' ]

			};

			com.ready = function(){

				com.setProperty({
					name : 'height',
					label : 'Height (px)',
					//hint : 'carajo',
					value : 400
				});

				com.setProperty({
					name : 'markers_table',
					label : 'Markers Table',
					value : false,
					xslValue : com.GET.tag()+'_markers'
				});

				/*com.setProperty({
					name : 'markers_widget',
					label : 'Markers Widget',
					value : false,
					isField : true,
					//xslValue : com.GET.tag()+'_markers'
				});*/
			};

			com.onXMLGenerate = function(xmlStr){
				
				var xml = '';

				if(com.GET.markers_table()){

					var tag  = $.trim(com.GET.tag());

					xml  = '<'+tag+'_markers type="table" xml-type="table" gen-type="container" gen-group="true">'+
							'<fields>'+
								'<'+tag+'_title name="p_'+tag+'_title" type="text" maxlength="200"><label>Titulo</label></'+tag+'_title>'+
								'<'+tag+'_info name="p_'+tag+'_info" type="text" maxlength="800"><label>Info</label></'+tag+'_info>'+
								'<'+tag+'_lat name="p_'+tag+'_lat" type="text" maxlength="200"><label>Latitude</label></'+tag+'_lat>'+
								'<'+tag+'_lng name="p_'+tag+'_lng" type="text" maxlength="200"><label>Longitude</label></'+tag+'_lng>'+
								'<'+tag+'_icon name="p_'+tag+'_icon" type="text" maxlength="200"><label>Icon</label></'+tag+'_icon>'+
							'</fields>'+
							'<table><value>'+
								'<row>'+
							        '<'+tag+'_title name="p_'+tag+'_title">Cabo Verde</'+tag+'_title>'+
							        '<'+tag+'_lng name="p_'+tag+'_lng">-24</'+tag+'_lng>'+
							        '<'+tag+'_lat name="p_'+tag+'_lat">16</'+tag+'_lat>'+
									'<'+tag+'_info name="p_'+tag+'_info">Centro de Cabo Verde</'+tag+'_info>'+
									'<'+tag+'_icon name="p_'+tag+'_icon"></'+tag+'_icon>'+
								'</row>'+
							'</value>';

					xml+='</table></'+tag+'_markers>';

				}

				return xml;
			};

			com.onDrawEnd = function(){	

				$.IGRP.components.Leaflet.init( '#leaflet-'+com.GET.tag() );

			}
			
			
		}

	});

})();

