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
		
			if( type.indexOf('listar_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.listar;
			
			if( type.indexOf('separator_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.separator;
			
			if( type.indexOf('forrmlist_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.formlist;
			
			if( type.indexOf('grafico_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.grafico;
			
			if( type.indexOf('formuu_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.index_editar;
			
			if( type.indexOf('vieww_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.index_editar;
			
			if( type.indexOf('save_formu_') == 0 )
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.inserir_dao;
			
			if( type == 'checkbox_table')
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.checkbox_table;
			
			if( type == 'core_fun_set')
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.core_fun_set;
			
			if( type == 'core_fun_get')
				
				IGRPElement = IGRP_BLOCKLY_ELEMENTS.core_fun_get;
				
		
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
									
									title = field.attr('title'),
									
									editable = field.attr('editable') == 'false' ? false : true;
								
					
								
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
										
									break;
										
									case 'field_text':
										
										 var textfield = field.attr('options'),
										 	
										 	fieldObject = new Blockly.FieldTextInput(textfield);
										
										 	value.appendField(fieldObject, name)
										
									break;
								
									case 'image':
										
										var fWidth = field.attr('field-width') || 15,
										
											fHeight = field.attr('field-height') || 15,
											
											src     = field.attr('src');
										
										value.appendField(new Blockly.FieldImage(src, fWidth, fHeight, "*"));
										
									break;
									
									case 'checkbox':
										
										var checkfield = field.attr('options'),
											
											updateShape = field.attr('update-shape') == 'true';
										
										var Field = new Blockly.FieldCheckbox(checkfield, function(v){
											
											if(updateShape){
												
												this.sourceBlock_.updateShape_(v);
											}
											
										})
										
										value.appendField(Field, name);
										
									break;
									
									case 'text':
										
										var text = field.attr('options');
										
										value.appendField(text);
										
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
				
				if(mutateValue)
					
					block.setMutator(new Blockly.Mutator( mutateValue.split(',') ));
					
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
				
				if(type.indexOf('set-dao-') >= 0){
					
					var daoName = type.split('set-dao-').pop();
					
					$(document).trigger('set-dao-block-init', [ block, daoName ]);
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
			
			//.appendField(new Blockly.FieldCheckbox(false), 'FILL');
			
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

Blockly.Blocks['insert_t'] = {
		
		init : function() {
			
			this.appendDummyInput().appendField("add to transaction");
			
			this.appendStatementInput("SCRIPT");
			
			this.setNextStatement(true);
			
			this.setColour(230);
			
		},
		
};

Blockly.Blocks['separatori'] = {
		
		init : function() {
			
			this.appendDummyInput().appendField("insert");
			
			this.setPreviousStatement(true);
			
			this.setNextStatement(true);
			
			this.setColour(230);
			
		},
		
};

