var INCREMENTS         = {};
var _getDate = function(){
	var date = new Date();
	var year  = date.getFullYear();
	var month = (date.getMonth()+1).length > 1 ? (date.getMonth()+1) : '0'+(date.getMonth()+1);
	var day   = date.getDate().length > 1 ? date.getDate() : '0'+date.getDate();
	return date.getTime();
	//return (year+''+month+''+day);
}

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

var setXmlnsAttr = function(template){
	var rtn = template;
	var idx = template.indexOf('>');
	
	if(template.slice(0, idx).indexOf('xmlns:xsl') == -1)
		rtn = [template.slice(0, idx), ' xmlns:xsl="http://www.w3.org/1999/XSL/Transform" ', template.slice(idx)].join('');
	//var hasXmlns = template.indexOf('>')
	//return [template.slice(0, idx), ' xmlns:xsl="http://www.w3.org/1999/XSL/Transform" ', template.slice(idx)].join('');
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

function getIndicesOf (searchStr, str, caseSensitive) {
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

function init(){
	sectionHeight();
	menuSwitcher();
	layout();
	
	setInputSwitcher();

	_onResize();
}


Array.prototype.move = function (from, to) {
  this.splice(to, 0, this.splice(from, 1)[0]);
};

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