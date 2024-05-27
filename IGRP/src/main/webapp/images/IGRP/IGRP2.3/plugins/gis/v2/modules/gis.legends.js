(function() {

	var utils = GIS.module('Utils'),

		styles = {};

	GIS.module('Legends', {

		Get: function(data, feature) {

			styles[data.id] = styles[data.id] || this.getRenders(data.Legend);
			
			return this.getStyle(feature, styles[data.id], data.geomType);

		},

		GetLegend: function(data) {

			if (data.type == 'WFS')

				$.get(data.url + '?service=WMS&request=GetLegendGraphic&layer=' + data.options.typeName + '&version=1.0.0&format=application/json').then(function(json) {

					data.Legend = json.Legend[0];

				});

		},

		getRenders: function(legend) {

			var rtn = [],

				rules = legend !== undefined ? legend.rules : [];

			for (var key in rules) {

				var rule = rules[key],

					o = { field: '', condition: '', value: '', style: '', symbolizers: rule.symbolizers },

					filter = rule.filter || '';

				if (filter)

					o.condition = this.replace(filter)

				rtn.push(o);

			}

			return rtn;

		},

		getStyle: function(feature, styles, type) {

			var rtn = {},

				properties = feature.properties;

			for (var key in styles) {

				var rule = styles[key],

					isValid = this.isValid(rule, properties);

				var symbolizers = rule.symbolizers;

				if (isValid && type == utils.geometry.point || isValid && type == utils.geometry.pointCluster) {

					var symbolize = symbolizers[0].Point,

						graphics = symbolize.graphics;

					rtn = { size: symbolize.size, url: symbolize.url, color: '', mark: '' };

					for (var i in graphics) {

						var graphic = graphics[i];

						rtn.color = rtn.color ? rtn.color : graphic.fill;

						rtn.mark = rtn.mark ? rtn.mark : graphic.mark;

					}

				} else if (isValid && symbolizers.length === 1) {

					var symbolize = symbolizers[0].Line || symbolizers[0].Polygon;

					rtn = {
						stroke: symbolize.stroke ? true : false,
						weight: symbolize['stroke-width'] || 1,
						opacity: symbolize['stroke-opacity'] || 0.5,
						color: symbolize.stroke || '',
						lineCap: symbolize['stroke-linecap'] || '',
						lineJoin: symbolize['stroke-linejoin'] || '',
						fill: symbolize.fill ? true : false,
						fillColor: symbolize.fill || '',
						fillOpacity: symbolize['fill-opacity'] || ''
					}

				} else if (isValid && symbolizers[1]) {

					var stroke = {};

					for (var i in symbolizers) {

						if (symbolizers[i].Polygon) {

							var graphicFill = symbolizers[i].Polygon['graphic-fill'];

							if (graphicFill) {

								var path, pattern, graphics = graphicFill.graphics[0],

									options = {
										stroke: graphics.stroke ? true : false,
										opacity: graphics['stroke-opacity'] || 0.5,
										color: graphics.stroke || '',
										lineCap: graphics['stroke-linecap'] || '',
										lineJoin: graphics['stroke-linejoin'] || '',
										fill: true,
										fillColor: graphics.fill || graphics.stroke || '',
										fillOpacity: graphics['fill-opacity'] || graphics.opacity || 1,
										dashArray: graphics['stroke-dasharray'] || '',
										dashOffset: graphics['stroke-dashoffset'] || ''
									}

								if (graphics.mark == 'line') {

									options = $.extend(options, {
										d: 'M0 ' + graphicFill.size / 2 + ' V ' + graphicFill.size,
										weight: graphics['stroke-width'] && graphics['stroke-width'] > 4 ? graphics['stroke-width'] : 4
									});

									path = new L.PatternPath(options);

									pattern = new L.Pattern({ angle: graphicFill.rotation });

								} else {

									options = $.extend(options, {
										x: 12,
										y: 12,
										radius: 10
									});

									path = new L.PatternCircle(options);

									var size = graphicFill.size > 10 ? graphicFill.size : 10;

									pattern = new L.Pattern({ angle: graphicFill.rotation, width: size, height: size });

								}

								pattern.addShape(path);

								stroke.fillPattern = pattern;

							}

						}

						if (symbolizers[i].Line) {

							var symbolize = symbolizers[i].Line;

							stroke = {
								stroke: symbolize.stroke ? true : false,
								weight: symbolize['stroke-width'] || 1,
								opacity: symbolize['stroke-opacity'] || 0.5,
								color: symbolize.stroke || '',
								lineCap: symbolize['stroke-linecap'] || '',
								lineJoin: symbolize['stroke-linejoin'] || ''
							}

						}

						rtn = $.extend(rtn, stroke);

					}

				}

			}

			return rtn;

		},

		replace: function(str) {

			return str.replace('[', '').replace(']', '').replaceAll(' AND ', ' && ').replaceAll(' OR ', ' || ').replaceAll(' = ', ' == ').replaceAll(' IS NULL', " == null ").replaceAll(' IS NOT NULL', " != null ");

		},

		isReplaced: function(string, substring) {

			if (string.indexOf(substring) !== -1)

				return true;

			return false;
		},

		isValid: function(r, properties) {

			var condition = r.condition, quote = '\'', space = ' ';

			if (!condition /*&& r.style*/)

				return true;

			for (var key in properties) {

				var value = !isNaN(properties[key] * 1) ? properties[key] : quote + properties[key] + quote;

				condition = this.isReplaced(condition, key + space) ? condition.replaceAll(key + space, value + space) : condition;

			}

			return eval(condition);
		},

	});

})();