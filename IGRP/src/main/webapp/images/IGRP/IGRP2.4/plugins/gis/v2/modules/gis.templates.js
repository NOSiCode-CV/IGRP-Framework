(function(){

	var Tmpl = GIS.module('Templates',{

		Layers : {

			layer : function(layer){
				
				
				var group_id = typeof layer.group !== 'undefined' ?  layer.group.id : '',				
			
					r = '<li layer-type="'+layer.type+'" layer-id="'+layer.id+'" group-id="'+group_id+'" class="visibility-controller gis-layer">'+
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

			},
			
			element: function(){
				 
				return '<div class="visibility-controller layer-group not-layer-group"><ul/></div>';
			},
			
			select : function(layer){
				return '';
			},
			
			svg: function(o){
				
				 var   fillOpacity = o.fillOpacity || 1,
			 	       fill        = o.color || "#4594D1",
		               strokeWidth = o.strokeWidth != 'undefined' ? o.strokeWidth : 1;
		     				
				 var svg = '<svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="map-marker-alt" class="svg-inline--fa fa-map-marker-alt fa-w-12" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">' + 				
						   '<path fill="'+fill+'" fill-opacity="'+fillOpacity+'" stroke-width="'+strokeWidth+'" ' +
						   'd="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"></path></svg>';
		    
				 return encodeURI("data:image/svg+xml," + svg).replace('#','%23');
			},
			
			svgCluster: function(o){
				
				 var svg = '<svg xmlns="http://www.w3.org/2000/svg" '+
							   'width="100" height="100" version="1.1"> '+
							   '<circle cx="50" cy="50" r="30" stroke="#117da9" fill="#117" stroke-width="4" stroke-opacity="0.5"/>'+
							   '<text x="50%" y="60%" text-anchor="middle" fill="white" font-size="40px">'+o.value+'</text> '+
							'</svg>';
				 
				 console.log(svg);
		    
				 return encodeURI("data:image/svg+xml," + svg).replace('#','%23');
	
			},

		},

		BaseMaps : {

			item : function(b){

				var activeClss = b.default ? 'active' : '';
				
				var url = typeof b.url === 'string' ?  b.url : '';
				
				var iconURL = b.iconURL ?  b.iconURL : path+'/plugins/gis/images/basemaps/'+b.name+'.jpg';

				return  '<div class="gis-basemap-item '+activeClss+'" basemap-name="'+b.name+'" basemap-url="'+url+'" style="background-image:url('+iconURL+')">'+

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
				
					target = w.target || 'void',
					
					control = w.control && !w.control.button ? 'no-widget-control' : '';
				
				r+='<div class="btn-group-vertical '+control+' gis-panel-inner" role="group" gis-widget="'+w.type+'">'+
		              '<button gis-widget="'+w.type+'"  widget-id="'+id+'" target="'+target+'" title="'+w.title+'" class="btn btn-default gis-widget-controller" text-color="primary">'+
		              	'<i class="fa '+w.icon+'"></i>'
		              '</button>'+
		            '</div>'

				return r;

			},
			
			menu : function(arr, widget){
				
				var wrapper = $('<ul class="gis-widget-menu"/>');

				arr.forEach(function(item){
					
					var menu = $('<li class="widget-menu-item txt-ellipsis"><a class="">'+item.title+'</a></li>');
					
					if(item.onClick)
						
						menu.on('click', item.onClick);
					
					wrapper.append(menu);
					
				});
				
				return wrapper;
				
			},
			
			panelTools : function(){
				
				return '<div class="gis-widget-panel-tools">'+
							'<a class="widget-deactivate" href="#" target="void"><i class="fa fa-times-circle"></i></a>'+
					   '</div>';
				
			},
			
			selectionMenu : function(item, params){

				var r = '',
				
					target = item.target || '_blank',
					
					fa     = item.icon ? item.icon : 'fa-angle-right';
				
					icon   = item.icon ? '<div class="icon-item-holder"><i class="fa fa-lg ' + item.icon  + '"></i></div>' : '',
										
					url    = item.url ? item.url + (Object.keys(params).length > 0  ? L.Util.getParamString(params, item.url, false) : '') : '#';			
		
				r += '<a href="' +url+ '" class="list-group-item list-group-item-action text-decoration-none" target="'+target+'">'+
						icon + '<span class="">'+item.label+'</span>' +
					 '</a>';
				
				return r;
				
			},
			
			edition : {
				
				icon: function(name){
					
					return path+'/plugins/gis/images/'+name+'.png';
					
				}
			}

		
		}

	});

})();