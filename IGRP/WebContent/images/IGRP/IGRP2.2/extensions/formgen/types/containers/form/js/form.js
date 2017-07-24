var GENFORM = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	var lastSize = '4';

	container.sortableOptions.placeholder = 'gen-form-placeholder';

	container.contextMenu = {
		type   : 'button',
		holder : '.buttonBar',
		menu   : {
			selector: '.bClick',
			label   : '.label',
		},
		xmlTag:'tools-bar'
	}

	container.includes = {
		xsl : ['setAttribute'],
		css : [ { path : 'igrp.forms.css' } ],
		js  : [ { path : 'igrp.forms.js'  } ]
	}

	container.onFieldSet = function(field){

		if(!field.hidden){
			var sizeOptions = field.GET.type() == 'texteditor' || field.GET.type() == 'separator' ? 
			  {
			  	value: '1',
			  	options:[{value:'1',label:'100%'}]
			  } :
			  {
			  	value: lastSize,
			  	options:[{value:'1',label:'100%'},{value:'2',label:'50%'},{value:'3',label:'33%'},{value:'4',label:'25%'}]
			  }

			if(field.GET.type() != 'separator' && field.GET.type() != 'img'){

				if(field.GET.type() != 'link'){
					
					field.setPropriety({
						name:'required',
						value    : false,
						xslValue : 'required', //XSL VALUE WHEN PROPRIETY IS TRUE
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
							propriety:false,
							xslValue : 'readonly="readonly"', //XSL VALUE WHEN PROPRIETY IS TRUE
							transform:true
							
						});
					}

					field.setPropriety({
						name:'disabled',
						propriety:false,
						xslValue : 'disabled="disabled"', //XSL VALUE WHEN PROPRIETY IS TRUE
						transform:true
					});

				}

				if(field.GET.type() != "select" && field.GET.type() != "file" && field.GET.type() != "radio" && field.GET.type() != "checkbox" && field.GET.type() != "checkboxlist" && field.GET.type() != "radiolist"){
					field.setPropriety({
						name:'maxlength',
						propriety:30,
						onChange:function(value){
							field.holder.find('[maxlength]').attr('maxlength',value);
						}
					});
				}
			}
			
			field.setPropriety({
				name      :'size',
				propriety :sizeOptions,
				onChange:function(value){
					field.holder.removeClass('col col-1-1 col-1-2 col-1-3 col-1-4');
					field.holder.addClass(getFieldSize(field));
					lastSize = value;
				}
			});
		}else{
			field.xml.tag = 'hidden';
		}
	}

	container.onColorFieldSet = function(field){
		field.setPropriety({
			name:'format',
			value:{
				value   : 'hexa',
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
}

this[VARS.name].declareContainer({
	name:'form',
	container:GENFORM
});