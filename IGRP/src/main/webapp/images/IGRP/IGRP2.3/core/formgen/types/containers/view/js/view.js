var GENVIEW = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container = this;
	
	var GEN = VARS.getGen();
	
	container.includes = {css:[{ path:'/plugins/view/igrp.view.css' }]};

	container.ready = function(){
		container.setPropriety({
			name      :'img',
			label     :'Image?',
			value     :true,
			transform :true
		});
		
		container.setPropriety({
			name      :'template',
			label     :'Template',
			value     :{
				value : 'default',
				options : [
					{
						label: 'Default',
						value : 'default'
					},
					{
						label: 'InfoBar',
						value : 'info'
					},
					{
						label: '2 Columns',
						value : '2cols'
					},
				]
			}
		});
		
	}
	container.onFieldsXMLGenerate = function(str){
		return container.GET.img() ? '<'+container.GET.tag()+'_img type="text" name="p_'+container.GET.tag()+'_img" maxlength="300"><value>../images/IGRP/IGRP2.3/assets/img/jon_doe.jpg</value></'+container.GET.tag()+'_img>' : "";
	}

	container.onFieldSet = function(f){
		
		f.setProperty({
			name  : 'maxlength',
			value : 250 
		});
		
		GEN.setBTNClass(f,'default');
		
		GEN.setImgAttr(f,{
			value:''
		});
		
		f.setPropriety( {
			name : 'showlabel',
			label : 'Show Label',
			value : true
		});
		
		
		/*f.setProperty({
			name  : 'icon',
			value : 250 
		});*/

	}
}

this[VARS.name].declareContainer({
	name:'view',
	container:GENVIEW
});