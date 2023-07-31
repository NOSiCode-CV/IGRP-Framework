var SECTIONHEADER = function(name,params){
	GENHTML.call(this,name,params);
}

this[VARS.name].declareHtml({
	type:'sectionheader',
	html:SECTIONHEADER
});