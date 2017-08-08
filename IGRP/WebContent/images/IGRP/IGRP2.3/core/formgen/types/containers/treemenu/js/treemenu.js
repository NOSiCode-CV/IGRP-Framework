var TREEMENU = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();

	var container = this;

	var proprieties = params && params.properties;
	
	container.fields = false;

	container.xml.structure = 'table';

	container.xml.genGroup = true;

	container.xml.genRemote = false;

	container.includes = {
		xsl : ['treemenu'],
		css : [ { path : '/plugins/treemenu/treemenu.css' } ], 
		js  : [ { path : '/plugins/treemenu/treemenu.js' }]
	}

	var showPackageName = function(v){
		var action  = v ? 'show' : 'hide'; 
		$('.gen-properties-setts-holder div[rel="package_name"]')[action]();
	}

	container.ready = function(){

		container.setPropriety({
			name:'style',
			label:'Style',
			value:{
				value:'default',
				options:[
					{value:'default',label:'Default'},
					{value:'customimg',label:'Custom Images'}
				]
			}
		});

		GEN.setTargetAttr(container,{value:'_blank'});

		container.setPropriety({
			name:'package_name',
			label:'Package Name',
			value:'',
		});

		container.setPropriety({
			name 	: 'remote',
			label	: 'Remote',
			value 	: false,
			xslValue: '<xsl:with-param name="toggle" select="\'remote\'"/>',
			onChange : function(v){
				if (v)
					container.xml.genRemote = true;	
				else
					container.xml.genRemote = false;
			},
			onEditionStart : function(v){
				showPackageName(v.value);
				$('input',v.input).on('change',function(){
					showPackageName($(this).is(':checked'));
				});
			}
		});

		container.setPropriety({
			name 	: 'onLoad',
			label	: 'Call onLoad',
			value 	: false,
			xslValue: '<xsl:with-param name="onload" select="\'true\'"/>'
		});
	}
};

this[VARS.name].declareContainer({
	name:'treemenu',
	container:TREEMENU
});