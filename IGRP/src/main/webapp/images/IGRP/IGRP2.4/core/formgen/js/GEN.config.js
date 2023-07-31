var INCREMENTS         = {};

function get_firstchild(n) {
	//console.log(n)
    var x = n.firstChild;
    while (x.nodeType != 1) {
        x = x.nextSibling;
    }
    return x;
}

function getFirstHtmlChild(n){
	var rtn = false;

	if(n.tagName.indexOf('xsl:') != -1){
		
		var childs = n.childNodes;
		var valid = false;

		for(var i = 0; i < childs.length; i++){
			var child = childs[i];
			if(child.nodeType == 1){
				rtn = getFirstHtmlChild(child);
				break;
			}
		}

	}else{
		rtn = n;
	}

	return rtn;
}

var GenVarsReplaceFromObjAttr = function(p){
	/*
		container
		object
		begin
		end
		template
	*/
	var replaces = [];
	var initInd = getIndicesOf(p.begin, p.template, false);
	var endInd  = getIndicesOf(p.end, p.template, false);

	initInd.forEach(function(val, pos){
		var beginIdx = initInd[pos];
		var endIdx   = endInd[pos]+2;

		var expression        = p.template.substring(beginIdx,endIdx);
		var expressionContent = expression.substring(2,expression.length-2).split('.');

		var operation		  = expressionContent[1] ? expressionContent[1] : null;
		var attrName          = expressionContent[0];
		var xslVal 		  = '';

		//console.log(p.object.GET[attrName])
		if(p.object.GET[attrName]){
			//console.log(attrName)
			if(operation){
				switch(operation){
					case 'attr':
						xslVal = '{'+valuePath+'/@'+attrName+'}'
					break;
					case 'val':
						xslVal = '<xsl:value-of select="'+p.object.GET[attrName]()+'"/>';

					break;
				}
			}else{
				var prpValue = p.object.GET[attrName]();
				

				if( p.object.xslValues && p.object.xslValues[attrName] ){
		
					prpValue = prpValue ? (typeof p.object.xslValues[attrName] == 'function') ? p.object.xslValues[attrName]() : p.object.xslValues[attrName] : '';
				}
					
				xslVal = prpValue; 
			}

			replaces.push({
				expression:expression,
				value     :p.object.GET[attrName](),
				xslValue  :xslVal 
			});
		}else{
			replaces.push({
				expression:expression,
				value     :'',
				xslValue  :'' 
			});
		}
	});

	return replaces;
}

var GenVarsReplaceFromCusomStr = function(p){
	/*
		object
		begin
		end
		template
	*/
	var replaces = [];
	var initInd = getIndicesOf(p.begin, p.template, false);
	var endInd  = getIndicesOf(p.end, p.template, false);

	initInd.forEach(function(val, pos){
		var beginIdx = initInd[pos];
		var endIdx   = endInd[pos]+2;

		var expression        = p.template.substring(beginIdx,endIdx);
		var expressionContent = expression.substring(2,expression.length-2).split('.');
		

		var operation = expressionContent[1] ? expressionContent[1] : null;
		var attrName  = expressionContent[0];
		var xslVal 	  = '';

		if(operation){
			switch(operation){
				case 'attr':
					xslVal = '{'+attrName+'}'
				break;
				case 'val':
					xslVal = '<xsl:value-of select="'+attrName+'"/>';
				break;
			}
		}

		replaces.push({
			expression:expression,
			value     :DATA.get({type:p.object.GET.type()}),
			xslValue  :xslVal 
		});
	});

	return replaces;
}

var _getDate = function(){
	var date = new Date();
	var year  = date.getFullYear();
	var month = (date.getMonth()+1).length > 1 ? (date.getMonth()+1) : '0'+(date.getMonth()+1);
	var day   = date.getDate().length > 1 ? date.getDate() : '0'+date.getDate();
	return date.getTime();
	//return (year+''+month+''+day);
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() ;
}

function capitalizeFirstLetter(string) {
    return string ? string.charAt(0).toUpperCase() + string.slice(1) : '';
}

var setXmlnsAttr = function(template){
	var rtn = template;
	var idx = template.indexOf('>');
	
	if(template.slice(0, idx).indexOf('xmlns:xsl') == -1)
		rtn = [template.slice(0, idx), ' xmlns:xsl="http://www.w3.org/1999/XSL/Transform" ', template.slice(idx)].join('');
	
	return rtn;
}

/*switch types menu*/
function menuSwitcher(){
	$(VARS.html.typesMenu).on('click',function(){
		var rel 	= $(this).attr('rel');
		var content = $(VARS.html.typesRel+'[rel="'+rel+'"]');
		
		$(VARS.html.typesMenu).removeClass('active');
		$(this).addClass('active');
		
		$(VARS.html.typesRel).removeClass('active');
		content.addClass('active');
		
	});
}

function sectionHeight(){
	var wHeight = $(window).height();
	var topH    = $('#igrp-topPage').height();

	//console.log(wHeight)


	$(VARS.html.typesHolder).css({
		//'min-height':wHeight-topH,
		//'top':topH+44
	});

	$('#gen-toolbar').css({
		//'top':topH+44
	})

	$(VARS.html.view).css({
		//'min-height':wHeight-topH-10,
		//'top':topH+44
	});
	$(VARS.html.codeArea+' .CodeMirror').css({
		//'min-height':wHeight-topH-31,
		//'top':topH+44
	});
}

function _onResize (){
	$(window).resize(function(){
		//console.log('resize');
		//sectionHeight();
		//VARS.getGen().setEditionDialogPosition();
	});
}

function layout(){
	$(VARS.html.layoutMenu).find('ul li').on('click',function(){
		var layout = $(this).attr('layout');
		VARS.getGen().layout.set(layout);
	});
}

function getImagesFromDir(p){
	var element = $('<ul/>');
	$.ajax({
		url:p.dir+p.paramName,
		success:function(imgs){
			imgs.forEach(function(img){

				var name = img.split(p.paramName+'/')[1];
 				var _class = (p.active == name) ? 'active' : '';
				
				var li = HTML({
					tag:'li',
					class:'btn-icon-setter '+_class,
					rel:name,
					html:HTML({
						tag:'img',
						src:path+'/'+img
					})
				});

				li.on('click',function(e){
    				li.parent().find('li').removeClass('active');
    				li.addClass('active');
    				if(p.onClick) p.onClick(e);
    			});

    			element.append(li);
			});
		
		}
	});

	return element;
}

var  getIndicesOf = function(searchStr, str, caseSensitive) {
	    var startIndex = 0, searchStrLen = searchStr.length;
	    var index, indices = [];
	    if (!caseSensitive) {
	        str = str.toLowerCase();
	        searchStr = searchStr.toLowerCase();
	    }
	    while ((index = str.indexOf(searchStr, startIndex)) > -1) {
	        indices.push(index);
	        startIndex = index + searchStrLen;
	    }
	    return indices;
	}

function docWriteWrapper(id,func) {

    var writeTo = document.createElement('div');
    var oldwrite = document.write;
    var content = '';

    writeTo.id = id;
   
    document.write = function(text) {
        content += text;
    }

    func();
    
    writeTo.innerHTML += content;
    document.write = oldwrite;

    document.body.appendChild(writeTo);
}

function setInputSwitcher(){
	$('body').on('mouseup',function(e){
		if(!$(e.target).hasClass('gen-input-switcher'))
			$('.gen-input-switcher').blur();
	});
}

function replaceSpecialChars(label){
	var chars = ['[',']','€','«','»',';','='];
	var accents = [
		{ base:'a', accents:['\u00c4' ,'\u00c3','\u00e1','\u00e0','\u00e2','\u00e3','\u00e4','\u00c1','\u00c0','\u00c2'] },
		{ base:'e', accents:['\u00e9','\u00e8','\u00ea','\u00ea','\u00c9','\u00c8','\u00ca','\u00cb'] },
		{ base:'i', accents:['\u00ed','\u00ec','\u00ee','\u00ef','\u00cd','\u00cc','\u00ce','\u00cf'] },
		{ base:'o', accents:['\u00d6','\u00d5','\u00f3','\u00f2','\u00f4','\u00f5','\u00f6','\u00d3','\u00d2','\u00d4'] },
		{ base:'u', accents:['\u00fa','\u00f9','\u00fb','\u00fc','\u00da','\u00d9','\u00db'] },
		{ base:'c', accents:['\u00e7','\u00c7'] },
		{ base:'n', accents:['\u00f1','\u00d1'] }
	];

	//replace white spaces to _
	var str = label.replaceAll(' ','_');
	//replace - to _
	str = str.replaceAll('-','_');
	//replace special characters
	str = str.replace(/[&\/\\#,+()$~%.'":*?<>!?@´ªº^|£§{}]/g,'');
	//replace symbols
	chars.forEach(function(c){
		str = str.replaceAll(c,'');
	});
	//replace accents
	accents.forEach(function(aObj){
		aObj.accents.forEach(function(a){
			str = str.replaceAll(a,aObj.base);
		});
	});

	return str.toLowerCase();
}

function copyToClipboard(content,callback) {
	  // create hidden text element, if it doesn't already exist
    var targetId = "_hiddenCopyText_";
    //var isInput = elem.tagName === "INPUT" || elem.tagName === "TEXTAREA";
    var origSelectionStart, origSelectionEnd;
  
    // must use a temporary form element for the selection and copy
    target = document.getElementById(targetId);
    
    if (!target) {
        var target = document.createElement("textarea");
        target.style.position = "absolute";
        target.style.left = "-9999px";
        target.style.top = "0";
        target.id = targetId;
        document.body.appendChild(target);
    }

    target.textContent = content;
    // select the content
   // var currentFocus = document.activeElement;
    target.focus();
    target.setSelectionRange(0, target.value.length);
    // copy the selection
    var succeed;
    try {
    	  succeed = document.execCommand("copy");
    } catch(e) {
        succeed = false;
    }

    // clear temporary content
    target.textContent = "";

    if(callback)
    	callback();
    
    
    return succeed;
}

var preserveExceptions = function(content,o){

	var idx 	  		    = o.index || 0,

		defaultExcp  	    = 'throws IOException, IllegalArgumentException, IllegalAccessException',

		mainExpressionStart = '/*----#EXECEP(',

		afterName 		    = ')EXECEP#----*/',

		mainExpressionEnd 	= ','+defaultExcp+',';

	if(idx < o.starts.group.length){

		var startIdx 	 	  = o.starts.group[idx],

			endIdx 	 	 	  = o.ends.group[idx],

			innerContent 	  = content.substring( startIdx,endIdx+o.ends.expression.length ),

			urlSubStart  	  = innerContent.indexOf(mainExpressionStart),

			urlSubEnd 	 	  = innerContent.indexOf(mainExpressionEnd),

			url 	     	  = innerContent.substring(urlSubStart+mainExpressionStart.length,urlSubEnd),

			urlIndx 	 	  = innerContent.indexOf(url),

			beforeName   	  = mainExpressionStart+url+','+defaultExcp+',',

			startExceptionIdx = innerContent.indexOf(beforeName),

			endExceptionIdx   = innerContent.indexOf(afterName),

			itemName 		  = innerContent.substring(startExceptionIdx+beforeName.length,endExceptionIdx),

			expression	 	  = mainExpressionStart+url+mainExpressionEnd;


		o.index = idx+1;

		$.ajax({
			url: url
		})
		.done(function(d) {

			var xml  = $(d),

				text = xml.find('your_code').text() || defaultExcp;

			preserveExceptions.returner.push({
				name 	   : itemName.toLowerCase(),
				expression : innerContent,
				text 	   : text
			});

		})
		.fail(function(err){

			console.log('error: '+expression);
			
			console.log(err)

			preserveExceptions.returner.push({
				expression:expression,
				text:defaultExcp
			});

		})
		.always(function(){
			
			o.index = idx+1;

			preserveExceptions(content,o);

		});


	}else{

		if(o.callback)

			o.callback(preserveExceptions.returner);

		preserveExceptions.returner = [];

	}
}

preserveExceptions.returner = [];

var preserveArea = function(array,p){

	var idx  = p.idx ? p.idx : 0;
	//var isIE = window.ActiveXObject || window.navigator.userAgent.match(/rv:11.0/i) ? true : false;
	var beginExp = p.beginExp;
	
	var endExp   = p.endExp ;

	var startUrlExp = '/*----#gen(';

	var endUrlExp = ')/#----*/';

	var _endComment = '----*/';

	if(idx < array.length){

		var item 			= array[idx];

		var endItem         =  p.end[idx]+endExp.length;

		var expression      = p.content.substring(item,endItem);

		var areaName 		= expression.match(/\(([^)]+)\)/)[1];

		var areaReplaceble  = areaName+')'+_endComment;

		beginExp 			= beginExp.replace(areaName+')'+_endComment ,_endComment);

		var originalContent = expression.substring(beginExp.length, expression.length - endExp.length);

		var startUrl 		= getIndicesOf(startUrlExp, expression)[0];

		var endUrl   		= getIndicesOf(endUrlExp, expression)[0];

		var urlExpression 	= expression.substring(startUrl,endUrl+endUrlExp.length);

		var urlContent 		= expression.substring(startUrl,endUrl).split(',');

		var url 			= urlContent[1];

		originalContent = originalContent.replace(areaReplaceble,'');

		$.ajax({
			url: url
		})
		.done(function(d) {
			
			var xml  = $(d);

			var text = xml.find('your_code').text();

			preserveArea.returnObject.push({
				areaName  : areaName,
				originalContent : originalContent,
				expression:expression,
				urlExpression : urlExpression,
				text:text
			});
		})
		.fail(function(){
			console.log('error: '+urlContent[1]);
			preserveArea.returnObject.push({
				areaName  : areaName,
				originalContent : originalContent,
				expression:expression,
				urlExpression : urlExpression,
				text:''
			});
		})
		.always(function(){
			p.idx = idx+1;
			preserveArea(array,p)
		});

	}else{

		if(p.callback)
			p.callback(preserveArea.returnObject);
		
		preserveArea.returnObject = [];

	}
	
}

preserveArea.returnObject = [];


var preserve_code = function(array,p){
	var idx  = p.idx ? p.idx : 0;
	//var isIE = window.ActiveXObject || window.navigator.userAgent.match(/rv:11.0/i) ? true : false;
	var beginExp = p.beginExp || '#gen(';
	
	var endExp   = p.endExp || ')/#';

	if(idx < array.length){
		
		var item = array[idx];

		var endItem            =  p.end[idx]+endExp.length;

		var expression        = p.content.substring(item,endItem);

		var expressionContent = expression.substring(beginExp.length,expression.length-endExp.length).split(',');
		
		var url = expressionContent[1];

		$.ajax({
			url: url
		})
		.done(function(d) {
			
			var xml  = $(d);
			var text = xml.find('your_code').text();
			
			preserve_code.returnObject.push({
				expression:expression,
				text:text
			});
		})
		.fail(function(){
			console.log('error: '+expressionContent[1]);
			preserve_code.returnObject.push({
				expression:expression,
				text:''
			});
		})
		.always(function(){
			p.idx = idx+1;
			preserve_code(array,p)
		});

	}else{
		
		if(p.callback)
			p.callback(preserve_code.returnObject);
		
		preserve_code.returnObject = [];
	}
}

preserve_code.returnObject = [];

function init(){
	sectionHeight();
	menuSwitcher();
	layout();
	
	setInputSwitcher();

	_onResize();
}
var ArrayMove = function (arr,from, to) {
  arr.splice(to, 0, arr.splice(from, 1)[0]);
};

/*Array.prototype.move = function (from, to) {
  this.splice(to, 0, this.splice(from, 1)[0]);
};*/

String.prototype.insert = function (index, string) {
  if (index > 0)
    return this.substring(0, index) + string + this.substring(index, this.length);
  else
    return string + this;
};

String.prototype.replaceAll = function(str1, str2, ignore) 
{
    return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g,"\\$&"),(ignore?"gi":"g")),(typeof(str2)=="string")?str2.replace(/\$/g,"$$$$"):str2);
} 

String.prototype.replaceAt=function(index, character) {
    return this.substr(0, index) + character + this.substr(index+character.length);
}

$.fn.getXMLStr = function(){
	return new XMLSerializer().serializeToString(this[0]);
}

$.fn.getXMLDocument = function(s) {
	var rtn;
	try{
		if(this[0]){
			var str = new XMLSerializer().serializeToString(this[0]);
			rtn = $.parseXML(str);
		}	
	}catch(e){
		rtn = false;
	}

    return rtn;
};


$.fn.switchToInput  = function(p){
	
	var $input = $("<input>", {
        val: $(this).text(),
        type: "text"
    });

    $input.addClass(p.class+' gen-input-switcher');

    $(this).replaceWith($input);

    $input.on("blur", function(e){
    	try{
    		var val = $(this).val();
	    	$(this).switchToSpan(p);
	    	p.onBlur(val,e);
    	}catch(e){
    		console.log(e)
    	}
    	
    });

    $input.select();
}

$.fn.switchToSpan  = function(p){
	var $span = $("<span>", {
        text: $(this).val()
    });
    
    $span.removeClass(p.class);

    $(this).replaceWith($span);

     /*$span.on("dblclick", function(){
     	$span.switchToInput(p);
     });*/
}

$.fn.insertAt = function(elements, index){
	var children = this.children();
	if(index >= children.size()){
		this.append(elements);
		return this;
	}
	var before = children.eq(index);
	$(elements).insertBefore(before);
	return this;
};

$.fn.tagName = function() {
  return this.prop("tagName");
};


var swapElements = function(siblings, subjectIndex, objectIndex) {
    // Get subject jQuery
    var subject = $(siblings.get(subjectIndex));
    // Get object element
    var object = siblings.get(objectIndex);
    // Insert subject after object
    subject.insertAfter(object);
}

/*$(function() {
    swapElements($('li'), 0, 3);
});*/


$(function(){
	init();
});