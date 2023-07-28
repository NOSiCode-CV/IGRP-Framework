var ELECTRONICSIGNATURE = function(type,params){
	Field.call(this,type,params);

	var GEN 		= VARS.getGen(),
		field 		= this,
		addColField = null;

	field.xml.structure = 'link';

	field.xml.description = true;

	field.includes = {
		xsl : ['IGRP-electronic-signature.tmpl'],
		js  : [ { path:'/plugins/electronicsignature/electronicsignature.js'}],
		css : [ { path:'/plugins/electronicsignature/electronicsignature.css'}]
	}

	/**const creatAuxField = function(v){
		let container = field.parent;
		if(v){

			field.SET.urlautoupload(v);

			if(addColField === null){
				var name = field.GET.tag()+'_uuid',
					f 	 = GEN.getDeclaredField('hidden');

				addColField = new f.field('hidden',{
					properties:{
						tag   	 	: name,
						editable	: false,
						name  	 	: 'p_'+name
					}
				});

				console.log(addColField,field.GET.id());

				container.SET.fields([addColField]);
			}
		}else{
			if(addColField != null){
				console.log(addColField.GET.id());
				container.removeField(addColField.GET.id(),false);
				addColField = null;
			}
		}
	}*/
	
	field.ready = function(){

		field.setPropriety({
			name :'height',
			label:'Max Height (Pixel value)',
			value:150
		});

		field.setPropriety({
			name :'labelstart',
			label:'Signature Button Label',
			value:'Click Para Assinar / Editar'
		});

		field.setPropriety({
			name :'labelcancel',
			label:'Cancel Button Label',
			value:'Remover Assinatura'
		});

		field.setPropriety({
			name:'urlautoupload',
			value:false,
			editable:false,
			xslValue:'urlautoupload=""'
		});

		field.setPropriety({
			name    : 'autoupload',
			label   : 'Auto Upload',
			value   : false,
			xslValue: 'autoupload',
			onChange: function(v){
				field.SET.urlautoupload(v);
			}
		});
	}
}

VARS.getGen().declareField({
	type : 'electronicsignature',
	field: ELECTRONICSIGNATURE
});