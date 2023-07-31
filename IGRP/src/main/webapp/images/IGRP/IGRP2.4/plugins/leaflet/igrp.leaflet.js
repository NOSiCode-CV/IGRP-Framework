(function(){

	var com;

	var Leaflet = function(selector,options){

		var leaflet = this;

		leaflet.map 	= L.map(selector).setView([16, -24], 7);

		leaflet.basemap = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(leaflet.map);

		leaflet.markers = [];

		leaflet.setMarker = function(m){

			var marker = L.marker([m.lat, m.lng]).addTo(leaflet.map);

			leaflet.markers.push( marker );

		};	

		leaflet.setMarkers = function(markers){

			markers.forEach( leaflet.setMarker );

		};

		if(options.markers)

			leaflet.setMarkers( JSON.parse(options.markers) );

		return leaflet;

	};

	com = $.IGRP.component('Leaflet',{

		maps : {},

		getMap : function(id){

			return com.maps[id];

		},

		init : function(selector,options){
			
			selector = selector || '.igrp-leaflet-map';

			options  = options 	|| {};

			$(selector).each(function(i,el){

				var id = $(el).attr('id') || 'leaflet-'+(new Date()).getTime();

				$(el).attr('id', id);

				options.markers = $(el).attr('markers-data');

				com.maps[id] = new Leaflet( id, options );

			});

		}	

	},true);

})();