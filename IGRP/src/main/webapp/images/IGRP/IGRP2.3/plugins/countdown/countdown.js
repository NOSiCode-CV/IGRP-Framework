(function ($) {
	'use strict';
	$.fn.countdown = function (options) {
		return $.fn.countdown.begin(this, $.extend({
			year: 2016, // YYYY Format
			month: 1, // 1-12
			day: 1, // 1-31
			hour: 0, // 24 hour format 0-23
			minute: 0, // 0-59
			second: 0, // 0-59
			timezone: -6, // http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
			labels: true, // If false days hours seconds and monutes labels will not be created
			start : null,
			onFinish: function () { }  // Executes client side when timer is zero
		}, options));
	};

	var lng = {
		days 	: 'Dia(s)',
		year	: 'Ano',
		months 	: 'Mês',
		hours 	: 'Hora(s)',
		minutes : 'Minuto(s)',
		seconds	:'Segundo(s)'
	}

	$.fn.countdown.begin = function (parent, settings) {

		var getRenderHour = (function () {
		
			let timestamp = settings.start ? new Date(settings.start).getTime() : new Date().getTime();
			setInterval(() => { timestamp += 1000; }, 1000);
			return function () { return new Date(timestamp) }
		})();

		// Define Variables
		var timespan, start, end;

		// Define Target Date/time
		end = new Date(settings.year, settings.month - 1, settings.day, settings.hour, settings.minute, settings.second);
		console.log(settings.start);
		// Converts Local Timezone to Target Timezone
		start = settings.start != null ? settings.start : $.fn.countdown.convertTimezone(settings.timezone);

		// Defines countdown data
		timespan = $.fn.countdown.getTimeRemaining(start, end, settings);

		// Check if the script has run before
		if (!settings.init) {

			// Create elements
			$.each(timespan, function (k, v) {
				// Define variables being used
				var container, wrapper, time, label;

				// Create elements container
				container = $('<div/>').addClass('col-xs-6 col-sm-3').attr('id', k);

				// Create wrapper element
				wrapper = $('<div/>').addClass('wrapper');

				// Create time element
				time = $('<span/>').addClass('time').text(v < 10 ? '0' + v : v.toLocaleString());

				if (settings.labels) {
					// Create label element
					label = $('<span/>').addClass('label').text((v === 1 ? $.fn.countdown.singularize(k) : lng[k]));

					// Add everything to container element
					container.append(wrapper.append(time).append(label));
				} else {
					container.append(wrapper.append(time));
				}

				// Add elements to parent element
				parent.append(container.addClass('animated rotateIn'));
			});

			// Tell the script that it has already been run
			settings.init = true;
		} else {
			// Update each element
			$.each(timespan, function (k, v) {
				$('.time', '#' + k).text(v < 10 ? '0' + v : v.toLocaleString());
				$('.label', '#' + k).text((v === 1 ? $.fn.countdown.singularize(k) : lng[k]));
			});
		}

		// Check if target date has beeen reached
		if (settings.target_reached) {

			// Executes function once timer reaches zero
			settings.onFinish();

		} else {

			// Updates the time every second for the visitor
			setTimeout(function () {
				console.log(settings.start);
				if(settings.start){
					/*var nStart = new Date(settings.start);
					nStart = nStart.getTime() + 1000;
					settings.start = new Date(nStart)*/
					settings.start = getRenderHour(settings.start);
				}

				$.fn.countdown.begin(parent, settings);

			}, 1000);
		}
	};

	// Removes the trailing S in days hours minutes seconds
	$.fn.countdown.singularize = function (str) {
		//lng[str.substr(0, str.length - 1)]
		return lng[str];
	};

	// Converts local timezone to target timezone
	$.fn.countdown.convertTimezone = function (timezone) {
		var now, local_time, local_offset, utc;
		now = new Date();
		local_time = now.getTime();
		local_offset = now.getTimezoneOffset() * 60000;
		utc = local_time + local_offset;

		return new Date(utc + (3600000 * timezone));
	};

	// Returns time remaining data for view
	$.fn.countdown.getTimeRemaining = function (start, end, settings) {
		
		var timeleft, remaining;
		remaining = {};
		timeleft = (end.getTime() - start.getTime());
		timeleft = (timeleft < 0 ? 0 : timeleft);

		// Check if target date has been reached
		if (timeleft === 0) {
			settings.target_reached = true;
		}

		// Built return object
		remaining.days = Math.floor(timeleft / (24 * 60 * 60 * 1000));
		remaining.hours = Math.floor((timeleft / (24 * 60 * 60 * 1000) - remaining.days) * 24);
		remaining.minutes = Math.floor(((timeleft / (24 * 60 * 60 * 1000) - remaining.days) * 24 - remaining.hours) * 60);
		remaining.seconds = Math.floor(timeleft / 1000 % 60);
		return remaining;
	};
}(jQuery));