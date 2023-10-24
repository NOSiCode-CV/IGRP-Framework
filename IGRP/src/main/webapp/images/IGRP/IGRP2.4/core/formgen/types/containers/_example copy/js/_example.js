(function(){
	IGRPGEN.declareContainer({
		name:'_example',
		container: function(name,params){

			CONTAINER.call(this,name,params);//preserve this line
			
			/*
			//add container text property
			this.setProperty({
				name  	 : 'text_property',
				label 	 : 'Text',
				value    : ''
			});
			//add container boolean property
			this.setProperty({
				name  	 : 'boolean_property',
				label 	 : 'Boolean',
				value    : true
			});
			//add container number property
			this.setProperty({
				name  	 : 'number_property',
				label 	 : 'Number',
				value    : 10
			});
			//add container options property
			this.setPropriety({
				name:'options_property',
				label:'Options',
				value:{
					value  : 'value0',
					options: [
						{
							label:'Value 0',
							value : 'value0'
						},
						{
							label:'Value 1',
							value : 'value1'
						}
					]
				}//,
				//transform:true
			});*/



	
		}
	});

})();

