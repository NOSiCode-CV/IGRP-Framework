$(function(){

	var GEN 	= VARS.getGen(),
		
		server  = GEN.server,
		
		coreSet = false;
	
	server.hints 	  = {
		Core : []
	};
	
	var SetCoreAutoComplete = function(data){
		
		if(data && data[0]){
			
			data.forEach(function(d){
				
				for(var methodName in d){
					
					var params   = d[methodName],
						
						paramsStr = "";
						
					params.forEach(function(p,i){
							
						paramsStr+=p;
						
						if(i < params.length -1)
							paramsStr+=', '
						
					});
					

					server.hints.Core.push(methodName+'('+paramsStr+')');
					
				}
				
			});
			
		}
		
	};
	
	var SetTagModelAutoComplete = function(tag,o){
		
		var model = [];
		
		if( (o.genType == 'field' && o.parent && !o.parent.xml.table) || o.xml.type == 'text' ){
			//model
			model.push('get'+capitalizeFirstLetter(tag)+'()');
			model.push('set'+capitalizeFirstLetter(tag)+'(Object value)');
		}
		
		
		if(o.xml.description){
			model.push('get'+capitalizeFirstLetter(tag)+'_desc()');
			model.push('set'+capitalizeFirstLetter(tag)+'_desc(Object value)');
		}
	
		if(o.type == 'table'){
			
			var tbName = o.GET.tag(),
				
				fields = o.GET.fields(),
				
				sqlFields = function(){
					var rtn = "";
					fields.forEach(function(f,i){
						rtn += "'"+f.GET.tag()+"' as "+f.GET.tag();
						if(i < fields.length -1)
							rtn+=", ";
					});
					return rtn;
				}();

				model.push('load'+capitalizeFirstLetter(tbName)+'(Core.query(null,"SELECT '+sqlFields+'"));');
			
		}
			
		
		return model;
		
	}
	
	var SetTagViewAutoComplete = function(tag,o){
		
		var view = [],
			
			tag = o.type == 'button' ? 'btn_'+tag : tag;

		view.push(tag);	

		return view;
		
	};
	
	var SetFieldsViewAutoComplete = function(tag,o){

		var methods = [],
			
			tag = o.type == 'button' ? 'btn_'+tag : tag;
		
		if(o.genType == 'field' || o.xml.type == 'text'){
			
			methods.push({
				name : 'view.'+tag,
				method : 'setLabel(String label);'
			});
			
			methods.push({
				name : 'view.'+tag,
				method : o.xml.options ? 'setValue(Map<?,?> value)' :'setValue(Object value)'
			});
			
			if(o.xml.lookup){
				methods.push({
					name : 'view.'+tag,
					method :'addParam(String string, String string2)'
				});
				methods.push({
					name : 'view.'+tag,
					method :'setLookup(String app, String page, String action);'
				});
			}

			if(o.xml.options){
				
				methods.push({
					name : 'view.'+tag,
					method : 'setListOptions(Map<?,?> map)'
				});
				
				methods.push({
					name : 'view.'+tag,
					method : 'setQuery(Core.query(String connectionName, String query));'
				});

			}
		}
		
		if(o.genType == 'container'){
			
			methods.push({
				name : 'view.'+tag,
				method : 'setParam(boolean isParam)'
			});
			
			if(o.type == 'chart'){
				methods.push({
					name : 'view.'+tag,
					method : 'loadQuery(Core.query(String_connectionName, String_query));'
				});
			}
			
		}
		
		methods.push({
			name : 'view.'+tag,
			method : 'setVisible(boolean isVisible);'
		});

		
		return methods;
	};
	
	var SetAutoCompleteHints = function(content,idx){
		
		var hints = {

			model : [],
			
			view  : [
				"setModel(model);"
			],
			
			System : [
				"out.println();",
			],
			this :[
				"addQueryString(tag, value);","forward(app, page, action, this.queryString());","forward(app, page, action);",
				"forward(app, page, action, model, this.queryString());","loadQueryString();","config.",
				"restartQueryString();","removeQueryString(key);","getQueryArray();","redirect(app, page, action, model, this.queryString());",
				"redirectError();","redirectToUrl(String url);","xSend(byte []file, String name, String contentType, boolean download);"
				,"sendFile(File file, String name, String contentType, boolean download);",
				"xSend(byte []file, String name, String contentType, boolean download,String url);",
				"xSend(FileRest file, String name, String contentType, boolean download);"
				]

		};
		
		var setHint = function(tag,object){

			SetTagModelAutoComplete(tag,object).forEach(function(m){ hints.model.push(m) }) ;
			
			SetTagViewAutoComplete(tag,object).forEach(function(m){ hints.view.push(m) });		
			
			SetFieldsViewAutoComplete( tag,object ).forEach(function(m){ 
				
				if(!hints[m.name])
					
					hints[m.name] = [];
				
				hints[m.name].push(m.method);
				
			});
			
			//hints.view.push('setModel(model);');
			
		};
		
		try{
			//model
			GEN.getAllContents().forEach(function(c){
				
				if(c.container){
					
					if(c.container.xml.type == 'text'){
						
						var tag = c.container.GET.tag()+'_text';
						
						setHint(tag,c.container);
						
					}else{
						
						setHint(c.container.GET.tag(),c.container);
							
					}
					
				}
				
				if(c.fields[0]){

					c.fields.forEach(function(f){
						
						var tag = f.GET.tag();

						setHint(tag,f);

					});

				}

				/*if(c.fields[0]){

					c.fields.forEach(function(f){
						
						var tag = f.GET.tag();

						setHint(tag,f);

					});

				}else{

					if(c.container.xml.type == 'text'){
						
						var tag = c.container.GET.tag()+'_text';
						
						setHint(tag,c.container);
						
					}else{
						
						setHint(c.container.GET.tag(),c.container);
							
					}
					
				}*/
				

			});

		}catch(e){

			console.log(e)
		}
		
		var Core = server.hints.Core;
		
		server.hints = hints;
		server.hints.Core = Core;
		
		//console.log(server.hints);
		
	};
	
	var ConfigCodeMirror = function(){

		CodeMirror.hint.fromList = function(cm, options) {

		    var cur   	 = cm.getCursor(), 

		    	lineText = cm.getLine(cur.line),

		    	token 	 = cm.getTokenAt(cur),

		    	found	 = [],

		    	from 	 = CodeMirror.Pos(cur.line, token.start),

			    to   	 = CodeMirror.Pos(cur.line, token.end),

		    	rtn      = null,

		    	isDot 	 = false,
		    	
		    	defaults = ["import","System","Core","view","model","this"];

		    options.words = [];
		    
		    try{
		    	
		    	if(token.string == '.'){

			    	var hintClass = $.trim(lineText.substring(0, cur.ch-1));

			    	if(server.hints[hintClass]){

			    		options.words = server.hints[hintClass];
			    		
			    	}else{
			    		
			    		if(hintClass){
			    			
			    			var dotArr = lineText.split(/[-+.(,;\t),]/)
			    			
			    			dotArr = dotArr.filter(function(v){
			    				
			    				return $.trim(v) != '';
			    			});

			    			hintClass = $.trim(dotArr[dotArr.length-1]);
			    			
			    			
			    			if(!server.hints[hintClass])
			    				
			    				hintClass = $.trim(dotArr[dotArr.length-2]) +'.'+ $.trim(dotArr[dotArr.length-1]);
			    			
			    			options.words = server.hints[hintClass];

			    		}

			    	}
			    	
			    	isDot = true;

			    	from = CodeMirror.Pos(cur.line, token.start+1);
			    	
			    	found = options.words;
		
			    }else{
			    	
			    	var tIdx = lineText.indexOf(token.string),
			    		
			    		partStr = $.trim(lineText.substring(0,tIdx)),
			    		
			    		parts   = partStr.split('.'),
			    		
			    		isClass = false;

		    		var _arr = lineText.split(/[-+.(,;\t),]/);
		    		
		    		if(_arr && _arr.length){
		    			
		    			_arr = _arr.filter(function(v){
		    				
		    				return $.trim(v) != '';
		    					
		    			});
		    			
		    			var hintClss = $.trim( _arr[_arr.length - 2] );

		    			if(hintClss && server.hints[hintClss])
		    				
		    				options.words = server.hints[hintClss];
		    			
		    			else{
		    				
		    				var dotArr = lineText.split(/[-+.(,;\t),]/).filter(function(v,i){
			    				
			    				return $.trim(v) != '';
			    				
			    			});

		    				dotArr.pop();

		    				hintClass = dotArr.join('.')
		    				
			    			if(server.hints[hintClass])
			    				
			    				options.words = server.hints[hintClass];
			    	
			    			else{
			    				
			    				hintClass = $.trim(dotArr.slice(Math.max(dotArr.length - 2, 1)).join('.'));
			    				
			    				options.words = server.hints[hintClass];
			    			}

		    			}

		    		}

		    		if(options.words){
		    			
		    			for (var i = 0; i < options.words.length; i++) {

					      	var word = options.words[i];

					      	if (token.string && word.slice(0, token.string.length).toLowerCase() == token.string.toLowerCase())
					      		found.push(word);
					        
					    }
		    			
		    		}
		    		
			    }

			    return {
			      	list : found || [],
			     	from : from,
			        to   : CodeMirror.Pos(cur.line, token.end)
			    }
		    	
		    }catch(err){		    	
		    	console.log(err);		    	
		    }

		}

	};
	
	var Init = function(){
		
		GEN.on('ready',function(){
			
			$.get( GEN.UTILS.core_methods_list ,SetCoreAutoComplete )
			
		});
		
		ConfigCodeMirror();
		
		GEN.server.events.on('java.controller.gen',function(o){
			
			SetAutoCompleteHints(o.content);
			
		});
		
		
		
	}();
		

});