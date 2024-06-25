var INPUTPHONE = function (type, params) {
    Field.call(this, type, params);

    var GEN = VARS.getGen();
    var field = this;
    var proprieties = params && params.properties;

    field.ready = function () {

    }

    field.includes = {
		js :[
			{ path:'/themes/default/assets/js/pages/flag-input.init.js' }
		],
		css:[
		
		]
	}
}

this[VARS.name].declareField({
    type: 'inputPhone',
    field: INPUTPHONE
});
