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

const __XSLTemplatesInc = {};

$.fn.XMLTransform = function(params) {
	const element = this;
	let xml = null;
	let xsl = null;
	const loader = params.loading;
	const loadingClass = params.loadingClass ? params.loadingClass : 'xml-xsl-loading';
	let loadingb64 = null;
	const tmplSplitter = params.xslBasePath ? params.xslBasePath + '/' : path + '/xsl/tmpl/';
	let IEincludes = [];

	//GOOGLE/FIREFOX TRANSFORM
	//GOOGLE/FIREFOX TRANSFORM
	const Transform = function(){

		// ── Use native XSLTProcessor while it exists ────────────────────────────
		if (typeof XSLTProcessor !== 'undefined') {

			try {
				const xsltProcessor = new XSLTProcessor();
				xsltProcessor.flags = 0;
				xsltProcessor.importStylesheet(xsl);

				if (params.xslParams) {
					for (let p in params.xslParams) {
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
				const xmlStr = new XMLSerializer().serializeToString(xml);

				const payload = {
					xml: xmlStr,
					xslParams: params.xslParams || {}
				};

// Prefer cached server-side XSL path
				if (params.xslPath) {
					payload.xslPath = params.xslPath;
				} else if (typeof params.xsl === 'string') {
					payload.xslPath = params.xsl;
				} else {
					// fallback for dynamic XSL object
					payload.xsl = new XMLSerializer().serializeToString(xsl);
				}

				$.ajax({
					url: '../app/webapps?r=igrp/Generator/transform&target=_blank',
					method: 'POST',
					contentType: 'application/json; charset=UTF-8',
					dataType: 'html',
					processData: false,
					data: JSON.stringify(payload),

					success: function (html) {
						setContent(html);
					},

					error: function (xhr, status, err) {
						console.error('[XMLTransform] Server-side transform failed:', status, err);
						console.error('[XMLTransform] Response text:', xhr.responseText);
						errorHandler({message: 'Server transform failed: ' + status});
					}
				});

			} catch (e) {
				console.error('[XMLTransform] Fallback serialization failed:', e.message || e);
				if (typeof XSLTProcessor !== 'undefined') {
					console.log('[XMLTransform] Falling back to client-side XSLTProcessor');
					// retry with client-side XSLTProcessor here
				} else {
					errorHandler(e);
				}
			}
		}
	};
//IE TRANSFORMATION
	const IETransform = function(){
		try{
			let xslTemplate, xslproc;

			/*GET IE XSL*/
			const xsldoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument.6.0");
			xsldoc.async = false;
			xsldoc.preserveWhiteSpace = true;
			xsldoc.setProperty("AllowDocumentFunction", true);//allow xsl to load files (document())

			try{
				xsldoc.load(xsl);
			}catch(xsldocErr){
				console.log(xsldocErr)
			}

			/*GET IE XML*/
			let xmldoc = new ActiveXObject("Msxml2.DOMDocument.6.0");

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
					for(let p in params.xslParams){
						xslproc.addParameter(p, params.xslParams[p]);
					}
				}
				xslproc.transform();
				setContent(xslproc.output);
			}

		}catch(IEError){
			console.log(IEError)
		}
	};
//include templates manually
	const includeTemplates =function(p){

		const includesArr = getIncludesArr(xsl);

		const stylesheet = xsl.documentElement;

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
	};
	const excludePrefix = function(pref){
		const xslStr = $(xsl).getXMLStr();
		const newXslStr = xslStr.replaceAll(pref, '');
		const xmlStr = $(xml).getXMLStr();
		const newXmlStr = xmlStr.replaceAll(pref, '');

		try {
			xsl = $.parseXML(newXslStr);
			xml = $.parseXML(newXmlStr);
		}catch(e){
			console.log('Exclude Prefix Error: '+ pref);
			console.log(e);
		}
	};
	const getIncludesArr = function(doc, base){
		const rtn = [];
		const xslPath = typeof params.xsl == 'string' ? params.xsl : null;
		let baseWay = '';

		if(xslPath){
			const arr = xslPath.split('/');
			arr.pop();
			baseWay = arr.join('/');
		}

		$.each($(doc).find('*'),function(){
			if(this.tagName == 'xsl:include' || this.tagName == 'xsl:import'){

				let href = $(this).attr('href');

				href = base ? base+'/'+href : href;

				const isGlobal = href.indexOf(tmplSplitter) != -1 ? true : false;

				const name = isGlobal ? href.split(tmplSplitter)[1] : href;

				if(name) rtn.push({
					global:isGlobal,
					name:name
				});


			}
		});

		//console.log(rtn)
		return rtn;
	};
//DONE CALLBACK
	const done = function(content,c){

		const complete = c != false;

		element.removeClass(loadingClass);

		element.find('.xml-xsl-loader').remove();

		if(params.loader)
			params.loader.hide();

		if(complete){
			if(params.complete){
				params.complete(element,content);
			}
		}

	};


	//SET DIV CONTENT FROM TRANSFORMATION
	const setContent = function (content) {
		if (params.method === 'replace') {
			element.replaceWith(content);
		} else {
			element.html(content);
		}

		done(content);
	};

	//TRANSFORM
	const start = function () {
		try {
			if (xml && xsl) {
				const isIE11 = window.navigator.userAgent.match(/rv:11.0/i);
				const isIE = !!(window.ActiveXObject || isIE11);
				const callback = isIE ? IETransform : Transform;

				includeTemplates({
					callback: function () {
						if (isIE && params.excludePrefix)
							excludePrefix(params.excludePrefix);

						callback();
					}
				});

			}
		} catch (startError) {
			errorHandler(startError)
		}
	};

	const loadTemplate = function (p) {
		const i = p.index > 0 ? p.index : 0;
		const content = p.content ? p.content : "";

		if (i < p.includes.length) {

			let includeFile = p.includes[i].global ? tmplSplitter + p.includes[i].name : p.includes[i].name;

			const baseWay = includeFile.split('/').slice(0, -1).join('/');

			if (!baseWay)
				includeFile = tmplSplitter + '/' + includeFile;

			includeFile = includeFile.split('?v=')[0];

			if (!__XSLTemplatesInc[includeFile])

				__XSLTemplatesInc[includeFile] = {

					request: null

				}

			const AfterLoadCallback = function (data) {

				const contents = $(data).clone()[0];

				for (let x = 0; x < contents.childNodes.length; x++) {
					if (contents.childNodes[x].tagName && contents.childNodes[x].tagName !== 'xsl:include' && contents.childNodes[x].tagName !== 'xsl:import') {
						IEincludes.push(contents.childNodes[x]);
					}
				}

				loadTemplate({
					includes: getIncludesArr(data, baseWay),
					callback: function () {
						loadTemplate({
							includes: p.includes,
							index: i + 1,
							callback: p.callback
						});
					}
				});

			};


			if (__XSLTemplatesInc[includeFile].data) {

				AfterLoadCallback(__XSLTemplatesInc[includeFile].data);

			} else {

				if (__XSLTemplatesInc[includeFile].request)

					__XSLTemplatesInc[includeFile].request.then(function (data) {

						const contents = data.documentElement,

							clone = $(data.documentElement).clone(true)[0];

						AfterLoadCallback(clone);

						__XSLTemplatesInc[includeFile].data = clone;

					});

				else

					__XSLTemplatesInc[includeFile].request = $.ajax({
						url: includeFile,
						cache: true,
						success: function (data) {

							const contents = data.documentElement,

								clone = $(data.documentElement).clone(true)[0];

							AfterLoadCallback(clone);

							__XSLTemplatesInc[includeFile].data = clone;

							__XSLTemplatesInc[includeFile].request = false;


						},
						error: function (e) {
							errorHandler(e)
						}
					});

			}


		} else {
			if (p.callback) p.callback(i)
		}
	};


	const removeIncludes = function (xsl) {
		$.each($(xsl).find('xsl\\:include,xsl\\:import'), function () {
			$(this).remove()
		});
	};
	const prepareElement = function () {
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
	const setXML = function (_xml) {
		xml = _xml;
		start();
	};
	//XSL SETTER
	const setXSL = function (_xsl) {
		xsl = _xsl;
		start();
	};
	//GET XML OBJCT
	const getXML = function () {
		if (params.xml)
			switch (typeof params.xml) {
				case 'string':

					getContentFromUrl({
						url: params.xml,
						data: params.xmlData,
						method: 'POST',
						callback: setXML
					});

					break;
				case 'object':
					setXML(params.xml)
					break;
			}
		else
			errorHandler({message: 'No XML'})
	};
	//GET XSL OBJCT
	const getXSL = function () {
		if (params.xsl)
			switch (typeof params.xsl) {
				case 'string':
					getContentFromUrl({
						url: params.xsl,
						callback: setXSL
					});

					break;
				case 'object':
					setXSL(params.xsl);
					break;
			}
		else
			errorHandler({message: 'No XSL'})
	};
	//AJAX LOAD CONTENT
	var getContentFromUrl = function(p){
		const base = p.url.split('/').slice(0, -1).join('/');

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
	const init = function () {
		prepareElement();
		getXML();
		getXSL();
	};
	init();
};