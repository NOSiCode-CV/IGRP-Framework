var k = {

}

var genxsl = {
	xsl     : '',
	data    : {},
	build:function(){
	
		var baseStr = $(genxsl.base).getXMLStr();
		var tidx    = baseStr.indexOf('<!--TEMPLATES-->');

		for(var c in genxsl.data){
			var container = genxsl.data[c];
			var xtmp      = $.parseXML(setXmlnsAttr(container.template));
			var dropZones = $('[gen-id="drop-zone"]',xtmp);
			
			var ttemplate = '<gen:template name="gen_'+c+'" mode="gen_'+c+'">';
			//console.log(c.toUpperCase())
			if( dropZones[0] ){

				$.each(dropZones,function(i,dz){

					var dzStr    = $(dz).getXMLStr();
					var sidx     = dzStr.indexOf('>');
					var dzTop    = $.trim(dzStr.slice(0,sidx+1) );
					var dzBottom = $.trim(dzStr.slice(sidx+1) );
					//var

					if(dzTop && dzBottom){

						var dzFtemplateAttr = $(dz).attr('gen-field-template') ? $(dz).attr('gen-field-template') : 'field';
						var csplit          = dzFtemplateAttr.split('.');
						var defattr         = csplit[csplit.length-1];
						//console.log('-'+dzFtemplateAttr.toUpperCase())
						var ftypeChoose = '<gen:choose>';
						for(var f in container.fieldsTemplate){
							var field     = container.fieldsTemplate[f];
							var ftemplate = field[dzFtemplateAttr];

							if(ftemplate != container.defaults.fields[defattr]){
								//console.log('---'+f)
								ftypeChoose+='<gen:when test="'+f+'">';
								ftypeChoose+=ftemplate;
								ftypeChoose+='</gen:when>';
							}
						}
						ftypeChoose+='<gen:otherwise>'+container.defaults.fields[defattr]+'</gen:otherwise>';
						ftypeChoose+='</gen:choose>';

						dzTop+=(ftypeChoose+dzBottom);

						//console.log(dzTop)
					}
				});

			}


			ttemplate    += '</gen:template>';
			
			console.log(ttemplate)

			baseStr = baseStr.insert(tidx,ttemplate)

		}

	},



	download:function(){
		var GEN = VARS.getGen();
		genxsl.path = GEN.path;

		genxsl.getBase({
			callback:function(base){
				genxsl.base = base;
				$.ajax({
					url:GEN.sourcePath,
					success:function(sourceData){
						var containers = $.xml2json( $(sourceData).find('gen>containers')[0] ).item
						var fields     = $.xml2json( $(sourceData).find('gen>fields')[0] ).item
						
						genxsl.getContents({
							containers:containers,
							fields    :fields,
							callback:function(){
								console.clear();
								genxsl.build();
								
							}
						});

					}
				});
			}
		});

		
		
	},
	getBase:function(o){
		$.ajax({
			url:genxsl.path+'/util/XSL-generator.xsl',
			success:function(base){
				if(o.callback)
					o.callback(base);
			}
		})
	},
	getContents:function(o){
		var idx = o.index ? o.index : 0;
		
		if(idx < o.containers.length){
			var cdata     = o.containers[idx];
			var container = o.containers[idx];

			genxsl.getContainerTemplate(container,{
				fields  :o.fields,  
				callback:function(){
					genxsl.getContents({
						containers:o.containers,
						fields    :o.fields,
						index     :idx+1,
						callback  :o.callback
					});
				}
			});

		}else{
			if(o.callback && typeof o.callback == 'function')
				o.callback();
		}
	},
	getDropZonesFieldsTemplate:function(o){
		var idx = o.index ? o.index : 0;

		var rtn = o.result ? o.result : {};

		if(idx < o.dropZones.length){
			var dz      = o.dropZones[idx];
			var context = $(dz).attr('gen-field-template') ? $(dz).attr('gen-field-template') : 'field';
	
			TEMPLATES.GET.field({
				field    : o.field.name,
				context  : context,
				container: o.container.name,
				genType  : 'container',
				callback :function(result,p){
					//var csplit   = context.split('.');
					//var fcontext = csplit[ csplit.length-1 ];					
					//if(!p.useDefault)
					genxsl.data[o.container.name].fieldsTemplate[o.field.name][context] = result;
					
					genxsl.getDropZonesFieldsTemplate({
						container: o.container,
						field    : o.field,
						//genfields: o.genfields,
						dropZones: o.dropZones,
						index    : idx+1,
						result   : rtn,
						callback : o.callback
					});
				}
			});
			
		}else{
			if(o.callback)
				o.callback(rtn);
		}
	},
	setAllFieldsTemplate:function(o){
		var idx = o.index ? o.index : 0;
		var rtn = o.result ? o.result : {};

		if(idx < o.genfields.length){
			var field = o.genfields[idx];
			
			genxsl.data[o.container.name].fieldsTemplate[field.name] = {};

			genxsl.getDropZonesFieldsTemplate({
				container:o.container,
				field    :field,  
				dropZones:o.dropZones,
				callback :function(rtn){
				
					genxsl.setAllFieldsTemplate({
						container:o.container,
						genfields:o.genfields,
						index    :idx+1,
						dropZones:o.dropZones,
						result   :rtn,
						callback :o.callback
					});


				}
			});

		}else{
			if(o.callback)
				o.callback();
		}
	},
	setTemplate:function(o){
		var xtmp      = $.parseXML( setXmlnsAttr( o.data.template ) );
		var dropZones = $('[gen-id="drop-zone"]',xtmp);
		var hasField  = o.container.hasField == 'false' ? false : true;

		genxsl.data[o. container.name] = {
			defaults      :o.data,
			template      :o.data.template,
			fieldsTemplate:{}
		};

		//console.log(genxsl.data[o. container.name])
		
		if(hasField){
			genxsl.setAllFieldsTemplate({
				container:o.container,
				genfields:o.genfields,
				dropZones:dropZones,
				callback:function(d){
					if(o.callback)
						o.callback();
				}
			});
		}else{
			if(o.callback)
				o.callback();
		}
	},
	getContainerTemplate:function(container,o){
		var hasField = container.hasField == 'false' ? false : true;

		TEMPLATES.GET.container({
			name:container.name,
			genType:'container',
			getField:hasField,
			callback:function(d){

				genxsl.setTemplate({
					container:container,
					data     :d,
					genfields:o.fields,
					callback :function(){
						//console.log(o)
						if(o && o.callback)
							o.callback()
					}
				});
			},
			error:function(){
				console.log('error');
			}
		});
	}
};