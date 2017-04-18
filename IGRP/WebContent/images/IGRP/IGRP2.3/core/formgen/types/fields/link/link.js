var LINKFIELD = function(type,params){
	Field.call(this,type,params);

	var GEN = VARS.getGen();
	
	var proprieties = params && params.properties;

	this.xml.description = true;


	GEN.setTargetAttr(this,{
		value: (proprieties && proprieties.target) ? proprieties.target : '_self'
	});

	GEN.setBTNClass(this,'link');

	GEN.setImgAttr(this,{
		value: 'fa-link'
	});

	/*GEN.setTargetAttr(this,{
		value: (proprieties && proprieties.target) ? proprieties.target : '_self'
	});
*/	/*this.setPropriety({
		name:'target',
		propriety:{
			value:'_blank',
			options:[{value:'_blank',label:'Blank'},{value:'_self',label:'Self'}]
		}
	});*/
}

VARS.getGen().declareField({
	type:'link',
	field:LINKFIELD
});