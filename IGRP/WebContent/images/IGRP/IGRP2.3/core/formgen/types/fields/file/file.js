var FILEFIELD = function(type,params){
	Field.call(this,type,params);
	var field 		= this,
		proprieties = params.properties;

	field.ready = function(){

		field.setPropriety({
			name:'accept',
			value:{
				value: 'file_extension',
				multiple:true,
				editable:false,
				options:[
					{ value:'file_extension' , label: 'All file extension' },
					{ value:'application/msword' , label: 'Word' },
					{ value:'application/vnd.ms-excel', label: 'Excel' },
					{ value:'application/vnd.ms-powerpoint', label: 'Power Point' },
					{ value:'text/plain', label: 'Text' },
					{ value:'application/pdf', label: 'PDF' },
					{ value:'image/*', label: 'Images' },
					{ value:'video/*', label: 'Videos' },
					{ value:'audio/*', label: 'Audios' },
					{ value:'text/html', label: 'HTML' }
				]
			}
		});

		field.setPropriety({
			name 	 :'multiple',
			label 	 : 'Multiple',
			value 	 : false,
			xslValue : 'multiple="multiple"' //XSL VALUE WHEN PROPRIETY IS TRUE
		});
	}
}
this[VARS.name].declareField({
	type:'file',
	field:FILEFIELD
});