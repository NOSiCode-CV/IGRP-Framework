var Field = function(type,proprieties){
	var field = this;
	
	field.GEN = VARS.getGen();

	field.hasLabel = true;

	field.templates = {};

	field.xml = {
		label:true,
		value:true,
		options:false,
		lookup :false,
		attrs : {}
	};

	field.xslValues = {};

	field.includes = [];

	field.genType = 'field';

	field.autoTag = true;

	field.export = function(){
		var prop = {};
		console.log(field.proprieties);
		for(var propriety in field.proprieties){
			var name  = propriety;
			if(field.GET[propriety])
				prop[name]=field.GET[propriety]();
			//var value = field.GET[propriety]();
			//var value = (typeof f.proprieties[propriety] == 'object') ?  f.proprieties[propriety].value : f.proprieties[propriety];
			//prop[name]=value;
		}
		return prop;
	}

	field.GET = {
		id:  function(){
			return field.id;
		},
		name :function(){
			return field.proprieties.name ? field.proprieties.name : 'p_'+field.GET.tag();
		},
		tag :function(){
			return field.proprieties.tag;
		},
		label :function(){
			return field.proprieties.label;
		},

		type:function(){
			return field.type;
		},
		labelPath:function(){
			return field.parent.GET.path()+'/label/'+field.GET.tag();
		},
		valuePath:function(){
			return field.parent.GET.path()+'/value/'+field.GET.tag();
		}
	}

	var validateTag = function(tag){
		var rtn = tag;
		return rtn;
	}

	var setTagFromLabel = function(label){
		var tagFromLbl = replaceSpecialChars(label);	
		field.SET.tag(tagFromLbl);

		if(field.GEN.edit.object){
			var editionInpt = $(VARS.edition.dialog+'[object-id="'+field.GEN.edit.object.GET.id()+'"]'+' .propriety-setter[rel="tag"]');
			editionInpt.val(tagFromLbl);
		}
	}

	field.SET = {
		label :function(label){
			field.proprieties.label = label;
			
			if(field.holder)
				field.holder.find('[gen-lbl-setter]').text(label);

			if(field.autoTag)
				setTagFromLabel(label);

		},
		tag :function(tag){
			field.proprieties.tag = replaceSpecialChars(tag);
			
			tagChangeEvents.forEach(function(listner){
				try{
					listner(field.GET.tag());
				}catch(e){
					console.log(e);
				}
			});
			
			if(field.holder){
				var holderHasTag = typeof field.holder.attr('tag') != 'undefined';
				var tagSetter = holderHasTag ? field.holder : $('[tag]',field.holder);
				if(tagSetter[0]) tagSetter.attr('tag',field.GET.tag());
			}
			
			field.SET.name('p_'+tag);
		},
		name :function(name){
			field.proprieties.name = name;

			var nameHolder = field.holder ? field.holder.find('[name]') : [];
			if(nameHolder[0]) nameHolder.attr('name',name);
		}
	}

	field.setIncludes = function(includes){
		includes.forEach(function(_i){
			var found = false;
			for(var x = 0; x < field.includes.length; x++){
				if(_i == field.includes[x]){
					found = true;
					break;
				}
			}
			if(!found) field.includes.push(_i);
		});
	}

	var serializeAttrs = function(){
		var xml = "";
		for(var prop in field.proprieties){
			xml = xml + prop + '="' + field.proprieties[prop]+'" '
		}
		return xml;
	}

	var getAttrsArr = function(){
		var arr = [];
		for(var prop in field.proprieties){
			if(prop != 'label' && prop !='tag' && prop !='size'){
				//console.log(prop+': '+field.GET[prop]())
				if(field.GET[prop]){
					var obj = {
						name :prop,
						value:field.GET[prop]()
						//field.GET[prop].value ? field.proprieties[prop].value : field.proprieties[prop]
					}
					arr.push(obj);
				}
			}
		}
		return arr;
	}


	field.getTemplate = function(context){
		return field.templates[context] ? field.templates[context] : 'no template';
	}

	field.unsetProprieties = function(proprieties){
		for(var p in field.proprieties){
			proprieties.forEach(function(prop){
				if(prop != 'tag' && prop != 'type')
					if(prop == p) delete field.proprieties[p];
					
					if(field.GET[prop]) delete field.GET[prop];
					if(field.SET[prop]) delete field.SET[prop];
			});
		}
	}
	
	var notEditableAttrs = {};

	field.isEditable = function(attr){
		return notEditableAttrs[attr] ? false : true;
	}

	field.setPropriety = function(p){

		var val = p.hasOwnProperty('value') ? p.value : p.propriety; 
		
		var isInt = typeof val == 'number';

		if(proprieties && proprieties[p.name]){
			if(val.value) val.value = proprieties[p.name];
			else          val       = proprieties[p.name];
		}

		field.proprieties[p.name] = val;

		//propriety is editable?
		if(p.editable == false){
			notEditableAttrs[p.name] = true;
		}else{
			//has change event associated (blur,change,...)
			var hasChangeEvent =  val.changeEvent ? true : false;
			if(hasChangeEvent){
				field.proprieties[p.name]['on'+capitalizeFirstLetter(val.changeEvent)] = function(val){
					field.SET[p.name](val);
					if(p.onChange) p.onChange(val);
				}
			}
			/* setter */
			field.SET[p.name] = function(value,_params){
				var transform = p.transform || (_params && _params.transform) ? true : false;
				var _value = isInt ? parseInt(value) : value;

				if(typeof val == 'object')
					field.proprieties[p.name].value = _value;
				else
					field.proprieties[p.name] = _value;

				if(!hasChangeEvent && p.onChange)
					p.onChange(_value,_params);

				/*if(p.transform && transform) 
					field.parent.Transform();*/
			}
		}

		if(typeof val == 'boolean' && p.xslValue)
			field.xslValues[p.name] =  p.xslValue;

		/* getter */
		field.GET[p.name] = function(){
			var rtn;
			if(typeof val == 'object')
				rtn = field.proprieties[p.name].value;
			else
				rtn =  field.proprieties[p.name];
			
			return rtn;
		}
		if(p.xmlAttr){
			field.xml.attrs[p.name] = p.xmlAttr;
		}
		

		//console.log(field.)

	
	}

	field.init = function(){
		
		var orderStr   =  field.order ? '-'+field.order : '';

		field.type     = type;

		field.id       = type+'-'+(new Date()).getTime()+orderStr+'-'+genNum(9999);
		
		//console.log(field.parent);
		if(!field.proprieties.tag || $.trim(field.proprieties.tag) == ''){
			field.SET.tag(field.parent.incrementTag('field',type));
		}

		field.onInit();

		field.ready();
		//console.log(field.proprieties.img.value);
	}

	field.proprieties = proprieties ? proprieties : {
		label     : type,
		tag       : '',
		name      : '',
		type      : type
	}

	/*field.proprieties = proprieties ? proprieties : {
		label     : type,
		tag       : validateTag(type),
		name      : 'p_'+validateTag(type),
		type      : type
	}*/
	
	var tagChangeEvents = [];
	
	field.setEventListner = function(event,callback){
		if(event == 'tagChange'){
			tagChangeEvents.push(callback);
		}
	}

	field.genXMLAttr = function(name,value){
		return name+'="'+value+'"';
	}

	/*subscrever*/

	field.onDrawEnd = function(){};
	field.onInit = function(){};
	field.ready = function(){};
	field.beforeDropHtml = function(){};
	field.afterDropHtml = function(){};
	field.onTemplateSet = function(){};

}

