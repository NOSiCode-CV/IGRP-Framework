/*
	XML / XSL TRANSFORMATION
	PLUGIN PARAMETERS:
		xml          : 'pathtoxml' / xml object
		xsl          : 'pathtoxsl' / xsl object
		xslBasePath  : 'path to include'
		xslParams 	 : xsl parameters { p1:'xxx', p2:'yyy' }
		xmlData   	 : xml data (when xml is a url) { p1:'zz',p2:'qq' } / 'p1=zz&p2=464'
		method    	 : method when calling xml url 'GET/POST'
		dataType     : response type expected
		loadingClass : css class to the element that is being transformed
		complete  	 : transformation complete callback
		error        : transformation error callback

		//IE NAMESPACE FIX
		namespace    : 


	ChangeLog:
		22.05.15  - CREATED . WILLIAM LIMA - NOSi
		19.06.15  - IE FIX  . WILLIAM LIMA - NOSi
*/

var __XSLTemplatesInc = {};

$.fn.XMLTransform = function(params) {
	var element 	 = this;
 	var xml 		 = null;
 	var xsl 		 = null;
 	var loader 		 = !params.loading ? false : true;
 	var loadingClass = params.loadingClass ? params.loadingClass : 'xml-xsl-loading';
 	var loadingb64   = null;
 	var tmplSplitter = params.xslBasePath ? params.xslBasePath+'/' : path+'/xsl/tmpl/';
 	var IEincludes   = [];

 	//SET DIV CONTENT FROM TRANSFORMATION
 	var setContent = function(content){

 		setTimeout(function(){
 			
 			if(params.method && params.method == 'replace')
 				element.replaceWith(content);
 			else
 				element.html(content);
 			

 			done(content);
 			
 		},150);		
 	}
 	//TRANSFORM
 	var start = function(){
 		try{
	 		if(xml && xsl){
	 			var isIE11    = window.navigator.userAgent.match(/rv:11.0/i);
	 			var isIE      = window.ActiveXObject  || isIE11 ? true : false;
	 			var callback  = isIE ? IETransform : Transform;

	 			includeTemplates({
	 				callback:function(){
	 					if(isIE && params.excludePrefix )
	 						excludePrefix(params.excludePrefix);

	 					callback();
	 				}
	 			});

	 		}
 		}catch(startError){
 			errorHandler(startError)
 		}
 	}
 	//DONE CALLBACK
 	var done = function(content,c){
 		
 		var complete = c == false ? false : true;

 		element.removeClass(loadingClass);
 		
 		element.find('.xml-xsl-loader').remove();

 		if(params.loader) 
 			params.loader.hide();
 		
 		if(complete){
 			if(params.complete){
 				params.complete(element,content);
 			}
 		}
 		
 	}

 	var loadTemplate = function(p){
 		var i       = p.index > 0 ? p.index : 0;
 		var content = p.content ? p.content : "";

 		if(i < p.includes.length){

 			var includeFile = p.includes[i].global ? tmplSplitter+p.includes[i].name : p.includes[i].name;

 			var baseWay = includeFile.split('/').slice(0,-1).join('/');
 			
 			if(!baseWay) 
 				includeFile=tmplSplitter+'/'+includeFile;
 			
 			includeFile = includeFile.split('?v=')[0];
 			
 			if(!__XSLTemplatesInc[ includeFile ])
 			
	 			__XSLTemplatesInc[ includeFile ] = {
	 				
	 				request : null
	 					
	 			}
 			
 			var AfterLoadCallback = function(data){
 				
 				var contents = $(data).clone()[0];
 				
 				for(var x = 0; x < contents.childNodes.length;x++){
						if(contents.childNodes[x].tagName && contents.childNodes[x].tagName != 'xsl:include' && contents.childNodes[x].tagName != 'xsl:import'){
							IEincludes.push(contents.childNodes[x]);
						}
					}

					loadTemplate({
						includes:getIncludesArr(data,baseWay),
						callback:function(){
							loadTemplate({
				 				includes:p.includes,
				 				index   :i+1,
				 				callback:p.callback
				 			});
						}
					});	
 				
 			};
 			

 			if(__XSLTemplatesInc[ includeFile ].data){

 				AfterLoadCallback( __XSLTemplatesInc[ includeFile ].data );
 				
 			}else{
 			
	 			if(__XSLTemplatesInc[ includeFile ].request)
	 				
	 				__XSLTemplatesInc[ includeFile ].request.then(function(data){
	 					
	 					var contents = data.documentElement,
	 					
	 						clone    = $(data.documentElement).clone(true)[0];
	 					
	 					AfterLoadCallback( clone );
	 					
						__XSLTemplatesInc[ includeFile ].data = clone;
	 					
	 				});
	 		
	 			else
 				
 				__XSLTemplatesInc[ includeFile ].request = $.ajax({
	 				url:includeFile,
	 				cache:true,
	 				success:function(data){
	 					
	 					var contents = data.documentElement,
	 					
	 						clone    = $(data.documentElement).clone(true)[0];
	 					
	 					AfterLoadCallback( clone );
	 					
						__XSLTemplatesInc[ includeFile ].data = clone;
						
						__XSLTemplatesInc[ includeFile ].request = false;

						
	 				},
	 				error:function(e){
	 					errorHandler(e)
	 				}
	 			});
 				
 			}
 			
	 			
			

 		}else{
 			if(p.callback) p.callback(i)
 		}
 	};

 	var getIncludesArr = function(doc,base){
 		var rtn = [];
 		var xslPath = typeof params.xsl == 'string' ?  params.xsl : null;
 		var baseWay = '';
 		
 		if(xslPath){
 			var arr = xslPath.split('/')
 			arr.pop();
 			baseWay = arr.join('/');
 		}

 		$.each($(doc).find('*'),function(){
 			if(this.tagName == 'xsl:include' || this.tagName == 'xsl:import'){
 				
 				var href   = $(this).attr('href');

 				href = base ? base+'/'+href : href;

 				var isGlobal = href.indexOf(tmplSplitter) != -1 ? true : false;

 				var name = isGlobal ? href.split(tmplSplitter)[1] : href;
 				
 				if(name) rtn.push({
 					global:isGlobal,
 					name:name
 				});


 			}
 		});
 		
 		//console.log(rtn)
 		return rtn;
 	};

	var removeIncludes = function(xsl){
		$.each($(xsl).find('xsl\\:include,xsl\\:import'),function(){
			$(this).remove()
		});
	}
	
	var excludePrefix = function(pref){
 		var xslStr    = $(xsl).getXMLStr();
 		var newXslStr = xslStr.replaceAll(pref,'');
 		var xmlStr    = $(xml).getXMLStr();
 		var newXmlStr = xmlStr.replaceAll(pref,'');
 		
 		try {
 			xsl = $.parseXML(newXslStr);
 			xml = $.parseXML(newXmlStr);
 		}catch(e){
 			console.log('Exclude Prefix Error: '+ pref);
 			console.log(e);
 		}
 	}	
 	//include templates manually
 	var includeTemplates =function(p){

 		var includesArr = getIncludesArr(xsl);

 		var stylesheet = xsl.documentElement;

 		loadTemplate({
 			includes: includesArr,
 			callback:function(){
 				IEincludes.forEach(function(include,i){
 					$(stylesheet).append(include); // include all templates and vars
 				});

 				xsl = $(stylesheet).getXMLDocument(); // assume the new xsl

 				removeIncludes(xsl); //remove all includes / imports
 				
 				IEincludes = []; //reset Includes Array

 				if(p.callback) p.callback(xsl); //transform
 			}
 		});
 	}

 	//IE TRANSFORMATION
 	var IETransform = function(){
 		try{
 			var xslTemplate,xslproc;
 			
 			/*GET IE XSL*/
 			var xsldoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument.6.0");
			xsldoc.async = false;
			xsldoc.preserveWhiteSpace = true;
			xsldoc.setProperty("AllowDocumentFunction", true);//allow xsl to load files (document())

			try{
 				xsldoc.load(xsl);
 			}catch(xsldocErr){
 				console.log(xsldocErr)
 			}

 			/*GET IE XML*/
 			var xmldoc = new ActiveXObject("Msxml2.DOMDocument.6.0");
 			
			xmldoc.async           = false;

			//xmldoc.load(params.xml);

			xmldoc = xml;

 			if ((xsldoc.parseError && xsldoc.parseError.errorCode != 0) || (xmldoc.parseError && xmldoc.parseError.errorCode != 0)) {
 				errorHandler({
 					xslError: xsldoc.parseError.reason,
 					xmlError: xmldoc.parseError.reason
 				});
 				return false;
 			}else{
 				xslTemplate = new ActiveXObject("Msxml2.XSLTemplate.6.0");
 				
 				xslTemplate.stylesheet = xsldoc;
 				
 				xslproc = xslTemplate.createProcessor();
 				 
				xslproc.input = xmldoc;

				if(params.xslParams){
					for(var p in params.xslParams){
						xslproc.addParameter(p, params.xslParams[p]);
					}
				}
				xslproc.transform();
				setContent(xslproc.output);
 			}
 			
 		}catch(IEError){
 			console.log(IEError)
 		}
 	}
 	//GOOGLE/FIREFOX TRANSFORM
	//GOOGLE/FIREFOX TRANSFORM
	var Transform = function(){

		// ── Use native XSLTProcessor while it exists ────────────────────────────
		if (typeof XSLTProcessor !== 'undefined') {

			try {
				var xsltProcessor = new XSLTProcessor();

				xsltProcessor.flags = 0;

				xsltProcessor.importStylesheet(xsl);

				if (params.xslParams) {
					for (var p in params.xslParams) {
						xsltProcessor.setParameter(null, p, params.xslParams[p]);
					}
				}

				setContent(xsltProcessor.transformToFragment(xml, document));

			} catch (e) {
				console.error('[XMLTransform] XSLTProcessor failed:', e.message || e);
				errorHandler(e);
			}

			// ── Server-side fallback (for when XSLTProcessor is eventually removed) ─
		} else {

			try {
				// At this point includeTemplates() has already run, so xsl has all
				// includes inlined — we can safely serialize and send to the server.
				var xmlStr = new XMLSerializer().serializeToString(xml);
				var xslStr = new XMLSerializer().serializeToString(xsl);

				$.ajax({
					url         : 'app/webapps/igrp/generator/transform',
					method      : 'POST',
					contentType : 'application/json',
					data        : JSON.stringify({
						xml       : xmlStr,
						xsl       : xslStr,
						xslParams : params.xslParams || {}
					}),
					success : function(html) {
						var wrapper = document.createElement('div');
						wrapper.innerHTML = html;
						setContent(html);
					},
					error : function(xhr, status, err) {
						console.error('[XMLTransform] Server-side transform failed:', status, err);
						errorHandler({ message: 'Server transform failed: ' + status });
					}
				});

			} catch (e) {
				console.error('[XMLTransform] Fallback serialization failed:', e.message || e);
				errorHandler(e);
			}
		}
	}
	var prepareElement = function() {
		if (loader) {
			loadingb64 = $('<div>').addClass('xml-xsl-loader'); // CSS handles the rest
			element.css({
				position: element.css('position') === 'static' ? 'relative' : element.css('position')
			});
			if (element.height() > 30)
				element.append(loadingb64);
		}
		if (params.loader)
			params.loader.show();
		element.addClass(loadingClass);
	};
 	//XML SETTER
 	var setXML = function(_xml){
 		xml = _xml;
 		start();
 	}
 	//XSL SETTER
 	var setXSL = function(_xsl){
 		xsl = _xsl;
 		start();
 	}
 	//GET XML OBJCT
 	var getXML = function(){
 		if(params.xml)
	 		switch(typeof params.xml){
	 			case 'string':
	 				
	 				getContentFromUrl({
	 					url      :params.xml,
	 					data     :params.xmlData,
						method : 'POST',
	 					callback :setXML
	 				});

	 			break;
	 			case 'object':
	 				setXML(params.xml)
	 			break;
	 		}
	 	else
	 		errorHandler({ message:'No XML' })
 	}
 	//GET XSL OBJCT
 	var getXSL = function(){
 		if(params.xsl)
	 		switch(typeof params.xsl){
	 			case 'string':
	 				getContentFromUrl({
	 					url      :params.xsl,
	 					callback :setXSL
	 				});

	 			break;
	 			case 'object':
	 				setXSL(params.xsl);
	 			break;
	 		}
	 	else
	 		errorHandler({ message:'No XSL' })
 	}
 	//AJAX LOAD CONTENT
 	var getContentFromUrl = function(p){
 		var base = p.url.split('/').slice(0,-1).join('/');

 		$.ajax({
 			url     : p.url,
 			dataType: p.dataType ? p.dataType : 'xml',
 			data    : p.data ? p.data : null,
 			method  : p.method ? p.method.toUpperCase() : 'GET',
 			type    : p.method ? p.method.toUpperCase() : 'GET',
 			success : p.callback,
 			error   : errorHandler,
 			fail    : errorHandler
 		});
 	}
 	//ERROR HANDLER
 	var errorHandler = function(e){
 		if(params.error) params.error(e);
 		done(null,false);
 		return false;
 	}
 	//INITIALIZATION
 	var init = function(){
 		prepareElement();
 		getXML();
 		getXSL();
 	}
 	init();
};