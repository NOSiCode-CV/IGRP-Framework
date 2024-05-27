(function(){

	GIS.module('Layers',function(app, groupLayers){

		var Layers     = this,

			LayerClass = GIS.module('Layer'),
			
			Templates  = GIS.module('Templates'),

			viewer     = app.viewer(),

			Groups     = [],

			AllLayers  = [];

		Layers.get = function(id){

			return AllLayers.filter(function(l){

				return l.id == id

			})[0];

		};
		
		Layers.getLayers = function(){
			return AllLayers;
		};

		Layers.add = function(layerOption){	

			var layer     = LayerClass( layerOption, app );

			if(layer)

				AllLayers.push(layer);

			else{

				console.log('Unable to load layer!');

				console.log(layerOption);

			}
			
			//console.log(layerOption);
			
			return layer;

		};

		Layers.addGroup = function(groupOptions,index){
				
			/*Grupo de Layers*/
			if( groupOptions.layers ){

				var id    = groupOptions.id || 'group-'+$.IGRP.utils.unique(),

					group = L.layerGroup();
				
				groupOptions.id = group.id   = id;

				group.visible   = groupOptions.visible;

				group.title     = groupOptions.title;

				group.html 	    = $(Templates.Layers.group( groupOptions ));

				if(groupOptions.layers && groupOptions.layers[0]){

					groupOptions.layers.forEach( function(layerOptions){

						layerOptions.group = group;
						
						var layer = Layers.add( layerOptions );

						layer.groupVisible = group.visible;

						if(layer)

							$('>ul', group.html ).append( layer.controller );
					});

				};
					
				group.show = function(){

					group.visible = true;

					app.map.view.addLayer(group, true);
					
					//viewer.fire('addlayer', group);
				
				};

				group.hide = function(){

					group.visible = false;

					group.remove();
					
					//viewer.fire('removelayer', group);

				};

				Groups.push(group);

				$('.layers-data', app.dom).append(group.html);

				if(group.visible)

					group.show();

			}else{
				
				/*Layer Sem Grupo*/
				var layer = Layers.add( groupOptions );
				
				if(!layer.visible)
					
					layer.hide();
				
				if(layer){
											
					var html = $(Templates.Layers.element());
					
					$('>ul', html ).append( layer.controller );
																	
					$('.layers-data', app.dom).append(html);
					
				}
				
			}

		};

		Layers.addGroups = function(groups){
			
			if(groups.length){
				
				$('.layers-wrapper', app.dom ).removeClass('hidden');

				groups.forEach( Layers.addGroup );
			}

		};

		Layers.groupVisible = function(id, visible){

			var group = Groups.filter(function(g){return g.id == id})[0],

				action = visible ? 'show' : 'hide';
			
			if(group)

				group[action]();

		};

		Layers.layerVisible = function(id, visible){

			var layer = AllLayers.filter(function(l){return l.id == id})[0],

				action = visible ? 'show' : 'hide';
			
			if(layer)

				layer[action]();

		};

		Layers.openMenu = function(){

			$(app.dom).addClass('show-layers');

		};

		Layers.closeMenu = function(){

			$(app.dom).removeClass('show-layers');

		};

		Layers.toggleMenu = function(){
			
			$(app.dom).toggleClass('show-layers');

		};

		function Controllers(){

			$(app.dom).on('change','.gis-group-visibility input', function(){

				var item 	= $(this).parents('.visibility-controller').first(),

					isLayer = item.is('.gis-layer'),

					visible = $(this).is(':checked');

				if(isLayer)

					Layers.layerVisible(item.attr('layer-id'), visible);

				else

					Layers.groupVisible(item.attr('group-id'), visible);

			});

			$(app.dom).on('click','.layers-control .open', Layers.toggleMenu );

			$(app.dom).on('click','.layers-control .close', Layers.closeMenu );

			$(app.dom).on('click','.layers-control .close', Layers.closeMenu );

		};	

		(function(){
					
			if(groupLayers && groupLayers[0])

				Layers.addGroups( groupLayers );

			Controllers();

		})();
			
	});

})();