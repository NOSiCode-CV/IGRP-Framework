(function() {

	function SearchWidget(widget, app) {

		var input, check, txtCql, submitSearch, inputParent,

			Layers = [],

			cqlFilters = '',

			data = widget.data(),

			timeout = function() { },

			Map = app.viewer();

		widget.activeFilter = false;

		widget.activeDivAdmin = false;

		widget.activeNominatimAPI = false;

		widget.activeLayers = false;

		widget.results = {};

		widget.templateParams = {

			layers: [],

			total: 0,

			noResultsMessage: 'Não foram encontrados resultados.',

			searchResults: [],

			layerAttributes: []

		};

		function ClearResults() {

			UnHighLightFeatures();

			$('.search-widget-no-data-msg').hide();

			$('.search-clear', widget.html).hide();

			$('.search-widget-results', widget.html).hide();

		};

		function SetResults(results) {

			try {

				widget.setTemplateParam('results', {

					total: results.length,

					noResultsMessage: 'Não foram encontrados resultados.',

					searchResults: results

				});

				ClearResults();

				$('.search-widget-results', widget.html).show();

				$('.search-clear', widget.html).show();

			} catch (err) {

				console.log(err)

			}

		};

		function Search() {

			var val = input.val();

			if (widget.activeNominatimAPI) {
				if (val && val.length >= 1) {
					NominatimAPI(val);
				} else {
					ClearResults();

					widget.loading(false);
				}


			} else {

				GetLayers();

				getCqlFilter();

				if ((val && val.length >= 1 || cqlFilters) && Layers[0]) {

					var reqs = [],

						Results = [];

					////cql_filter
					Layers.forEach(function(l) {

						var layer = l.layer,

							attributes = l.attributes,

							req = layer.query({ attributes: attributes, value: val, cql: cqlFilters });

						req.then(function(f) {

							if (f.totalFeatures) {

								var results = {

									layer: layer.data(),

									total: f.totalFeatures,

									features: f.features,

									attributes: attributes

								};

								Results.push(results);

							}

						});

						reqs.push(req);

					});

					$.when.apply(undefined, reqs).then(function() {

						SetResults(Results);

					}).always(function() {

						widget.loading(false);

					});

				} else {

					ClearResults();

					widget.loading(false);

				}

			}

		};

		function UnHighLightFeatures() {

			Layers.forEach(function(l) {

				try {

					l.layer.unHighlightAll();

				} catch (err) {

					console.log(err);

				}

			});

			if (widget.highlight)

				Map.removeLayer(widget.highlight);

		}

		function GetLayers() {

			Layers = [];

			if (data.layers && data.layers[0]) {

				data.layers.forEach(function(l) {

					var layer = app.layers.get(l.layer);

					if (layer)

						Layers.push({

							layer: layer,

							attributes: l.fields ? l.fields.split(',') : []

						});

				});

			} else {

				var layer_id = $('select#layers-select').val(),

					layer = app.layers.get(layer_id),

					attributes = $('select#layer-atts-select').val();

				if (layer && (attributes[0] || isSearchAdvanced()))

					Layers.push({

						layer: layer,

						attributes: attributes

					});
			}

		};

		function LoadFields() {


			var _layers = [], _grouplayers = app.layers.getLayers();

			if (!data.layers || !data.layers[0]) {

				if (widget.activeLayers) {

					_grouplayers.forEach(function(l) {

						var layer = l.data();

						_layers.push({
							name: layer.name,
							id: layer.id
						});

					});

					try {

						widget.setTemplateParams({

							'layers': _layers

						});

					} catch (err) {

						console.log(err)

					}

					$('.search-input-layer', widget.html).show();

				} else
					$('select#layers-select', widget.html).hide();

			} else
				$('.search-input-layer', widget.html).hide();



		};

		function AttributesToSelect(json) {

			var attributes = [];

			for (var key in json) {

				attributes.push({

					id: key,

					name: key.toUpperCase()

				});

			}

			return attributes;
		};

		function isSearchAdvanced() {

			return check.is(":checked");

		}

		function genCqlFilter(v) {

			if (!v) return '';

			var value = txtCql.val() + ' ' + v;

			txtCql.val(value);
		};

		function getCqlFilter() {

			var attrReplaced = [];

			cqlFilters = " " + txtCql.val();

			if (isSearchAdvanced()) {

				Layers.forEach(function(l) {

					var attributes = l.layer.Description.attributes;

					for (var attr in attributes) {

						if (attrReplaced.indexOf(attr) == -1 && cqlFilters.includes(attr))

							cqlFilters = cqlFilters.replace(" " + attr + " ", ' strToLowerCase(' + attr + ') ');

					};

				});

			}

		};

		function ClearSearch() {

			input.val('').trigger('keyup');

			input[0].focus();

			txtCql.val('');

			input[0].removeAttribute('disabled');

			if (widget.request)

				widget.request.abort();

			if (widget.activeDivAdmin) {

				widget.activeDivAdmin = false;

				widget.steps.divAdmin.activate();

				var selects = $('.search-div-admin select', widget.html);

				for (var i = 0; i < selects.length; i++) {
					selects[i].value = '';
				}
			}

			widget.loading(false);

		};

		function setRemoteComobox(o) {

			try {

				//clear
				if (!o.parent && o.id == '') {

					try {

						widget.setTemplateParam('div-admin-' + o.target, { 'divData': [] });

						$('#' + o.target, widget.html).trigger("change");


					} catch (e) {
						console.log(e)
					}

					widget.loading(false);

					return false;
				}

				$.getJSON(path + '/plugins/gis/data/config.json', function(json) {

					if (json.hasOwnProperty(o.tipo_obj)) {

						widget.pathGeoJson = path + '/plugins/gis/data' + json[o.tipo_obj];

						$.getJSON(widget.pathGeoJson, function(json) {

							var data = json.features,

								results = [];

							data.forEach(function(feature, i) {

								var properties = feature.properties;

								if (properties['name'] && properties['code'])
									results.push({
										name: properties['name'],
										id: properties['code'],
										feature: feature
									});

							});

							widget.results[o.target] = json

							try {

								if (results.length == 1)
									results[0].selectedId = results[0].id;

								widget.setTemplateParam('div-admin-' + o.target, { 'divData': results });

								$('#' + o.target, widget.html).select2();

								$('#' + o.target, widget.html).trigger("change");


							} catch (e) {
								console.log(e)
							}

							widget.loading(false);

						});
					} else {
						widget.loading(false);
					}

				});

			} catch (e) {
				console.log(e)
				widget.loading(false);
			}
		}

		function DivAdmin() {

			ClearSearch();

			ClearResults();

			input[0].setAttribute('disabled', true);

			if (!widget.activeDivAdmin) {

				widget.activeDivAdmin = true;

				widget.steps.divAdmin.activate();

			}

			//static file json 
			if (widget.activeDivAdmin) {

				var opt = {
					target: 'nivel-1',
					tipo_obj: 'global',
					parent: true
				}

				clearTimeout(timeout);

				timeout = setTimeout(setRemoteComobox(opt), 600);

				widget.loading(true);

			}


			widget.activeDivAdmin = true;

			widget.activeNominatimAPI = false;

			widget.activeLayers = false;
		}

		function NominatimAPI(val) {

			var results = [];

			var paramCountrycodes = data.countryCodes ? 'countrycodes=' + data.countryCodes : '';

			var req = $.get('https://nominatim.openstreetmap.org/search?' + paramCountrycodes + '&polygon_geojson=1&format=geojson&q=' + val);

			req.then(function(data) {

				data.features.forEach(function(feature, i) {

					feature.id = feature.properties['place_id'];

				});

				results.push({

					layer: { "name": "Lugar ou Endereço", "id": 9999 },

					total: data.features.length,

					features: data.features,

					attributes: ["display_name"]

				});

				widget.results = results;

				SetResults(results);

				widget.loading(false);

			});

		}

		function SetEvents() {

			input = $('.search-input-wrapper input', widget.html);

			inputParent = $('.search-input-wrapper', widget.html);

			check = $('#search-ckeck-advanced :checkbox', widget.html);

			checkParent = $('#search-ckeck-advanced', widget.html);

			txtCql = $('#search-txt-cql textarea', widget.html);

			submitSearch = $('#search-form-submit', widget.html);

			if (!data.btnOptions)

				widget.html.find('#btnOptions').hide();

			widget.html.on('click', '.search-item', function() {

				var item = $(this),

					bounds = item.attr('bounds'),

					id = item.attr('feature-id'),

					layerid = item.attr('layer-id'),

					layer = app.layers.get(layerid);

				widget.html.find('.search-item').removeClass('active');

				UnHighLightFeatures();

				try {

					if (bounds) {

						bounds = JSON.parse(bounds);

						var ne = L.latLng([bounds._northEast.lng, bounds._northEast.lat]),//??

							sw = L.latLng([bounds._southWest.lng, bounds._southWest.lat]);//?? lat lng switched

						app.viewer().fitBounds(L.latLngBounds(sw, ne));

						if (layer) {

							layer.highlight(id, function() {

								item.addClass('active');

							});

							layer.show();

						} else if (widget.results && widget.results[0]) {

							var jsonObject = widget.results[0].features;

							widget.highlight = L.geoJson(jsonObject, {
								filter: function(feature, layer) {
									return feature.id == id;
								}
							}).addTo(Map);

							Map.highlightLayer = widget.highlight;

						}

					}

				} catch (err) {

					console.log(err)

				}

			});

			input.on('keyup', function() {

				clearTimeout(timeout);

				timeout = setTimeout(Search, 600);

				widget.loading(true);

			});

			widget.action("search", function() {

				clearTimeout(timeout);

				timeout = setTimeout(Search, 600);

				widget.loading(true);

			})

			$('.search-clear', widget.html).on('click', function() {

				ClearSearch();

			});

			submitSearch.on('click', function() {

				clearTimeout(timeout);

				timeout = setTimeout(Search, 600);

				widget.loading(true);

			});

			widget.html.on('change', 'select#layers-select', function() {

				var val = $(this).val();

				$('#layer-atts-select', widget.html).hide();

				if (!val) return;

				var layer = app.layers.get(val)

				_attributes = layer.Description.attributes,

					attributes = [];

				attributes = AttributesToSelect(_attributes);

				widget.setTemplateParam('attributes', {

					'layerAttributes': attributes

				});

				$('#layer-atts-select', widget.html).show();

			});

			if (!data.advanced) {
				checkParent.hide();
			}
			else {

				check.on('change', function() {

					inputParent.show();

					ClearSearch();

					if (this.checked) {

						inputParent.hide();

						widget.activeFilter = true;

						widget.steps.filter.activate();

					} else {

						$("#search-form-advanced", widget.html).removeClass('active');

						widget.activeFilter = false;

					}
				});
			}

			widget.html.on('click', '#search-grid-operators button', function() {

				genCqlFilter($(this).data('operator'));

			});

			widget.html.on('click', 'select#layer-atts-select', function() {

				if (isSearchAdvanced()) {

					genCqlFilter($(this).val());

				}
			});

			/*SEARCH LAYERS MENU*/
			widget.html.on('click', '#search-layers', function() {

				ClearSearch();

				widget.activeDivAdmin = false;

				widget.activeNominatimAPI = false;

				widget.activeLayers = true;

				LoadFields();

			})

			/*DIV ADMIN*/
			widget.html.on('click', '#search-div-admin', function() {

				DivAdmin();

				LoadFields();

			});

			/*NOMINATIM-API*/
			widget.html.on('click', '#search-nominatim-api', function() {

				ClearSearch();

				widget.activeDivAdmin = false;

				widget.activeNominatimAPI = true;

				widget.activeLayers = false;

				LoadFields();

			})

			widget.html.on('change', '.remote-change', function() {

				var field = $(this),

					bounds = field.find(':selected').attr('bounds'),

					obj = field.data('value');

				opt = {
					target: field.data('target'),
					id: field.val(),
					tipo_obj: field.val()
				}

				if (opt.target) {

					clearTimeout(timeout);

					timeout = setTimeout(setRemoteComobox(opt), 600);

					widget.loading(true);
				}


				try {

					if (bounds) {

						bounds = JSON.parse(bounds);

						var ne = L.latLng([bounds._northEast.lng, bounds._northEast.lat]),//??

							sw = L.latLng([bounds._southWest.lng, bounds._southWest.lat]);//?? lat lng switched

						app.viewer().fitBounds(L.latLngBounds(sw, ne));

						if (widget.results[obj] && opt.id !== '') {

							var jsonObject = widget.results[obj];

							widget.highlight = L.geoJson(jsonObject, {
								filter: function(feature, layer) {
									return feature.properties['code'] === opt.id;
								}
							}).addTo(Map);

							Map.highlightdivadmin = { 'code': opt.id, 'url': widget.pathGeoJson }

							Map.highlightLayer = widget.highlight;

						}

					}

				} catch (err) {

					console.log(err)

				}
			})

			widget.activeNominatimAPI = data.defaultNominatim;

			widget.activeDivAdmin = data.defaultDivAdmin;

			widget.activeLayers = data.defaultLayers;

			if (widget.activeDivAdmin) {
				DivAdmin();
			}
		};

		(function() {

			widget.on('activate', function() {

				SetEvents();

				LoadFields();

			});

			widget.on('deactivate', function() {

				UnHighLightFeatures();

				ClearSearch();

				check.trigger("click");

			})

		})();

	}

	GIS.widgets.register('search', {

		dependencies: {

			js: [
				path + '/plugins/select2/select2.full.min.js',
				path + '/plugins/select2/select2.init.js'
			],

			css: [
				path + '/plugins/select2/select2.min.css',
				path + '/plugins/select2/select2.style.css'
			]

		},


		init: SearchWidget

	});

})();