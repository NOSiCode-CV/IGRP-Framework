/**
 * @author rodfelfer@hotmail.com (Rodney Fernandes)
 */
'use strict';

goog.require('Blockly.Blocks');

goog.require('Blockly.Java');

goog.require('Blockly.FieldDate');


Blockly.Blocks['if_t'] = {
		init : function() {
			this.appendDummyInput().appendField("if");
			this.appendStatementInput("SCRIPT");
			this.setNextStatement(true);
			this.setColour(230);
		},
};
Blockly.Blocks['elseif_t'] = {
		init : function() {
			this.appendDummyInput().appendField("else if");
			this.setPreviousStatement(true);
			this.setNextStatement(true);
			this.setColour(230);
		},
};
Blockly.Blocks['else_t'] = {
		init : function() {
			this.appendDummyInput().appendField("else");
			this.setPreviousStatement(true);
			this.setColour(230);
		},
};
Blockly.Blocks['if_elseif'] = {
	    init: function () {
	        this.else_ = 0;
	        this.elseif_ = 0;
	        this.updateShape_();
	        this.setMutator(new Blockly.Mutator(['elseif_t','else_t']));
			this.appendValueInput("SCRIPT").appendField("if elseif").setCheck(['compr']);
			this.appendStatementInput("SCRIPT2").setCheck(['iff']);
			this.setColour(230);
			this.setPreviousStatement(true);
			this.setNextStatement(true,'if');
	    },
	    mutationToDom: function () {
	        var container = document.createElement('mutation');
	        container.setAttribute('else_', this.else_);
	        container.setAttribute('elseif_t', this.elseif_);
	        return container;
	    }, 
	    domToMutation: function (xmlElement) {
	        this.else_ = parseInt(xmlElement.getAttribute('else_'), 10);
	        this.elseif_ = parseInt(xmlElement.getAttribute('elseif_t'), 10);
	        this.updateShape_();
	    }, 
	    decompose: function (workspace) {
	        var topBlock = workspace.newBlock('if_t');
	        topBlock.initSvg();
	        var connection = topBlock.getInput('SCRIPT').connection;
	        if (this.else_ == 1) {
	            var itemBlock = workspace.newBlock('else_t');
	            itemBlock.initSvg();
	            connection.connect(itemBlock.previousConnection);
	         
	        }
	        if (this.elseif_ == 1) {
	            var itemBlock = workspace.newBlock('elseif_t');
	            itemBlock.initSvg();
	            connection.connect(itemBlock.previousConnection);
	        }
	        return topBlock;
	    },
	    compose: function (topBlock) {
	        var itemBlock = topBlock.getInputTargetBlock('SCRIPT');
	        if (itemBlock == "else") {
	            this.join_ = 1;
	        } else {
	            this.join_ = 0;
	        }
	        if (itemBlock == "else if") {
	            this.elseif_ = 1;
	        } else {
	            this.elseif_ = 0;
	        }
	        this.updateShape_();
	    }, 
	    updateShape_: function () {
	        if (this.join_ == 1 && !this.getInput('JOIN')) {
	            var input = this.appendValueInput("JOIN").setCheck("table").appendField("else");
	        } else if (this.join_ == 0 && this.getInput('JOIN')) {
	            this.removeInput('JOIN');
	        } 
	        if (this.elseif_ == 1 && !this.getInput('JOINS')) {
	            this.appendValueInput("JOINS").setCheck("table").appendField("else if");
	            this.appendStatementInput("JOINS").setCheck("table");
	        } else if (this.elseif_ == 0 && this.getInput('JOINS')) {
	            this.removeInput('JOINS');
	        }
	    }
	};


Blockly.Blocks['if_list'] = {
	    init: function () {
	        this.else_ = 0;
	        this.elseif_ = 0;
	        this.itemCount_ = 0;
	        this.updateShape_();
	        this.setMutator(new Blockly.Mutator(['elseif_t','else_t']));
			this.appendValueInput("SCRIPT").appendField("if list").setCheck(['compr']);
			this.appendStatementInput("SCRIPT2").setCheck(['iff']);
			this.setColour(230);
			this.setPreviousStatement(true);
			this.setNextStatement(true,'if');
	    },
	    mutationToDom: function () {
	        var container = document.createElement('mutation');
	        container.setAttribute('count', this.itemCount_);
	        container.setAttribute('else_', this.else_);
	        container.setAttribute('elseif_t', this.elseif_);
	        return container;
	    }, 
	    domToMutation: function (xmlElement) {
	    	 this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
	    	 this.else_ = parseInt(xmlElement.getAttribute('else_'), 10);
		     this.elseif_ = parseInt(xmlElement.getAttribute('elseif_t'), 10);
	        this.updateShape_();
	    },
	    decompose: function (workspace) {
	        var containerBlock = workspace.newBlock('if_t');
	        containerBlock.initSvg();
	        var connection = containerBlock.getInput('SCRIPT').connection;	        
	        for (var i = 0; i < this.itemCount_; i++) { 
	        	//if (this.elseif_ == 1) {
		            var itemBlock = workspace.newBlock('elseif_t');
		            itemBlock.initSvg();
		            connection.connect(itemBlock.previousConnection);
		            connection = itemBlock.nextConnection;
	        	//}
//	        	if (this.else_ == 1) {
//		            var itemBlock = workspace.newBlock('else_t');
//		            itemBlock.initSvg();
//		            connection.connect(itemBlock.previousConnection);
//		            connection = itemBlock.nextConnection;
//	        	}
	        }
	        return containerBlock;
	    },  
	    compose: function (containerBlock) {
	        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
	        var connections = [];
	        while (itemBlock) {
	            connections.push(itemBlock.valueConnection_);
	            itemBlock = itemBlock.nextConnection && itemBlock.nextConnection.targetBlock();
	            
//	            if(itemBlock.type)
//	            	{
//			            if (itemBlock.type == "else") {
//				            this.join_ = 1;
//				        } else {
//				            this.join_ = 0;
//				        }
//				        if (itemBlock.type == "else if") {
//				            this.elseif_ = 1;
//				        } else {
//				            this.elseif_ = 0;
//				        }
//	            	}
	        }
	      for (var i = 0; i < this.itemCount_; i++) {
	            var connection = this.getInput('ADD' + i).connection.targetConnection;
	            if (connection && connections.indexOf(connection) == -1) {
	                connection.disconnect();
	            }
	        }
	        this.itemCount_ = connections.length;
	        this.updateShape_();
	        for (var i = 0; i < this.itemCount_; i++) {
	            Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
	        }
	    },
	    
	    saveConnections: function(containerBlock) {
	        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
	        var i = 0;
	        while (itemBlock) {
	            var input = this.getInput('ADD' + i);
	            itemBlock.valueConnection_ = input && input.connection.targetConnection;
	            i++;
	            itemBlock = itemBlock.nextConnection &&
	                itemBlock.nextConnection.targetBlock();
	        }
	    },
	    updateShape_: function () {
	    
	        for (var i = 0; i < this.itemCount_; i++) {
	            if (!this.getInput('ADD' + i)) {
//	            	 if (this.else_ == 1)
//	            		 {
//	    	        	 var input = this.appendValueInput('ADD' + i).setCheck("table").appendField("else");
//	            		 }
//	            	 if (this.elseif_ == 1)
//            		 {
    	        	 var input = this.appendValueInput('ADD' + i).setCheck("table").appendField("else if");
            		// }
	            }
	        }
	        while (this.getInput('ADD' + i)) {
	            this.removeInput('ADD' + i);
	            i++;
	        }   
	    } 
	};


Blockly.Blocks['en'] = {
		  init: function() {
		    var checkbox = new Blockly.FieldCheckbox("TRUE", function(pxchecked) {
		      this.sourceBlock_.updateShape_(pxchecked);});
		    this.setInputsInline(false);
		    this.appendDummyInput().appendField("Unit").appendField(new Blockly.FieldTextInput("C01"), "ENName");
		    this.appendDummyInput().appendField("PX").appendField(checkbox, 'HasPX');
		    this.setPreviousStatement(true, ["C", "EN"]);
		    this.setNextStatement(true, ["C", "EN"]);
		    this.setColour(40);
		  },
		  mutationToDom: function() {
		    var container = document.createElement('mutation');
		    var pxchecked = (this.getFieldValue('HasPX') == 'TRUE');
		    container.setAttribute('pxchecked', pxchecked);
		    return container;
		  },
		  domToMutation: function(xmlElement) {
		    var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true');
		    this.updateShape_(pxchecked);
		  },
		  updateShape_: function(pxchecked) {
		    if (pxchecked) {
		      this.appendValueInput("PX")
		          .setCheck('PX');
		    } else {
		      if (this.childBlocks_.length > 0) {
		        for (var i = 0; i < this.childBlocks_.length; i++) {
		          if (this.childBlocks_[i].type == 'px') {
		            this.childBlocks_[i].unplug();
		            break;
		          }
		        }
		      }
		      this.removeInput('PX');
		    }
		  }
		};

Blockly.Blocks['select_ori'] = {
	    init: function () {
	        this.join_ = 0;
	        this.updateShape_();
	        this.setMutator(new Blockly.Mutator(['join']));
	    },
	    mutationToDom: function () {
	        var container = document.createElement('mutation');
	        container.setAttribute('join', this.join_);
	        return container;
	    }, 
	    domToMutation: function (xmlElement) {
	        this.join_ = parseInt(xmlElement.getAttribute('join'), 10);
	        this.updateShape_();
	    }, 
	    decompose: function (workspace) {
	        var topBlock = workspace.newBlock('container');
	        topBlock.initSvg();
	        var connection = topBlock.getInput('JOIN').connection;
	        if (this.join_ == 1) {
	            var itemBlock = workspace.newBlock('join');
	            itemBlock.initSvg();
	            connection.connect(itemBlock.outputConnection);
	        }
	        return topBlock;
	    },
	    compose: function (topBlock) {
	        var itemBlock = topBlock.getInputTargetBlock('JOIN');
	        if (itemBlock == "JOIN") {
	            this.join_ = 1;
	        } else {
	            this.join_ = 0;
	        }

	        this.updateShape_();
	    }
	    , 
	    updateShape_: function () {
	        if (this.join_ == 1 && !this.getInput('JOIN')) {
	            var input = this.appendValueInput("JOIN").setCheck("table").appendField(new Blockly.FieldDropdown([["INNER JOIN", "INNER JOIN"], ["LEFT JOIN", "LEFT JOIN"], ["RIGHT JOIN", "RIGHT JOIN"], ["FULL OUTER JOIN", "FULL OUTER JOIN"]]), "JOINS");
	        } else if (this.join_ == 0 && this.getInput('JOIN')) {
	            this.removeInput('JOIN');
	        }
	    }
	};
	Blockly.Blocks['container'] = {
	    init: function () {
	        this.setColour(60);
	        this.appendValueInput("JOIN")
	            .setCheck("join")
	            .appendField("CONTAINER");
	        this.setTooltip("");
	        this.contextMenu = !1
	    }
	};
	Blockly.Blocks['join'] = {
	    init: function () {
	        this.setColour(60);
	        this.appendDummyInput()
	            .appendField("JOIN");
	        this.setOutput(true, "join");
	        this.setTooltip("");
	        this.contextMenu = !1
	    }
	};
	
	Blockly.Blocks['def_type_extra'] = {
		    init: function() {
		        this.appendDummyInput()
		            .appendField("Tipo")
		            .appendField(new Blockly.FieldDropdown([["char", "char"],["float", "float"],["cl_char", "cl_char"],["cl_float", "cl_float"]]), "tipo")
		            .appendField(new Blockly.FieldVariable("item"), "nome");
		        this.setColour(290);
		        this.itemCount_ = 3;
		        this.updateShape_();
		        this.setOutput(false);
		        this.setColour(315);
		        this.setMutator(new Blockly.Mutator(['lists_create_with_item']));
		        this.setTooltip('');
		        this.setInputsInline(false);
		        this.setPreviousStatement(true, null);
		        this.setNextStatement(true, null);
		    },
		    mutationToDom: function() {
		        var container = document.createElement('mutation');
		        container.setAttribute('items', this.itemCount_);
		        return container;
		    },
		    domToMutation: function(xmlElement) {
		        this.itemCount_ = parseInt(xmlElement.getAttribute('items'), 10);
		        this.updateShape_();
		    },
		    decompose: function(workspace) {
		        var containerBlock = workspace.newBlock('lists_create_with_container');
		        containerBlock.initSvg();
		        var connection = containerBlock.getInput('STACK').connection;
		        for (var i = 0; i < this.itemCount_; i++) {
		            var itemBlock = workspace.newBlock('lists_create_with_item');
		            itemBlock.initSvg();
		            connection.connect(itemBlock.previousConnection);
		            connection = itemBlock.nextConnection;
		        }
		        return containerBlock;
		    },
		    compose: function(containerBlock) {
		        var itemBlock = containerBlock.getInputTargetBlock('STACK');
		        // Count number of inputs.
		        var connections = [];
		        while (itemBlock) {
		            connections.push(itemBlock.valueConnection_);
		            itemBlock = itemBlock.nextConnection &&
		                itemBlock.nextConnection.targetBlock();
		        }
		        // Disconnect any children that don't belong.
		        for (var i = 0; i < this.itemCount_; i++) {
		            var connection = this.getInput('ADD' + i).connection.targetConnection;
		            if (connection && connections.indexOf(connection) == -1) {
		                connection.disconnect();
		            }
		        }
		        this.itemCount_ = connections.length;
		        this.updateShape_();
		        // Reconnect any child blocks.
		        for (var i = 0; i < this.itemCount_; i++) {
		            Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
		        }
		    },
		    saveConnections: function(containerBlock) {
		        var itemBlock = containerBlock.getInputTargetBlock('STACK');
		        var i = 0;
		        while (itemBlock) {
		            var input = this.getInput('ADD' + i);
		            itemBlock.valueConnection_ = input && input.connection.targetConnection;
		            i++;
		            itemBlock = itemBlock.nextConnection &&
		                itemBlock.nextConnection.targetBlock();
		        }
		    },
		    updateShape_: function() {
		        if (this.itemCount_ && this.getInput('EMPTY')) {
		            this.removeInput('EMPTY');
		        } else if (!this.itemCount_ && !this.getInput('EMPTY')) {
		            this.appendDummyInput('EMPTY')
		                .appendField(Blockly.Msg.LISTS_CREATE_EMPTY_TITLE);
		        }
		        for (var i = 0; i < this.itemCount_; i++) {
		            if (!this.getInput('ADD' + i)) {
		                var input = this.appendValueInput('ADD' + i);
		                if (i == 0) {
		                    input.appendField(Blockly.Msg.LISTS_CREATE_WITH_INPUT_WITH);
		                }
		            }
		        }
		        while (this.getInput('ADD' + i)) {
		            this.removeInput('ADD' + i);
		            i++;
		        }
		    }
		};

		
		