(function() {

	var utils = GIS.module('Utils');

	function TimeSlider(widget, app) {

		var Map = app.map.view,

		data = widget.data(),

		formatIn = 'DD-MM-YYYY', formatOut = 'DD/MM/YYYY',

		today = moment().format(formatIn),

		sliderVal = 0, sliderValues = [ 0, 1 ], sliderInterval = {}, slideMax = -1, hasSlider = false, moving = false,

		SliderController, playButton, Times = [], LayerController, attributes = [],

		layers = [], modalId = '#slider-modal', modal, hasAttributes = false,

		settings = $.extend({

			delay : 1000,

			startDate : '01-01-2001',

			endDate : today,

			period : 'months',// days,months,years,weeks

			step : 1, // salto

			animate : 'fast', // slow,fast

			range : false, // true,false

			increment : 1,

			loop : false

		}, data);

		settings.startDate = moment(settings.startDate, formatIn);

		settings.endDate = moment(settings.endDate, formatIn);

		settings.dateAttr = null;

		settings.attributes = [];

		widget.templateParams = {

			layers : [],

			settings : {},

			attributes : []

		};

		widget.getValues = function() {

			if (settings.range)

				sliderValues = SliderController.slider("values");

			else

				sliderVal = SliderController.slider("value");

		};

		widget.getValue = function(indice) {

			var rtn = null;

			if (settings.range)

				rtn = SliderController.slider("values")[indice];

			else

				rtn = SliderController.slider("value");

			return rtn;

		};

		widget.setValues = function(previous) {

			if (!previous) {

				if (settings.range) {

					sliderValues[0] += settings.increment;

					sliderValues[1] = sliderValues[0] + settings.increment
							* settings.step;

					SliderController.slider("values", sliderValues);

				} else {

					sliderVal += settings.increment;

					SliderController.slider("value", sliderVal);
				}

			} else {

				if (settings.range) {

					sliderValues[0] -= settings.increment * settings.step;

					sliderValues[1] -= settings.increment;

					SliderController.slider("values", sliderValues);

				} else {

					sliderVal -= settings.increment;

					SliderController.slider("value", sliderVal);

				}

			}

		};

		widget.action('run', function() {

			var message = '';

			if (!widget.layerId)

				message = 'Escolha o Layer para continuar.';

			else if (hasAttributes && !settings.dateAttr)

				message = 'Escolha o Atributo para continuar.';

			if (message) {

				$.IGRP.notify({

					message : message,

					type : 'error'

				});

				return false;
			}

			widget.layer.show();

			if (!moving) {

				widget.getValues();

				sliderInterval = setInterval(function() {

					var val = widget.getValue(1);

					if (val < slideMax)

						widget.setValues();

				}, settings.delay);

				moving = true;

				widget.setIconAnimation();

			} else

				widget.actions.stop();

			var val = widget.getValue(1);

			if (val == slideMax && !settings.loop)

				widget.slider();

		});

		widget.action('stop', function() {

			clearInterval(sliderInterval);

			moving = false;

			widget.setIconAnimation();

		});

		widget.action('previous', function() {

			widget.getValues();

			var val = widget.getValue(0);

			if (val > 0)

				widget.setValues('previous');

			widget.actions.stop();

		});

		widget.action('next', function() {

			widget.getValues();

			var val = widget.getValue(1);

			if (val < slideMax)

				widget.setValues();

			widget.actions.stop();

		});

		widget.setIconAnimation = function() {

			if (moving)

				playButton.html('<i class="fa fa-pause-circle fa-2x"></i>');

			else

				playButton.html('<i class="fa fa-play-circle fa-2x"></i>');

		}

		function SetEvents() {

			widget.slider();

			SliderController.on("slidechange", function(event, ui) {

				var val = widget.getValue(1);

				var start = settings.range ? Times[ui.values[0]].value
						: settings.startDate,

				end = settings.range ? Times[ui.values[1]].value
						: Times[ui.value].value;

				widget.SetLayerDefinitions(start, end);

				if (start)

					showDate(start, end);

				if (val == slideMax) {

					widget.actions.stop();

					if (settings.loop) {

						moving = false;

						widget.slider();

						playButton.click();

					}

				}

			});

		}
		;

		function diffDate(pStart, pEnd) {

			var start = moment(pStart, formatIn),

			end = moment(pEnd, formatIn);

			return Math.ceil(end.diff(start, settings.period, true));

		}
		;

		function calculatesScaleTime() {

			var i = 0;

			while (i <= slideMax) {

				var date = moment(settings.startDate, formatIn).add(i,
						settings.period);

				date = date.toDate();

				Times[i] = {
					id : i,
					value : date
				}
				i++;
			}

		}

		function getFormateDate(date, f) {

			var f = f || formatOut;

			return moment(date).format(f);

		}
		;

		function showDate(pStart, pEnd) {

			$('.slider-time-extent span.start', widget.html).html(
					getFormateDate(pStart));

			$('.slider-time-extent span.end', widget.html).html(
					getFormateDate(pEnd))

		}

		/*
		 * Settings timeslider
		 * 
		 */

		widget.action('settings', function() {

			$(".IGRP-form").prepend(modal);

			modal.modal('show');

			widget.actions.stop();

		});

		String.prototype.bool = function() {

			if (String(this) == "true")
				return true;

			return false;
		};

		widget
				.action('settings-confirm',
						function() {

							modal.modal('toggle');

							settings.range = ($('input[name=range]:checked',
									modalId).val()).bool();

							settings.loop = ($('input[name=loop]:checked',
									modalId).val()).bool();

							settings.step = parseInt($('input[name=step]',
									modalId).val(), 10);

							settings.startDate = moment($(
									'input[name=start_date]', modalId).val(),
									formatIn);

							settings.endDate = moment($('input[name=end_date]',
									modalId).val(), formatIn);

							settings.period = $('select[name=period]', modalId)
									.val()
									|| settings.period;

							settings.delay = parseInt($('input[name=delay]',
									modalId).val(), 10);

							widget.slider();

						});

		widget.slider = function() {

			if (hasSlider) {

				widget.actions.stop();

				SliderController.slider("destroy");

			}

			slideMax = diffDate(settings.startDate, settings.endDate);

			calculatesScaleTime();

			SliderController.slider({

				classes : {
					"ui-slider" : "gis-slider"
				},

				animate : settings.animate,

				max : slideMax,

				step : settings.step,

				range : settings.range ? true : 'min',

				orientation : "horizontal"

			});

			if (settings.range)

				SliderController.slider("values", [ 0, 1 ]);

			else

				SliderController.slider("value", 0);

			showDate(settings.startDate, settings.endDate);

			$('.slider-min-date span', widget.html).html(
					getFormateDate(settings.startDate));

			$('.slider-max-date span', widget.html).html(
					getFormateDate(settings.endDate));

			hasSlider = true;

		};

		/* End Settings */

		widget.getLayers = function() {

			if (data.layers && data.layers[0]) {

				data.layers.forEach(function(l) {

					var layer = app.layers.get(l.layer);

					if (layer) {

						var layer = layer.data();

						layers.push({

							name : layer.name,

							id : layer.id

						});
					}

					if (data.layers.length == 1)

						widget.layerId = layer.id;

				});

			} else {

				var grouplayers = app.layers.getLayers();

				grouplayers.forEach(function(l) {

					var layer = l.data();

					if (layer.type === 'WFS')

						layers.push({

							name : layer.name,

							id : layer.id

						});

				});
			}

		};

		widget.getDateAttr = function() {

			settings.dateAttr = $('select[name=attributes]', widget.html).val();

		};

		function AttributesToSelect(json, onLayer) {

			var attributes = [];

			if (!onLayer) {

				for ( var key in json)

					attributes.push({

						id : json[key],

						name : json[key]

					});

			} else

				for ( var key in json) {

					if (json[key] == 'date' || json[key] == 'dateTime')

						attributes.push({

							id : key,

							name : key

						});

				}

			return attributes;
		}
		;

		widget.SetLayerDefinitions = function(pStart, pEnd) {

			if (!widget.layer || !settings.dateAttr || !pStart || !pEnd)
				return false;

			widget.layer.bringToFront();

			pStart = getFormateDate(pStart, moment.defaultFormat);

			pEnd = getFormateDate(pEnd, moment.defaultFormat);

			// widget.layer.options.cql_filter = settings.dateAttr +' AFTER ' +
			// pStart + ' AND ' + settings.dateAttr + ' BEFORE ' + pEnd;
			widget.layer.options.cql_filter = settings.dateAttr + ' BETWEEN '
					+ pStart + ' AND ' + pEnd;

			widget.layer.request = null;

			widget.layer.updateData();

		};

		function CreateSlider() {

			if (widget.layerId) {

				widget.layer = app.layers.get(widget.layerId);

				var _layers = data.layers[0] ? data.layers : layers;

				if (_layers[0]) {

					_layers
							.forEach(function(l) {

								var layerId = l.layer || l.id;

								if (layerId == widget.layerId) {

									settings = $.extend(settings, l.slider);

									settings.startDate = moment(
											settings.startDate, formatIn);

									settings.endDate = moment(settings.endDate,
											formatIn);

									RenderModal(settings);

									widget.slider();

									var attributes = l.dateAttr ? l.dateAttr
											.split(',') : [];

									if (l.dateAttr == undefined
											|| l.dateAttr == '') {

										settings.attributes = AttributesToSelect(
												widget.layer.Description.attributes,
												true);

										hasAttributes = true;

									} else if (attributes.length > 1) {

										settings.attributes = AttributesToSelect(attributes);

										hasAttributes = true;

									} else
										settings.dateAttr = l.dateAttr;

									if (hasAttributes)
										RenderAttribute();

								}

							});
				}
			}
		}

		function RenderModal(o) {

			var modalData = $.extend({
				periods : {
					'days' : 'Dia',
					'weeks' : 'Semana',
					'months' : 'Mês',
					'years' : 'Ano'
				},
				items : [ {
					"label" : "Sim",
					"active" : true
				}, {
					"label" : "Não",
					"active" : false
				} ]
			}, o);

			modalData.startDate = getFormateDate(o.startDate, formatIn);

			modalData.endDate = getFormateDate(o.endDate, formatIn);

			try {

				widget.setTemplateParam('settings', {
					settings : modalData
				});

				$(".select2-modal").select2({

					dropdownParent : modal

				});

				$('.gen-date-picker').daterangepicker({

					singleDatePicker : true,

					locale : {
						format : 'DD-MM-YYYY'
					}

				// locale: $.IGRP.components.daterangepicker.locale

				});

			} catch (e) {
			}

		}

		function RenderAttribute() {

			$('div[item-name=attributes]', widget.html).show();

			$("select[name=attributes]", widget.html).select2('destroy');

			try {

				widget.setTemplateParam('attributes-time', {
					attributes : settings.attributes
				});

				$("select[name=attributes]", widget.html).select2();

			} catch (e) {
			}

		}

		function Render() {

			RenderModal(settings);

			if (layers.length > 1)

				$('div[item-name=layers]', widget.html).show();

			$(".select2", widget.html).select2();

			$(".select2", widget.html).select2('destroy');

			try {

				widget.setTemplateParam('layers', {
					layers : layers
				});

			} catch (e) {
			}

		}

		function Init() {

			modal = $(modalId);

			SliderController = $(".slider", widget.html);

			playButton = $(".run", widget.html);

			LayerController = $("select[name=layers]", widget.html);

			$(".select2", widget.html).select2();

			$('div[item-name=attributes]', widget.html).hide();

			if (layers.length == 1)

				CreateSlider();

			widget.html.on('change', "select[name=layers]", function(e) {

				widget.layerId = e.target.value;

				widget.actions.stop();

				widget.slider();

				if (widget.layer) {

					widget.layer.options.cql_filter = null;

					widget.layer.updateData();
				}

				settings.dateAttr = null;

				$('div[item-name=attributes]', widget.html).hide();

				CreateSlider();

			});

			widget.html.on('change', "select[name=attributes]", function(e) {

				settings.dateAttr = e.target.value;

				widget.actions.stop();

				widget.slider();

				widget.layer.options.cql_filter = null;

				widget.layer.updateData();

			});

		}

		(function() {

			widget.on('load-html', function() {

				widget.getLayers();

			});

			widget.on('activate', function() {

				Render();

				Init();

				SetEvents();

			});

			widget.on('deactivate', function() {

				if (widget.layer) {

					widget.actions.stop();

					widget.layer.options.cql_filter = null;

					widget.layer.updateData();
				}

			});

		})();
	}

	GIS.widgets
			.register(
					'timeslider',
					{

						dependencies : {

							js : [
									path
											+ '/plugins/leaflet/library/plugins/ui/jquery-ui.min.js',
									path
											+ '/plugins/select2/select2.full.min.js',
									path + '/plugins/select2/select2.init.js',
									path
											+ '/plugins/datepicker2/daterangepicker.js',
									path
											+ '/plugins/datepicker2/IGRP.daterangepicker.config.js',
									path
											+ '/plugins/datepicker2/locale/dp.locale.pt.js',
									path
											+ '/plugins/datepicker2/locale/dp.locale.pt.js', ],

							css : [
									path
											+ '/plugins/leaflet/library/plugins/ui/jquery-ui.min.css',
									path + '/plugins/select2/select2.min.css',
									path + '/plugins/select2/select2.style.css',
									path
											+ '/plugins/datepicker2/daterangepicker.css',
									path
											+ '/plugins/datepicker2/IGRP.daterangepicker.css' ]

						},

						init : TimeSlider

					});

})();