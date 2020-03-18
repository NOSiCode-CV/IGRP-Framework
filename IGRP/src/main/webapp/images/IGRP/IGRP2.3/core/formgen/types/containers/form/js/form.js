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
		
		if (field.GET.type() == 'number') {

			field.setPropriety({
				name	: 'calculation',
				label 	: 'Calculation',
				value 	: false,
				xslValue: 'calculation',
				onEditionStart: function (v) {

					$('input', v.input).on('change', function () {

						var isChecked = $(this).is(':checked'),
							action = isChecked ? 'show' : 'hide',
							holdermathcal = $('.gen-properties-setts-holder div[rel="mathcal"]'),
							holdernumberf = $('.gen-properties-setts-holder div[rel="numberformat"]');

						holdermathcal[action]();
						holdernumberf[action]();

						if (!isChecked){

							$(':input', holdermathcal).val('');
							$(':input', holdernumberf).val('');
						}

					});
				}
			});

			field.setPropriety({
				name: 'mathcal',
				label: 'Mathematical Expression',
				value: '',
				size: 12,
				inputType: 'textarea',
				onEditionStart: function (o) {
					if (field.GET.calculation && field.GET.calculation())
						o.input.show();
					else
						o.input.hide();
				}
			});

			field.setPropriety({
				name: 'numberformat',
				label: 'Number Format',
				value: '',
				size: 12,
				onEditionStart: function (o) {
					if (field.GET.calculation && field.GET.calculation())
						o.input.show();
					else
						o.input.hide();
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