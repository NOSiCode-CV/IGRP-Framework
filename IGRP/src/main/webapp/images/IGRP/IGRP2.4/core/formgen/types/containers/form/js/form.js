var GENFORM = function(name,params){
	CONTAINER.call(this,name,params);

	var GEN = VARS.getGen();
	var container = this;

	container.sortableOptions.placeholder = 'gen-form-placeholder';

	container.includes = {
		xsl : [ 'IGRP-form-utils.tmpl', 'component.form.fields' ],
		//js  : [ { path :'/core/igrp/form/igrp.forms.js'} ]
	};

	container.contextMenu = {
		type   : 'button',
		holder : '.gen-form-btns',
		menu   : {
			selector: '>.btn',
			label   : '.btn-lbl',
		},
		xmlTag:'tools-bar'
	}

	container.onCheckboxFieldSet = function(f){
		f.setProperty({
			name  	 : 'switch',
			label 	 : 'Switch',
			value    : false,
			xslValue : 'form-switch'
		});
	}

	container.onDateFieldSet = function(field){
		//GEN.setBTNClass(field);
	}

	container.onHiddenFieldSet = function(field){
		field.xml.tag = 'hidden';
	}

	container.onFieldSet = function(field){
		
		GEN.setFormFieldAttr(field);

		const hideProprietys = ['filesigner', 'electronicsignature'];

		if(!hideProprietys.includes(field.type)){

			field.setPropriety({

				name:'tooltip',

				label:'Show Tooltip',

				value : false,

				xslValue : `
				<xsl:call-template name="setTooltip">
					<xsl:with-param name="field" select="${container.GET.path()}/fields/${field.GET.tag()}"/>
				</xsl:call-template>`

			});

			field.setPropriety({
				name:'disable_copy_paste',
				label:'Disable Copy/Paste',
				value : false,
				xslValue : 'onselectstart="return false" oncut="return false" oncopy="return false" onpaste="return false" ondrag="return false" ondrop="return false"'

			});
		}

	}

	const getElementsByType = function(t){
		let hasElement = false;

		container.GET.fields().forEach( f => {
			if(f.GET.type() === t){
				hasElement = true;

				return false;
			}
		});

		return hasElement;
	}

	const getBtnByTarget = function(type){
		let hasBtnSigner = false;

		container.contextMenu.items.forEach(f => {
			const target = f.GET.target ? f.GET.target() : null;

			if(target.includes(type)){
				hasBtnSigner = true;
				return false;
			}
		});

		return hasBtnSigner;
	}

	const mergeArrayUniqueKey = function(arr, type){

		return [...new Set([...container.includes[type], ...arr])];
	}

	const includeFiles = function(has, arrJs, arrCss){
		
		if(!has){

			if(Array.isArray(arrCss))
				container.includes.css = mergeArrayUniqueKey(arrCss, 'css');
			
			if(Array.isArray(arrJs))
				container.includes.js  = mergeArrayUniqueKey(arrJs, 'js');

		}else{
			if(Array.isArray(arrCss))
				GEN.removeIncluds(arrCss,'css',container);

			if(Array.isArray(arrJs))
				GEN.removeIncluds(arrJs,'js',container);
		}

	}

	const inlcudesFilesNosiCaSigner = function(){
		const hasSelect   = getElementsByType('select'),
			hasFileSigner = getElementsByType('filesigner'),
			hasVkb 		  = getElementsByType('virtualkeyboard'),
			hasBtnSigner  = getBtnByTarget('signer');

		const jsSelectFile = [
			{ path:'/plugins/select2/select2.full.min.js'}, 
			{ path:'/plugins/select2/select2.init.js'}
		],
		cssSelectFile = [
			{ path:'/plugins/select2/select2.min.css' }, 
			{ path:'/plugins/select2/select2.style.css' } 
		],
		jsVkbFile = [
			{ path:'/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js'}
		],
		cssVkbFile = [
			{ path:'/plugins/virtualkeyboard/vkb.css' }
		],
		includJs = [{ path:'/plugins/nosicaSigner/nosicaSigner.js'}];

		if(hasFileSigner || hasBtnSigner){

			if(!container.includes?.css)
				container.includes['css'] = [];

			includeFiles(hasSelect, jsSelectFile, cssSelectFile);
			includeFiles(hasVkb, jsVkbFile, cssVkbFile);

			if(hasBtnSigner){
				includeFiles(!hasBtnSigner, includJs, '');
			}

		}else{

			const jsArr = [...jsSelectFile, ...jsVkbFile, ...includJs],
				cssArr  = [...cssSelectFile, ...cssVkbFile];

			GEN.removeIncluds(cssArr,'css',container);
			GEN.removeIncluds(jsArr,'js',container);
		}
	}
	
	container.onDrawEnd = function(){

		inlcudesFilesNosiCaSigner();

		//$.IGRP.components.form.placeholder2desc();
		
	}

	container.ready = function(){
		
		/*container.setProperty({
			name:'style',
			label : 'Estilo de Botões',
			value:{
				value : 'btn',
				size  : '12',
				list  : {
					items:[
						{value:'btn',label:'Normal'},
						{value:'btn-soft',label:'Suave'},
						{value:'btn-outline',label:'Linha'},
						{value:'btn-ghost',label:'Transparente'}
					],
					itemTemplate:'<span class="btn btn-xs #value#-primary">#label#</span>'
				}
			}
		});*/

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