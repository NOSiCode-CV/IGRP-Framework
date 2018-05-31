var GENMAPOS = function(name,params){
	
	CONTAINER.call(this,name,params);
	
	var container    = this;

	container.xml.structure = 'form';

	container.includes = {

		css : [
			{ path : '/plugins/gis/styles/igrp.gis.css' }
		],

		js :  [

			{ path : "/plugins/gis/app/app.js" }

		],

		xsl:  [ 'gis.map' ]

	};


	container.onDrawEnd = function(){

		GIS.init();

	}

	container.ready = function(){

		container.setProperty({

			name: 'map_type',

			label : 'Map Type',

			value : {

				value : 'leaflet',

				options : [

					{
						value : 'openlayers',

						label : 'Open Layers'
					},

					{
						value : 'leaflet',

						label : 'Leaflet'
					}

				]

			}

		});

		container.setProperty({
			
			name : 'heigth',

			value : 450
		
		});

	}

}

this[VARS.name].declareContainer({
	name:'map_os',
	container:GENMAPOS
});