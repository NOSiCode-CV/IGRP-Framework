$(function(){

	var GEN = VARS.getGen(),
		
		server = GEN.server;
	
	server.hints 	  = {

	};
	
	var SetTagModelAutoComplete = function(tag,o){
		
		var model = [];
		
		//model
		model.push('get'+capitalizeFirstLetter(tag)+'();' );
		model.push('set'+capitalizeFirstLetter(tag)+'( Object value );' );
		
		if(o.xml.description){
			model.push('get'+capitalizeFirstLetter(tag)+'_desc();' );
			model.push('set'+capitalizeFirstLetter(tag)+'_desc( Object value );' );
		}
			
		
		return model;
		
	}
	
	var SetTagViewAutoComplete = function(tag){
		
		var view = [];

		view.push(tag);

		return view;
		
	};
	
	SetFieldsViewAutoComplete = function(tag,o){

		var methods = [];
		
		methods.push({
			name : 'view.'+tag,
			method : 'setLabel( String label );'
		});
		
		methods.push({
			name : 'view.'+tag,
			method : o.xml.options ? 'setValue(Map<?,?> value);' :'setValue( Object value );'
		});
		
		if(o.xml.lookup){
			methods.push({
				name : 'view.'+tag,
				method :'addParam(String string, String string2);'
			});
			methods.push({
				name : 'view.'+tag,
				method :'setLookup(String app,String page,String action);'
			});
		}

		if(o.xml.options){
			
			methods.push({
				name : 'view.'+tag,
				method : 'setListOptions( Map<?,?>  map);'
			});
			
			methods.push({
				name : 'view.'+tag,
				method : 'setSqlQuery(String connectionName, String tableName, String key, String value);'
			});

		}
			
		methods.push({
			name : 'view.'+tag,
			method : 'setParam(boolean isParam);'
		});
			
		methods.push({
			name : 'view.'+tag,
			method : 'setVisible( boolean isVisible );'
		});

		
		return methods;
	};
	
	var SetAutoCompleteHints = function(content,idx){
		
		var hints = {

			model : [],
			
			view  : []

		};
		
		var setHint = function(tag,object){

			SetTagModelAutoComplete( tag, object ).forEach(function( m ){ hints.model.push(m) }) ;
			
			SetTagViewAutoComplete( tag,object ).forEach(function( m ){ hints.view.push(m) }) ;
			
			SetFieldsViewAutoComplete( tag,object ).forEach(function( m ){ 
				
				if(!hints[m.name])
					
					hints[m.name] = [];
				
				hints[m.name].push(m.method);
				
			});
		};
		
		try{
			//model
			GEN.getAllContents().forEach(function(c){

				if(c.fields[0]){

					c.fields.forEach(function(f){
						
						var tag = f.GET.tag();

						setHint(tag,f);

					});

				}else{

					if(c.container.xml.type == 'text'){
						
						var tag = c.container.GET.tag()+'_text';
						
						setHint(tag,c.container);
						
					}	
					
				}

			});

		}catch(e){

			console.log(e)
		}
		
		console.log(hints);
		
		server.hints = hints;
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

		    	isDot 	 = false;

		    options.words = ["import","model","view","this"];

		    if(token.string == '.'){

		    	var hintClass = $.trim(lineText.substring(0, cur.ch-1));

		    	options.words = server.hints[hintClass];

		    	if(!options.words)

		    		return;

		    	isDot = true;

		    	from = CodeMirror.Pos(cur.line, token.start+1);
	
		    }
		    
		    if(isDot){

		    	found = options.words;

		    }else{
		    	
		    	var tIdx 	= lineText.indexOf(token.string),
		    		
		    		partStr = $.trim(lineText.substring(0,tIdx)),
		    		
		    		parts   = partStr.split('.');
		    	
		    	parts.forEach(function(p){

		    		if( server.hints[p] )
		    			
		    			options.words = server.hints[p];
		    			
		    		
		    	});

		    	for (var i = 0; i < options.words.length; i++) {

			      	var word = options.words[i];

			      	if ( token.string && word.slice(0, token.string.length) == token.string){

			      		found.push(word);

			      	}
			        
			    }
		    }

		    return {

			      	list : found,

			     	from : from,

			        to   : CodeMirror.Pos(cur.line, token.end)

			    }

		  
		    
		}

	};
	
	var Init = function(){
		
		ConfigCodeMirror();
		
		GEN.server.events.on('java.controller.gen',function(o){
			
			SetAutoCompleteHints(o.content);
			
		})
		
	}();
		

});