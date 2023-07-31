this[VARS.name].declareContainer({

	name:'zeguimoko',

	container:function(name,params){
		
		CONTAINER.call(this,name,params);
		
		var container = this;

		container.ready = function(){
			console.log('ZEGUI MOKO READY!')
		}

	}
});