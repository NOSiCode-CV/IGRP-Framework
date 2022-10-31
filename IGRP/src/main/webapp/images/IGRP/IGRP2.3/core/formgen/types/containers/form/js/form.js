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

	const filesIncludes = {
		xsl : [ 'form-utils'],
		//css : [ { path :'/core/igrp/form/igrp.forms.css' } ],
		js  : [ { path :'/core/igrp/form/igrp.forms.js'} ]
	};

	container.includes = filesIncludes;

	container.onLinkFieldSet = function(field){
		/*field.setPropriety({
			name:'button',
			value:false,
			xslValue:'btn btn-primary'
		});*/
		
	}

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

	}

	const inlcudesFilesNosiCaSigner = function(){
		let hasSelect    = false,
			hasBtnSigner = false;

		container.GET.fields().forEach( f => {
			if(f.GET.type() === 'select'){
				hasSelect = true;

				return false;
			}
		});

		container.contextMenu.items.forEach(f => {
			const target = f.GET.target ? f.GET.target() : null;

			if(target.includes('signer')){
				hasBtnSigner = true;
				return false;
			}
		});

		const includeJsFile = [
			{ path:'/plugins/select2/select2.full.min.js'}, 
			{ path:'/plugins/select2/select2.init.js'}
		],
		includeCssFile = [
			{ path:'/plugins/select2/select2.min.css' }, 
			{ path:'/plugins/select2/select2.style.css' } 
		];

		let includJs = [{ path:'/plugins/nosicaSigner/nosicaSigner.js'}];

		if(hasBtnSigner){

			if(!hasSelect){
				includJs = [
					...includeJsFile,
					...includJs
				];

				container.includes['css'] = includeCssFile;

			}else{
				GEN.removeIncluds(includeCssFile,'css',container);
				GEN.removeIncluds(includeJsFile,'js',container);
			}

			container.includes.js = [
				...container.includes.js,
				...includJs
			];

		}else{
			includJs = [
				...includeJsFile,
				...includJs
			]
			removeIncluds(includeCssFile,'css');
			removeIncluds(includJs,'js');
		}
	}
	
	container.onDrawEnd = function(){

		inlcudesFilesNosiCaSigner();

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