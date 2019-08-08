/**
 * @author rodfelfer@hotmail.com (Rodney Fernandes)
 */
'use strict';

goog.require('Blockly.Blocks');

goog.require('Blockly.Java');

goog.require('Blockly.FieldDate');

goog.require('Blockly.FieldCheckbox');


function SetupBlockly(){
	
	$('.igrp-blockly-config').find('block').not('[default="true"]').each(function(indx, el){
		
		var element = $(this),
		
			type  = element.attr('type'),
			
			coment  = element.attr('coment'),
			
			color = element.attr('color') || 180,
			
			title = element.attr('title') || '',
			
			rtn    = element.attr('return'),
			
			mutate    = element.is('[mutator]'),
			
			mutateValue = element.attr('mutator') || null,
			
			output = element.is('[output]'),
			
			outputValue = element.attr('output') || null,
			
			prevStatement = element.is('[prev-statement]'),
			
			nextStatement = element.is('[next-statement]'),
			
			values = element.find('>value'),    
			
			statements = element.find('>statement'),
		
			IGRPElement = IGRP_BLOCKLY_ELEMENTS[type] || false;
		
		Blockly.Blocks[type] = {
				
			init : function() {
				
				var block = this;
				
				if(values[0]){
					
					values.each(function(i,e){
						
						var valueName  = $(e).attr('name'),
						
							valueTitle = $(e).attr('title'),
						
							type 	   = $(e).attr('type'),
							
							check  	   = $(e).attr('check') ? $(e).attr('check').split(',') : false,
									
							fields     = $('>field', e),
									
							inputType  = function(){
								
								switch(type){
									case 'value':
										return 'appendValueInput';
									break;
									
									case 'statement':
										return 'appendStatementInput';
									break;
									
									default: 
										return 'appendDummyInput';
								}
								
							}(),
									
							value 	   = block[inputType](valueName);
						
						if(valueTitle)
								
							value.appendField(valueTitle);
						
						if(fields[0]){
							
							fields.each(function(z,f){
								
								var field = $(f),
								
									type = field.attr('type'),
									
									name = field.attr('name'),
									
									title = field.attr('title');
								
								if(title)
									
									value.appendField(title)
								
								switch(type){
									
									case 'dropdown':
										
										var fieldValue = eval( field.attr('options') );
										
										if(fieldValue){
											
											var onChange = field.attr('igrp-on-change'),
											
												dropDown = new Blockly.FieldDropdown(fieldValue, function(item){
												
												if(onChange){
													
													try{
														
														eval(onChange); 
														
													}catch(error){
														
													}
													
												}
												
											});

											value.appendField(  dropDown, name );

										}

										else
											
											console.log(field)
										
									break;
										
									case 'field_text':
										
										 var textfield = field.attr('options');
										
										value.appendField(new Blockly.FieldTextInput(textfield), name)
										
									break;
										
									case 'image':
										
										var fWidth = field.attr('field-width') || 15,
										
											fHeight = field.attr('field-height') || 15,
											
											src     = field.attr('src');
										
										value.appendField(new Blockly.FieldImage(src, fWidth, fHeight, "*"));
										
									break;
									
									case 'checkbox':
										value.appendField(new Blockly.FieldCheckbox('TRUE'), 'Checkbox');
										
									break;
								
								}							
								
							})
							
						}
							
					});
						
				}else
					
					block.appendDummyInput().appendField(title);
				
				if(output)
					
					block.setOutput(true, outputValue);
				
				if(prevStatement)
					
					block.setPreviousStatement(true, element.attr('prev-statement'));
	
				if(nextStatement)
					
					block.setNextStatement(true, element.attr('next-statement'));
				
				if(mutateValue){
					
					console.log(mutateValue.split(','))
					
					console.log([ mutateValue.split(',')] )
					
					block.setMutator(new Blockly.Mutator( mutateValue.split(',') ));
					
				}
					
				if(color)	
					block.setColour(color);
				
				if(coment)	
					block.setTooltip(coment);
				
				if(IGRPElement) {
					
					for(var method in IGRPElement){
						if(method != 'init')
							block[method] = IGRPElement[method];
						
					}
					
					if(IGRPElement.init)
					
						IGRPElement.init(block);		
					
				}
				
				$(document).trigger('block-init', [ block ]);
				
				$(document).trigger('block-'+type+'-init', [ block ]);
				
				if(type.indexOf('get-dao-') >= 0){
					var daoName = type.split('get-dao-').pop();
					
					$(document).trigger('get-dao-block-init', [ block, daoName ]);
				}
					
					
				
			
					
					
			}
		};
		
		
		
		Blockly.Java[type] = function(block) {
			
			return '';
		};
		
	})
	
}

Blockly.Blocks['where_t'] = {
		init : function() {
			this.appendDummyInput().appendField("where");
			this.appendStatementInput("SCRIPT");
			this.setNextStatement(true);
			this.setColour(230);
		},
};
Blockly.Blocks['where'] = {
		init : function() {
			this.appendDummyInput().appendField("where");
			this.setPreviousStatement(true);
			this.setNextStatement(true);
			this.setColour(230);
		},
};

