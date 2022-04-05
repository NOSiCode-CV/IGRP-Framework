//https://zverik.github.io/leaflet-streetview/index.html
//https://raruto.github.io/leaflet-pegman/examples/leaflet-pegman-panoDiv.html

(function() {

	function StreetViewWidget(widget, app) {

		var Map = app.map.view,

			data = widget.data(),

			providerUrlTemp = 'https://www.google.com/maps?layer=c&cbll={lat},{lon}',

			panorama = null,

			viewer = null;

		container = null,

			widget.layer = null;

		function _ajaxRequest(url, callback, post_data) {
			if (url) {
				window.open(url, 'streetview');
			}
			else {

				if (window.XMLHttpRequest === undefined)
					return;
				var req = new XMLHttpRequest();
				req.open(post_data ? 'POST' : "GET", url);
				if (post_data)
					req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				req.onreadystatechange = function() {
					if (req.readyState === 4 && req.status == 200) {
						var data = (JSON.parse(req.responseText));
						callback(data);
					}
				};
				req.send(post_data);
			}
		}

		function onLayerClick(e) {

			var textures = e.layer.feature.properties.foto;

			console.log(textures)

			processImagePanorama(textures);

			/*viewer.addUpdateCallback(function() {

				panorama.rotation.y += 0.005;

			});

			/*if (e.latlng)
				processStreetViewServiceData(L.Util.formatNum(e.latlng.lat, 6), L.Util.formatNum(e.latlng.lng, 6));
			*/
		}

		function onLayerDblClick(e) {

			if (e.latlng) {

				var providerUrl = providerUrlTemp
					.replace(/{lon}/g, L.Util.formatNum(e.latlng.lng, 6))
					.replace(/{lat}/g, L.Util.formatNum(e.latlng.lat, 6));

				_ajaxRequest(providerUrl)

			}
		}

		function processImagePanorama(textures) {

			container = document.querySelector('#panorama');

			if (panorama && viewer) {
				container.innerHTML = "";
			}

			var lookAtPositions = [
				new THREE.Vector3(4871.39, 1088.07, -118.41),
				new THREE.Vector3(1278.27, 732.65, 4769.19)
			];

			var infospotPositions = [
				new THREE.Vector3(3136.06, 1216.30, -3690.14),
				new THREE.Vector3(3258.81, -295.50, 3771.13)
			];

			panorama = new PANOLENS.ImagePanorama(textures);

			var panorama2 = new PANOLENS.ImagePanorama('https://gis-teste.nosi.cv/geoserver/styles/Street%20View%20360%20bixu%20rocha3.jpg');
			panorama2.addEventListener('enter', function() {
				viewer.tweenControlCenter(lookAtPositions[1], 0);
			});

			panorama.link(panorama2, infospotPositions[0]);
			panorama2.link(panorama, infospotPositions[1]);

			infospot = new PANOLENS.Infospot(350, PANOLENS.DataImage.Info);
			infospot.position.set(0, -2000, -5000);

			panorama.add(infospot);

			panorama.addEventListener('enter-fade-start', function() {
				viewer.tweenControlCenter(lookAtPositions[0], 0);
			});

			viewer = new PANOLENS.Viewer({ output: 'console', container: container });

			viewer.add(panorama, panorama2);
		}

		function processStreetViewServiceData(lat, lng) {

			var streetViewCoords = new google.maps.LatLng(lat, lng);

			var panoramaOptions = {
				navigationControl: true,
				position: streetViewCoords,
				pov: {
					heading: 34,
					pitch: 10,
				},
			};

			new google.maps.StreetViewPanorama(document.getElementById('panorama'), panoramaOptions);
		}

		function SetResult() {

			$(".igrp-map-os-wrapper").removeClass("expand");

			$("#googlestreetview").addClass("on");

			processImagePanorama("https://gis-teste.nosi.cv/geoserver/styles/Street%20View%20360%20bixu%20rocha3.jpg");

			data.layerIds.forEach(function(item) {

				widget.layer = app.layers.get(item);

				if (widget.layer) {

					widget.layer.on('click', function(e) {

						onLayerClick(e)

					});

					widget.layer.on('dblclick', function(e) {

						onLayerDblClick(e)

					});
				}
			})



		}

		function remove() {

			$("#googlestreetview").removeClass("on");

			if (panorama && viewer) {
				container.innerHTML = "";
			}
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

	GIS.widgets.register('googlestreetview', {

		dependencies: {

			js: [path + '/plugins/leaflet/library/plugins/panolens/three.min.js',
			path + '/plugins/leaflet/library/plugins/panolens/panolens.min.js']

		},

		init: StreetViewWidget

	});

})();