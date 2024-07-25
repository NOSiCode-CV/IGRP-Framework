var INPUTSPIN = function (type, params) {
	Field.call(this, type, params);

	var field = this;

	field.xml.value = false;

	field.includes = {
		js: [
			{ path:'/components/input.spin/input.spin.js'} 
		],
		css: []
	}

	const ButtonAppearanceProperties = GEN.getGlobalProperty('button-appearance-properties');

	field.ready = function () {		

		field.setPropriety({
			name: 'min',
			label: 'Min value',
			value: '0',
			inputType: 'number'
		});

		field.setPropriety({
			name: 'max',
			label: 'Max value',
			value: '',
			inputType: 'number'
		});

		ButtonAppearanceProperties(field, {showbtnStyle: false});

		field.on('draw-end', function () {
			console.log(field);

			const parent = $(`.form-group[item-name="${field.GET.tag()}"]`);

			$.IGRP.components.inputspin.init(parent);

		});
	}

}



this[VARS.name].declareField({
	type: 'inputspin',
	field: INPUTSPIN
});