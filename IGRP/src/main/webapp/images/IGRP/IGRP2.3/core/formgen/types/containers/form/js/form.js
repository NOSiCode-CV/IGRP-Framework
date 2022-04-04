var GENFORM = function(name,params){
	CONTAINER.call(this,name,params);

	var GEN = VARS.getGen();
	var container = this;

	container.sortableOptions.placeholder = 'gen-form-placeholder';

	container.contextMenu = {
		type   : 'button',
		holder : '.gen-form-btns',
		menu   : {
			selector: '>.btn',
			label   : '.btn-lbl',
		},
		xmlTag:'tools-bar'
	}

	container.includes = {
		xsl : [ 'form-utils'],
		//css : [ { path :'/core/igrp/form/igrp.forms.css' } ],
		js  : [ { path :'/core/igrp/form/igrp.forms.js'} ]
	}

	container.onLinkFieldSet = function(field){
		/*field.setPropriety({
			name:'button',
			value:false,
			xslValue:'btn btn-primary'
		});*/
		
	}

	var inputMaskIncludes 	= [
			{path : '/plugins/inputmask/jquery.inputmask.min.js'},
			{path : '/plugins/inputmask/igrp.inputmask.js'},
		],
		removeIncludesJs 	= function(arr){
			arr.forEach(function(e){
				for( var i = 0; i < container.includes.js.length; i++){
					var inc = container.includes.js[i];
					if(inc.path == e.path){
						var index = container.includes.js.indexOf(inc);
						if (index > -1) 
							container.includes.js.splice(index, 1);
						break;
					}
				}
			});
		},
		inputMaskInc = false
	;

	container.onFileFieldSet = function(field){
		GEN.setBTNClass(field);
	}

	container.onCheckboxFieldSet = function(f){
		f.setProperty({
			name  	 : 'switch',
			label 	 : 'Switch',
			value    : false,
			xslValue : 'checkbox-switch switch'
		});
	}

	container.onDateFieldSet = function(field){
		GEN.setBTNClass(field);
	}

	container.onHiddenFieldSet = function(field){
		field.xml.tag = 'hidden';
	}

	container.onFieldSet = function(field){
		GEN.setFormFieldAttr(field);

		field.setPropriety({

            name:'tooltip',

            label:'Show Tooltip',

            value : false,

            xslValue : '<xsl:call-template name="setTooltip">'+
				'<xsl:with-param name="field" select="'+container.GET.path()+'/fields/'+field.GET.tag()+'"/>'+
			'</xsl:call-template>'

        });

		field.setPropriety({

            name:'disable_copy_paste',

            label:'Disable Copy/Paste',

            value : false,

            xslValue : 'onselectstart="return false" oncut="return false" oncopy="return false" onpaste="return false" ondrag="return false" ondrop="return false"'

        });

		if(field.GET.type && field.GET.type() == 'text'){

			field.setPropriety({
				name:'inputmask',
				label:'Input Mask',
				value:{
					value:'',
					options:[
						{value:'',label:'-- Select Mask --'},
						{value:'currency',label:'Currency Mask (#.##0)'},
						{value:'date',label:'Date Mask (DD-MM-YYYY)'},
						{value:'monthYear',label:'Date Mask (MM-YYYY)'}
					]
				},
				onChange:function(v){
					if(v !== undefined && v !== ''){

						if(!inputMaskInc){
							inputMaskIncludes.forEach(function(e){
								container.includes.js.unshift(e);
							});
							inputMaskInc = true;
						}					
					}else{
						removeIncludesJs(inputMaskIncludes);
						inputMaskInc = false;
					}
				}
			});
		}
	}
	
	container.onDrawEnd = function(){
		
		//$.IGRP.components.form.placeholder2desc();
		
	}

	// container.ready = function(){
	// 	container.setProperty({
	// 		name:'template',
	// 		value:{
	// 			value  : 'form',
	// 			options : [
	// 				{
	// 					label : 'Form',
	// 					value : 'form'
	// 				},
	// 				{
	// 					label : 'Filter',
	// 					value : 'filter'
	// 				}
	// 			]
	// 		}
	// 	})
	// 	//console.log('dsaljdhlsakdbhaslkd')
	// }
	
	


}

this[VARS.name].declareContainer({
	name:'form',
	container:GENFORM
});