/*!
 * fullcalendar-rightclick v1.8
 * Docs & License: https://github.com/mherrmann/fullcalendar-rightclick
 * (c) 2015 Michael Herrmann
 */

(function($) {
	function monkeyPatchViewClass(View) {
		View = View.class || View;
		var renderFn = 'render' in View.prototype ? 'render' : 'renderDates';
		var originalRender = View.prototype[renderFn];
		View.prototype[renderFn] = function() {
			originalRender.call(this);
			if (! this.el.data('fullcalendar-rightclick')) {
				this.registerRightclickListener();
				this.el.data('fullcalendar-rightclick', true)
			}
		};
		View.prototype.registerRightclickListener = function() {
			var that = this;
			this.el.on('contextmenu', function(ev) {
				var eventElt = $(ev.target).closest('.fc-event');
				if (eventElt.length) {
					var seg = eventElt.data('fc-seg');
					return that.trigger('eventRightclick', this, seg.event, ev);
				} else {
					// Users of this library may add custom content inside
					// FullCalendar's DOM structure, eg. popovers. We don't want
					// to catch rightclicks on these custom elements, so we
					// check that the clicked element actually lies inside one
					// of FullCalendars default containers:
					var fcContainer = $(ev.target).closest(
						'.fc-bg, .fc-slats, .fc-content-skeleton, ' +
						'.fc-bgevent-skeleton, .fc-highlight-skeleton'
					);
					if (fcContainer.length) {
						var cell;
						if (that.coordMap) {
							// FullCalendar < 2.5.0:
							that.coordMap.build();
							cell = that.coordMap.getCell(ev.pageX, ev.pageY);
						} else {
							// FullCalendar >= 2.5.0:
							that.prepareHits();
							var hit = that.queryHit(ev.pageX, ev.pageY);
							cell = that.getHitSpan(hit);
						}
						if (cell)
							return that.trigger(
								'dayRightclick', null, cell.start, ev
							);
					}
				}
			});
		}
	}
	var fc = $.fullCalendar;
	monkeyPatchViewClass(fc.views.agenda);
	monkeyPatchViewClass(fc.views.basic);
})(jQuery);