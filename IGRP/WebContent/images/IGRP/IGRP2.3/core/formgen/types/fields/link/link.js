var LINKFIELD = function(type,params){
	Field.call(this,type,params);

	var GEN = VARS.getGen();
	var field = this;
	var proprieties = params && params.properties;

	field.xml.description = true;

	field.xml.attrs.action = function(){
		return ' action="'+field.action.action+'" page="'+field.action.page+'" app="'+field.action.app+'" ';
	}

	field.ready = function(){

		GEN.setTargetAttr(field,{
			value: (proprieties && proprieties.target) ? proprieties.target : '_self'
		});

		GEN.setBtnActionAttr(field,{
			value: proprieties && proprieties.action ? proprieties.action : '',
			customAction : true,
			order  	     : 3,
			//valuePersist:true,
			onChange:function(v){
				
				//var isCustom = field.GET.action_type ? field.GET.action_type() : false;
				var isCustom 	 = $('.propriety-setter[rel="action_type"]').is(':checked') || false,

					customAction = $('.propriety-setter[rel="custom_action"]').val();

				field.proprieties.action.params = v.params;

				field.xml.dataValue = isCustom ? customAction : v.params.link;

				field.propertiesOptions.action.valuePersist = isCustom;
			}
		});

		GEN.setBTNClass(field,'link');

		field.setPropriety({
			name:'btnSize',
			label:'Buttons Size',
			value:{
				value:'',
				options:[
					{value:'',label:'Normal'},
					{value:'btn-lg',label:'Large'},
					{value:'btn-xs',label:'Small'}
					
				]
			}
		});


		GEN.setImgAttr(field,{
			value: 'fa-link'
		});

		//field.xml.
	}

	/*GEN.setTargetAttr(this,{
		value: (proprieties && proprieties.target) ? proprieties.target : '_self'
	});
*/	/*this.setPropriety({
		name:'target',
		propriety:{
			value:'_blank',
			options:[{value:'_blank',label:'Blank'},{value:'_self',label:'Self'}]
		}
	});*/
}

VARS.getGen().declareField({
	type:'link',
	field:LINKFIELD
});