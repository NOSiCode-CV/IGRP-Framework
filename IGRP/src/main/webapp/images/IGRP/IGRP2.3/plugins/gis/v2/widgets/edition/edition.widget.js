(function() {

	var utils = GIS.module('Utils'),

		Templates = GIS.module('Templates');

	function EditionWidget(widget, app) {

		var data = widget.data(),

			Map = app.map.view,

			Layers = {}, Attributes, FileController, EditorController, currentlyEditing, Reqs = [],

			LayerController, DrawLayer, DrawControl, DrawTool, EditTool, DeleteTool, CurrentLayer, CurrentLayerId, CurrentAction;

		widget.addedObject = null;

		widget.addedShpfile = null;

		widget.removedObjects = {};

		widget.addedEditor = null;

		widget.editingObjects = {};

		Map.enableEditing = false;

		widget.events.declare(['draw-end']);

		/**
		 * @Init Click onToolEdit
		*/

		widget.action('tool-create', function() {

			CurrentAction = 'init-create';

			SetTitle('Desenhar');

		});

		widget.action('tool-edit', function() {

			CurrentAction = 'start-editing';

			SetTitle('Modificar');

		});

		widget.action('tool-delete', function() {

			CurrentAction = 'init-delete';

			SetTitle('Eliminar');

		});

		widget.action('tool-shp', function() {

			SetTitle('Upload Shapefile');

		});

		widget.action('tool-editor', function() {

			CurrentAction = 'init-editor';

			SetTitle('Inserir Coordenadas');

		});

		widget.action('back-tools', function() {

			Clear();

			widget.steps.tools.activate();

		});

		/**
		 * @Execute/OnChange Tipo/Edição
		*/

		widget.action('select-layer', function() {

			if (!LayerController) return;

			CurrentLayerId = LayerController.val();

			if (!CurrentLayerId) return;

			var layer = app.layers.get(CurrentLayerId);

			CurrentLayer = { layer: layer, data: layer.data() }

			if (CurrentAction) widget.actions[CurrentAction]();

		});

		/**
		 * @Start ShpFile
		*/

		widget.action('upload-shp-file', function() {

			if (widget.addedShpfile)

				Map.removeLayer(widget.addedShpfile);

			var file = utils.shp.getFile(FileController.prop('files'));

			if (file) {

				var req = utils.shp.HandleZipFile(file);

				req.then(function(buffer) {

					ConvertToLayer(buffer);

				})

			}

		});

		widget.action('cancel-finish-shp', function() {

			ClearShp();

			widget.steps['div-shp'].activate()

		});

		widget.action('save-shp', function() {

			var LayerController = widget.html.find('select.layers-shp');

			var CurrentLayerId = LayerController.val();

			if (!CurrentLayerId) {

				$.IGRP.notify({

					message: 'Escolha o Layer para continuar.',

					type: 'error'

				});

				return;

			}

			var layer = app.layers.get(CurrentLayerId);

			CurrentLayer = { layer: layer, data: layer.data() }

			if ((layer.getGeometryType() === utils.geometry.pointCluster ? utils.geometry.point : layer.getGeometryType()) != ShpType()) {

				$.IGRP.notify({

					message: 'Tipo de layer escolhido  não é igual ao do shpfile.',

					type: 'error'

				});

				return;
			}

			widget.actions['save']()

		});

		function ConvertToLayer(buffer) {

			try {

				shp(buffer).then(function(geojson) {

					widget.addedShpfile = L.geoJSON(geojson, {

						onEachFeature: function(feature, layer) {

							layer.on('click', function(e) {

								var content = utils.feature.properties.toHTML(e.target.feature.properties);

								L.popup().setLatLng(e.latlng).setContent(content).openOn(app.viewer());

							});

						},

						pointToLayer: function(feature, latlng) {

							return new L.CircleMarker(latlng, {

								radius: 10,

								fillOpacity: 0.85

							});
						}

					});

					Map.addLayer(widget.addedShpfile);

					app.viewer().fitBounds(widget.addedShpfile.getBounds());

					if (widget.addedShpfile) widget.steps['finish-shp'].activate()

				});

			} catch (e) {

				console.log(e)

			}

		}

		function ShpType() {

			var type = null,

				layers = widget.addedShpfile;

			layers.eachLayer(function(layer) {

				var object = utils.feature.getData(layer.feature);

				if (object) {

					type = object.type;

					return false;

				}

			});

			return type;

		}

		function ClearShp() {

			FileController.val('');

			if (widget.addedShpfile)

				Map.removeLayer(widget.addedShpfile);

			widget.addedShpfile = null;

		}

		/**
		 * @Start Eliminar
		*/

		widget.action('init-delete', function() {

			EnableDeleteShape();

		});

		function deleteShape(e) {

			widget.removedObjects[e.layer.feature.id] = e.layer;

			Map.removeLayer(e.layer);

		};

		function EnableDeleteShape() {

			if (CurrentLayer)

				CurrentLayer.layer.on('click', deleteShape, this);

		};

		function DisableDeleteShape() {

			if (CurrentLayer)

				CurrentLayer.layer.off('click', deleteShape, this);

		};

		widget.action('cancel-delete', function() {

			CurrentLayer.layer.updateData();

		});

		/**
		 * @Start Editor
		*/

		widget.action('init-editor', function() { });

		widget.action('add-editor', function() {

			RemoveLayerEditor();

			if (!EditorController.val()) return;

			var type = CurrentLayer.layer.getGeometryType();

			type = type == 'Line' ? "LineString" : type;

			try {

				var geojsonFeature = {

					"type": "Feature",

					"geometry": {

						"type": type,

						"coordinates": JSON.parse(EditorController.val())

					},

					'crs': L.CRS.EPSG4326

				};

				widget.addedEditor = L.geoJSON(geojsonFeature, {

					coordsToLatLng: function(coords) {

						return new L.LatLng(coords[0], coords[1], coords[2]);

					}

				}).addTo(Map);

				widget.addedEditor.addData(geojsonFeature);

				widget.addedObject = widget.addedEditor;

				app.viewer().fitBounds(widget.addedEditor.getBounds());

				widget.steps['editor-finish'].activate();

			} catch (err) {

				$.IGRP.notify({

					message: err.message,

					type: 'error'

				});

			}

		});

		widget.action('cancel-editor-finish', function() {

			widget.actions['init-editor']();

			widget.addedObject = null;

		});

		widget.action('delete-editor', function() {

			ClearEditor();

		});

		widget.action('save-editor', function() {

			widget.addedObject = null;

			widget.actions.save();

		});

		function RemoveLayerEditor() {

			if (widget.addedEditor)

				Map.removeLayer(widget.addedEditor);

			widget.addedEditor = null;

			widget.addedObject = null;

		}

		function ClearEditor() {

			EditorController.val('');

			RemoveLayerEditor();

		}

		/**
		 * @Start Draw/Edit
		*/

		// start editing a given layers
		widget.action('start-editing', function() {

			Map.enableEditing = true;

			GetEditableLayers();

			for (var i in data.editableLayers) {

				var layer = data.editableLayers[i];

				layer.on('click', L.DomEvent.stop).on('click', function(e) {

					if (currentlyEditing && (L.stamp(currentlyEditing) != L.stamp(e.target))) RemoveEditing()

					e.target.toggleEdit();

					currentlyEditing = e.target;

				});

			}

		});

		// stop editing a given layers
		widget.action('stop-editing', function() {

			RemoveEditing();

			for (var i in data.layers) {

				var layer = data.layers[i].layer;

				layer.updateData();

			}

			widget.editingObjects = {};

		});

		widget.action('save-editing', function() {

			RemoveEditing();

			widget.actions['save']();

		});

		// remove editing a given layer
		function RemoveEditing() {

			if (currentlyEditing) {

				handleEdit(currentlyEditing);

				if (currentlyEditing.enableEdit()) currentlyEditing.disableEdit()

			}

			currentlyEditing = null;

		}

		function handleEdit(layer) {

			widget.editingObjects[L.stamp(layer)] = layer;

		}

		function GetEditableLayers() {

			data.editableLayers = null;

			var results = [];

			var layers = CurrentLayer.layer;

			var info = layers.Info;

			layers.eachLayer(function(layer) {

				if (layer instanceof L.Path) {

					layer.info = info;

					results[L.stamp(layer)] = layer;

				} else if (layer instanceof L.Marker || layer instanceof L.CircleMarker) {

					if (layer.getChildCount) {

						var layers = layer.getAllChildMarkers();

						for (var key in layers) {

							layers[key].info = info;

							results[L.stamp(layers[key])] = layers[key];

						}

					} else {

						layer.info = info;

						results[L.stamp(layer)] = layer;

					}

				}

			});

			data.editableLayers = results;

		}

		/**
		 * @Start Draw/Create
		*/

		widget.action('init-create', function() {

			if (DrawTool && DrawTool.disable)

				DrawTool.disable();

			if (CurrentLayer)

				StartDrawing(CurrentLayer);

		});

		widget.action('cancel', function() {

			Clear();

			widget.steps.select.activate();

		});

		widget.action('edit', function() {

			EditTool.enable();

		});

		widget.action('confirm-edition', function() {

			EditTool.save();

			EditTool.disable();

		});

		widget.action('cancel-edition', function() {

			EditTool.revertLayers();

			EditTool.disable();

		});

		widget.action('delete', function() {

			DeleteTool.enable();

			DeleteTool.removeAllLayers();

		});

		widget.action('confirm-delete', function() {

			DeleteTool.save();

			DeleteTool.disable();

			widget.addedObject = null;

		});

		widget.action('cancel-deleting', function() {

			DeleteTool.revertLayers();

			DeleteTool.disable();

		});

		/**
		 * @Global Function Save
		 */

		function GetWFST(layerInfo) {

			return new L.WFST({

				url: layerInfo.owsURL,

				typeNS: layerInfo.workspace,

				typeName: layerInfo.workspaceName,

				geometryField: layerInfo.geometryField,

				namespaceUri: layerInfo.workspaceLink,

				typeNSName: layerInfo.workspaceLayer,

				crs: L.CRS.EPSG4326,

				forceMulti: true,

				showExisting: false

			}).addTo(Map).on('error', function(e) {

				console.log(e)

			});

		}

		function ExcuteSave(wfst) {

			var req = wfst.save();

			req.then(function(f) {

				if (f.insertResults && f.insertResults[0]) {

					if (!Map.enableEditing) {

						ClearDelete();

						CurrentLayer.layer.updateData();

						if (widget.addedShpfile)

							widget.actions['cancel-finish-shp']()

						else

							widget.actions.cancel();

						$.IGRP.notify({

							message: 'Operação efetuado com sucesso.!',

							type: 'success'

						});

					}

				} else if (f.exception) {

					console.log(f.exception)

					$.IGRP.notify({

						message: 'Parece que algo deu errado #' + f.exception.message,

						type: 'error'

					});

					widget.actions.cancel();

				}

			})
				.catch(function(f) {

					console.log(f)

				})

			Reqs.push(req);

		}

		widget.action('save', function() {

			if (!Map.enableEditing && CurrentLayer) {

				var wfst = GetWFST(CurrentLayer.layer.Info),

					layer = widget.addedObject;

				if (widget.addedObject || widget.addedEditor) {

					var properties = {};

					for (var name in Attributes) {

						var attr = Attributes[name];

						properties[attr.name] = widget.html.find('form [name="' + attr.name + '"]').val();

					}

					if (widget.addedEditor) {

						widget.addedEditor.eachLayer(function(layer) {

							layer.feature = { properties: properties };

							wfst.addLayer(layer);

						});

					} else {

						layer.feature = { properties: properties };

						wfst.addLayer(layer);

					}

				} else if (Object.keys(widget.removedObjects).length != 0) {

					for (var key in widget.removedObjects) {

						wfst.removeLayer(widget.removedObjects[key]);

					}

				} else if (widget.addedShpfile) {

					var layers = widget.addedShpfile;

					layers.eachLayer(function(layer) {

						wfst.addLayer(layer);

					});

				}

				ExcuteSave(wfst);

			} else {

				for (var i in widget.editingObjects) {

					var wfst = GetWFST(widget.editingObjects[i].info);

					wfst.editLayer(widget.editingObjects[i]);

					ExcuteSave(wfst);

				}

				$.when.apply(undefined, Reqs).then(function() {

					widget.actions['stop-editing']()

					widget.actions.cancel()

					$.IGRP.notify({

						message: 'Operação efetuado com sucesso.!',

						type: 'success'

					});

				})

			}

		});

		function InitDraw() {

			DrawLayer = new L.FeatureGroup();

			DrawControl = new L.Control.Draw({

				edit: {

					featureGroup: DrawLayer

				}

			});

			EditTool = new L.EditToolbar.Edit(Map, DrawControl.options.edit);

			DeleteTool = new L.EditToolbar.Delete(Map, DrawControl.options.edit);

			Map.on(L.Draw.Event.CREATED, function(e) {

				if (!CurrentLayer) return;

				e.layer.addTo(DrawLayer);

				widget.addedObject = e.layer;

				widget.events.trigger('draw-end', e);

				widget.steps.confirmation.activate();

			});

			DrawLayer.addTo(Map);

		};

		function StartDrawing(l) {

			var type = l.layer.getGeometryDraw();

			if (!type) return;

			DrawTool = new L.Draw[type](Map);

			DrawTool.enable();

		};

		function Clear() {

			if (DrawTool && DrawTool.disable)

				DrawTool.disable();

			if (EditTool && EditTool.disable)

				EditTool.disable();

			if (DrawLayer)

				DrawLayer.clearLayers();

			ClearShp();

			ClearDelete();

			ClearEditor();

			if (Map.enableEditing)

				widget.actions['stop-editing']();

			widget.addedObject = null;

			widget.removedObjects = {};

			CurrentLayer = null;

			LayerController.val('');

			Map.enableEditing = false;

		};

		function ClearDelete() {

			widget.removedObjects = {};

			DisableDeleteShape();

			if (CurrentLayer)

				CurrentLayer.layer.updateData();

		}

		function GetLayers() {

			var grouplayers = app.layers.getLayers();

			grouplayers.forEach(function(layer) {

				var layerdata = layer.data();

				if (layerdata.type == 'WFS' && layerdata.editable)

					Layers[layer.id] = {

						layer: layer,

						data: layerdata
					}

			})

			data.layers = Layers;

		};

		function getAttributesInData(layer) {

			var data = widget.data(),

				attrs = layer.Description.attributes,

				results = [],

				customAttrs = data.infos.filter(function(l) {
					return l.layer == layer.id;
				});

			if (customAttrs[0] && customAttrs[0].attributes) {

				for (var name in attrs) {

					for (var key in customAttrs[0].attributes) {

						var attr = customAttrs[0].attributes[key];

						if (attr.name == name)

							results.push({
								"defaultValue": attr.defaultValue,
								"name": attr.name,
								"description": attr.description || name,
								"type": attrs[name]
							})
					}
				}

			} else {

				for (var name in attrs) {

					results.push({
						"defaultValue": "",
						"name": name,
						"description": name,
						"type": attrs[name]
					})
				}
			}
			return results;

		}

		function FormAttributes(e) {

			if (!e) return;

			var html = '';

			Attributes = getAttributesInData(e.layer);

			for (var key in Attributes) {

				var attribute = Attributes[key];

				var type = 'number';

				if (attribute.type == 'string') type = 'text'

				else if (attribute.name == 'dateTime' || attribute.name == 'date') type = 'date';

				html += '<input type="' + type + '" class="form-control" placeholder="' + attribute.description + '" name="' + attribute.name + '" value="' + attribute.defaultValue + '"/>'

			}

			var form = widget.html.find('form.attributes');

			form.html("");

			form.prepend(html);

		}

		function SetControllers() {

			LayerController = widget.html.find('select.layers');

			FileController = widget.html.find('input#file');

			EditorController = widget.html.find('textarea.form-control');

			widget.steps.attributes.on('activate', function(step) {

				FormAttributes(CurrentLayer);

				if (!step.html.find(':input').first().val())

					step.html.find(':input').first()[0].focus()

			});

			widget.steps.attributes.on('deactivate', function() {

				var form = widget.html.find('form.attributes');

				form.html("");

			});

		};

		function SetTitle(t) {

			widget.setTemplateParam('tool-title', {

				title: t

			});

		}

		(function() {

			GetLayers();

			widget.on('deactivate', function() {

				Clear();

			});

			widget.on('activate', function() {

				InitDraw();

				SetControllers();

				widget.setTemplateParams({

					add: Templates.Widgets.edition.icon('add'),

					edit: Templates.Widgets.edition.icon('edit'),

					trash: Templates.Widgets.edition.icon('trash'),

					shp: Templates.Widgets.edition.icon('upshape'),

					coords: Templates.Widgets.edition.icon('coords')

				});


			});

		})();

	};

	GIS.widgets.register('edition', {

		dependencies: {

			js: [

				path + '/plugins/leaflet/library/plugins/draw/leaflet-wfst.src.js',

				path + '/plugins/leaflet/library/plugins/draw/shp.min.js'

			]

		},

		init: EditionWidget

	});

})();
