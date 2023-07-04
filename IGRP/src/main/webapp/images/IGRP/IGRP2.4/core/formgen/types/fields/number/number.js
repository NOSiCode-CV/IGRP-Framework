var NUMBERFIELD = function(type,params){
	Field.call(this,type,params);

	var GEN = VARS.getGen(),
		field 		= this,
		proprieties = params.properties;

	field.ready = function(){

		field.setPropriety({
			name :'min',
			label:'Min value',
			value:'',
			inputType : 'number'
		});

		field.setPropriety({
			name :'max',
			label:'Max value',
			value:'',
			inputType : 'number'
		});
		
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



this[VARS.name].declareField({
	type:'number',
	field:NUMBERFIELD
});