var INPUTPHONE = function (type, params) {
    Field.call(this, type, params);

    var GEN = VARS.getGen();
    var field = this;
    var proprieties = params && params.properties;

    field.includes = {
		js :[
			{ path:'/components/input.phone/input.phone.js' }
		],
		css:[
		
		]
	}

    field.ready = function () {

		field.setPropriety({
			name: 'defaultCountry',
			label: 'Set the default country',
			value: '52',
			inputType: 'selector'
		});

		field.on('draw-end', function () {
			console.log(field);

			const parent = $(`.form-group[item-name="${field.GET.tag()}"]`);
			let defaultCountry = parseInt(field.GET.defaultCountry())

			$.IGRP.components.flagSelector.init(parent, defaultCountry);
		});
    }
}

this[VARS.name].declareField({
    type: 'inputPhone',
    field: INPUTPHONE
});