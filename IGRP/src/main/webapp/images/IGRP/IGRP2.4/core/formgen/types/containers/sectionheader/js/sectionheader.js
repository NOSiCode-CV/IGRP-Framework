var SECTIONHEADER = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;
	
	container.xml.type      = 'text';
	container.xml.structure = 'form';

	container.ready = function(){
		container.unsetProprieties(['title','hasTitle','collapsible']);

		container.setProperty({
			name:'font-size',
			label:'Tamanho',
			value:{
				value: 'h4',
				options:[
					{
						value:'h1',
						label:'Muito grande'
					},
					{
						value:'h2',
						label:'Grande'
					},
					{
						value:'h3',
						label:'Médio'
					},
					{
						value:'h4',
						label:'Normal'
					},
					{
						value:'h5',
						label:'Pequeno'
					},
				]
			}
		});


	}
	
}

this[VARS.name].declareContainer({
	name:'sectionheader',
	container:SECTIONHEADER
});