var GENMAPOS = function(name,params){
	
	CONTAINER.call(this,name,params);
	
	var container    = this;

	container.xml.structure = 'form';

	container.includes = {

		js :  [

			{ path:'/plugins/gis/classes/gis.controller.js' },

			{ path:'/plugins/gis/classes/gis.map.js' }

		],

		xsl:  [ 'gis.map' ]

	};

	var jsIncludes =  {

		leaflet :  {

		},

		openlayers : {

		}

	}

	container.onDrawEnd = function(){
		
		GIS.create({

			mapID : container.GET.tag()

		});

	}

	container.ready = function(){

		container.setProperty({

			name: 'map_type',

			value : {

				value : 'openlayers',

				options : [
					{
						value : 'openlayers',
						label : 'Open Layers'
					},
					{
						value : 'leaflet',
						label : 'Leaflet'
					},
					{
						value : 'esri',
						label : 'Esri'
					}
				]
			}
		});


	}

}

this[VARS.name].declareContainer({
	name:'map_os',
	container:GENMAPOS
});