var HIDDENFIELD = function(type,proprieties){
	Field.call(this,type,proprieties);
	var field = this;
 
  field.hidden = true;

  field.autoTag = false;

  field.xml.label = false;
  //field.xml.tag = 'hidden';
  field.unsetProprieties(['label']);

}

this[VARS.name].declareField({
	type:'hidden',
	field:HIDDENFIELD
});