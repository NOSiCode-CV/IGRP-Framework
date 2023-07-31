var GENHTML = function(name,params){
	var GEN = VARS.getGen();
	var html = this;

	var notEditableAttrs = {};
	
	html.genType = 'html';

	html.propertiesLabels= {};

	html.proprieties = {
		type        : name,
		title     	: name
	}

	html.GET = {
		id:function(){
			return html.id;
		},
		title:function(){
			return html.proprieties.title;
		},
		type:function(){
			return html.proprieties.type;
		}
	}

	html.SET = {
		title:function(c){
			html.proprieties.title = c;
		}
	}

	var setVars = function(){
		html.type   = name;
		html.id     = name+(new Date()).getTime();
		html.folder = VARS.genPath+'/types/html/'+name;

		html.holder = getContainerHolder(html);

	}
	var setProprietiesValues = function(){
		if(params && params.proprieties){
			for(var p in params.proprieties){
				if(html.SET[p]) 
					html.SET[p](params.proprieties[p]);
			}
		}
	}

	var getContainerHolder = function(html){
		var holder = $(VARS.getContainerSettsHtml(html));
		//edit click
		holder.find('.container-edit').on('click',function(e){
			GEN.edit(html,e);
		});
		//remove click
		holder.find('.container-remove').on('click',function(){
			if(confirm('Remover Container?'))
				GEN.removeContainer(html.GET.id());
			//return false;

		});

		return holder;
	}



	html.export = function(includeId){
		var returnId = !includeId ? false : true;
		var c        = {
			genType:'html',
			proprieties:{}
		};

		for(var p in html.proprieties)
			c.proprieties[p] = html.GET[p]();

		if(returnId) 
			c.id = html.GET.id();
		
		return c;
	}

	html.XSLToString = function(){
		return html.getXSL();
	}

	html.Transform = function(p){
		
		var template = html.getXSL();

		html.holder.find('.container-contents').html( template );

		html.holder.find('.c-holder-loading').hide();

		if(p && p.callback) p.callback();

		html.holder.show();
	}

	html.getXSL = function(){
		var template = html.template

		var replaces_from_attr = GenVarsReplaceFromObjAttr({
			object   :html,
			begin    :'#[',
			end      :']#',
			template :template
		});

		replaces_from_attr.forEach(function(r){
			template = template.replaceAll(r.expression, r.xslValue);
		});

		return template;
	}

	html.init = function(callback){
		//try{
			setVars();

			var templateCallback = function(contents){

				if(contents.template){

					html.template = contents.template;
					
					html.ready();
					
					setProprietiesValues();

					html.Transform({
						callback:function(){
							callback();
							//container.complete();
						}
					});

	
				}else{
					console.log('template not found: '+html.type)
				}
			};

			var templateError = function(e){
				GEN.removeContainer(html.id);
				console.log('template not found: '+html.type);
			}


			TEMPLATES.GET.container({
				name:html.type,
				genType:html.genType,
				getField:false,	
				callback:templateCallback,
				error:templateError
			});

		/*}catch(e){ 
			console.log(e); 
		}*/

		//console.log(html)
	}

	html.isEditable = function(attr){
		return notEditableAttrs[attr] ? false : true;
	}

	html.ready = function(){};
	html.onRemove = function(){};
}