var xml2String = function(str){
	return (typeof XMLSerializer!=="undefined") ? (new window.XMLSerializer()).serializeToString(str) : str.xml;
};

var minify = function(str){
    return str.replace(/^\s+|\r\n|\n|\r|(>)\s+(<)|\s+$/gm, '$1$2');
};

var formField = function(p){
	var v = '';
  
	if (p.t == 'c'){
      v = p.o.replace(/activiti_G_formProperty/g, 'camunda_G_formField').
      replace(/expression=/g, 'defaultValue=');

      if (!/executionListener|taskListener/i.test(p.n))
        v = v.replace(/name=/g, 'label=');
    }
    else if (p.t == 'a'){
		  v = p.o.replace(/camunda_G_formField/g, 'activiti_G_formProperty').
            replace(/defaultValue=/g, 'expression=');

      if (!/executionListener|taskListener/i.test(p.n))
        v = v.replace(/label=/g, 'name=');
    }
	return v;
}

var getAttrs = function(attrs){
	var str = '';

	$.each(attrs,function(i,e){
		var name = e.name;
		if (name != 'camunda:candidateUsers' && name != 'camunda:candidateGroups')
			str += name.replace(/:/g, '_G_')+'="'+e.value+'" ';
	});

	return str;
}


//activiti to bpmjs xml
$.fn.activiti2Io = function(params) {
   var xml 	 = this;
    
   	xml.find('process > userTask').replaceWith(function(i,e){
      
      var strChilds = $(this).find('extensionElements')[0],
          str       = '',
          tag       = getAttrs($(this)[0].attributes);

      if (strChilds) {
        var omissionField = ['activiti_G_formProperty','activiti_G_executionListener','activiti_G_taskListener'];

   		  strChilds = $($.parseXML(xml2String(strChilds).replace(/:/g, '_G_')));

     		strChilds.find('extensionElements > *').each(function(x,l){

     			var tagName = $(this)[0].tagName;
          
     			if($.inArray(tagName, omissionField) == -1){
            
     				if (tagName == 'modeler_G_assignee-info-email')
     					tag +='camunda_G_candidateUsers="'+$(this).text()+'"';

     				else if (tagName == 'modeler_G_assignee-info-firstname') 
     					tag += ' camunda_G_candidateGroups="'+$(this).text()+'"';

     			}else{
            str += formField({
              o  : xml2String($(this)[0]),
              t  : 'c',
              n  : tagName
            });
          }
     		});  

   		  if (strChilds.find('extensionElements > activiti_G_formProperty')[0])
   		 	 str = '<camunda_G_formData>'+ str+'</camunda_G_formData>';
        
        if (str != '')
          str = '<bpmn_G_extensionElements>'+ str+'</bpmn_G_extensionElements>';
      }

      
       //$(xml.find('process > userTask')[i]).empty();
   		return '<userTask '+tag+'>'+str+'</userTask>';
	});

  

  xml = xml2String(xml[0])
 		.replace(/_G_/g, ':').replace(/xmlns=""/g, '')
 		.replace(/xmlns:activiti=""/g, '')
    .replace(/activiti:/g,'camunda:')
 		.replace(/<conditionExpression/g,'<bpmn:conditionExpression')
 		.replace(/<\/conditionExpression/g,'<\/bpmn:conditionExpression')
 		.replace(/xsi:type="tFormalExpression"/g,'xsi:type="bpmn:tFormalExpression"');

    //console.log(xml);
  //console.log($.parseXML(xml));

  return xml;
};


//bpmjs to activiti xml
$.fn.io2Activiti = function(params){
	var xml 	 = this;

	xml = xml2String(xml[0]).replace(/bpmn:/g,'');
	xml = $($.parseXML(xml));

	xml.find('process > userTask').replaceWith(function(i,e){
   		var strChilds = $(this).find('extensionElements')[0],
        tag     = getAttrs($(this)[0].attributes),
        str       = '';
       
   		if (strChilds) {
        var omissionField = ['camunda_G_formData'];

   			strChilds = $($.parseXML(xml2String(strChilds).replace(/:/g, '_G_')));

        strChilds.find('extensionElements > *').each(function(x,l){
          var tagName = $(this)[0].tagName;

          if ($.inArray(tagName, omissionField) != -1) {

            $(this).find('> *').each(function(x,l){
              
              str += formField(xml2String($(this)[0]),'a');
            
            });

          }else{
            str += formField({
              o  : xml2String($(this)[0]),
              t  : 'a',
              n  : tagName
            });
          }
        });

	   		if (str != '')
	   			str = '<extensionElements>'+ str+'</extensionElements>';
   		}

   		return '<userTask '+tag+'>'+str+'</userTask>';
	});

	var starAtivitiXml =  '<?xml version="1.0" encoding="UTF-8"?>'+
        '<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" '+
        ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
        ' xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" '+
        ' xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" '+
        ' xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" '+
        ' xmlns:xsd="http://www.w3.org/2001/XMLSchema" '+
        ' xmlns:activiti="http://activiti.org/bpmn" '+
        ' targetNamespace="http://www.activiti.org/processdef">';


	var xml = xml2String(xml[0])
		.replace(/_G_/g, ':').replace(/xmlns=""/g, '')
		.replace(/xmlns:activiti=""/g, '')
   	.replace(/camunda:formKey=/g,'activiti:formKey=')
   	.replace(/camunda:/g,'activiti:')
   	.replace(/<bpmn:conditionExpression/g,'<conditionExpression')
   	.replace(/<\/bpmn:conditionExpression/g,'<\/conditionExpression')
   	.replace(/bpmn:tFormalExpression/g,'tFormalExpression')
   	.replace(/<dc:/g, '<omgdc:').replace(/<di:/g, '<omgdi:');

  xml   = minify(xml);

  var index = xml.indexOf('<collaboration') != -1 ? xml.indexOf('<collaboration') : xml.indexOf('<process');
    
  xml 	= xml.substring(index,xml.length);
  xml 	= minify(starAtivitiXml+xml);
  
	return xml; 
};