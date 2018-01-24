var Field = function(type,params){
	var field = this;

	var customTag = false;

	var paramsProperties = jQuery.extend(true, {}, params.properties);

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

	field.includes = {
		js : [],
		css : [],
		xsl:[]
	};
	
	field.server = {

			preserved : { }

		};
	
	field.genType = 'field';

	field.autoTag = params.options && params.options.hasOwnProperty('autoTag') ? params.options.autoTag : true;

	//to fix - field properties label
	field.propertiesLabels = {};

	field.propertiesOptions = {};

	//console.log(params.properties)
	field.customStyle = {
		class :params && params.style && params.style.class  ? params.style.class : '',
		inline:params && params.style && params.style.inline ? params.style.inline : ''
	}; 

	field.xslOptions      = {
		useDefault : params && params.xsl ? params.xsl.useDefault : true,
		template   : params && params.xsl ? params.xsl.template   : null
	};

	field.export = function(){
		
		var prop = {
			properties:{},
			style:{
				class :field.customStyle.class,
				inline:field.customStyle.inline
			},
			options:{
				autoTag : field.autoTag,
				rules:field.rules
			},
			xsl : field.xslOptions
		};

		//console.log(field.proprieties);
		for(var propriety in field.proprieties){
			var name  = propriety;
			if(field.GET[propriety])
				prop.properties[name]=field.GET[propriety]();
			//var value = field.GET[propriety]();
			//var value = (typeof f.proprieties[propriety] == 'object') ?  f.proprieties[propriety].value : f.proprieties[propriety];
			//prop[name]=value;
		}
		return prop;
	}

	field.getPropertyOptions = function(name){
		return field.propertiesOptions[name];
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
			
			field.proprieties.label = capitalizeFirstLetter(label);
			
			if(field.holder)
				field.holder.find('[gen-lbl-setter]').text(capitalizeFirstLetter(label));

			/*if(field.autoTag)
				setTagFromLabel(label);*/

		},
		tag :function(tag){
			
			field.proprieties.tag = replaceSpecialChars(tag);
			
			if(field.holder){
				var itemNameHolder = field.holder.attr('item-name') ? field.holder : $('[item-holder]',field.holder);
				itemNameHolder.attr('item-name',field.proprieties.tag);
			}

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
		},
		type : function(type){
			field.proprieties.type = type;
			field.type = type;
		}
	}

	field.XSLToString = function(){
		
		if(field.xslOptions.useDefault){

			var templates = field.templates;

			var xslStr = templates ? templates[Object.keys(templates)[0]] : '<xsl:if test="'+field.GET.labelPath()+'"></xsl:if>';
		
			return xslStr;

		}else{

			return field.xslOptions.template;

		}
			
	}

	field.setIncludes = function(includes){
		/*
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
		*/

		var incs = field.includes.xsl ? field.includes.xsl : field.includes;
		includes.forEach(function(_i){
			var found = false;
			for(var x = 0; x < incs.length; x++){
				if(_i == incs[x]){
					found = true;
					break;
				}
			}
			if(!found) incs.push(_i);
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

	var setPropertyOptions = function(p){
		field.propertiesOptions[p.name] = {};
		for(var k in p){
			field.propertiesOptions[p.name][k] = p[k];
		}

		field.propertiesOptions[p.name].isDefault = false;
		//console.log(field.propertiesOptions);
	}

	field.setPropriety = function(p){

		var val = p.hasOwnProperty('value') ? p.value : p.propriety;

		var isInt = typeof val == 'number';

		if(params && params.properties && params.properties[p.name]){
			if(val.hasOwnProperty('value')) 
				val.value = params.properties[p.name];
			else          
				val       = params.properties[p.name];
		}

		/*if(val.move)
			delete val.move;*/

		field.proprieties[p.name] = val;

		setPropertyOptions(p);

		if(p.label) field.propertiesLabels[p.name] = p.label;

		//propriety is editable?
		if(p.editable == false)
			notEditableAttrs[p.name] = true;

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

			try{
				
				if(!hasChangeEvent && (p.onChange || field.proprieties[p.name].onChange) ){
					if(p.onChange) 
						p.onChange(_value,_params);
					if(field.proprieties[p.name].onChange) 
						field.proprieties[p.name].onChange(_value,_params);
				}

			}catch(error){}

			if(p.transform && transform) 

				field.parent.Transform();
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

		if(p.xmlAttr)
			field.xml.attrs[p.name] = p.xmlAttr;
	}

	field.setProperty = field.setPropriety;

	var setFieldPropertiesValues = function(){
		var properties = paramsProperties;
		//console.log( JSON.stringify(properties))
		if(properties){
			for(var p in properties){

				if(field.SET[p])
					field.SET[p](properties[p],{transform:false});
			}
		}
	}

	field.setFilesIncludes = function(){

		var __setFile = function(type){
			
			field.includes[type].forEach(function(file){
				var isExternal = /^https?:\/\//i.test(file.path);
				var rel  = file.relative == false || isExternal ? false : true;
				
				var _path = rel ?  path+file.path : file.path;

				field.GEN.includeToHead({
					type     : type,
					relative : rel,
					path     : _path
				});
			});
		}

		if(field.includes && field.includes.css && field.includes.css[0])
			__setFile('css');
		if(field.includes && field.includes.js && field.includes.js[0])
			__setFile('js');
		
	}

	field.init = function(){
		
		var orderStr   =  field.order ? '-'+field.order : '';

		field.type     = type;

		field.id       = type+'-'+(new Date()).getTime()+orderStr+'-'+genNum(9999);

		field.folder   = VARS.genPath+'/types/fields/'+type;

		if(!field.proprieties.tag || $.trim(field.proprieties.tag) == '')
			field.SET.tag(field.parent.incrementTag('field',type));
		
		field.onInit();

		field.ready();

		field.setFilesIncludes();

		setFieldPropertiesValues();

	}

	field.setRules = function(arr,param){
		var p = $.extend({},param);
		field.rules = arr;
	}
	

	field.rules =  params && params.options && params.options.rules ? params.options.rules : [];

	field.proprieties = params && params.properties ? params.properties : {
		label     : capitalizeFirstLetter(type),
		tag       : '',
		name      : '',
		type      : type,
	}

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

