var TEMPLATES = {
	path : path+VARS.genPath,
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
		html:function(){

		},
		container:function(p){

			var tReady  = false;
			var ftReady = false;
			

			var getField = p.getField == false ? false : true;
			
			var fieldTemp = p.fieldStyle ? p.fieldStyle : 'field';
			//console.log(p)
			if(!TEMPLATES.container[p.name] || !TEMPLATES.container[p.name].template){
				$.ajax({
					url: TEMPLATES.path+'/types/'+p.genType+'s/'+p.name+'/'+p.name+'.html',
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

			if(getField){

				//console.log(p.genType)
				if(!TEMPLATES.container[p.name] || !TEMPLATES.container[p.name].fields[fieldTemp] ){
					
					$.ajax({
						url:  TEMPLATES.path+'/types/'+p.genType+'s/'+p.name+'/'+fieldTemp+'.html',
						success:function(fieldhtml){
							var temp =fieldhtml;
				
							TEMPLATES.SET.container({
								name:p.name,
								field:{
									name:fieldTemp,
									html:fieldhtml
								}
							});

							
						},
						complete:function(e,i){
							ftReady = true;
							
							if(tReady && ftReady)
								if(p.callback) p.callback(TEMPLATES.container[p.name]);

						}
					});
				}else{
					ftReady = true;
				}
			}else{
				ftReady = true;
			}
			
			
			if(tReady && ftReady)
				if(p.callback) p.callback(TEMPLATES.container[p.name]);
		},
		field:function(p){

			var field = TEMPLATES.field[p.field];

			if(field && field[p.container] && field[p.container][p.context]){
				if(p.callback) p.callback(field[p.container][p.context],field.useDefault)
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

				var fieldContainerTmpl = TEMPLATES.path+'/types/fields/'+p.field+'/templates/'+p.field+'.'+p.container+fieldTemplate+'.html';
	
				var fieldCopyTempl = TEMPLATES.path+'/types/fields/'+p.field+'/templates/'+p.field+'.'+container+fieldTemplate+'.html';
				//url = path+'/components/core/formgen/types/fields/'+p.field+'/templates/'+p.field+'.'+container+fieldTemplate+'.html';
				
				//console.log(url);

				$.ajax({
					url:fieldContainerTmpl,
					
					success:function(result){
						var fTemp = result;
						var useDefault = false;
						
						TEMPLATES.SET.field({
							name     : p.field,
							container: container,
							context  : temp,
							template : fTemp,
							useDefault:useDefault
						});

						if(p.callback) p.callback(fTemp,{
							useDefault:useDefault
						});
							
					},
					error:function(e){
						if(fieldCopyTempl != fieldContainerTmpl){
							$.ajax({
								url:fieldCopyTempl,
								
								success:function(result){
									var fTemp = result;
									var useDefault = false;
									TEMPLATES.SET.field({
										name     : p.field,
										container: container,
										context  : temp,
										template : fTemp,
										useDefault:useDefault
									});

									if(p.callback) p.callback(fTemp,{
										useDefault:useDefault
									})
										
								},
								error:function(e){

									//use default
									TEMPLATES.GET.container({
										name:container,
										fieldStyle:temp,
										genType  : p.genType,
										callback:function(contents){
											var fTempl = contents.fields[temp];
											var useDefault = true;

											TEMPLATES.SET.field({
												name     : p.field,
												container: container,
												context  : temp,
												template : fTempl,
												useDefault:useDefault
											});

											if(p.callback) p.callback(fTempl,{
												useDefault:useDefault
											});
										}
									});


								}
							});
						}else{
							//use default
							TEMPLATES.GET.container({
								name:container,
								fieldStyle:temp,
								genType  : p.genType,
								callback:function(contents){
									var fTempl = contents.fields[temp];
									var useDefault = true;

									TEMPLATES.SET.field({
										name     : p.field,
										container: container,
										context  : temp,
										template : fTempl,
										useDefault:useDefault
									});

									if(p.callback) p.callback(fTempl,{
										useDefault:useDefault
									});
								}
							});
						}
						

						/*//use default
						TEMPLATES.GET.container({
							name:container,
							fieldStyle:temp,
							genType  : p.genType,
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
						});*/


					}
				});
			}
		}
	}
	
}