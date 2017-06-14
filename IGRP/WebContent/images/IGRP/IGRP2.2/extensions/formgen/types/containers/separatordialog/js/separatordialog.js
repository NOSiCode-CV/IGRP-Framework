var GENSEPARATORDIALOG = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	container.xml.table = true;

	//container.sortableOptions.placeholder = 'gen-form-placeholder';
	
	container.includeCss();

	//container.includes = ['setAttribute'];

	container.includes = {
		xsl : ['setAttribute']
		//css : [ { path : 'igrp.graph.css', } ],
		//js  : [ { path : 'igrp.graph.js'  } ]
	}

	container.onFieldSet = function(field){

		if(!field.hidden){
			var sizeOptions = field.GET.type() == 'texteditor' || field.GET.type() == 'separator' ? 
			  {
			  	value: field.proprieties.size ? field.proprieties.size : '1',
			  	options:[{value:'1',label:'100%'}]
			  } :
			  {
			  	value: field.proprieties.size ? field.proprieties.size : '4',
			  	options:[{value:'1',label:'100%'},{value:'2',label:'50%'},{value:'3',label:'33%'},{value:'4',label:'25%'}]
			  }

			if(field.GET.type() != 'separator'){

				if(field.GET.type() != 'link'){
					field.setPropriety({
						name:'required',
						value    : false,
						xslValue : 'important', //XSL VALUE WHEN PROPRIETY IS TRUE
						transform:true
					});

					if(field.GET.type() != "file"){
						field.setPropriety({
							name:'change',
							propriety:false,
							xslValue : 'IGRP_change', //XSL VALUE WHEN PROPRIETY IS TRUE
							transform:true
						});
					}

					if(field.GET.type() != "select" && field.GET.type() != "file"){
						field.setPropriety({
							name:'readonly',
							propriety: false,
							xslValue : 'readonly="readonly"', //XSL VALUE WHEN PROPRIETY IS TRUE
							transform:true
						});
					}

					field.setPropriety({
						name:'disabled',
						propriety:false,
						xslValue :'disabled="disabled"', //XSL VALUE WHEN PROPRIETY IS TRUE
						transform:true
					});
				}

				if(field.GET.type() != "select" && field.GET.type() != "file" && field.GET.type() != "radio" && field.GET.type() != "checkbox" && field.GET.type() != "checkboxlist" && field.GET.type() != "radiolist"){
					field.setPropriety({
						name:'maxlength',
						propriety:40,
						onChange:function(value){
							field.holder.find('[maxlength]').attr('maxlength',value);
						}
					});
				}
			}
			
			field.setPropriety({
				name      :'size',
				value :sizeOptions,
				onChange:function(value){
					field.holder.removeClass('col col-1-1 col-1-2 col-1-3 col-1-4');
					field.holder.addClass(getFieldSize(field));
					//lastSize = value;
				}
			});

			field.setPropriety({
				name      :'table',
				value :true,
				onChange:function(value){
					container.Transform();
				}
			});

			field.xml.desc = true;
		}
	}

	container.onColorFieldSet = function(field){
		field.setPropriety({
			name:'format',
			value:{
				value   : 'rgb',
				options : [
					{ label:'RGBA', value:'rgba' },
					{ label:'RGB', value:'rgb' },
					{ label:'Hexa', value:'hex' }
				]
			},
			transform:true
		});
	}

	var getFieldSize = function(field){
		var size = field.GET.size();
		var rtn = size == '1' ? 'col' : 'col-1-'+size;

		return rtn;
	}

	//VARS.getGen().includeTemplates(['setAttribute']);
}

this[VARS.name].declareContainer({
	name:'separatordialog',
	container:GENSEPARATORDIALOG
});