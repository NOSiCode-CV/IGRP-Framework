(function(){

	'use strict';

	var GEN 		= null,

		downloading = false,

		genPath 	= path+'/core/formgen',

		baseXSL 	= null,

		baseGEN  	= null,

		dFields 	= [],

		dContainers = [],

		contentsXSL = '',

		includes    = {},

		gx  		= window.genxsl = {

			download:function(){

				if(!downloading){

					downloading = true;
					
					GEN 		= VARS.getGen();

					dContainers = GEN.getAllDeclaredContainers();

					dFields 	= GEN.getDeclaredFields();

					contentsXSL = '';

					includes 	= {

						xsl : [],

						css : [],

						js : []

					}

					gx.getBaseXsl().then( function(){

						gx.buildContents({

							callback:function(){

								console.log('das');
							
							}
						})

					} );
				}
					

			},

			getContainerContents:function(c,o){

				var mainTemplate = $(baseGEN).find('gen\\:template[match="/"]') ;
				
				var container 	 = new c.container(c.name,{});
				
				try{

					container.init(function(){

						var temp = gx.createContainerTemplate(container);

						contentsXSL+=temp

						//xsl includes
						if(container.getXSLIncludes){
							
							var incArr = container.getXSLIncludes().array || [];

							incArr.forEach(function(i){

								var inc = {

									types : [container.type],

									href: i

								};

								if(includes.xsl[0]){

									var exists 	 = false,

										existsIdx;

									for(var x=0; x < includes.xsl.length; x++){

										var included = includes.xsl[x];

										if(included.href == inc.href){

											exists = true;

											existsIdx = x;

											break;

										}

									}

									if(exists)

										includes.xsl[existsIdx].types.push(container.type)

									else
										
										includes.xsl.push( inc )


								}else{

									
									includes.xsl.push( inc )

								}
								
							});

						}

						//css includes
						if(container.includes && container.includes.css){

							var csss = container.includes.css;

							csss.forEach(function(cssinc){

								var inc = {

									href : cssinc.path,

									types : [container.type]

								};

								if(includes.css[0]){

									var exists 	 = false,

										existsIdx;

									for(var x=0; x < includes.css.length; x++){

										var included = includes.css[x];

										if(included.href == inc.href){

											exists = true;

											existsIdx = x;

											break;

										}

									}

									if(exists)

										includes.css[existsIdx].types.push(container.type)

									else
										
										includes.css.push( inc )

								}else{
									includes.css.push(inc);
								}


							})

						}

						//js includes
						if(container.includes && container.includes.js){

							var jss = container.includes.js;

							jss.forEach(function(jsinc){

								var inc = {

									href : jsinc.path,

									types : [container.type]

								};

								if(includes.js[0]){

									var exists 	 = false,

										existsIdx;

									for(var x=0; x < includes.js.length; x++){

										var included = includes.js[x];

										if(included.href == inc.href){

											exists = true;

											existsIdx = x;

											break;

										}

									}

									if(exists)

										includes.js[existsIdx].types.push(container.type)

									else
										
										includes.js.push( inc )

								}else{
									includes.js.push(inc);
								}


							})

						}



						o.always();//

					});

				}catch(err){

					console.log(err);

				}

			},

			getIndexes:function(o){

				var index = o.index || 0;

				var c 		 = o.container;

				var template = c.template;

				var beginExp = '#[';

				var endExp   = ']#';

				var begin 	 = getIndicesOf(beginExp, template);

				var end  	 = getIndicesOf(endExp, template);

				var rtn      =  [];

				begin.forEach(function(bi,i){

					var bindex    = bi+beginExp.length,

						eindex    = end[i],

						attrName  = template.substring(bindex,eindex),

						attrValue = '',

						attrOptions = c.propertiesOptions[attrName] || {};

					if(attrName){

						var propValue   = c.GET[attrName] ? c.GET[attrName]() : '';

						if(attrOptions.xslValue ){
							if(propValue == true)
								attrValue = typeof attrOptions.xslValue == 'function' ?attrOptions.xslValue() : attrOptions.xslValue ;
						}else{
							attrValue = propValue
						}

						//attrValue = attrOptions.xslValue && propValue == true ? attrOptions.xslValue : '';

						//attrValue = c.GET[attrName] ? c.GET[attrName]() : '';

					}
						
					rtn.push({

						expression : beginExp+attrName+endExp,

						attrName   : attrName,

						attrValue : attrValue,

						attrOptions : attrOptions

					});


				});

				return rtn;

			},

			configFieldsTemplate:function(o){
				
				var dzExpr 	    = 'gen-id="drop-zone"',

					dzIdx 		= o.containerTemplate.indexOf(dzExpr),

					hasDropZone = dzIdx != -1;
			
				if(hasDropZone){
					
					var dropZonesIdx = getIndicesOf(dzExpr,o.containerTemplate);

					o.container.dropZone.forEach(function(dz){

						console.log(dz);

					});

					console.log(o.containerTemplate)

				}

			},

			createContainerTemplate:function(c){

				var wrapper  = '<gen:template name="gen_'+c.type+'" >';

				var tagStr  = '{name()}';

				var pathStr  = 'rows/content/{name()}';

				var template = c.template;

				gx.getIndexes( { container:c } ).forEach(function(r){
					
					template = template.replaceAll(r.expression,r.attrValue);

				});

				template = template.replaceAll('#path#',pathStr);

				template = template.replaceAll('#tag#',tagStr);

				template = template.replaceAll('#value.rows#',"''");

				template = template.replaceAll('#table.rows#',pathStr+"/table/value/row[not(@total='yes')]");

				template = template.replaceAll('#title#',c.GET.title ? c.GET.title() : "");

				template = template.replaceAll('#collapsible#',"false");

				wrapper+='<xsl:if test="'+pathStr+'"><div item-name="{name()}" class="gen-container-item">'+template+'</div></xsl:if>';

				if(c.propertiesOptions){

					for(var p in c.propertiesOptions){

						var prop = c.propertiesOptions[p];

						if(prop.isField){
							
							var pname = prop.name;

							wrapper = wrapper.replaceAll("{rows/content/{name()}/fields/{name()}_"+pname+"/value}", "{ concat( '{rows/content/',name(),'/fields/',name(),'_"+pname+"/value }' ) }");

							wrapper = wrapper.replaceAll("{rows/content/{name()}/fields/{name()}_"+pname+"/label}", "{ concat( '{rows/content/',name(),'/fields/',name(),'_"+pname+"/label }' ) }")

						}

					}
				}

				wrapper+='</gen:template>';

				gx.configFieldsTemplate({
					containerTemplate : wrapper,
					container 	      : c
				});

				return wrapper ;
			},

			buildContents:function(o){

				var idx = o.index || 0;

				if(idx < dContainers.length){

					var container = dContainers[idx];

					o.index = idx+1;

					gx.getContainerContents( container, {

						always:function(){

							o.index = idx +1;

							gx.buildContents(o);

						}

					});

				}else{

					gx.getGENString();

					downloading = false;



				}

			},

			getGENIncludes : function(){

			},

			getGENString : function(){

				var genXSLStr = $( baseGEN ).getXMLStr().replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"','');

				var templateStartIdx = genXSLStr.indexOf('</gen:stylesheet>');

				var xslTmplPath = GEN.SETTINGS.gentype == 'java' ? '../../..' : '../..';

				var xslIncludesStr = '';

				var cssIncludesStr = '';

				var jsIncludesStr = '';

				genXSLStr = genXSLStr.insert(templateStartIdx,contentsXSL);

				includes.xsl.forEach(function(inc){

					var incStr = function(){

						var rtn = '';

						inc.types.forEach(function(t,x){

							rtn+="@type='"+t+"'";

							if(x < inc.types.length-1)
								rtn+=' or ';

						});

						return rtn;

					}();

					xslIncludesStr+='<gen:if test="rows/content/*['+incStr+'] ">';

						xslIncludesStr+='<xsl:include href="'+xslTmplPath+'/xsl/tmpl/'+inc.href+'?v='+_getDate()+'"/>';

					xslIncludesStr+='</gen:if>';

				});

				includes.css.forEach(function(inc){

					var incStr = function(){

						var rtn = '';

						inc.types.forEach(function(t,x){

							rtn+="@type='"+t+"'";

							if(x < inc.types.length-1)
								rtn+=' or ';

						});

						return rtn;

					}();

					cssIncludesStr+='<gen:if test="rows/content/*['+incStr+'] ">';

						cssIncludesStr+='<link rel="stylesheet" type="text/css" href="{$pathAttr}'+inc.href+'?v={$version}"/>'

					cssIncludesStr+='</gen:if>';

				});

				includes.js.forEach(function(inc){

					var incStr = function(){

						var rtn = '';

						inc.types.forEach(function(t,x){

							rtn+="@type='"+t+"'";

							if(x < inc.types.length-1)
								rtn+=' or ';

						});

						return rtn;

					}();

					jsIncludesStr+='<gen:if test="rows/content/*['+incStr+'] ">';

						jsIncludesStr+='<script type="text/javascript" src="{$pathAttr}/'+inc.href+'?v={$version}"/>'

					jsIncludesStr+='</gen:if>';

				});

				genXSLStr = genXSLStr.replace('<!--INCLUDES-->',xslIncludesStr)

				genXSLStr = genXSLStr.replaceAll('xmlns="http://www.w3.org/1999/xhtml"','');

				genXSLStr = hackNamesXSL(genXSLStr);

				var cssExpression = '<xsl:call-template name="IGRP-head"/>',

					cssIndx = genXSLStr.indexOf(cssExpression);

				genXSLStr = genXSLStr.insert( cssIndx+cssExpression.length, cssIncludesStr );

				var jsExpression = '</body>',

					jsIndx = genXSLStr.indexOf(jsExpression);

				genXSLStr = genXSLStr.insert( jsIndx, jsIncludesStr );

				console.log( genXSLStr )

				return  genXSLStr;

			},

			configBaseXSL : function(xsl){

				var rtn = '',

					xslPath = GEN.SETTINGS.gentype == 'java' ? '../../..' : '../..';

				GEN.defaultIncludes.forEach(function(name){

					rtn+= '<xsl:include href="'+xslPath+'/xsl/tmpl/IGRP-'+name+'.tmpl.xsl?v='+_getDate()+'"/>';
				
				});
				
				$(rtn).insertAfter( $(xsl).find('xsl\\:template') );
				
				return xsl;
			},

			configContentsCall:function() {

				var rowMsg = '<div class="row row-msg">'+
                    '<div class="gen-column col-md-12">'+
                      '<div class="gen-inner">'+
                        '<xsl:apply-templates mode="igrp-messages" select="rows/content/messages"></xsl:apply-templates>'+
                      '</div>'+
                    '</div>'+
                  '</div>';

				var rtn = '<gen:for-each select="rows/content/*[@type]">';
						rtn+='<gen:variable name="contentType" select="@type"/>';
						rtn+='<gen:choose>';

						dContainers.forEach(function(c){
							rtn+='<gen:when test="@type = \''+c.name+'\'"><gen:call-template name="gen_'+c.name+'"></gen:call-template></gen:when>'
						});

						rtn+='</gen:choose>';
					rtn+='</gen:for-each>';
					

				return rowMsg+'<div class="row"> <div class="gen-column col-md-12"><div class="gen-inner">'+rtn+'</div></div> </div>';

			},

			getBaseXsl : function(){

				var genReq = $.get(genPath+'/util/genxsl/base.xsl'),
					
					xslReq = $.get(genPath+'/util/base.xsl');

				return $.when(genReq,xslReq).then(function(g,x){
				 	
				 	baseGEN = g[0];

				 	baseXSL = gx.configBaseXSL(x[0]);

				 	$( baseXSL ).find('#igrp-contents>.content').append(gx.configContentsCall())

					$( baseGEN ).find('gen\\:template').append( baseXSL.documentElement );

				 });


			}

	}

	function hackNamesXSL(template){

		var rtn = template;
		
		rtn = rtn.replaceAll("{rows/content/{name()}/fields/{name()}_img/value}","{concat('{rows/content/',name(),'/fields/',name(),'_img/value}')}")

		rtn = rtn.replaceAll("{{name()}_id}","{concat('{',name(),'_id }')}");

		rtn = rtn.replaceAll("{rows/content/{name()}/fields/{name()}_text/value}", "{concat( '{ rows/content/',name(),'/fields/',name(),'_text/value }' )}")

		rtn = rtn.replaceAll('gen-preserve="last"',"");

		rtn = rtn.replaceAll('xmlns:gen=""',"");

		rtn = rtn.replaceAll('xmlns:xsl=""',"");
		

		return rtn;
	}

	Array.prototype.inArray = function(comparer) { 
	    for(var i=0; i < this.length; i++) { 
	        if(comparer(this[i])) return true; 
	    }
	    return false; 
	}; 

	// adds an element to the array if it does not already exist using a comparer 
	// function
	Array.prototype.pushIfNotExist = function(element, comparer) { 
	    if (!this.inArray(comparer)) {
	        this.push(element);
	    }
	};

})();
