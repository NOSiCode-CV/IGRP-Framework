var TEMPLATES = {
	container:{

	},
	field:{

	},
	SET:{
		container:function(p){
			var object = TEMPLATES.container[p.name] ? TEMPLATES.container[p.name] : TEMPLATES.container[p.name] = { fields:{} };

			if(p.template)
				object.template = p.template;

			if(p.field)
				object.fields[p.field.name] = p.field.html;


		},
		field:function(p){
			var object = TEMPLATES.field[p.name] ? TEMPLATES.field[p.name] : TEMPLATES.field[p.name] = { };

			if(p.template && p.container && p.context){
				if(object[p.container]){
					object[p.container][p.context] = p.template;
				}else{
					object[p.container] = {};
					object[p.container][p.context] = p.template;
				}
			}
		}
	},
	GET:{
		container:function(p){
			var tReady  = false;
			var ftReady = false;
			
			var fieldTemp = p.fieldStyle ? p.fieldStyle : 'field';

			if(!TEMPLATES.container[p.name] || !TEMPLATES.container[p.name].template){
				$.ajax({
					url: path+'/extensions/formgen/types/containers/'+p.name+'/'+p.name+'.html',
					success:function(html){
						var temp = html;

						TEMPLATES.SET.container({
							name:p.name,
							template:temp
						});

						tReady = true;
						
						if(tReady && ftReady)
							if(p.callback) p.callback(TEMPLATES.container[p.name]);
					},
					error:function(e){
						if(p.error) p.error(e); 
					}
				});
			}else{
				tReady = true;
			}

			if(!TEMPLATES.container[p.name] || !TEMPLATES.container[p.name].fields[fieldTemp] ){
				$.ajax({
					url:  path+'/extensions/formgen/types/containers/'+p.name+'/'+fieldTemp+'.html',
					success:function(fieldhtml){
						var temp =fieldhtml;
						
						TEMPLATES.SET.container({
							name:p.name,
							field:{
								name:fieldTemp,
								html:fieldhtml
							}
						});

						ftReady = true;
						
						if(tReady && ftReady)
							if(p.callback) p.callback(TEMPLATES.container[p.name]);
					}
				});
			}else{
				ftReady = true;
			}
			
			if(tReady && ftReady)
				if(p.callback) p.callback(TEMPLATES.container[p.name]);
		},
		field:function(p){

			var field = TEMPLATES.field[p.field];

			if(field && field[p.container] && field[p.container][p.context]){
				if(p.callback) p.callback(field[p.container][p.context])
			}else{
				//get from path
				var ctx = p.context.split('.'),
					url,container,temp;
		
				if(ctx.length > 1){
					container = ctx[0];
					temp      = ctx[1];
				}else{
					container = p.container;
					temp      = ctx[0];
				}

				var fieldTemplate = temp == 'field' ? '' : '.'+temp;

				url = path+'/extensions/formgen/types/fields/'+p.field+'/templates/'+p.field+'.'+container+fieldTemplate+'.html';

				$.ajax({
					url:url,
					success:function(result){
						var fTemp = result;
					
						TEMPLATES.SET.field({
							name     : p.field,
							container: container,
							context  : temp,
							template : fTemp
						});

						if(p.callback) p.callback(fTemp)
							
					},
					error:function(e){

						TEMPLATES.GET.container({
							name:container,
							fieldStyle:temp,
							callback:function(contents){
								var fTempl = contents.fields[temp];
								
								TEMPLATES.SET.field({
									name     : p.field,
									container: container,
									context  : temp,
									template : fTempl
								});

								if(p.callback) p.callback(fTempl);
							}
						});
					}
				});
			}
		}
	}
	
}