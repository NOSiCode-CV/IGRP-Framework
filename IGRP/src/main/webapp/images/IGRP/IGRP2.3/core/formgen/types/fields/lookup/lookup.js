var LOOKUPFIELD = function(type,params){
	Field.call(this,type,params);
	
	var field = this;
	var GEN = VARS.getGen();
	var proprieties = params.properties;

	field.includes = {
		js :[{path:'/plugins/lookup/igrp.lookup.js'}]
	}

	field.ready = function(){
		
		GEN.setBtnActionAttr(field,{
			value: proprieties && proprieties.action ? proprieties.action : '',
			xmlAttr:function(){
				var action = field.action.action ? field.action.action : '',
					page   = field.action.page   ? field.action.page   : '',
					app    = field.action.app    ? field.action.app    : '';

				return 'action="'+action+'" page="'+page+'" app="'+app+'"';
			}
		});
		
		field.setProperty({
			name : 'lookupParams',
			type : 'formlist',
			order : 3,
			size : 12,
			value : {
				value : proprieties && proprieties.lookupParams || [],
				setter:function(){
					
					var flist = GEN.attributes.get({
						type : 'formlist',
						name : 'lookupParams',
						fields : {
							name : {
								type : 'text',
								label : 'Name',
								//defaultValue : '',
								rows : [
									'Test'
								]
							},
							value : {
								type : 'text',
								label : 'Value',
								//defaultValue : '',
								rows : [
									'Test 2'
								]
							}
						},
						data : field.GET.lookupParams()
					})

					
					return flist
				}
			}
		})
		
		field.setProperty({
			name:'lookup_type',
			label:'Lookup Type',
			editable : false,
			order : 3,
			value:{
				value: 'LOOKUP',
				options:[
					{
						label:'',
						value:'LOOKUP'
					},
					{
						label:'NIF',
						value:'LOOKUP_NIF'
					},
					{
						label:'B.I',
						value:'LOOKUP_BI'
					},
					{
						label:'CAE',
						value:'LOOKUP_CAE'
					},
					{
						label:'NIC',
						value:'LOOKUP_NIC'
					},
					{
						label:'Geografia',
						value:'LOOKUP_GEOG'
					},
					{
						label:'Nascimento',
						value:'LOOKUP_NASC'
					},
					{
						label:'Orgância',
						value:'LOOKUP_ORG'
					}
				]


			}
		});

		GEN.setBTNClass(field);
	}
	
}

this[VARS.name].declareField({
	type:'lookup',
	field:LOOKUPFIELD
});