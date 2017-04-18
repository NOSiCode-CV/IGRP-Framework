var SECTIONHEADER = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;
	
	container.xml.type      = 'text';
	container.xml.structure = 'form';

	container.ready = function(){
		container.unsetProprieties(['title','hasTitle','collapsible']);

		/*container.setProperty({
			name:'size',
			label:'Size',
			value:{
				value: 'h2',
				options:[
					{
						value:'h1',
						label:'h1'
					},
					{
						value:'h2',
						label:'h2'
					},
					{
						value:'h3',
						label:'h3'
					},
				]
			}
		});*/

		/*container.setProperty({
			name:'isTitle',
			label:'Page Title',
			value:false,
			editable:false,
			xslValue:'<xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>'
		});*/
	}
	
}

this[VARS.name].declareContainer({
	name:'sectionheader',
	container:SECTIONHEADER
});