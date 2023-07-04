var LOCATORFIELD = function(type,params){
	
	Field.call(this,type,params);
	
	var field = this;

	var GEN = VARS.getGen();

	var proprieties = params.properties;

	field.xml.lookup = true;
	
	function SetMapOptions(id, selected){
		
		var actionID = id || field.GET.action(),
		
			options  = [],
		
			req = GEN.getPageJSON( actionID ),
			
			select = $('#gen-edition-modal select[rel="map"]');
		
		select.html('');
		
		$('#gen-edit-confirm').attr('disabled',true);
		
		req.then(function(data){

			var containers = GEN.layout.getAllContainers(data.rows);
		
			containers.forEach(function(c){
				
				if(c.proprieties && c.proprieties.type == 'map_os' ){
					
					options.push({
						
						value : c.proprieties.tag,
						
						text : c.proprieties.tag,
						
						selected : c.proprieties.tag == selected
						
					})
					
				}
				
			});

			$.IGRP.components.select2.setOptions({
				
				select : select,
				
				options : options
				
			});
			
		});
		
		req.always(function(){
			$('#gen-edit-confirm').removeAttr('disabled');
		})
		
	};


	field.ready = function(){
		//choose lookup page
		GEN.setBtnActionAttr(field,{
			label : 'Page',
			value: proprieties && proprieties.action ? proprieties.action : '',
			xmlAttr:function(){
				var action = field.action.action ? field.action.action : '',
					page   = field.action.page   ? field.action.page   : '',
					app    = field.action.app    ? field.action.app    : '';

				return 'action="'+action+'" page="'+page+'" app="'+app+'"';
			}
		});
		//choose lookup page map
		field.setProperty({
			
			name : 'map',
			
			value : {
				
				value : '',
				
				options : []
		
			},
			
			onEditionStart:function(){

				SetMapOptions( field.GET.action(), field.GET.map() );
				
				$('#gen-edition-modal select[rel="action"]').on('change', function(){
					
					var id = $(this).val();
					
					SetMapOptions( id );
					
				} );
				
			}
		
		});
		
		/*field.setProperty({
		
			name : 'widget_title',
			
			label : 'Widget Title',
			
			value : '',
			
			inputType : 'texteditor',
			
			size : 12
			
		});*/
		
		
		GEN.setBTNClass(field);
	}
	
}

this[VARS.name].declareField({
	type:'locator',
	field:LOCATORFIELD
});