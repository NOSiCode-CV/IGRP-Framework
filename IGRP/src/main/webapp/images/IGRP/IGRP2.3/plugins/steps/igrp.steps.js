(function () {

	var com,
		startAt 	 = 0,
		isNav   	 = $('body[app]')[0],
		btnDirection = 0,
		firstIsHide  = false,
		lastIsHide   = false,
		totalStep    = 1;

	$.IGRP.component('stepcontent', {

		stepStartAt : function(obj){
			var lengthStep = $('.step-tab-panel', obj).length;

			if(lengthStep > 0){
				$('.step-footer',obj).removeClass('hidden');

				totalStep =  lengthStep - 1;

				var rel 		  = obj.attr("item-name"),
					name 		  = "p_fwl_"+rel,
					inputControll = $("#"+name),
					firstElement  = $('div.step-tab-panel:eq(0)', obj),
					lastElement   = $('div.step-tab-panel:eq('+totalStep+')', obj);

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

				if(firstElement[0] && firstElement.hasClass('hiddenrules')){
					firstIsHide = true;
					startAt = startAt === 0 ? 1 : startAt;
				}

				if(lastElement[0] && lastElement.hasClass('hiddenrules')){
					lastIsHide = true;
					totalStep = totalStep > 1 ? totalStep - 1 : totalStep;
				}

			}else	
				$('.step-footer',obj).addClass('hidden');

			obj.data('total-step',totalStep);
		},

		controllBtn : function (obj) {
			
			var HolderBtns = $('.box-footer.gen-form-footer .gen-form-btns',obj);

			if(HolderBtns[0]){

				var getBtns 	= $('>*',HolderBtns).clone(true),
					parentForm 	= HolderBtns.parents('.box.igrp-forms');

				if(!$(":input",parentForm)[0] && !$(".form-group",parentForm)[0]){
					parentForm.remove();
				}

				HolderBtns.parents('.box-footer.gen-form-footer').remove();

				if(getBtns[0]){

					getBtns.addClass('step-btn finish step-finish-btns');

					$('.step-footer .step-btn.finish',obj).remove();

					if(obj.data('total-step') === obj.data('corrent-step'))
						getBtns.removeClass('step-finish-btns');

					$('.step-footer',obj).append(getBtns);
				}
			}
		},

		hideOrShowBtn : function (idx, obj) {
			
			if(totalStep === idx){
				$('.step-footer .step-finish-btns',obj).removeClass('step-finish-btns');

				if(lastIsHide){
					$('.step-footer button.next',obj).addClass('hidden');
				}

			}else{
				$('.step-footer .finish',obj).addClass('step-finish-btns');
				$('.step-footer button.next',obj).removeClass('hidden');
			}

			if(firstIsHide && idx === 1){
				$('.step-footer button.prev',obj).addClass('hidden');
			}else{
				$('.step-footer button.prev',obj).removeClass('hidden');
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

						com.controllBtn(obj);
					}
				},
				onChange: function (currentIndex, newIndex, stepDirection) {

					var valid		= currentIndex >= 0 ? true : false,
						currentObj  = $('.step-tab-panel.active', obj),
						nextObj     = currentObj.next('div.step-tab-panel.hiddenrules'),
						prevObj     = currentObj.prev('div.step-tab-panel.hiddenrules');
					
					if(stepDirection != 'none'){

						if(nextObj[0] && currentIndex < totalStep){
							btnDirection = newIndex + 1;

						}else if(prevObj[0]){

							btnDirection = newIndex > 0 ? newIndex - 1 : 0;
						}
					}

					if(currentObj.hasClass("hiddenrules") && (currentIndex > 0 && currentIndex < totalStep)){

						$('ul.step-steps li:eq('+btnDirection+')').click();	

						$('ul.step-steps li:eq('+totalStep+')').removeClass('active error')

						valid = true;

					}else{

						$.IGRP.components.stepcontent.events.execute('stepActive', currentObj);//execute event

						var fields = $.IGRP.utils.getFieldsValidate(currentObj);

						if (stepDirection === 'forward' && isNav && fields[0]) {
						

							valid = fields.valid();
						}

						if (currentIndex < newIndex) {
							$('label.error.form-validator-label', $(`.step-tab-panel:eq(${newIndex})`, obj)).remove();
						}

						com.hideOrShowBtn(currentIndex,obj);

						if(obj.is("[control-start]") && obj.attr("control-start") == "true" && valid && isNav){
							
							$("#p_fwl_"+obj.attr("item-name")).val((newIndex + 1));
						}

						obj.data('corrent-step',newIndex);
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

			$.IGRP.events.on('element-transform',function(p){
				var step = p.content.parents('.step-holder');

				if(step[0]){
					
					com.controllBtn(step);
				}
			});

		}
	}, true);

	$(document).on('igrp:rules', function (i, p) {
		
		$.each(p.field,function(x,e){
			if($(e).hasClass('step-tab-panel')){

				var step  = $(e).parents('.step-holder'),
					index = $('.step-tab-panel.active', step).index();

				if($(e).hasClass('active')){
					
					if((index === 0 || index === totalStep)){
						index = index === 0 ? index + 1 : index - 1;

						$('ul.step-steps li:eq('+index+')').click();
					}
				}else{
					index = (index === 1 && p.action == 'show') ? 0 : index;
				}

				$.IGRP.components.stepcontent.stepStartAt(step);

				$.IGRP.components.stepcontent.controllBtn(step);
				
				$.IGRP.components.stepcontent.hideOrShowBtn(index,step);

			}

		});
			
	});

})();