var BTNFIELD = function(type,params){
	Field.call(this,type,params);
	
	var GEN = VARS.getGen();
	var field = this;
	var proprieties = params && params.properties,
		jsIncludes  = [
			{ path: '/plugins/sharpadbclient/sharpadbclient.js' }
		],
		removeIncluds = function (arr, type) {
			arr.forEach(function (e) {
				for (var i = 0; i < field.includes[type].length; i++) {
					var inc = field.includes[type][i];
	
					if (inc.path == e.path) {
						var index = field.includes[type].indexOf(inc);
	
						if (index > -1)
							field.includes[type].splice(index, 1);
	
						break;
					}
				}
			});
		};


	field.ready = function(){

		GEN.setTargetAttr(field,{
			value: proprieties && proprieties.target ? proprieties.target : '_blank'
		});

		
		GEN.setBtnActionAttr(field,{
			value: proprieties && proprieties.action ? proprieties.action : ''
		});

		GEN.service.set(field);

		field.setPropriety({
			name  :'transaction',
			value : false
		});
		
		field.setPropriety({
			name  :'custom_return',
			label : 'Custom Return',
			value : false,
			onEditionStart:function(e){
				
				var checker = e.input.find('.propriety-setter');
				
				var check = function(){
					
					var isChecked = checker.is(':checked'),
						
						operation = isChecked ? 'hide' : 'show';

					$('.gen-properties-setts-holder [rel="action"]')[operation]();
					
				};
				
				checker.on('change', check)
				
				check(); 	
				
			}
		});
		
		
		field.setPropriety({
			label: 'Sharp Adb Client Action',
			name: 'adbcli',
			order: 6,
			value: {
				value: '',
				options: $.IGRP.defaults.buttons.sharpadbclient
			},
			onEditionStart: function (o) {

				var checkTarget = function (v) {
					var target = v ? v : field.GET.target ? field.GET.target() : null;

					if (target == 'sharpadbclient'){

						o.input.show();

						jsIncludes.forEach(function (e) {
							field.includes.js.unshift(e);
						});
					}
						
					else{
						if ($.IGRP.components.select2){
							$.IGRP.components.select2.select2Init({
								field: $('select', o.input)
							});
						}
						
						o.input.hide();

						removeIncluds(jsIncludes, 'js');
					}
				}

				$('select[name="edit-target"]').on('change', function () {
					var target = $(this).val();
					checkTarget(target);
				});

				checkTarget();

			}
		});
/*
		field.setPropriety({
			name     :'outline',
			value    : false
			//xslValue : 'btn-outline'
		});*/

		GEN.setBTNClass(field);

		GEN.setImgAttr(field,{
			value:'fa-angle-right',
			paramName:field.parent.imagePath ? field.parent.imagePath : 'tools-bar'
		});
	}
}

this[VARS.name].declareField({
	type:'button',
	field:BTNFIELD
});