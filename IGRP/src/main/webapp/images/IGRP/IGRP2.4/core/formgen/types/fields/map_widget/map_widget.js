(function(){
	
	var GEN = VARS.getGen(),
	
		Widgets;
	
	GEN.Request.get( path+'/core/formgen/types/fields/map_widget/types/list.xml',{

		then : function(list){
			
			if( $.isXMLDoc(list) ){
				
				Widgets = WidgetsXMLToJson( list ).widgets;
				
			}else{
				
				if(typeof list === 'string')
					
					list = JSON.parse(list);
				
				Widgets = list.widgets;
				
			}

		}

	});


	var MAPWIDGETFIELD = function(type,params){
		
		var field = this;
		
		Field.call( field ,type,params);
		
		function SetAttributeType(name,attr, idx) {
			
			idx = idx || 0;
		
			var value = field.GET[name] ? field.GET[name]() : attr.value,
					
				options = {
					
					name : name,
					
					label : attr.label,
					
					widgetAttr : true,
					
					order : 2 + idx
					
				};

				
			switch( attr.type ){
				
				case "layers":
					
					var layers = field.properties && field.properties.layers ? field.properties.layers : [];

					options.size = 12;
					
					options.value = {

						value : layers,
						
						/*options : field.parent.getLayersComboBox(),
						
						multiple : true*/

					};
					
					options.type = 'formlist';
					
					options.fields = {
							
						layer : {
							
							type : 'select',
							
							options : function(){
								
								return field.parent.getActiveLayersCombo();
							}
						},
						
						attributes : {
							
							label : 'Attributes',
							
							type : 'text'
						},
							
					}
					
					
					field.setPropriety(options);
					
				break;
				
				default:
				
					options.value = function(){
						
						var val = value;
					
						if(attr.type == 'checkbox')
							
							val = value == '1' || value == 'true' ? true : false;
						
						if(attr.type == 'number')
							
							val = value*1;

						return val;
						
					}();

					field.setPropriety(options);
			}
			
		}
		
		function RemoveWidgetAttrs(){
			
			for(var a in field.propertiesOptions){
				
				var attr = field.propertiesOptions[a];
				
				if(attr.widgetAttr){
					
					field.unsetProprieties([a]);
					
					$('#gen-edition-modal [rel="'+a+'"]').remove();
					
				}	
				
			}
			
		}
		
		function SetWidgetAttrs( widget ){
			
			var i = 0;
			
			if(widget){
			
				for(var propName in widget){
					
					if(propName != 'attributes'){
						
						var wProp = widget[propName];
						
						if(field.SET[propName])
							
							field.SET[propName]( wProp );
					}
					
				}
				
				/*if(widget.hasOwnProperty('icon') && field.SET.icon)
					
					field.SET.icon( widget.icon )
					
				if(widget.hasOwnProperty('css') && field.SET.widget_css)
					
					field.SET.widget_css( widget.css );

				if(widget.hasOwnProperty('js') && field.SET.widget_js)
					
					field.SET.widget_js( widget.js );
				
				if(widget.hasOwnProperty('html') && field.SET.widget_html)
					
					field.SET.widget_html( widget.html );*/

					
				for(var attrName in widget.attributes){
					
					var attr = widget.attributes[attrName];
					
					SetAttributeType( attrName, attr, i );
					
					i++;
				}
				
			}
			
			
		};
		
		
		
		field.ready = function(){
			
			field.setPropriety({
				
				name : 'html',
				
				label : 'Load HTML',
				
				value : true,
				
				editable : false
				
			});
			
			field.setPropriety({
				
				name : 'css',
				
				label: 'Load CSS',
				
				value : false,
				
				editable : false
				
			});
			
			field.setPropriety({
				
				name : 'js',
				
				label : 'Load JS',
				
				value : true,
				
				editable : false
				
			});
			
			field.setPropriety({
				
				name : 'widget_position',
				
				label : 'Widget Position',
				
				order: 3,
				
				value : {
					
					value : 'button_level',
					
					options : [
						
						{
							label : 'Top',
							
							value : 'top'
						},
						
						{
							label : 'Right',
							
							value : 'right'
						},
						
						{
							label : 'Button Level',
							
							value : 'button_level'
						}
						
					]
					
				}
				
			})
			
			field.setPropriety({
				
				name : 'widget_type',
				
				label : 'Widget Type',
				
				order : 0,
			
				value : {
					value : '',
					
					options : function(){
						
						var arr = [
							{
								value : '',
								
								label : ''
							}
						];
					
						for(var w in Widgets)
							
							arr.push({
								
								label : Widgets[w].label,
								
								value : w
								
							});
						
						return arr;
						
					}
					
				},
				
				onEditionStart:function(o){
					
					var select = $('select',o.input);
					
					var LoadWidgetJson = function( t ){
						
						var type = t || select.val();
						
						RemoveWidgetAttrs( );
						
						console.log(type);
						
						if(type){
							
							var widget = Widgets[type];

							GEN.confirmEdition({
								
								hide : false,
								
								afterTransform : function(){
									
									SetWidgetAttrs( widget );
									
									setTimeout(function(){
										
										field.holder.find('.field-edit').click();
										
									},350)
									
								}
								
							});
							
						}
						
					};
					
					$('select',o.input).on('change', function(){
						
						LoadWidgetJson();
						
					});

				}
				
			});
			
			field.setPropriety({
				
				name : 'buttonControl',
				
				label : 'Show Control',
				
				value : true

			});
			
			field.setPropriety({
				
				name : 'active',
				
				label : 'Active',
				
				value : false

			});

			if(params && params.properties && params.properties.widget_type && params.properties.widget_type.value)
				
				SetWidgetAttrs( Widgets[params.properties.widget_type.value] );
	
				
		};
	}

	this[VARS.name].declareField({
		type:'map_widget',
		field:MAPWIDGETFIELD
	});
	
	function WidgetsXMLToJson(xml){
		
		var $xml = $(xml),
		
			json = {
				
				widgets : {}
				
			};
		
		$xml.find('widgets>item').each(function(i, item){
			
			var wname = $(item).attr('name'),
			
				value = $(item).attr('value');
			
			var widget = {
				
				icon  : $(item).attr('icon'),
				
				label : $(item).attr('label') || capitalizeFirstLetter(wname),
				
				css   : $(item).attr('css') == "true" || false,
				
				js    :  $(item).attr('js') == "false" ? false : true,
						
				html  : $(item).attr('html') == "false" ? false : true,
						
				active : $(item).attr('active') == "true" ? true : false,
						
				buttonControl : $(item).attr('buttonControl') == "false" ? false : true,
				
				attributes : {}
					
			};
			
			if( value )
				
				widget.value = value;
		
			$('attributes>attr',item).each(function(x,a){
				
				var aname  = $(a).attr('name'),
					
					label = $(a).attr('label') || capitalizeFirstLetter(aname),
					
					type  = $(a).attr('type');
				
				widget.attributes[aname] = {
					
					label : label,
					
					value : $(a).attr('value') || ""
					
				};
				
				if(type)
					
					widget.attributes[aname].type = type;

			});
		

			json.widgets[ wname ] = widget;
			
		});
	
		return json;
		
	}
	
})();


