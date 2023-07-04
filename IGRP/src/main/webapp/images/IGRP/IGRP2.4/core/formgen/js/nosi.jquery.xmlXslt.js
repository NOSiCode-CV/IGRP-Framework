//xml_path : caminho do ficheiro xml;
//xsl_path : caminho do ficheiro xsl;
//params : parametros para o template XSL;
//div : Div que vai conter as transformações Xml/Xsl
//loadedFunction : funções a serem executadas após o sucesso da transformação
//loading_element : elemento de de espera
//por William Lima NOSi 2013

var _method="GET";

var _data = null;

function set_metodo(p_method)
{
	_method = p_method;
}

function set_data(p_data)
{
	_data = p_data;
}
function PORTON_ajaxLoad(url,success,error,cache){
	$.ajax({
		url: url,
		type: _method,
		data:_data,
		dataType: 'xml',
		error: function(){
			error();
		},
		success: function(param){
		  success(param);
		}
		//cache: cache
	});	
}
function XmlXslTransform(xml_path,xsl_path,params,div,loadedFunction,loading_element){
  try{
			if (window.ActiveXObject){//IE
			try{
				loading_element.show();
			}catch(e){}
				var xslt = new ActiveXObject("Msxml2.XSLTemplate.6.0");
				//xslt.addEventListener('load',function(){alert('loading')})
				var xsldoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument.6.0");
					xsldoc.async = false;
					xsldoc.load(xsl_path);
				if (xsldoc.parseError.errorCode != 0) {
					 var myErr = xsldoc.parseError;
					 //alert("You have xsl error: " + myErr.reason);
					try{
							loading_element.hide();
						}catch(e){}
				}else{
					xslt.stylesheet = xsldoc;
						var xmldoc = new ActiveXObject("Msxml2.DOMDocument.6.0");
						xmldoc.async = false;
					if(typeof xml_path === 'string'){
						xmldoc.load(xml_path);
					}else{
						xmldoc = xml_path;
					}
					if (xmldoc.parseError.errorCode != 0) {
						var myErr = xmldoc.parseError;
						//alert("You have xml error: " + myErr.reason);
						try{
							loading_element.hide();
						}catch(e){}
					}else{
						var xslproc = xslt.createProcessor();
						xslproc.input = xmldoc;
						if(params != null){
							for(i=0; i < params.length; i=i+2){
							xslproc.addParameter(params[i], params[i+1]);
							}
						}  
						xslproc.transform();
						div.html(xslproc.output);
						if(loadedFunction !== ''){
								loadedFunction();

						}
						try{
							loading_element.hide();
						}catch(e){}
					}
		 	 }
		}
	  // code for Mozilla, Firefox, Opera, etc.
		else if (document.implementation)
		{
		   if(document.implementation.createDocument){
			 try{
				loading_element.show();
			   }catch(e){}
				var erroF=function(){ 
					//alert('Error Loading/Transforming XML/XSL');
						try{
							loading_element.hide();
				   		}catch(e){}
				}
				if(typeof xml_path == 'string'){
					
					var successXml = function(){
						try{
							loading_element.hide();
					    }catch(e){
					    	console.log(e);
					    }
					};

					PORTON_ajaxLoad(
						xml_path,
						success=function(xml){
							PORTON_ajaxLoad(
								xsl_path,
								success=function(xsl){
									 xsltProcessor=new XSLTProcessor();
									  xsltProcessor.importStylesheet(xsl);
									  if(params != null){
										  for(i=0; i < params.length; i=i+2){
											 xsltProcessor.setParameter(null,params[i], params[i+1]);
										  }
									  }
									  resultDocument = xsltProcessor.transformToFragment(xml,document);
									  div.html(resultDocument);
									  if(loadedFunction != ''){
											loadedFunction();
									}
													try{
								loading_element.hide();
							   }catch(e){}
								},
								erroF,
								true
							);
						},
						erroF,
						false
					);
				}else{
					if(typeof xsl_path == 'string'){
						PORTON_ajaxLoad(
							xsl_path,
							success=function(xsl){
								 xsltProcessor=new XSLTProcessor();
								 xsltProcessor.importStylesheet(xsl);
								 if(params != null){
									  for(i=0; i < params.length; i=i+2){
										 xsltProcessor.setParameter(null,params[i], params[i+1]);
									  }
								  }
								  resultDocument = xsltProcessor.transformToFragment(xml_path,document);
								  div.html(resultDocument);
								  if(loadedFunction != ''){
										loadedFunction();
								   }
									try{
										loading_element.hide();
				   					}catch(e){}
							},
							erroF,
							true
						);
					}else{
						var xsl = xsl_path;

						xsltProcessor=new XSLTProcessor();
						xsltProcessor.importStylesheet(xsl);

						if(params != null){
						  for(i=0; i < params.length; i=i+2){
							 xsltProcessor.setParameter(null,params[i], params[i+1]);
						  }
						}
						
						resultDocument = xsltProcessor.transformToFragment(xml_path,document);
						
						div.html(resultDocument);
						if(loadedFunction != ''){
							loadedFunction();
						}
						try{
							loading_element.hide();
						}catch(e){}
					}
					


				}
			}
		}	
	}catch(e){
		 //alert('ERRO TRANSF XML/XSL: '+e.message);
		  if(loadedFunction != ''){
				loadedFunction();
		   }
		   try{
				loading_element.hide();
			   }catch(e){}
	}	
}