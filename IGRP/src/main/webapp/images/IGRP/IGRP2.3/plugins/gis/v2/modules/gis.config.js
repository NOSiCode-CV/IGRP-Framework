(function() {

	GIS.module('Config', {

		getOptions: function(widget) {

			var config = {

				css: false, html: false, js: false

			}

			switch (widget) {

				case 'getcoordinates':
				case 'edition':
				case 'measurement':
				case 'legend':
				case 'search':
				case 'timeslider':

					config.css = true; config.js = true; config.html = true;

					break;

				case 'selection_menu':
				case 'infowindow':				
				case 'streetview':

					config.css = true; config.js = true;

					break;

				case 'attribute_render':
				case 'query_expression':
				case 'mouseover':

					config.js = true;

					break;


				case 'video':

					config.js = true; config.html = true;

					break;
			}

			return config;

		},


	});

})();