(function () {

	let com,
		startAt 	 = 0,
		isNav   	 = $('body[app]')[0],
		btnDirection = 0,
		firstIsHide  = false,
		lastIsHide   = false,
		validateStep = true,
		totalStep    = 1,
		rel 	     = '';

	$.IGRP.component('stepcontent', {

		controllVieWonly : function(name, val){
			let inputControllVieWonly = $(`#${name}`);

			if(inputControllVieWonly[0]){
				if(val === undefined)
					val = isNaN(inputControllVieWonly.val() * 1) ? 0 : inputControllVieWonly.val() * 1;

				else
					inputControllVieWonly.val(val);

				validateStep =  val === 1 ? false : true; 
			}
			else{

				validateStep =  val === 1 ? false : true;

				$.IGRP.utils.createHidden({
					name 	: name,
					id 		: name,
					class 	: "menuCtrl submittable",
					value   : 1
				});
			}
		},

		stepStartAt : function(obj){
			let lengthStep = $('.step-tab-panel', obj).length;

			if(lengthStep > 0){
				$('.step-footer',obj).removeClass('hidden');

				totalStep =  lengthStep - 1;

				rel = obj.attr("item-name");

				let name 		  = "p_fwl_"+rel,
					inputControll = $(`#${name}`),
					firstElement  = $('div.step-tab-panel:eq(0)', obj),
					lastElement   = $(`div.step-tab-panel:eq(${totalStep})`, obj);

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

				if(obj.is('[control-viewonly]')  && obj.attr("control-viewonly") == "true"  && isNav){
					const viewOnly = `${name}_viewonly`;

					com.controllVieWonly(viewOnly);
					
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

		controllChange : function (p) {

			const {currentIndex,newIndex, obj, valid} = p;

			if (currentIndex < newIndex) {
				$('label.error.form-validator-label', $(`.step-tab-panel:eq(${newIndex})`, obj)).remove();
			}

			com.hideOrShowBtn(currentIndex,obj);

			if(obj.is("[control-start]") && obj.attr("control-start") == "true" && valid && isNav){
				const fwlIndex = (newIndex + 1) <= (totalStep + 1) ? (newIndex + 1) : newIndex;
				$("#p_fwl_"+obj.attr("item-name")).val(fwlIndex);
			}

			obj.data('corrent-step',newIndex);
		},

		controllChangeBeforeSubmitNext : function(p){

			const {currentIndex,newIndex, obj, valid, currentObj} = p;

			com.controllChange({
				currentIndex : (currentIndex + 1),
				newIndex 	 : newIndex,
				obj 		 : obj,
				valid 		 : valid
			});

			const nextStep = $('ul.step-steps li:eq('+(newIndex)+')');

			currentObj.removeClass('active');
			
			$('ul.step-steps li:eq('+currentIndex+')').removeClass('active error').addClass('done');
			
			nextStep.addClass('active');

			$('.step-footer .step-btn.prev').show();

			if((currentIndex + 1) === totalStep)
				$('.step-footer .step-btn.next').hide();

			$(`.step-tab-panel[data-step="${nextStep.attr('data-step-target')}"]`).addClass('active');

			return valid;
		},

		getInputToSerializeArray : function(obj){

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

					var currentObj  = $('.step-tab-panel.active', obj),
						nextObj     = currentObj.next('div.step-tab-panel.hiddenrules'),
						prevObj     = currentObj.prev('div.step-tab-panel.hiddenrules');

					let valid = currentIndex >= 0 ? true : false;
					
					if(stepDirection != 'none'){

						if(nextObj[0] && currentIndex < totalStep){
							btnDirection = newIndex + 1;

						}else if(prevObj[0]){

							btnDirection = newIndex > 0 ? newIndex - 1 : 0;
						}
					}

					if(currentObj.hasClass("hiddenrules") && (currentIndex > 0 && currentIndex < totalStep)){

						$('ul.step-steps li:eq('+btnDirection+')').click();	

						$('ul.step-steps li:eq('+totalStep+')').removeClass('active error');

						return true;

					}else{
						if(isNav){

							$.IGRP.components.stepcontent.events.execute('stepActive', currentObj);//execute event
							
							if(stepDirection === 'forward'){// Next

								const fields = $.IGRP.utils.getFieldsValidate(currentObj);

								const liStep = $(`ul.step-steps li[data-step-target="${currentObj.attr('data-step')}"]`);
								
								if(liStep[0] && liStep.is('[action]') && validateStep){ // Submit before next

									const action = liStep.attr('action');

									if(action && action !== undefined){

										if (fields[0]) 
											valid = fields.valid();

										if(valid){

											currentObj.addClass('done');

											const objSubmit = $.IGRP.utils.getForm();

											$.IGRP.utils.loading.show();

											$.IGRP.utils.submitStringAsFile({
												pParam 		: {
													pArrayFiles : $.IGRP.utils.submitPage2File.getFiles(objSubmit),
													pArrayItem 	: objSubmit.find(':input').not(".notForm").serializeArray()
												},
												pUrl   		: liStep.attr('action'),
												pNotify 	: false,
												pComplete 	: function(resp){

													$.IGRP.utils.loading.hide();

													const xml = resp.responseXML || $($.parseXML(resp.response));

													let alert = '';

													$.each($(xml).find('messages message'),function(i,row){

														const type = $(row).attr('type');
							
														if (type === 'error') {
						
															alert += $.IGRP.utils.message.alert({
																type : 'danger',
																text : $(row).text()
															});
							
														}
													});

													if(alert !== ''){
														$('.igrp-msg-wrapper').html(alert);
														return false;

													}else{

														const viewOnly  = `p_fwl_${rel}_viewonly`,
															viewonlyObj = $(xml).find(`rows content >* hidden[name="${viewOnly}"]`);

														if(viewonlyObj[0]){
															
															const val = isNaN(viewonlyObj.text()) ? 0 : viewonlyObj.text();

															com.controllVieWonly(viewOnly, val);
														}

														$.IGRP.components.form.getHiddenFields(xml);

														let refreshComponents = liStep.is('[refresh_components]') ? liStep.attr('refresh_components') : null;

														if(refreshComponents){

															refreshComponents = refreshComponents.split(',');

															$.IGRP.utils.xsl.transform({
																xsl     : $.IGRP.utils.getXMLStylesheet(xml),
																xml     : xml,
																nodes   : refreshComponents,
																clicked : liStep,
																complete: function(res){

																	com.controllChangeBeforeSubmitNext({
																		currentIndex : currentIndex,
																		newIndex 	 : newIndex,
																		obj 		 : obj,
																		valid 		 : valid,
																		currentObj   : currentObj
																	});
																	
																}
															});

														}else{

															com.controllChangeBeforeSubmitNext({
																currentIndex : currentIndex,
																newIndex 	 : newIndex,
																obj 		 : obj,
																valid 		 : valid,
																currentObj 	 : currentObj
															});
														}
														
													}
												}
											});
										}

									}else{

										$.IGRP.notify({
											message : 'Acão de página não pode ser nulo',
											type	: 'danger'
										});

										return false
										
									}

								}else{
									console.log("viewonly :: ",validateStep);

									if (fields[0] && validateStep) 
										valid = fields.valid();

									if(valid)
										currentObj.addClass('done');

									com.controllChange({
										currentIndex : currentIndex,
										newIndex 	 : newIndex,
										obj 		 : obj,
										valid 		 : valid
									});

									return valid;
								}

							}else{
							
								currentObj.removeClass('done');

								com.controllChange({
									currentIndex : currentIndex,
									newIndex 	 : newIndex,
									obj 		 : obj,
									valid 		 : valid
								});

								return valid;

							}
						}
					}
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