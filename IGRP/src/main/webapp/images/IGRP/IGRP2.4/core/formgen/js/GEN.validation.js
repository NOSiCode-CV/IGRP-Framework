(function(){
	
	var data, editionModal, validationTab, annotationsController, annotationsSelect, validationContents, validationsList, validationFormList, clonableTr, onEdition;

	function SetNotNullWhenRequired(field){
		
		$(document).on('gen-edition-show', function(e,params){

			$('[rel="required"] .propriety-setter.checker', params.modal).on('change', function(){
				
				var checked = $(this).is(':checked');
				
				if(checked)
					annotationsController[0].setRows([{annotation : "@NotNull"}],{  
						prefix : false,
						trigger : false
					});
				else
					
					$('tbody tr td[item-name="annotation"] [name="annotation_fk"][value="@NotNull"]',annotationsController).parents('tr').remove();
					
			});
			
		});
		
	};
	
	function SetMinMaxValidation(){
		
		$(document).on('gen-edition-show', function(e,params){

			$('.propriety-setter[name="edit-min"]', params.modal).on('blur', function(){
				
				var val = $(this).val() ? $(this).val()*1 : null;
				
				if(val){
					
					annotationsController[0].setRows([{
						annotation : "@Min",
						value      : val
					}],{  
						prefix : false,
						trigger : false
					});
					
				}
				
			});
			
		});
		
	}
	
	function Config(){

		if(annotationsController[0] && annotationsController[0].events){
			
			SetNotNullWhenRequired();
			
			//SetMinMaxValidation();
			
			annotationsController[0].events.on('row-add', function(o){
				
				$('.validations-message').html('');
				
			});
			
			//validate unique groups
			annotationsController[0].events.on('valid-row-add', function(o){
	
				var valid 		    = true,
				
					_data  		    = annotationsController[0].toJSON(),
				
					annotationField = o.values.annotation.field,
				
					annotationVal   = annotationField.val(),
					
					selectedOption = $('option[value="'+annotationVal+'"]', annotationField),
					
					optionGroupType = selectedOption.attr('group-type'),
					
					optionGroupIndex = selectedOption.attr('group-index')*1;
					
				if(optionGroupType == 'unique'){
					
					var annotationTypeData = data.annotation.types[onEdition.type] ? data.annotation.types[onEdition.type] : false;
					
					if(annotationTypeData[optionGroupIndex]){
						
						var annotationGroup = annotationTypeData[optionGroupIndex],
							
							addedAnnotations = $('#field_validations td[field="annotation"] [name="annotation_fk"]' ).toArray()
						
						for(var x=0; x < addedAnnotations.length; x++ ){
							
							var addedVal = $(addedAnnotations[x]).val(),
							
								annotationData = annotationGroup.list[addedVal];
							
							if(annotationData && o.action != 'edit'){
								
								valid = false;
								
								$('.validations-message').html('');
								
								$.IGRP.notify({
									
									message : 'Validation conflict. Please check!',
									
									type : 'warning',
									
									component : 'field_validations',
									
									appendTo : '.validations-message'
										
								});
								
								break;
								
							}
	
						}
						
					}
					
				}
				
				/*var addedAnnotation = o.values.annotation.value[0];
				
				for(var x = 0; x < _data.length; x++){
					
					var item = _data[x];
					
					if(item.annotation == addedAnnotation){
						
						valid = false;
						
						$.IGRP.notify({
							
							message   : 'Validation Already Set!',
							
							type      : 'warning',
							
							component : 'field_validations',
							
							appendTo  : '.validations-message'
								
						});
						
						break;
					}
						
					
				}*/
				//annotationsController[0].toJSON().
				
				
				return valid;
			});
			
		}
		
		annotationsSelect.on('change', function(){
			
			var val = $(this).val();
			
			$('.validations-message').html('');
			
			if(val && onEdition){				
				
				var typeData  = data.annotation.types[onEdition.type] || data.annotation.types.text;
				
				HideValidationFields();
				
				if(typeData){
					
					var annotationData = GetAnnotationData( val, typeData );
					
					console.log(annotationData.inputs);
				
					for(var inputName in annotationData.inputs){
						
						var inputData = annotationData.inputs[inputName];
						
						if(inputData){
							
							var inputHolder = $('.field-annotation-input[item-name="'+inputName+'"]');
							
							if(typeof inputData === 'object'){
								
								if(inputData.required){
									
									inputHolder.attr('required','required');
									
									$('[name="'+inputName+'"]', inputHolder).attr('required', 'required');
									
								}

							}
							
							inputHolder.show();
							
						}
						
					}
								
				}

			}else{
				
				HideValidationFields();
			
			}
	
		});
		
		$(document).on('gen-field-edition-confirm', function(e, field){
			
			$('.validations-message').html('');
			
			var data = annotationsController[0].toJSON();
			
			field.validation = data;
			
		});
		
		$(document).on('gen-field-edition', function(e, field){
			
			$('.validations-message').html('');
			
			var type 			= field.type,
			
				annotationsList = data.annotation.types[type] || data.annotation.types.text,
				
				fieldValidations = field.validation && field.validation[0] ? field.validation : [];
			
			validationTab.hide();
			
			onEdition = field;
			
			HideValidationFields();
			
			if(field.formField && annotationsList.length){

				annotationsSelect.html( '' );
				
				annotationsSelect.append('<option/>');

				annotationsList.forEach(function(group, gi){
					
					var groupType = group.type,
					
						groupHTML = (
						//Group '+(gi+1)+'
						'<optgroup label="">'+
						
						   (function(){
							   
							   var options = '';
							   	
							   for(var annotationName in group.list)
								   
								   options+='<option group-index="'+gi+'" group-type="'+group.type+'" value="'+annotationName+'">'+group.list[annotationName].label+'</option>';

							   return options
							   
						   })()+
						   
						 '</optgroup>'
							
						)
					

					annotationsSelect.append( groupHTML );
									    
				});
				
				annotationsSelect.trigger('change');
				
				annotationsController[0].resetAll();
			

				annotationsController[0].setRows(fieldValidations, {  
					
					prefix : false,
					
					trigger : false
					
				});
				
				validationTab.show();
				
				
			}

		});
		
		$(document).on('change','.validation-check-input', function(){
			
			var tr = $(this).parents('tr'),
			
				checked = $(this).is(':checked'),
				
				messg   = $('[name="p_message_fk"]', tr);
			
			if(checked)
				
				messg.removeAttr('disabled');
			
			else
				
				messg.attr('disabled', 'true')
			
		});
		
		$(document).on('gen-field-export', function(e,data){
			
			if(data.field.validation)
				
				data.properties.validation = data.field.validation;

		});
		
		$(document).on('gen-field-init', function(e,data){

			data.field.validation = data.params.validation || [];

		});
		
		$(document).on('gen-field-structure', function(e, field){
			
			var rtn = '';
			
			if(field.validation && field.validation.length){
				
				rtn+='<validations>';
				
				try{
					
					field.validation.forEach(function(v, gi){
						
						rtn+='<validation>';
						
						for(var itemName in v)
							
							if(v[itemName])
								
								rtn+='<'+itemName+'>'+v[itemName]+'</'+itemName+'>';
							
						rtn+='</validation>';
						
					});
					
				}catch(err){
					
					console.log(err);
					
				}
				
				rtn+='</validations>';
				
			}

	
			return rtn;

		});
		
	};
	
	function HideValidationFields(){
		
		$('.field-annotation-input').removeAttr('required').hide();
		
		$('.field-annotation-input :input[required]').removeAttr('required');
	}
	
	function GetAnnotationData( annotation, typeData){
		
		var rtn = false;
		
		for(var i=0; i < typeData.length; i++){
			
			var d = typeData[i];
			
			if( d.list.hasOwnProperty(annotation) ){
				
				rtn = d.list[annotation];
				
				break;
				
			}
		}
		
		return rtn;
		
	}
	
	function MapType(type){
		
		return type.toLowerCase();
	};
	
	function Init(d){
		
		data = d;
		
		
		
		//validationContents = $('#igrp-field-validation');
		
		//validationsList = $('.form-group',validationContents);
		
		//validationFormList = $('#igrp-validation-fl').clone(true);
		
		
		
	};
	
	$.IGRP.on('init', function(){
		
		editionModal = $('#gen-edition-modal');
		
		validationTab = $('li[rel="validation"]', editionModal);
		
		annotationsSelect = $('#field_validations_annotation');
		
		annotationsController    = $('#igrp-field-annotations-list');
		
		Config();

		$.getJSON(path+'/core/formgen/data/annotations.json').then( Init );
		
	})
	
	
	
})();