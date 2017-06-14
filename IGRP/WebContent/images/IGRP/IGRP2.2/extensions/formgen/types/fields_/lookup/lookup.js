var LOOKUPFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	
	var field = this;
	var GEN = VARS.getGen();

	field.ready = function(){
		GEN.setBtnActionAttr(field,{
			value: proprieties && proprieties.action ? proprieties.action : '',
			xmlAttr:function(){
				var action = field.action.action ? field.action.action : '',
					page   = field.action.page   ? field.action.page   : '',
					app    = field.action.app    ? field.action.app    : '';

				return 'action="'+action+'" page="'+page+'" app="'+app+'"';
			}
		});
	}



	field.onDrawEnd = function(){
		console.log(field);
	}
	
}

this[VARS.name].declareField({
	type:'lookup',
	field:LOOKUPFIELD
});