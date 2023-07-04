var XSL = {
	IF:function(p){
		var rtn = $(document.createElement('xsl:if')).attr('test',p.test);
		if(p.content){
			if(typeof p.content == 'function')
				rtn.html(p.content());
			else
				rtn.html(p.content);	
		}
		return rtn.attr("xmlns:xsl","http://www.w3.org/1999/XSL/Transform");
	},
	VALUEOF:function(path,attr){
		var rtn = attr ? '{'+path+'}' : $(document.createElement('xsl:value-of')).attr('select',path);
		return rtn.attr("xmlns:xsl","http://www.w3.org/1999/XSL/Transform");
	},
	FOREACH:function(p){
		var rtn = $(document.createElement('xsl:for-each')).attr('select',p.path);
		if(p.content){
			if(typeof p.content == 'function') 
				rtn.html(p.content());
			
			else 
				rtn.html(p.content);
		}
		return rtn.attr("xmlns:xsl","http://www.w3.org/1999/XSL/Transform");
	},
	ATTRIBUTE:function(name,value){
		var rtn = $(document.createElement('xsl:attribute')).attr('name',name);
		rtn.append(value[0].outerHTML)
		return rtn.attr("xmlns:xsl","http://www.w3.org/1999/XSL/Transform");
	},
	APPLY:function(p){
		var rtn = $(document.createElement('xsl:apply-templates'));
		if(p.mode)   rtn.attr('mode',p.mode);
		if(p.select) rtn.attr('select',p.select);
		return rtn.attr("xmlns:xsl","http://www.w3.org/1999/XSL/Transform");
	}
};

var HTML = function(p){
	var element;
	var tag = p.tag ? p.tag : 'div';
	
	var element = $('<'+tag+'></'+tag+'>');

	if(p.id) 	element.attr('id',p.id);
	
	if(p.class) element.addClass(p.class);
	
	if(p.text) element.text(p.text);

	if(p.val) element.attr('value',p.val);

	if(p.rel) element.attr('rel',p.rel);

	if(p.type) element.attr('type',p.type);

	if(p.name) element.attr('name',p.name);

	if(p.href) element.attr('href',p.href);

	if(p.src) element.attr('src',p.src);

	if(p.target) element.attr('target',p.target);

	if(p.maxLength) element.attr('maxlength',p.maxLength);

	if(p.disabled != false) element.attr('disabled',p.disabled);
	
	if(p.attr) element.attr(p.attr[0],p.attr[1]);

	if(p.style) element.attr('style',p.style);

	if(p.attrs){
		p.attrs.forEach(function(attr){
			element.attr(attr.name,attr.value);
		});
	}

	if(p.html){
		if (typeof p.html === 'function') 
			element.html(p.html(element));
		else 
			element.html(p.html);
	} 

	if(p.onClick) element.on('click',p.onClick);

	if(p.onDblClick) element.on('dblclick',p.onDblClick);

	return element;
};
