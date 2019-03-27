(function(){

	var Tmpl = $.IGRP.components.GIS.module('Templates',{

		Layers : {

			layer : function(layer){

				var r = '<li layer-id="'+layer.id+'" group-id="'+layer.group.id+'" class="visibility-controller gis-layer">'+
							'<a>'+layer.name+'</a>'+
							Tmpl.Layers.visibility( layer.id, layer.visible )+
						'</li>';

				return r;

			},

			layers : function(layers){
				
				var r = '';
				
				layers.forEach( function(layer){

					r+=Tmpl.Layers.layer( layer )

				})

				return r;
			},

			group : function(group){

				var r = '';

				if(group)

					r+='<div class="visibility-controller layer-group gis-group" group-id="'+group.id+'">'+
              
			                '<a data-toggle="collapse" href="#layer-group-data-'+group.id+'">'+group.title+'</a>'+
				                Tmpl.Layers.visibility( group.id, group.visible )+
			                '<ul class="collapse" id="layer-group-data-'+group.id+'"></ul>'+

			            '</div>';

				return r;

			},

			visibility: function(id, checked){

				var chckd = checked ? 'checked' : '';

				return  '<span class="gis-group-visibility">'+
							'<div class="material-switch">'+
			                    '<input id="'+id+'-visibility" type="checkbox" '+chckd+'/>'+
			                    '<label for="'+id+'-visibility" bg-color="primary" class="label-default"></label>'+
			                '</div>'+
		                '</span>';

			}

		},

		BaseMaps : {

			item : function(b){

				var activeClss = b.default ? 'active' : '';

				return  '<div class="gis-basemap-item '+activeClss+'" basemap-name="'+b.name+'" style="background-image:url('+path+'/plugins/gis/images/basemaps/'+b.name+'.jpg)">'+

							'<span>'+b.name+'</span>'+

						'</div>'

			}

		},

		Widgets : {
			
			wrapper : function(w){
				
				var r = '<div class="gis-widget-wrapper" widget-id="'+w.id+'" widget-type="'+w.options.type+'">'+
				
							
					
						'</div>';
					
				
				return r;
				
			},
			
			widget : function(id,w){

				var r = '',
				
					target = w.target || 'void';

				r+='<div class="btn-group-vertical gis-panel-inner leaflet-control" role="group" gis-widget="'+w.type+'">'+
		              '<button gis-widget="'+w.type+'"  widget-id="'+id+'" target="'+target+'" title="'+w.title+'" class="btn btn-default gis-widget-controller leaflet-bar" text-color="">'+
		              	'<i class="fa '+w.icon+'"></i>'
		              '</button>'+
		            '</div>'

				return r;

			}

		}

	});

})();