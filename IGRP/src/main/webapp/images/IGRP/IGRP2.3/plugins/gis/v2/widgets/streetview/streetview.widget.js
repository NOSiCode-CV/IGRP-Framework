//https://zverik.github.io/leaflet-streetview/index.html
//https://raruto.github.io/leaflet-pegman/examples/leaflet-pegman-panoDiv.html

(function() {

	function StreetViewWidget(widget, app) {

		var Map = app.map.view,

			data = widget.data(),

			providerUrlTemp = 'https://www.google.com/maps?layer=c&cbll={lat},{lon}',

			panorama = null,

			viewer = null,

			container = null,

			// Focus tweening parameter
			parameters = {
				amount: 50,
				duration: 1000,
				curve: 'Exponential',
				easing: 'Out',
				iterative: false
			};

		widget.layer = null;

		widget.panolens = [];

		widget.defaultPanolens = {};

		function _ajaxRequest(url) {
			if (url)
				window.open(url, 'streetview');
		}

		function onLayerClick(e) {

			var url = e.layer.feature.properties.foto;

			console.log(url)

			var texture = new THREE.TextureLoader().load(url);

			viewer.panorama.updateTexture(texture);

			viewer.panorama.reset();

		}

		function onLayerDblClick(e) {

			if (e.latlng) {

				var providerUrl = providerUrlTemp
					.replace(/{lon}/g, L.Util.formatNum(e.latlng.lng, 6))
					.replace(/{lat}/g, L.Util.formatNum(e.latlng.lat, 6));

				_ajaxRequest(providerUrl)

			}
		}

		function getPosition(e) {
			if (e.intersects.length > 0) return;
			return viewer.raycaster.intersectObject(viewer.panorama, true)[0].point;
		};

		function getInfoPano(uuid) {
			return data.panolens.filter(pano => pano.uuid === uuid)[0] || {};
		}

		function getPanorama(uuid) {
			return widget.panolens.filter(pano => pano.uuid === uuid)[0] || null;
		}

		function getDefaultPanolens() {
			return data.panolens.filter(pano => pano.default)[0] || {};
		}

		function setCenter(point) {

			console.log(point)

			if (point && point.geom) {

				var marker = L.marker(point.geom),

					latLngs = [marker.getLatLng()],

					markerBounds = L.latLngBounds(latLngs),

					maxZoom = point.zoom || null;

				Map.fitBounds(markerBounds, { maxZoom: maxZoom });
				
				app.map.setCenter( point.geom);
			}
		}

		function onFocus() {
			this.focus(parameters.duration, TWEEN.Easing[parameters.curve][parameters.easing]);
		}


		function addPanorama(pano) {

			var panorama = getPanorama(pano.uuid);

			var transaction = pano.transaction !== undefined ? pano.transaction : 'enter';

			if (panorama) return panorama.pano;

			if (pano.type && pano.type === 'ImageLittlePlanet')
				panorama = new PANOLENS.ImageLittlePlanet(pano.src);
			else
				panorama = new PANOLENS.ImagePanorama(pano.src);

			if (pano.infospots && pano.infospots[0]) {

				for (var key in pano.infospots) {

					var position = pano.infospots[key].position;

					var text = pano.infospots[key].text;

					infospot = new PANOLENS.Infospot(350, PANOLENS.DataImage.Info);

					infospot.position.set(position.x, position.y, position.z);

					if (text)

						infospot.addHoverText(text);

					infospot.addEventListener('click', onFocus);

					panorama.add(infospot);
				}

			}

			if (pano.lookAtPosition)
				panorama.addEventListener(transaction, function() {

					viewer.tweenControlCenter(new THREE.Vector3(pano.lookAtPosition.x, pano.lookAtPosition.y, pano.lookAtPosition.z));

					setCenter(pano.point);

				});

			panorama.addEventListener('click', function(e) {

				var outputPosition = getPosition(e);

				console.log(outputPosition);

			});

			viewer.add(panorama);

			widget.panolens.push({
				uuid: pano.uuid,
				pano: panorama
			})

			return panorama;

		}

		function render(pano, callback) {

			panorama = addPanorama(pano);

			var panosLinks = pano.links;

			if (panosLinks && panosLinks[0]) {

				for (const key in panosLinks) {

					var link = panosLinks[key];

					var infoPano = getInfoPano(link.uuid)

					if (infoPano) {

						var pano = addPanorama(infoPano),

							thumb = (link.thumb + '?_=' + new Date().getTime()) || '',

							scale = link.scale || 300;

						panorama.link(pano, new THREE.Vector3(link.position.x, link.position.y, link.position.z), scale, thumb)

						viewer.add(pano);

					}
				}

			}
			if (callback)
				callback();
		}


		function processImagePanorama() {

			container = document.querySelector('#panorama');

			if (panorama && viewer) {
				container.innerHTML = "";
			}

			viewer = new PANOLENS.Viewer({ output: 'console', container: container });

			var pano = getDefaultPanolens();

			render(pano);

			//setCenter(pano.point);

			data.panolens.forEach(function(item) {
				if (pano.uuid !== item.uuid)
					render(item);
			})

			//viewer.renderer.sortObjects = true;
			
			console.log(app.map)

		}

		function SetResult() {

			$(".igrp-map-os-wrapper").removeClass("expand");

			$("#streetview").addClass("on");

			processImagePanorama();

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

			$("#streetview").removeClass("on");

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

	GIS.widgets.register('streetview', {

		dependencies: {

			js: [path + '/plugins/leaflet/library/plugins/panolens/three.min.js',
			path + '/plugins/leaflet/library/plugins/panolens/panolens.min.js']

		},

		init: StreetViewWidget

	});

})();