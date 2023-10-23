var PAGE_HEADER_BASIC = function(name,params){
	CONTAINER.call(this,name,params);

	var container = this;

	//container.autoSetField = false;

	//container.xslValidation = false;
	
	//container.xml.type = 'items';
	//container.xml.genType = 'menu';
	//container.xml.structure = 'toolsbar';

/*	container.contextMenu = {
		type   : 'button',
		holder : '.buttons-holder',
		menu   : {
			selector: '>.btn'
			
		},
		xmlTag:'tools-bar'
	}*/

	container.unsetProprieties(['collapsible','collapsed', 'hasTitle']);
	
	container.setProperty({
		name: 'description',
		value : 'Ipsum irure enim ad tempor ad ipsum et ipsum cupidatat laborum velit consequat.',
		inputType : 'textarea',
		isField : true,
		persist : true,
		size: '12'
	})

	/*container.autoSetField = false;

	container.xslValidation = false;
	
	container.xml.type = 'items';
	container.xml.genType = 'menu';
	container.xml.structure = 'toolsbar';
	container.xml.genStart = ()=>{
		return '<'+container.GET.tag()+'  type="toolsbar" xml-type="toolsbar" gen-type="menu" gen-group="">';
	}

	container.autoTag = false;
	
	container.ready = function(){
		
	}	*/
}

this[VARS.name].declareContainer({
	name:'page_header_basic',
	container:PAGE_HEADER_BASIC
});