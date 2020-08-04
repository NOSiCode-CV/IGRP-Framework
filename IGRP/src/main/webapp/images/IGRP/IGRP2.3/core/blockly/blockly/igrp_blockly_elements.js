(function(){
	
	var ListMutationSettings = {
					
		mutationToDom: function() {
			  var container = document.createElement('mutation');
			  var pxchecked = (this.getFieldValue('3D') == 'TRUE'); //para gráfico
			  container.setAttribute('pxchecked', pxchecked); //para gráfico
			  container.setAttribute('count', this.itemCount_);
			  for(var x=1; x <= this.itemCount_; x++){
				  var itemInput = this.getFieldValue('ADD'+x+'FILTER');
				  container.setAttribute('mutation-'+x, itemInput)
			  }
			  return container;  
			},
			
		domToMutation: function(xmlElement) {
			var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true'); //para gráfico
			var arr = [];			
			this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
			for(var x = 1; x <= this.itemCount_; x++){
				arr.push( xmlElement.getAttribute('mutation-'+x) );	
			}
			this.updateShape__(pxchecked); //para grafico
			this.updateShape_(arr); 
			},
				
		 decompose: function (workspace) {
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
		    
		 compose: function (containerBlock) {
		        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
		        var connections = [];
		        while (itemBlock) {
		            connections.push(itemBlock.valueConnection_);
		            itemBlock = itemBlock.nextConnection && itemBlock.nextConnection.targetBlock();
		        }
		        for (var i = 1; i <= this.itemCount_; i++) {
		            var connection = this.getInput('ADD' + i).connection.targetConnection;
		            if (connection && connections.indexOf(connection) == -1) {
		                //connection.disconnect();
		            } 
		        }
		        this.itemCount_ = connections.length;
		        this.updateShape_();
		        for (var i = 1; i <= this.itemCount_; i++) {
		            Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
		        }
		    },
		    
		 updateShape_: function (arr) {
			 	var _block = this;
			 	var mutation_num = this.itemCount_;
			 	if(_block.getInput("get_pa")!= null)
		 		{
				 	if(mutation_num != 0){
				 		_block.getInput("get_pa").setVisible(false);	
				 	}
				 	else{
				 		_block.getInput("get_pa").setVisible(true);		
				 	}
		 		}
			 	if(_block.getInput("empty_table")!= null)
		 		{
				 	if(mutation_num != 0){
				 		_block.getInput("empty_table").setVisible(true);	
				 	}
				 	else{
				 		_block.getInput("empty_table").setVisible(false);	
				 	}
		 		}
			 	var appendMutationFields = function(v,id){
			 		if(v == 'andWhere' || v == 'orWhere' || v == 'where' || v == 'having'  )	
            		{
			 			_block.getInput('ADD'+ id).setVisible(true);
			 			_block.getInput('ADD'+ id +'SIGNAL').setVisible(true);
			 			_block.getInput('ADD'+ id +'STATE2').setVisible(true);
			 			_block.getInput('ADD'+ id +'STATE3').setVisible(false);	
            		}
			 		if(v == 'andWhereBetween' || v == 'orWhereBetween' )	
            		{
			 			_block.getInput('ADD'+ id).setVisible(true);
			 			_block.getInput('ADD'+ id +'SIGNAL').setVisible(false);
			 			_block.getInput('ADD'+ id +'STATE2').setVisible(true);
			 			_block.getInput('ADD'+ id +'STATE3').setVisible(true);
            		}
			 		if(v == 'andWhereIsNull' || v == 'andWhereIsNotNull' || v == 'orWhereIsNull' || v == 'orWhereIsNotNull' )	
            		{
			 			_block.getInput('ADD'+ id).setVisible(true);
			 			_block.getInput('ADD'+ id +'SIGNAL').setVisible(false);
			 			_block.getInput('ADD'+ id +'STATE2').setVisible(false);
			 			_block.getInput('ADD'+ id +'STATE3').setVisible(false);
            		}
			 	}
			 	var getDDField = function(idx){
			 		return new Blockly.FieldDropdown(FILTER, function(input_type){
	            		appendMutationFields(input_type,idx)
	            	})
			 	}
		        for (var i = 1; i <= this.itemCount_; i++) {
		            if (!this.getInput('ADD' + i)) {
		             	var fdpFilter = new getDDField(i);
		             	this.appendValueInput('ADD' + i).appendField(fdpFilter,'ADD'+i+'FILTER').setVisible(true);
	    	        	this.appendDummyInput('ADD' + i+'SIGNAL').appendField(new Blockly.FieldDropdown(WHERE),'ADD'+i+'WHERE').setVisible(true);
	    	        	this.appendValueInput('ADD'+ i +'STATE2').setVisible(true);
	    	        	this.appendValueInput('ADD'+ i +'STATE3').setVisible(false);
		            }
		        }
		        if(arr && arr[0])
			        arr.forEach(function(v,x){
			        	appendMutationFields(v,x+1);
			        })
		        while (this.getInput('ADD' + i)) {
		            this.removeInput('ADD' + i);
		            this.removeInput('ADD'+i+'STATE1');
		            this.removeInput('ADD'+i+'SIGNAL');
		            this.removeInput('ADD'+i+'STATE2');
		            this.removeInput('ADD'+i+'STATE3');
		            i++;
		        }       
		    }	    
	}
	
	//////////////////////////////////////////////START IGRP_BLOCKLY_ELEMENTS ////////////////////////////////////////////////////////
	
	window.IGRP_BLOCKLY_ELEMENTS = {
			
		listar : $.extend({
			
			init : function(block){
				block.itemCount_ = 0;
				block.updateShape_();
				block.updateShape__ = function(){};
//				this.onTableSet = function(item){		
//					var XML = $.parseXML(VARS.getGen().getXML());	
//					var menus = function(){
//						var arr = [];
//						$('rows content '+item, XML).find('fields > *').each(function(i, field){	
//							var type =  GetJavaType[$(field).attr('type')] || 'String';
//							arr.push( [ field.tagName, type+'::'+ field.tagName ] )
//						})
//						return arr
//					}();
//				}	
			}
		}, ListMutationSettings),
		
		
	 combo_dao :$.extend({

		init : function(block){
			 block.itemCount_ = 0;
			 block.updateShape_();
			 block.updateShape__ = function(){};
		}	
	  }, ListMutationSettings),
	  
	  
	 index_editar :$.extend({
		  
			init : function(block){
				block.itemCount_ = 0;
				block.updateShape_();
				block.updateShape__ = function(){};
			}	
		  }, ListMutationSettings),
  
		  
	 separator :$.extend({
		 
		init : function(block){
			block.itemCount_ = 0;
			block.updateShape_();
			block.updateShape__ = function(){};
		}	
	  }, ListMutationSettings),
	  
	  
	 formlist :$.extend({
			
		init : function(block){
			block.itemCount_ = 0;
			block.updateShape_();
			block.updateShape__ = function(){};
		}	
	  }, ListMutationSettings),
		
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	  
	inserir_dao : {
		
		init : function(block){
			block.itemCount_ = 0;
			block.updateShape_();
			var checkbox = new Blockly.FieldCheckbox("FALSE", function(pxchecked) {
				this.sourceBlock_.updateShape_(pxchecked);
			});	
		},
		mutationToDom: function() {
			  var container = document.createElement('mutation');
			  container.setAttribute('count', this.itemCount_);
			  var pxchecked = (this.getFieldValue('EDIT') == 'TRUE');
			  container.setAttribute('pxchecked', pxchecked);
			  return container;
		},	
		domToMutation: function(xmlElement) {
			var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true');
			this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
			this.updateShape_(pxchecked);
		},	
		
		decompose: function (workspace) {
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
	  compose: function (containerBlock) {
	        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
	        var connections = [];
	        while (itemBlock) {
	            connections.push(itemBlock.valueConnection_);
	            itemBlock = itemBlock.nextConnection && itemBlock.nextConnection.targetBlock();
	        }
	      for (var i = 1; i < this.itemCount_; i++) {
	            var connection = this.getInput('SEPARATOR'+i).connection.targetConnection;
	            if (connection && connections.indexOf(connection) == -1) {
	                //connection.disconnect();
	            } 
	        }
	        this.itemCount_ = connections.length;
	        Contador = this.itemCount_;
	        this.updateShape_();
	        for (var i = 1; i <= this.itemCount_; i++) {
	            Blockly.Mutator.reconnect(connections[i], this, 'SEPARATOR'+i); 
	        }
	    },

	    updateShape_: function (pxchecked) {
		    var block = this;
		    pxchecked = typeof pxchecked === 'undefined' ? this.getFieldValue('EDIT') == 'TRUE' : pxchecked;
	        for (var i = 1; i <= this.itemCount_; i++) {
	            if (!this.getInput('SEPARATOR'+i)) { 
    	        	this.appendDummyInput('SEPARATORIL'+i).appendField("add insert");
    	        	this.appendStatementInput('SEPARATOR'+i);
	            }
	        }
	        while (this.getInput('SEPARATOR'+i)) {
	            this.removeInput('SEPARATOR'+i);
	            this.removeInput('SEPARATORIL'+i); 
	            i++; 
	        } 
	        this.removeInput('param_id');
	        if (pxchecked) {
			      block.appendValueInput("param_id").appendField("find");
			      block.moveInputBefore("param_id", "value2");
			} else {
			  this.removeInput('param_id');
		      if (this.childBlocks_.length > 0) {
		        for (var i = 0; i < block.childBlocks_.length; i++) {
		          if (block.childBlocks_[i].type == 'px') {  
			           block.childBlocks_[i].unplug();
			           break;
		          }
		        }
		      }
			}
	    }
	},
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		  
		
	checkbox_table : {
		
		init : function(block){
			block.itemCount_ = 0;
			var checkbox = new Blockly.FieldCheckbox("FALSE", function(pxchecked) {
				this.sourceBlock_.updateShape_(pxchecked);
			});	
		block.appendDummyInput().appendField(checkbox, 'UNSEL');
		block.appendStatementInput("value_selected");
		block.mutationToDom =  function() {
		    var container = document.createElement('mutation');
		    var pxchecked = (this.getFieldValue('UNSEL') == 'TRUE');
		    container.setAttribute('pxchecked', pxchecked);
		    return container; 
		},

		block.domToMutation = function(xmlElement) {
			var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true');
			this.updateShape_(pxchecked);
		},
		
		block.updateShape_  = function(pxchecked) {	
		    var check = pxchecked;
	        if (pxchecked) {
	        		block.appendDummyInput("tete").appendField("unselecteds");
			      block.appendStatementInput("value_unselected");
			} else {
			  this.removeInput('tete');
			  this.removeInput('value_unselected');
		      
			}
	    }
		
		}
	},
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//Handle with CORE BLOCK
		
		core_fun_set : {
			
			init : function(block){
			var options = IGRP_BLOCKLY_DROPS.core;
			var dropdown = new Blockly.FieldDropdown(options, function(option) {	
				this.sourceBlock_.updateShape_(option);    
		    });	
		    block.getInput("CORE").appendField(dropdown, 'CORE_FUNCTION')
			     .appendField(new Blockly.FieldImage(path+"/core/blockly/blockly/media/igrpweb_logo.png",40,20,"*"));
		    block.setInputsInline(true);
		    block.appendValueInput("value1").setVisible(false);
		    block.appendValueInput("value2").setVisible(false);
		    block.appendValueInput("value3").setVisible(false);
		    block.appendValueInput("value4").setVisible(false);
		    block.appendValueInput("value5").setVisible(false);
		    
			block.mutationToDom =  function() {
			    var container = document.createElement('mutation');
			    var itemInput = this.getFieldValue('CORE_FUNCTION');
			    container.setAttribute('hover_type', itemInput);
			    return container; 
			},

			block.domToMutation = function(xmlElement) {
			    var itemInput = xmlElement.getAttribute('hover_type');
			    this.updateShape_(itemInput);  
			},
			
			block.updateShape_  = function(input_type) {		 
			 	var type    = input_type;

			    if (type == 'enviar_email') {
					block.getInput("value1").setVisible(true);
					block.getInput("value2").setVisible(true);
					block.getInput("value3").setVisible(true);
					block.getInput("value4").setVisible(true);
					block.getInput("value5").setVisible(true);
			    }
			    else {
					block.getInput("value1").setVisible(false);
					block.getInput("value2").setVisible(false);
					block.getInput("value3").setVisible(false);
					block.getInput("value4").setVisible(false);
					block.getInput("value5").setVisible(false);
			    }
			  }
			}
		},
		
	core_fun_get : {
			
			init : function(block){
			var options = IGRP_BLOCKLY_DROPS.core;
			var dropdown = new Blockly.FieldDropdown(options, function(option) {	
				this.sourceBlock_.updateShape_(option);    
		    });	
		    block.getInput("CORE").appendField(dropdown, 'CORE_FUNCTION')
			     .appendField(new Blockly.FieldImage(path+"/core/blockly/blockly/media/igrpweb_logo.png",40,20,"*"));
		    block.setInputsInline(true);
		    block.appendValueInput("value1").setVisible(false);
		    block.appendValueInput("value2").setVisible(false);
		    block.appendValueInput("value3").setVisible(false);
		    block.appendValueInput("value4").setVisible(false);
		    block.appendValueInput("value5").setVisible(false);
		    
			block.mutationToDom =  function() {
			    var container = document.createElement('mutation');
			    var itemInput = this.getFieldValue('CORE_FUNCTION');
			    container.setAttribute('hover_type', itemInput);
			    return container; 
			},

			block.domToMutation = function(xmlElement) {
			    var itemInput = xmlElement.getAttribute('hover_type');
			    this.updateShape_(itemInput);  
			},
			
			block.updateShape_  = function(input_type) {		 
			 	var type    = input_type;

			    if (type == 'enviar_email') {
					block.getInput("value1").setVisible(true);
					block.getInput("value2").setVisible(true);
					block.getInput("value3").setVisible(true);
					block.getInput("value4").setVisible(true);
					block.getInput("value5").setVisible(true);
			    }
			    else if (type == 'apanhar_parametro_texto') {
					block.getInput("value1").setVisible(true);
					block.getInput("value2").setVisible(false);
					block.getInput("value3").setVisible(false);
					block.getInput("value4").setVisible(false);
					block.getInput("value5").setVisible(false);
			    }
			    else if (type == 'get_domain') {
					block.getInput("value1").setVisible(true);
					block.getInput("value2").setVisible(true);
					block.getInput("value3").setVisible(false);
					block.getInput("value4").setVisible(false);
					block.getInput("value5").setVisible(false);
			    }
			    else {
					block.getInput("value1").setVisible(false);
					block.getInput("value2").setVisible(false);
					block.getInput("value3").setVisible(false);
					block.getInput("value4").setVisible(false);
					block.getInput("value5").setVisible(false);
			    }
			  }
			}
		},
		
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	grafico :$.extend({
			
			init : function(block){
				
				block.itemCount_ = 0;
				block.updateShape_();
				
				 var checkbox = new Blockly.FieldCheckbox("TRUE", function(pxchecked) {
				      			this.sourceBlock_.updateShape__(pxchecked);			
				 });
				 
				//block.appendDummyInput().appendField("3D").appendField(checkbox, '3D');	
			 
				 block.updateShape__ = function(pxchecked) {
				    if (pxchecked) {
				      block.appendValueInput("eixoZ").appendField("Eixo Z");
				    } else {
				      if (this.childBlocks_.length > 0) {
					        for (var i = 0; i < block.childBlocks_.length; i++) {
						          if (block.childBlocks_[i].type == 'px') { 
							           block.childBlocks_[i].unplug();
							           break;
						          }   
					        } 
				      }
				      this.removeInput('eixoZ'); 
				    }
				 } 
			}
			
		}, ListMutationSettings),
	
	}
	
	/////////////////////////////////////////////  END IGRP_BLOCKLY_ELEMENTS  /////////////////////////////////////////////////
	
//Handle SET Dao Blocks
	
	$(document).on('set-dao-block-init', function(e, block, dao){	
		var options = IGRP_BLOCKLY_DROPS.daos[dao];
		var dropdown = new Blockly.FieldDropdown(options, function(option) {	
			this.sourceBlock_.updateShape_(option);    
	    });	
		block.setColour(160);
	    block.getInput("value1").appendField(dropdown, 'DAO_FIELD')
		     .appendField(new Blockly.FieldImage(path+"/core/blockly/blockly/media/dao.svg",15,15,"*"));
	    
		block.mutationToDom =  function() {
		    var container = document.createElement('mutation');
		    var itemInput = this.getFieldValue('DAO_FIELD');
		    container.setAttribute('hover_type', itemInput);
		    return container; 
		},

		block.domToMutation = function(xmlElement) {
		    var itemInput = xmlElement.getAttribute('hover_type');
		    this.updateShape_(itemInput);  
		},
		
		block.updateShape_  = function(input_type) {		 
		 	var strSplit    = input_type.split('::'),
				type        = strSplit[0],
				val 	    = strSplit[1],
		        inputExists = this.getInput('dao_rela'); 
		    if (type.includes("_FK#")) {
		      if (!inputExists) {
		        this.setInputsInline(true);
		      }
		    }else
		    try{
		    	this.setInputsInline(false);
		    }catch(err){	
		    } 
		  }
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//Handle GET Dao Blocks
	
	$(document).on('get-dao-block-init', function(e, block, dao){	
		var options = IGRP_BLOCKLY_DROPS.daos[dao];
		var dropdown = new Blockly.FieldDropdown(options, function(option) {	
			this.sourceBlock_.updateShape_(option);    
	    });	
		block.setColour(160);
	    block.appendDummyInput().appendField("get "+dao).appendField(dropdown, 'DAO_FIELD')
		     .appendField(new Blockly.FieldImage(path+"/core/blockly/blockly/media/dao.svg",15,15,"*"));
	    block.setInputsInline(true);
	    block.setOutput(true);
		block.mutationToDom =  function() {
		    var container = document.createElement('mutation');
		    var itemInput = this.getFieldValue('DAO_FIELD');
		    container.setAttribute('hover_type', itemInput);
		    return container; 
		},

		block.domToMutation = function(xmlElement) {
		    var itemInput = xmlElement.getAttribute('hover_type');
		    this.updateShape_(itemInput);  
		},
		
		block.updateShape_  = function(input_type) {		 
		 	var strSplit    = input_type.split('::'),
				type        = strSplit[0],
				val 	    = strSplit[1],
		        inputExists = this.getInput('dao_rela'); 
		    if (type.includes("_FK#")) {
		      if (!inputExists) {
		        this.appendValueInput('dao_rela').setCheck();
		      }
		    }else
		    try{
		    	this.removeInput('dao_rela');
		    }catch(err){	
		    } 
		  }
	});

})();