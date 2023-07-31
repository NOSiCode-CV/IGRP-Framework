var GENIFRAME = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;

	var GEN = VARS.getGen();
	
	//container.xml.type      = 'text';
	
	//container.xml.valueAttr = 'source';

	container.includes = {
		js:[{path:'/core/igrp/iframenav/com.iframe.js'}]
	}

	container.ready = function(){
		
		container.setPropriety({
			name: 'height',
			value:250
		});

		container.setPropriety({
			label:'Iframe Source',
			name: 'src',
			size:12,
			value:'#',
			editable:false,
			isField:true
		});

		GEN.setBtnActionAttr(container,{
			value: '',
			onChange:function(v){
				container.SET.src(v.params.link);
			}
		});

		container.setPropriety({
			name: 'boxed',
			value:false,
			xslValue:'box'
		});

	}

	container.onDrawEnd = function(){
		$.IGRP.components.iframes.init(container.holder);
	}

}

this[VARS.name].declareContainer({
	name:'iframe',
	container:GENIFRAME
});