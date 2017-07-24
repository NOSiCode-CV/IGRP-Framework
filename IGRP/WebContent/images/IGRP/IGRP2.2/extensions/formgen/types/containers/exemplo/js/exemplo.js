//Declaração do container no FORMGEN CONTROLLER
//this[VARS.name] devolve o controller do formgen

this[VARS.name].declareContainer({
	name:'exemplo',
	container:function(name,params){
		//herda os métodos e propriedades da classe CONTAINER
		CONTAINER.call(this,name,params);

		this.ready               = function(){
			this.setPropriety({
				name:'tst_attribute',
				value:false
			});
		};
		this.complete            = function(){/* CODE HERE */};
		this.onDrop              = function(){/* CODE HERE */};
		this.onDrawEnd           = function(){/* CODE HERE */};
		this.onFieldSet          = function(){/* CODE HERE */};
		this.onFieldRemove       = function(){/* CODE HERE */};
		this.onFieldsXMLGenerate = function(){/* CODE HERE */};

		
	}
});