(function () {

	var com,
		startAt = 0,
		isNav   = $('body[app]')[0];

	$.IGRP.component('stepcontent', {
		stepStartAt : function(obj){
			var rel 		  = obj.attr("item-name"),
				name 		  = "p_fwl_"+rel,
				inputControll = $("#"+name);

			if(obj.is("[control-start]") && obj.attr("control-start") == "true" && isNav){

				if(inputControll[0]){
					startAt = inputControll.val();

					startAt = isNaN(startAt) ? 0 : startAt - 1;
				}
				else{
					$.IGRP.utils.createHidden({
						name 	: name,
						id 		: name,
						class 	: "menuCtrl submittable",
						value   : 1
					});
				}
			}
		},
		start: function (obj) {

			obj.steps({
				startAt : startAt,
				onInit: function () {

					if($(':input', obj)[0] && isNav){

						$(':input', obj).bind('keypress', function (e) {

							if (e.keyCode == 13) {
								e.preventDefault();

								return false;
							}
						});
					}


					if(isNav){

						$('ul.step-steps > li > a',obj).each(function(i,a){
							
							$(a).parents('li:first').html($(a).html());
							//$(a).removeAttr(Object.values(a.attributes).map(attr => attr.name).join(' '));
							
						});

						var HolderBtns = $('.box-footer.gen-form-footer .gen-form-btns',obj);

						if(HolderBtns[0]){

							$('>*',HolderBtns).addClass('step-btn finish step-finish-btns');

							var getBtns = $('>*',HolderBtns).clone(true);

							HolderBtns.remove();

							HolderBtns.parents('.box-footer.gen-form-footer').remove();

							$('.step-footer',obj).append(getBtns);
						}
					}
				},
				onChange: function (currentIndex, newIndex, stepDirection) {

					let valid = currentIndex >= 0 ? true : false;

					const isNav = $('body[app]')[0];

					const currentObj = $('.step-tab-panel.active', obj);

					const totalStep = $('.step-tab-panel', obj).length - 1;

					$.IGRP.components.stepcontent.events.execute('stepActive', currentObj);//execute event

					if (stepDirection === 'forward' && isNav && $(':input', currentObj)[0]) {

						var fields = $.IGRP.utils.getFieldsValidate(currentObj);

						valid = fields.valid();
					}

					if (currentIndex < newIndex) {
						$('label.error.form-validator-label', $(`.step-tab-panel:eq(${newIndex})`, obj)).remove();
					}

					if(totalStep === currentIndex){
						$('.step-footer .step-finish-btns',obj).removeClass('step-finish-btns');
					}else{
						$('.step-footer .finish',obj).addClass('step-finish-btns');
					}

					if(obj.is("[control-start]") && obj.attr("control-start") == "true" && valid && isNav){
						
						$("#p_fwl_"+obj.attr("item-name")).val((newIndex + 1));
					}

					return valid;
				},
				onFinish: function () {
					
				}
			});
		},
		init: function () {

			com = this;

			com.events.declare(['stepActive']);

			com.on = com.events.on;

			$('.step-holder').each(function () {
				com.stepStartAt($(this));
				com.start($(this));
			});

		}
	}, true);
})();