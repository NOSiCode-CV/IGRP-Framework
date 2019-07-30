(function(){
	
	
	var Contador=0;
	
	
	window.IGRP_BLOCKLY_ELEMENTS = {
			
		listar : {
			
			init : function(block){
				
				block.itemCount_ = 0;
				block.updateShape_();
				
				this.onTableSet = function(item){
					
					var XML = $.parseXML(VARS.getGen().getXML());
					
					var menus = function(){
						var arr = [];
						
						$('rows content '+item, XML).find('fields > *').each(function(i, field){
							
							var type =  GetJavaType[$(field).attr('type')] || 'String';
							
							arr.push( [ field.tagName, type+'::'+ field.tagName ] )
						})
						
						return arr;
						
					}();
					
					console.log(GetJavaType)
					
					console.log(menus)
					
					console.log(block)
					
					//block.childBlocks_[0].inputList[0].fieldRow[1].menuGenerator_ = menus;
					//console.log( block.childBlocks_[0].inputList.fieldRow[1] )					
					//pega kel coluna d es table
					//setta campos di tabel "item"
				}
				
				
			},
			
			mutationToDom: function() {
				  var container = document.createElement('mutation');
				  container.setAttribute('count', this.itemCount_);
				  return container;
				},
			domToMutation: function(xmlElement) {
				this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
				  this.updateShape_();  
				},
			 decompose: function (workspace) {
			        var containerBlock = workspace.newBlock('where_t');
			        containerBlock.initSvg();
			        var connection = containerBlock.getInput('SCRIPT').connection;	        
			        for (var i = 0; i < this.itemCount_; i++) { 
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
			      for (var i = 1; i < this.itemCount_; i++) {
			            var connection = this.getInput('ADD' + i).connection.targetConnection;
			            if (connection && connections.indexOf(connection) == -1) {
			                connection.disconnect();
			            }
			        }
			        this.itemCount_ = connections.length;
			         Contador = this.itemCount_;
			         
			        this.updateShape_();
			        for (var i = 0; i < this.itemCount_; i++) {
			            Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
			        }
			    },
			    updateShape_: function () {
				    
			        for (var i = 1; i <= this.itemCount_; i++) {
			            if (!this.getInput('ADD' + i)) {
		    	        	 var input =
		    	        	this.appendValueInput('ADD' + i).appendField("onde:");
		    	        	this.appendValueInput('ADD' + i+'STATE2').appendField(new Blockly.FieldDropdown(WHERE),'ADD'+i+'WHERE');
		    	 			
			            }
			        }
			        while (this.getInput('ADD' + i)) {
			            this.removeInput('ADD' + i);
			            this.removeInput('ADD' + i+'WHERE');
			            this.removeInput('ADD' + i+'STATE2');
			            
			            i++;
			        }   
			    }
			
		},
		
		inserir_dao : {
			
			init : function(block){
				
				//var ParamField = new Blockly.FieldDropdown([["todos", "todos"],["um, "um"]]);
				
				var ParamInput = block.getInput('value1'),
				
					ParamField = ParamInput ? ParamInput.fieldRow[3] : null;
					
				console.log(ParamField)
				
				if(ParamField){
					
					var ParamValidator = function(val){
						block.updateConnections(val)
					}
					
					ParamField.setValidator(ParamValidator);
					
					
				}
				
				//block.appendDummyInput().appendField(ParamField, "find");
				
				
				
				//var ddField = 
				
			},
			
			updateConnections: function(newValue) {
				
				console.log(newValue)
				
			  this.removeInput('PARAM', /* no error */ true);
			  
			  if (newValue == 'um') {
				this.appendValueInput('PARAM').appendField('por parametro');
				this.moveInputBefore('PARAM','value2')
			  } 
			  
			}
			
		}
			
			
	}
	
})();