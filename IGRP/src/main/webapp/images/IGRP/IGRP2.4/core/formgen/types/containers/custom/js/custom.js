var GENCUSTOM = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;

	container.fields = false; //does not accept any fields


	var isXMLSet = params && params.proprieties && params.proprieties.XML ? true : false;
	var isXSLSet = params && params.proprieties && params.proprieties.XSL ? true : false;
	
	container.getXML = function(){
		return $.parseXML('<'+container.GET.tag()+'>'+container.GET.XML()+'</'+container.GET.tag()+'>');;
	}

	container.getXSL = function(){
		var xsl = container.GET.XSL ? container.GET.XSL() : container.template;
		container.template = xsl;
		return $.parseXML(container.replaceContainersGenVars(setXmlnsAttr(xsl)));
	}

	container.ready = function(){
		container.setPropriety({
			name:'XML',
			value:{
				value:'<custom></custom>',
				setter:function(){
					var rtn = $('<div class="gen-custom-setter-holder"/>');
					//if(!isXMLSet){

					var textarea = $('<textarea class="gen-custom-content"></textarea>');

					textarea.on('blur',function(){
						container.SET.XML(textarea.val());
					})
					
					var file = $('<input type="file" gen-class="file-visible"/>');
					file.on('change',function(evt){
						var files = evt.target.files; 
					    var output = [];
					    for (var i = 0, f; f = files[i]; i++) {
					    	var reader = new FileReader();
					    	reader.onload = (function(theFile) {
								return function(e) {
									console.log(e);
									console.log(e.target.result)
								 container.SET.XML(e.target.result);
								 setTextAreaContent(textarea,container.GET.XML())
								 isXMLSet = true;
								};
							})(f);
					    	reader.readAsText(f);
					    }
					});
					
					setTextAreaContent(textarea,container.GET.XML());

					rtn.append([file,textarea]);
					//rtn = $('<div class="gen-custom-setter-holder"/>');

					return rtn;
				}
			}
		});
		container.setPropriety({
			name:'XSL',
			value:{
				value:'<div></div>',
				setter:function(){
					var rtn = $('<div class="gen-custom-setter-holder gen-custom-content"/>');
					//if(!isXMLSet){

					var xsltextarea = $('<textarea></textarea>');

					xsltextarea.on('blur',function(){
						 container.template = xsltextarea.val();
						//container.SET.XSL(xsltextarea.val());
					})
					
					var file = $('<input type="file" gen-class="file-visible"/>');
					file.on('change',function(evt){
						var files = evt.target.files; 
					    var output = [];
					    for (var i = 0, f; f = files[i]; i++) {
					    	var reader = new FileReader();
					    	reader.onload = (function(theFile) {
								return function(e) {
								 container.template = e.target.result;
								 container.SET.XSL(e.target.result);
								 setTextAreaContent(xsltextarea,container.template)
								 isXSLSet = true;
								};
							})(f);
					    	reader.readAsText(f);
					    }
					});
					
					//console.log(container.template);
					setTextAreaContent(xsltextarea,container.template);

					rtn.append([file,xsltextarea]);
					//rtn = $('<div class="gen-custom-setter-holder"/>');



					return rtn;
				}
			}
		});
	}

	var setTextAreaContent = function(txta,content){
		txta.text(content);
		//$('<textarea disabled>'+container.GET.XSL()+'</textarea>')
	}
}

this[VARS.name].declareContainer({
	name:'custom',
	container:GENCUSTOM
});