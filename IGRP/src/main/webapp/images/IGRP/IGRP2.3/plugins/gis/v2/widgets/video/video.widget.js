//https://weblab.gov.cv/weblabtour/index.htm
//"https://www.mapbox.com/bites/00188/patricia_nasa.webm",
//"https://www.mapbox.com/bites/00188/patricia_nasa.mp4"
(function() {

	function VideoWidget(widget, app) {

		var Map = app.map.view,

			data = widget.data(),

			overlay = null;

		function SetResult() {

			var videoUrls = data.videoUrls,

				bounds = data.bounds ? L.latLngBounds(data.bounds) : Map.getBounds();

			if (data.videoOverlay) {

				Map.fitBounds(bounds);

				overlay = L.videoOverlay(videoUrls, bounds, {
					opacity: 0.8,
					interactive: false,
					autoplay: true,
					crossOrigin: "anonymous"
				});

				Map.addLayer(overlay);
			}

			if (data.iframe) {
				try {

					widget.setTemplateParam("video", {
						
						iframe: true,

						src: videoUrls,

						style: "height: " + (data.height || "300px; ") + (data.width ? "; width: " + data.width : null)

					});
				
				} catch (err) {

					console.log(err)

				}
			}
		}

		function remove() {
			if (data.videoOverlay)
				overlay.remove();
		}

		(function() {

			widget.on('activate', function() {

				SetResult();

			})

			widget.on('deactivate', function() {

				remove();

			})

		})();

	}

	GIS.widgets.register('video', {

		init: VideoWidget

	});

})();