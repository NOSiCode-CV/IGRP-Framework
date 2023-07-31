/**
 * @author Rodney Fernandes
 */

(function() {

	/** *************** MUTAÇÕES **************************** */

	/** ***** Mutações Filtros Where ***************** */
	var UpdateShape_where = function(block, ar_wheres) {
		var appendMutationFields = function(v, id) {
			if (v == 'andWhere' || v == 'orWhere' || v == 'where'
					|| v == 'having') {
				block.getInput('ADD' + id).setVisible(true);
				block.getInput('ADD' + id + 'SIGNAL').setVisible(true);
				block.getInput('ADD' + id + 'STATE2').setVisible(true);
				block.getInput('ADD' + id + 'STATE3').setVisible(false);
			}
			if (v == 'andWhereBetween' || v == 'orWhereBetween') {
				block.getInput('ADD' + id).setVisible(true);
				block.getInput('ADD' + id + 'SIGNAL').setVisible(false);
				block.getInput('ADD' + id + 'STATE2').setVisible(true);
				block.getInput('ADD' + id + 'STATE3').setVisible(true);
			}
			if (v == 'andWhereIsNull' || v == 'andWhereNotNull'
					|| v == 'orWhereIsNull' || v == 'orWhereNotNull') {
				block.getInput('ADD' + id).setVisible(true);
				block.getInput('ADD' + id + 'SIGNAL').setVisible(false);
				block.getInput('ADD' + id + 'STATE2').setVisible(false);
				block.getInput('ADD' + id + 'STATE3').setVisible(false);
			}
			if (v == 'whereIn' || v == 'whereNotIn') {
				block.getInput('ADD' + id).setVisible(true);
				block.getInput('ADD' + id + 'SIGNAL').setVisible(false);
				block.getInput('ADD' + id + 'STATE2').setVisible(true);
				block.getInput('ADD' + id + 'STATE3').setVisible(false);
			}
		};
		var getDDField = function(idx) {
			return new Blockly.FieldDropdown(FILTER, function(input_type) {
				appendMutationFields(input_type, idx);
			});
		};
		for (var i = 1; i <= block.itemCount_; i++) {
			if (!block.getInput('ADD' + i)) {
				var fdpFilter = new getDDField(i);
				block.appendValueInput('ADD' + i).appendField(fdpFilter,'ADD' + i + 'FILTER').setVisible(true);
				block.appendDummyInput('ADD' + i + 'SIGNAL').appendField(new Blockly.FieldDropdown(WHERE), 'ADD' + i + 'WHERE').setVisible(true);
				block.appendValueInput('ADD' + i + 'STATE2').setVisible(true);
				block.appendValueInput('ADD' + i + 'STATE3').setVisible(false);
			}
		}
		if (ar_wheres && ar_wheres[0])
			ar_wheres.forEach(function(v, x) {
				appendMutationFields(v, x + 1);
			});
		while (block.getInput('ADD' + i)) {
			block.removeInput('ADD' + i);
			block.removeInput('ADD' + i + 'STATE1');
			block.removeInput('ADD' + i + 'SIGNAL');
			block.removeInput('ADD' + i + 'STATE2');
			block.removeInput('ADD' + i + 'STATE3');
			i++;
		}
	};
	/** ***** Mostrar Input Order *************** */
	var UpdateShape_order = function(block, order) {
		if (block.getInput("order_value") != null) {
			if (order == 'order_by_asc' || order == 'order_by_desc') {
				block.getInput("order_value").setVisible(true);
				block.moveInputBefore("order_value", "find");
			} else {
				block.getInput("order_value").setVisible(false);
			}
		}
	};
	
	/** ***** Mostrar Input Estatistica *************** */
	var UpdateShape_statistics = function(block, operation) {
		if (block.getInput("statisValue") != null) {
			if (operation != 'get_counting') {
				block.getInput("statisValue").setVisible(true);
				block.moveInputBefore("statisValue", "value2");
			} else {
				block.getInput("statisValue").setVisible(false);
			}
		}
	};
	
	/** ***** Mostrar Input Operation *************** */
	var tempParams=[];
	var UpdateShape_operation = function(block, operation) {
		var operationName = operation.split('::').pop().split('//')[0],
		 	serviceName = operation.split('$$')[0];
		var atualParams=[];
		var numParams =0;
		
		$(globalAjaxData).find('services>'+serviceName+'>operations>'+operationName+'>params>*').each(function(i, f) {
			var tipo = $(f).text().split(".").pop();
			if (!block.getInput(tipo+"%%param"+i)){
				var valueShow = i+1;
				block.appendValueInput(tipo+"%%param"+i).appendField("input "+valueShow);
			}					
			atualParams.push(tipo+"%%param"+i);
			numParams++;	
		});	
		while(numParams<=tempParams.length){
			block.removeInput(tempParams[numParams]);
			numParams++;
		}
		tempParams=atualParams.slice();	
	};

	/** ***** Mostrar input Collector *************** */
	var UpdateShape_collectors = function(block, collectors) {
		if (block.getInput("collector_value") != null) {
			if (collectors != 'counting') {
				block.getInput("collector_value").setVisible(true);
				block.moveInputBefore("collector_value", "value2");
			} else {
				block.getInput("collector_value").setVisible(false);
			}
		}
	};
	/** ************* Mutação Mutation Number ************* */
	var UpdateShape_mut_num = function(block, mutation_num, limit) {
		if (block.getInput("empty_table") != null && mutation_num >=1) {
				block.getInput("empty_table").setVisible(true);
		} else if(block.getInput("empty_table") != null) {
			block.getInput("empty_table").setVisible(false);
		}
		if (block.getInput("get_pa") != null && mutation_num >=1 ) {
				block.getInput("get_pa").setVisible(false);
		} else if(block.getInput("get_pa") != null && limit == 'UMM') {
			block.getInput("get_pa").setVisible(true);
		}else if(block.getInput("get_pa") != null && limit == 'limit') {
			block.getInput("get_pa").setVisible(false);
		}else if(block.getInput("get_pa") != null  && limit == 'TODOSS') {
			block.getInput("get_pa").setVisible(false);
		}else if(block.getInput("get_pa") != null ) {
			block.getInput("get_pa").setVisible(true);
		}
		if (block.getInput("keepcon") != null && mutation_num >=1) {
				block.getInput("keepcon").setVisible(true);
		} else if(block.getInput("keepcon") != null) {
			block.getInput("keepcon").setVisible(false);
		}
		if (block.getInput("limit_value") != null && limit == 'limit') {
			block.getInput("limit_value").setVisible(true);
			block.moveInputBefore("limit_value", "value2");
		} else if(block.getInput("limit_value") != null) {
				block.getInput("limit_value").setVisible(false);
		}
	};
	/** ************* Mutações Checkbox ************* */
	var UpdateShape_checkbox = function(block, pxchecked) {
		if (block.getInput("edited") != null) {
			if (pxchecked) {
				block.appendValueInput("param_id");
				block.moveInputBefore("param_id", "value2");
			} else {
				block.removeInput('param_id');
			}
		}
		if (block.getInput("value_selected") != null) {
			if (pxchecked) {
				block.appendDummyInput("tete").appendField("unselecteds");
				block.appendStatementInput("value_unselected");
			} else {
				block.removeInput('tete');
				block.removeInput('value_unselected');
			}
		}
	};
	
	/** ************* Mutações Checkbox AJAX ************* */
	var UpdateShape_ajax = function(block, pxchecked) {
		if (block.getInput("ajaxcomponents") != null) {
			if (pxchecked) {
				block.getInput("ajaxcomponents").setVisible(true);
			} else {
				block.getInput("ajaxcomponents").setVisible(false);
			}
		}
	};

	/** ********** Adicionar Inserts ********* */
	var UpdateShape_inserts = function(block,contador) {
		for (var i = 1; i <= contador; i++) {
			if (!block.getInput('SEPARATOR' + i)) {
				block.appendDummyInput('SEPARATORIL' + i).appendField("add persist");
				block.appendStatementInput('SEPARATOR' + i);
			}
		}
		while (block.getInput('SEPARATOR' + i)) {
			block.removeInput('SEPARATOR' + i);
			block.removeInput('SEPARATORIL' + i);
			i++;
		}
	};
	
	/** ********** AdicionarParams ********* */
	var UpdateShape_insertParams = function(block,contador) {
		for (var i = 1; i <= contador; i++) {
			if (!block.getInput('PARAM' + i)) {
				block.appendDummyInput('PARAMIL' + i).appendField("Param "+i).appendField(new Blockly.FieldTextInput('insert param name'), 'paramy'+i);
				block.appendValueInput('PARAM' + i);
			}
		}
		while (block.getInput('PARAM' + i)) {
			block.removeInput('PARAM' + i);
			block.removeInput('PARAMIL' + i);
			i++;
		}
	};
	
	/** ********** AdicionarFilters ********* */
	var UpdateShape_insertFilters = function(block, contador) {
		for (var i = 1; i <= contador; i++) {
			if (!block.getInput('FILTER' + i)) {
				block.appendValueInput('FILTER' + i);
				block.appendDummyInput('FILTER' + i + 'SIGNAL').appendField(new Blockly.FieldDropdown(WHERE_FIL), 'FILTER' + i + 'WHERE');
				block.appendValueInput('FILTER' + i + 'STATE2');
			}
		}
		while (block.getInput('FILTER' + i)) {
			block.removeInput('FILTER' + i);
			block.removeInput('FILTER' + i + 'SIGNAL');
			block.removeInput('FILTER' + i + 'STATE2');
			i++;
		}
	};

	/** ********** AdicionarConcats ********* */
	var UpdateShape_insertConcats = function(block,contador) {
		for (var i = 1; i <= contador; i++) {
			if (!block.getInput('CONCAT' + i)) {
				block.appendValueInput('CONCAT' + i);
			}
		}
		while (block.getInput('CONCAT' + i)) {
			block.removeInput('CONCAT' + i);
			i++;
		}
	};
	
	/** ***** Inserts do Crud *************** */
	var UpdateShape_crud = function(block, crud) {
		if (block.getInput("param_value") != null) {
			if (crud == 'delete') {
				block.getInput("param_value").setVisible(true);
				block.getInput("value2").setVisible(false);
			} else if (crud == 'update') {
				block.getInput("param_value").setVisible(true);
				block.getInput("value2").setVisible(true);
			}else if (crud == 'insert'){
				block.getInput("param_value").setVisible(false);
				block.getInput("value2").setVisible(true);
			}
		}
	};

	/** ************ COMPOSIÇÃO DO FILTRO WHERE **************************** */
	var ListMutationSettings = {
		mutationToDom : function() {
			var container = document.createElement('mutation');
			var order = this.getFieldValue('orderdrop');
			container.setAttribute('order', order);
			var operation = this.getFieldValue('operdrop');
			container.setAttribute('operation', operation);
			var limit = this.getFieldValue('find');
			container.setAttribute('limit', limit);
			var collectors = this.getFieldValue('collectors');
			container.setAttribute('collectors', collectors);
			var crud = this.getFieldValue('cruddrop');
			container.setAttribute('crud', crud);
			var statistDrop = this.getFieldValue('statistDrop');
			container.setAttribute('statistDrop', statistDrop);
			var ajax = this.getFieldValue('AJAX');
			container.setAttribute('ajax', ajax);
			container.setAttribute('count', this.itemCount_);
			for (var x = 1; x <= this.itemCount_; x++) {
				var itemInput = this.getFieldValue('ADD' + x + 'FILTER');
				container.setAttribute('mutation-' + x, itemInput);
			}
			return container;
		},
		domToMutation : function(xmlElement) {
			var block = this;
			var arr = [];
			var order = xmlElement.getAttribute('order');
			var operation = xmlElement.getAttribute('operation');
			var limit = xmlElement.getAttribute('limit');
			var crud = xmlElement.getAttribute('crud');
			var collectors = xmlElement.getAttribute('collectors');
			var ajax = xmlElement.getAttribute('ajax');
			var statistDrop = xmlElement.getAttribute('statistDrop');
			this.itemCount_ = parseInt(xmlElement.getAttribute('count'));
			for (var x = 1; x <= this.itemCount_; x++) {
				arr.push(xmlElement.getAttribute('mutation-' + x));
			}
			UpdateShape_where(block, arr);
			UpdateShape_order(block, order);
			UpdateShape_operation(block, operation);
			UpdateShape_crud(block, crud);
			UpdateShape_collectors(block, collectors);
			UpdateShape_mut_num(block, this.itemCount_, limit);
			UpdateShape_ajax(block, ajax);
			UpdateShape_statistics(block, statistDrop);
		},
		decompose : function(workspace) {
			var containerBlock = workspace.newBlock('where_t');
			containerBlock.initSvg();
			var connection = containerBlock.getInput('SCRIPT').connection;
			for (var i = 1; i <= this.itemCount_; i++) {
				var itemBlock = workspace.newBlock('where');
				itemBlock.initSvg();
				connection.connect(itemBlock.previousConnection);
				connection = itemBlock.nextConnection;
			}
			return containerBlock;
		},
		compose : function(containerBlock) {
			var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
			var connections = [];
			while (itemBlock) {
				connections.push(itemBlock.valueConnection_);
				itemBlock = itemBlock.nextConnection
						&& itemBlock.nextConnection.targetBlock();
			}
			this.itemCount_ = connections.length;
			var block = this;
			UpdateShape_where(block, connections);
			UpdateShape_mut_num(block, this.itemCount_, '');
			for (var i = 1; i <= this.itemCount_; i++) {
				Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
			}
		}
	};
	
	/** ************ COMPOSIÇÃO DO FILTRO PARAMS **************************** */
	var ParamsMutationSettings = {
			mutationToDom : function() {
				var container = document.createElement('mutation');
				container.setAttribute('count', this.itemCount_);
				return container;
			},
			domToMutation : function(xmlElement) {
				var block = this;
				this.itemCount_ = parseInt(xmlElement.getAttribute('count'));
				UpdateShape_insertParams(block,this.itemCount_);
			},
			decompose : function(workspace) {
				var containerBlock = workspace.newBlock('param_t');
				containerBlock.initSvg();
				var connection = containerBlock.getInput('SCRIPT').connection;
				for (var i = 0; i < this.itemCount_; i++) {
					var itemBlock = workspace.newBlock('param');
					itemBlock.initSvg();
					connection.connect(itemBlock.previousConnection);
					connection = itemBlock.nextConnection;
				}
				return containerBlock;
			},
			compose : function(containerBlock) {
				var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
				var block = this;
				var connections = [];
				while (itemBlock) {
					connections.push(itemBlock.valueConnection_);
					itemBlock = itemBlock.nextConnection
							&& itemBlock.nextConnection.targetBlock();
				}
				this.itemCount_ = connections.length;
				var Contador = this.itemCount_;
				UpdateShape_insertParams(block,Contador);
				for (var i = 1; i <= this.itemCount_; i++) {
					Blockly.Mutator.reconnect(connections[i], this, 'PARAM'+ i);
				}
			}
		};
		
			/** ************ COMPOSIÇÃO DO FILTRO FILTERS **************************** */
	var FilterMutationSettings = {
			mutationToDom : function() {
				var container = document.createElement('mutation');
				container.setAttribute('count', this.itemCount_);
				return container;
			},
			domToMutation : function(xmlElement) {
				var block = this;
				this.itemCount_ = parseInt(xmlElement.getAttribute('count'));
				UpdateShape_insertFilters(block,this.itemCount_);
			},
			decompose : function(workspace) {
				var containerBlock = workspace.newBlock('filter_t');
				containerBlock.initSvg();
				var connection = containerBlock.getInput('SCRIPT').connection;
				for (var i = 0; i < this.itemCount_; i++) {
					var itemBlock = workspace.newBlock('filter');
					itemBlock.initSvg();
					connection.connect(itemBlock.previousConnection);
					connection = itemBlock.nextConnection;
				}
				return containerBlock;
			},
			compose : function(containerBlock) {
				var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
				var block = this;
				var connections = [];
				while (itemBlock) {
					connections.push(itemBlock.valueConnection_);
					itemBlock = itemBlock.nextConnection
							&& itemBlock.nextConnection.targetBlock();
				}
				this.itemCount_ = connections.length;
				var Contador = this.itemCount_;
				UpdateShape_insertFilters(block,Contador);
				for (var i = 1; i <= this.itemCount_; i++) {
					Blockly.Mutator.reconnect(connections[i], this, 'PARAM'+ i);
				}
			}
		};
	
	window.IGRP_BLOCKLY_ELEMENTS = {			
		/** ******* ÍNICIO IGRP_BLOCKLY_ELEMENTS *************** */		
		/** ******* COMEÇO ELEMENTOS COM FILTRO WHERE *************** */		
		/** ******* TABELA ******* */
		listar : $.extend({
			init : function(block) {
				/**** MUTAÇÂO ORDER *****/
				var orderlist = IGRP_BLOCKLY_DROPS.order;
				var dropdown2 = new Blockly.FieldDropdown(orderlist, function(order) {
					UpdateShape_order(block, order);
				});
				block.appendDummyInput("enter_order").appendField("order").appendField(dropdown2, 'orderdrop');
				block.appendValueInput("order_value").setVisible(false);
				block.moveInputBefore("enter_order", "value2");
				/***** MUTAÇÃO LIMIT ****/
				var limite = IGRP_BLOCKLY_DROPS.findList;
				var dropdown = new Blockly.FieldDropdown(limite, function(limit) {
					UpdateShape_mut_num (block, '', limit);				
				});
				block.appendDummyInput("find").appendField("list").appendField(dropdown, 'find');
				block.appendDummyInput("limit_value").appendField("limit value")
					 .appendField(new Blockly.FieldTextInput(''), 'limit').setVisible(false);	
				block.moveInputBefore("find", "value2");
				/***** MUTAÇÃO EMPTY TABLE ****/
				block.appendDummyInput("empty_table").appendField("empty table?")
					.appendField(new Blockly.FieldCheckbox("FALSE"), 'FILL').setVisible(false);
				block.moveInputBefore("empty_table", "enter_order");
			}
		}, ListMutationSettings),
		
		/** ******* BLOCOS_SIMPLES_DAO ******* */		
		list_simple_dao : $.extend({
			init : function(block) {
			/***** MUTAÇÃO LIMIT ****/
			var limite = IGRP_BLOCKLY_DROPS.findListDao;
			var dropdown = new Blockly.FieldDropdown(limite, function(limit) {
				UpdateShape_mut_num(block,'', limit);
			});
			block.appendDummyInput("keepcon").appendField("keep connection?")
				.appendField(new Blockly.FieldCheckbox("FALSE"), 'checkbox').setVisible(false);
			block.moveInputBefore("keepcon", "value2");
			block.appendDummyInput("find").appendField(dropdown, 'find');
			block.appendDummyInput("limit_value").appendField("limit value")
				 .appendField(new Blockly.FieldTextInput(''), 'limit').setVisible(false);	
			block.moveInputBefore("find", "value2");
			block.appendValueInput("get_pa").appendField("find").setVisible(false);
			block.moveInputBefore("get_pa", "value2");
			}
		}, ListMutationSettings),
		
		update_simple_dao : $.extend({
			init : function(block) {
				block.appendDummyInput("keepcon").appendField("keep connection?")
					.appendField(new Blockly.FieldCheckbox("FALSE"), 'KEEP').setVisible(false);
				block.moveInputBefore("keepcon", "value2");
			}			
		}, ListMutationSettings),
		
		apagar : $.extend({
			init : function(block) {
				block.appendDummyInput("keepcon").appendField("keep connection?")
					.appendField(new Blockly.FieldCheckbox("FALSE"), 'KEEP').setVisible(false);
				block.moveInputBefore("keepcon", "value2");
			}		
		}, ListMutationSettings),		
		
		/** ******* BLOCOS_SERVICE ******* */		
		listar_service: $.extend({
			init : function(block) {
				/**** MUTAÇÂO OPERATION *****/
				var serverlist = IGRP_BLOCKLY_DROPS.service_list;
				var atualOperationlist = IGRP_BLOCKLY_DROPS.operation_list;
				var serverdrop = new Blockly.FieldDropdown(serverlist);
				block.appendDummyInput("service").appendField("Service").appendField(serverdrop, 'service');
				var operdrop = new Blockly.FieldDropdown(atualOperationlist, function(operation) {
					UpdateShape_operation(block, operation);				  
				});			
				block.appendDummyInput("enter_operation").appendField("operation").appendField(operdrop, 'operdrop');
				block.moveInputBefore("service", "value2");
				block.moveInputBefore("enter_operation", "value2");
				/***** MUTAÇÃO LIMIT ****/
				var limite = IGRP_BLOCKLY_DROPS.findList;
				var dropdown = new Blockly.FieldDropdown(limite, function(limit) {
					UpdateShape_mut_num(block, '', limit);
				});
				block.appendDummyInput("find").appendField("list").appendField(dropdown, 'find');
				block.appendDummyInput("limit_value").appendField("limit value")
					 .appendField(new Blockly.FieldTextInput(''), 'limit').setVisible(false);	
				block.moveInputBefore("find", "value2");
			}
		}, ListMutationSettings),
		
		list_simple_service : $.extend({
			init : function(block) {
			var atualOperationlist = IGRP_BLOCKLY_DROPS.operation_list;
			var operdrop = new Blockly.FieldDropdown(atualOperationlist, function(operation) {
				UpdateShape_operation(block, operation);				  
			});
			block.appendDummyInput("enter_operation").appendField("operation").appendField(operdrop, 'operdrop');
			block.moveInputBefore("enter_operation", "value2");
			var limite = IGRP_BLOCKLY_DROPS.findList;
			var dropdown = new Blockly.FieldDropdown(limite, function(limit) {
				UpdateShape_mut_num(block, '', limit);
			});
			block.appendDummyInput("find").appendField("list").appendField(dropdown, 'find');
			block.moveInputBefore("find", "value2");
			}
		}, ListMutationSettings),
		
		insert_simple_service : $.extend({
			init : function(block) {
				var atualOperationlist = IGRP_BLOCKLY_DROPS.operation_list;
				var operdrop = new Blockly.FieldDropdown(atualOperationlist, function(operation) {
					UpdateShape_operation(block, operation);				  
				});	
				block.appendDummyInput("enter_operation").appendField("operation").appendField(operdrop, 'operdrop');
				block.moveInputBefore("enter_operation", "value2");
				}
		}, ListMutationSettings),
		
		update_simple_service : $.extend({
			init : function(block) {
				var atualOperationlist = IGRP_BLOCKLY_DROPS.operation_list;
				var operdrop = new Blockly.FieldDropdown(atualOperationlist, function(operation) {
					UpdateShape_operation(block, operation);				  
				});	
				block.appendDummyInput("enter_operation").appendField("operation").appendField(operdrop, 'operdrop');
				block.moveInputBefore("enter_operation", "value2");
				}
		}, ListMutationSettings),
		
		apagar_service : $.extend({
			init : function(block) {
				var atualOperationlist = IGRP_BLOCKLY_DROPS.operation_list;
				var operdrop = new Blockly.FieldDropdown(atualOperationlist, function(operation) {
					UpdateShape_operation(block, operation);				  
				});	
				block.appendDummyInput("enter_operation").appendField("operation").appendField(operdrop, 'operdrop');
				}
		}, ListMutationSettings),
		
		grafico : $.extend({
		}, ListMutationSettings),
		
		/***** BLOCO VERTICAL MENU *******/
		verticalmenu : $.extend({		
			init : function(block) {
				/**** MUTAÇÂO CHECK SUBMIT AJAX *****/
				var checkbox = new Blockly.FieldCheckbox('TRUE', function(pxchecked) {
					UpdateShape_ajax(block, pxchecked);
				});
				block.appendDummyInput("ajax").appendField("refresh components?").appendField(checkbox,'AJAX');
				block.appendDummyInput("ajaxcomponents").appendField(new Blockly.FieldTextInput('insert name components'), 'namecompo').setVisible(false);
				block.moveInputBefore("ajax", "value2");
				block.moveInputBefore("ajaxcomponents", "value2");
			},
		}, ListMutationSettings),

		combo_dao : $.extend({
		}, ListMutationSettings),

		statbox : $.extend({
			init : function(block) {
				/**** MUTAÇÂO CHECK SUBMIT AJAX *****/
				var statistDbList = IGRP_BLOCKLY_DROPS.stat_db;
				var statistDrop = new Blockly.FieldDropdown(statistDbList, function(operation) {
					UpdateShape_statistics(block, operation);				  
				});	
				block.appendDummyInput("enter_statistics").appendField(statistDrop, 'statistDrop');
				block.appendValueInput("statisValue").setVisible(false);
				block.moveInputBefore("enter_statistics", "value2");
			},
		}, ListMutationSettings),

		index_editar : $.extend({
		}, ListMutationSettings),

		separator : $.extend({
		}, ListMutationSettings),

		formlist : $.extend({
		}, ListMutationSettings),
		
		circle_statbox : $.extend({
		}, ListMutationSettings),
		
		filterr : $.extend({
		}, FilterMutationSettings),
		
		/** ******* FIM ELEMENTOS COM FILTRO WHERE *************** */	
		/** ******* COMEÇO ELEMENTOS COM FILTRO PARAMS *************** */		
		/********** BLOCO_CUSTOM_REPORT *******/
		
		custombutReport : $.extend({			
		}, ParamsMutationSettings),
		
		paramsVertical : $.extend({			
		}, ParamsMutationSettings),
		
		core_fn_link : $.extend({			
		}, ParamsMutationSettings),
		
		/***** BLOCO SAVE FORM *******/
		inserir_dao : {
			init : function(block) {
				/**** MUTAÇÂO CHECK FINDONE *****/
				var checkbox = new Blockly.FieldCheckbox('FALSE', function(pxchecked) {
					UpdateShape_checkbox(block, pxchecked);
				});
				block.appendDummyInput("edited").appendField("edit?").appendField(checkbox,'EDIT');
				block.moveInputBefore("edited", "value2");
			},
			mutationToDom : function() {
				var container = document.createElement('mutation');
				container.setAttribute('count', this.itemCount_);
				var pxchecked = (this.getFieldValue('EDIT')== 'TRUE');
				container.setAttribute('pxchecked', pxchecked);
				return container;
			},
			domToMutation : function(xmlElement) {
				var block = this;
				var pxchecked = (xmlElement.getAttribute('pxchecked')=='true');
				this.itemCount_ = parseInt(xmlElement.getAttribute('count'));
				UpdateShape_checkbox(block, pxchecked);
				UpdateShape_inserts(block,this.itemCount_);
			},
			decompose : function(workspace) {
				var containerBlock = workspace.newBlock('insert_t');
				containerBlock.initSvg();
				var connection = containerBlock.getInput('SCRIPT').connection;
				for (var i = 0; i < this.itemCount_; i++) {
					var itemBlock = workspace.newBlock('separatori');
					itemBlock.initSvg();
					connection.connect(itemBlock.previousConnection);
					connection = itemBlock.nextConnection;
				}
				return containerBlock;
			},
			compose : function(containerBlock) {
				var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
				var block = this;
				var connections = [];
				while (itemBlock) {
					connections.push(itemBlock.valueConnection_);
					itemBlock = itemBlock.nextConnection
							&& itemBlock.nextConnection.targetBlock();
				}
				this.itemCount_ = connections.length;
				var Contador = this.itemCount_;
				UpdateShape_inserts(block,Contador);
				for (var i = 1; i <= this.itemCount_; i++) {
					Blockly.Mutator.reconnect(connections[i], this, 'SEPARATOR'+ i);
				}
			}
		},
		
		/***** BLOCO_CONCAT *******/
		concat : {
			mutationToDom : function() {
				var container = document.createElement('mutation');
				container.setAttribute('count', this.itemCount_);
				return container;
			},
			domToMutation : function(xmlElement) {
				var block = this;
				this.itemCount_ = parseInt(xmlElement.getAttribute('count'));
				UpdateShape_insertConcats(block,this.itemCount_);
			},
			decompose : function(workspace) {
				var containerBlock = workspace.newBlock('concat_t');
				containerBlock.initSvg();
				var connection = containerBlock.getInput('SCRIPT').connection;
				for (var i = 0; i < this.itemCount_; i++) {
					var itemBlock = workspace.newBlock('concat');
					itemBlock.initSvg();
					connection.connect(itemBlock.previousConnection);
					connection = itemBlock.nextConnection;
				}
				return containerBlock;
			},
			compose : function(containerBlock) {
				var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
				var block = this;
				var connections = [];
				while (itemBlock) {
					connections.push(itemBlock.valueConnection_);
					itemBlock = itemBlock.nextConnection
							&& itemBlock.nextConnection.targetBlock();
				}
				this.itemCount_ = connections.length;
				var Contador = this.itemCount_;
				UpdateShape_insertConcats(block,Contador);
				for (var i = 1; i <= this.itemCount_; i++) {
					Blockly.Mutator.reconnect(connections[i], this, 'CONCAT'+ i);
				}
			}
		},

		/***** BLOCO CHECKBOX EM TABELA *******/
		checkbox_table : {
			init : function(block) {
				var checkbox = new Blockly.FieldCheckbox("FALSE", function(pxchecked) {
					UpdateShape_checkbox(block, pxchecked);
				});
				block.appendDummyInput().appendField(checkbox, 'UNSEL');
				block.appendStatementInput("value_selected");
			
				block.mutationToDom = function() {
				var container = document.createElement('mutation');
				var pxchecked = (this.getFieldValue('UNSEL') == 'TRUE');
				container.setAttribute('pxchecked', pxchecked);
				return container;
				};
				block.domToMutation = function(xmlElement) {
				var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true');
				UpdateShape_checkbox(block,pxchecked);
				};
			}
		},

		/***** BLOCO CORE SET *******/
		core_fun_set : {
			init : function(block) {
				var options = IGRP_BLOCKLY_DROPS.core_set;
				var dropdown = new Blockly.FieldDropdown(options, function(option) {
					this.sourceBlock_.updateShape_(option);
				});
				block.getInput("CORE").appendField(dropdown, 'CORE_FUNCTION');
				block.setInputsInline(true);
				block.appendValueInput("value1").setVisible(false);
				block.appendValueInput("value2").setVisible(false);
				block.appendValueInput("value3").setVisible(false);
				block.appendValueInput("value4").setVisible(false);
				
				block.mutationToDom = function() {
					var container = document.createElement('mutation');
					var itemInput = this.getFieldValue('CORE_FUNCTION');
					container.setAttribute('hover_type', itemInput);
					return container;
				}; 
				block.domToMutation = function(xmlElement) {
					var itemInput = xmlElement.getAttribute('hover_type');
					this.updateShape_(itemInput);
				}, 
				block.updateShape_ = function(input_type) {
					var type = input_type;
					if (type == 'enviar_email') {
						block.getInput("value1").setVisible(true);
						block.getInput("value2").setVisible(true);
						block.getInput("value3").setVisible(true);
						block.getInput("value4").setVisible(true);
					} else if(type == 'messageInfoLink') {
						block.getInput("value1").setVisible(true);
						block.getInput("value2").setVisible(false);
						block.getInput("value3").setVisible(false);
						block.getInput("value4").setVisible(false);
					}else {
						block.getInput("value1").setVisible(false);
						block.getInput("value2").setVisible(false);
						block.getInput("value3").setVisible(false);
						block.getInput("value4").setVisible(false);
					}
				};
			}
		},
		/******* BLOCO CORE GET *******/
		core_fun_get : $.extend({
			init : function(block) {
				var options = IGRP_BLOCKLY_DROPS.core_get;
				var dropdown = new Blockly.FieldDropdown(options, function(
						option) {
					this.sourceBlock_.updateShape_(option);
				});
				var domainsOptions = new Blockly.FieldDropdown(IGRP_BLOCKLY_DROPS.domains);
				block.getInput("CORE").appendField(dropdown, 'CORE_FUNCTION');
				block.setInputsInline(true);
				block.appendDummyInput("value1").appendField(new Blockly.FieldTextInput('insert name param'), 'value1');
				block.appendDummyInput("domains").appendField("domain").appendField(domainsOptions, 'domaindrop')
					.appendField("value").setVisible(false);
				block.appendValueInput("value_default").setVisible(false);
				block.appendDummyInput("valueLink").appendField(new Blockly.FieldDropdown(IGRP_BLOCKLY_DROPS.app), 'value2')
				.appendField(new Blockly.FieldDropdown(IGRP_BLOCKLY_DROPS.pages), 'value3')
				.appendField(new Blockly.FieldTextInput('name action'), 'value4')
				.setVisible(false);
				//block.setMutator(new Blockly.Mutator(['param']));
				block.mutationToDom = function() {
					var container = document.createElement('mutation');
					var itemInput = this.getFieldValue('CORE_FUNCTION');
					container.setAttribute('hover_type', itemInput);
					return container;
				},
				block.domToMutation = function(xmlElement) {
					var itemInput = xmlElement.getAttribute('hover_type');
					this.updateShape_(itemInput);
				},
				block.updateShape_ = function(input_type) {
					var type = input_type;
					  if (type == 'String::get_domain') {
						block.getInput("domains").setVisible(true);
						block.getInput("value_default").setVisible(true);
						block.getInput("value1").setVisible(false);
						block.getInput("valueLink").setVisible(false);
					} else if (type == 'get_igrp_link') {
						block.getInput("domains").setVisible(false);
						block.getInput("value_default").setVisible(false);
						block.getInput("value1").setVisible(false);
						block.getInput("valueLink").setVisible(true);
						block.getInput("mutateParam").setVisible(true);
					}else if (type == 'String::get_username_by_id') {
						block.getInput("domains").setVisible(false);
						block.getInput("value_default").setVisible(true);
						block.getInput("value1").setVisible(false);
						block.getInput("valueLink").setVisible(false);
					} else {
						block.getInput("domains").setVisible(false);
						block.getInput("value_default").setVisible(false);
						block.getInput("value1").setVisible(true);
						block.getInput("valueLink").setVisible(false);
					}
				};
			}
		}, ParamsMutationSettings),
		
		/******* BLOCO MESSAGES REMOTE *******/
		set_properties : {
			init : function(block) {
				var options = IGRP_BLOCKLY_DROPS.prop;
				var dropdown = new Blockly.FieldDropdown(options, function(
						option) {
					this.sourceBlock_.updateShape_(option);
				});
				var messagesOptions = new Blockly.FieldDropdown(IGRP_BLOCKLY_DROPS.messages);
				block.getInput("set_proper").appendField(dropdown, 'set_prop');
				block.setInputsInline(true);
				block.appendDummyInput("name").appendField(new Blockly.FieldTextInput('insert name'), 'name').setVisible(false);
				block.appendDummyInput("messages").appendField(messagesOptions, 'messagedrop').setVisible(false);
				block.appendValueInput("value1");
				block.mutationToDom = function() {
					var container = document.createElement('mutation');
					var itemInput = this.getFieldValue('set_prop');
					container.setAttribute('hover_type', itemInput);
					return container;
				},
				block.domToMutation = function(xmlElement) {
					var itemInput = xmlElement.getAttribute('hover_type');
					this.updateShape_(itemInput);
				},
				block.updateShape_ = function(input_type) {
					var type = input_type;
					  if (type == 'add_message') {
						block.getInput("messages").setVisible(true);
						block.getInput("name").setVisible(false);
					}  else {
						block.getInput("messages").setVisible(false);
						block.getInput("name").setVisible(true);
					}
				};
			}
		},

	};
	
	
	/** ******* FIM IGRP_BLOCKLY_ELEMENTS *************** */
	/******* ** BLOCO SET DAO *******/

	$(document).on('set-dao-block-init',function(e, block, dao) {
		var options = IGRP_BLOCKLY_DROPS.daos_set[dao];
		var dropdown = new Blockly.FieldDropdown(options,function(option) {
			this.sourceBlock_.updateShape_(option);
		});
		block.setColour(160);
		block.getInput("value1").appendField(dropdown, 'DAO_FIELD')
			.appendField(new Blockly.FieldImage(path+ "/core/blockly/blockly/media/dao.svg",15, 15, "*"));
		
		block.mutationToDom = function() {
			var container = document.createElement('mutation');
			var itemInput = this.getFieldValue('DAO_FIELD');
			container.setAttribute('hover_type',itemInput);
			return container;
		},
		block.domToMutation = function(xmlElement) {
			var itemInput = xmlElement.getAttribute('hover_type');
			this.updateShape_(itemInput);
		},

		block.updateShape_ = function(input_type) {
			var strSplit = input_type.split('::'), type = strSplit[0], inputExists = this.getInput('dao_rela');
			if (type.includes("_FK#")) {
				if (!inputExists) {
					this.setInputsInline(true);
				}
			}else{
				try {
					this.setInputsInline(false);
				} catch (err) {
				}		
			}
		};
	});

	/******* BLOCO GET DAO *******/

	$(document).on('get-dao-block-init',function(e, block, dao) {
		var options = IGRP_BLOCKLY_DROPS.daos[dao];
		var dropdown = new Blockly.FieldDropdown(options,function(option) {
			this.sourceBlock_.updateShape_(option);
		});
		block.setColour(160);
		block.appendDummyInput().appendField("get " + dao).appendField(dropdown, 'DAO_FIELD')
			.appendField(new Blockly.FieldImage(path+ "/core/blockly/blockly/media/dao.svg",15, 15, "*"));
		block.setInputsInline(true);
		block.setOutput(true);
		
		block.mutationToDom = function() {
			var container = document.createElement('mutation');
			var itemInput = this.getFieldValue('DAO_FIELD');
			container.setAttribute('hover_type',itemInput);
			return container;
		};
		block.domToMutation = function(xmlElement) {
			var itemInput = xmlElement.getAttribute('hover_type');
			this.updateShape_(itemInput);
		};
		block.updateShape_ = function(input_type) {
			var strSplit = input_type.split('::'), type = strSplit[0], inputExists = this.getInput('dao_rela');
			if (type.includes("_FK#")) {
				if (!inputExists) {
					this.appendValueInput('dao_rela').setCheck();
				}
			} else{
				try {
					this.removeInput('dao_rela');
				} catch (err) {
				}	
			}		
		};
	});

})();