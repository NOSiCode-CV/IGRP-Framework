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
				block.appendValueInput('ADD' + i).appendField(fdpFilter,
						'ADD' + i + 'FILTER').setVisible(true);
				block.appendDummyInput('ADD' + i + 'SIGNAL').appendField(
						new Blockly.FieldDropdown(WHERE), 'ADD' + i + 'WHERE')
						.setVisible(true);
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
	/** ***** Mostrar input Limit *************** */
	var UpdateShape_limit = function(block, limit) {
		if (block.getInput("limit_value") != null) {
			if (limit == 'limit') {
				block.getInput("limit_value").setVisible(true);
				block.moveInputBefore("limit_value", "value2");
			} else {
				block.getInput("limit_value").setVisible(false);
			}
		}
	};
	/** ************* Mutação Mutation Number ************* */
	var UpdateShape_mut_num = function(block, mutation_num) {
		if (block.getInput("empty_table") != null) {
			if (mutation_num >=1) {
				block.getInput("empty_table").setVisible(true);
			} else {
				block.getInput("empty_table").setVisible(false);
			}
		}
		if (block.getInput("get_pa") != null) {
			if (mutation_num >=1) {
				block.getInput("get_pa").setVisible(false);
			} else {
				block.getInput("get_pa").setVisible(true);
			}
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
	
	/** ***** Inserts do Crud *************** */
	var UpdateShape_crud = function(block, crud) {
		console.log(crud);
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
			var limit = this.getFieldValue('find');
			container.setAttribute('limit', limit);
			var crud = this.getFieldValue('cruddrop');
			container.setAttribute('crud', crud);
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
			var limit = xmlElement.getAttribute('limit');
			var crud = xmlElement.getAttribute('crud');
			this.itemCount_ = parseInt(xmlElement.getAttribute('count'));
			for (var x = 1; x <= this.itemCount_; x++) {
				arr.push(xmlElement.getAttribute('mutation-' + x));
			}
			UpdateShape_where(block, arr);
			UpdateShape_order(block, order);
			UpdateShape_limit(block, limit);
			UpdateShape_crud(block, crud);
			UpdateShape_mut_num(block, this.itemCount_);
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
			UpdateShape_mut_num(block, this.itemCount_);
			for (var i = 1; i <= this.itemCount_; i++) {
				Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
			}
		}
	};
	
	window.IGRP_BLOCKLY_ELEMENTS = {
			
		/** ******* ÍNICIO IGRP_BLOCKLY_ELEMENTS *************** */
			
		/** ******* ELEMENTOS COM FILTRO WHERE (COMEÇO) *************** */
			
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
					UpdateShape_limit(block, limit);
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
		
		/***** BLOCO GRÁFICO *******/
		list_simple_dao : $.extend({
			init : function(block) {
			/***** MUTAÇÃO LIMIT ****/
			var limite = IGRP_BLOCKLY_DROPS.findListDao;
			var dropdown = new Blockly.FieldDropdown(limite, function(limit) {
				UpdateShape_limit(block, limit);
			});
			block.appendDummyInput("find").appendField(dropdown, 'find');
			block.appendDummyInput("limit_value").appendField("limit value")
				 .appendField(new Blockly.FieldTextInput(''), 'limit').setVisible(false);	
			block.moveInputBefore("find", "value2");
			}
		}, ListMutationSettings),
		
		update_simple_dao : $.extend({
		}, ListMutationSettings),
		
		apagar : $.extend({
		}, ListMutationSettings),
		
		grafico : $.extend({
		}, ListMutationSettings),

		combo_dao : $.extend({
		}, ListMutationSettings),

		statbox : $.extend({
		}, ListMutationSettings),

		index_editar : $.extend({
		}, ListMutationSettings),

		separator : $.extend({
		}, ListMutationSettings),

		formlist : $.extend({
		}, ListMutationSettings),
		
		/** ******* ELEMENTOS COM FILTRO WHERE (FIM) *************** */
		
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
				var options = IGRP_BLOCKLY_DROPS.core;
				var dropdown = new Blockly.FieldDropdown(options, function(option) {
					this.sourceBlock_.updateShape_(option);
				});
				block.getInput("CORE").appendField(dropdown, 'CORE_FUNCTION')
					.appendField(new Blockly.FieldImage(path+ "/core/blockly/blockly/media/igrpweb_logo.png",40, 20, "*"));
				block.setInputsInline(true);
				block.appendValueInput("value1").setVisible(false);
				block.appendValueInput("value2").setVisible(false);
				block.appendValueInput("value3").setVisible(false);
				block.appendValueInput("value4").setVisible(false);
				block.appendValueInput("value5").setVisible(false);
				
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
						block.getInput("value5").setVisible(true);
					} else {
						block.getInput("value1").setVisible(false);
						block.getInput("value2").setVisible(false);
						block.getInput("value3").setVisible(false);
						block.getInput("value4").setVisible(false);
						block.getInput("value5").setVisible(false);
					}
				};
			}
		},
		/******* BLOCO CORE GET *******/
		core_fun_get : {
			init : function(block) {
				var options = IGRP_BLOCKLY_DROPS.core;
				var dropdown = new Blockly.FieldDropdown(options, function(
						option) {
					this.sourceBlock_.updateShape_(option);
				});
				block.getInput("CORE").appendField(dropdown, 'CORE_FUNCTION')
					.appendField(new Blockly.FieldImage(path+ "/core/blockly/blockly/media/igrpweb_logo.png",40, 20, "*"));
				block.setInputsInline(true);
				block.appendValueInput("value1").setVisible(false);
				block.appendValueInput("value2").setVisible(false);
				block.appendValueInput("value3").setVisible(false);
				block.appendValueInput("value4").setVisible(false);
				block.appendValueInput("value5").setVisible(false);

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
					if (type == 'enviar_email') {
						block.getInput("value1").setVisible(true);
						block.getInput("value2").setVisible(true);
						block.getInput("value3").setVisible(true);
						block.getInput("value4").setVisible(true);
						block.getInput("value5").setVisible(true);
					} else if (type == 'apanhar_parametro_texto') {
						block.getInput("value1").setVisible(true);
						block.getInput("value2").setVisible(false);
						block.getInput("value3").setVisible(false);
						block.getInput("value4").setVisible(false);
						block.getInput("value5").setVisible(false);
					} else if (type == 'get_domain') {
						block.getInput("value1").setVisible(true);
						block.getInput("value2").setVisible(true);
						block.getInput("value3").setVisible(false);
						block.getInput("value4").setVisible(false);
						block.getInput("value5").setVisible(false);
					} else {
						block.getInput("value1").setVisible(false);
						block.getInput("value2").setVisible(false);
						block.getInput("value3").setVisible(false);
						block.getInput("value4").setVisible(false);
						block.getInput("value5").setVisible(false);
					}
				};
			}
		},

	};
	/** ******* FIM IGRP_BLOCKLY_ELEMENTS *************** */

	/******* BLOCO SET DAO *******/

	$(document).on('set-dao-block-init',function(e, block, dao) {
		var options = IGRP_BLOCKLY_DROPS.daos[dao];
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