var GENVERTICALMENU = function(name,params){
	CONTAINER.call(this,name,params);
	var container = this;
	
	container.xml.type = 'items';
	
	container.xml.genType = 'menu';
	
	container.unsetProprieties(['collapsible']);

	container.onFieldSet = function(field){
		
		field.setProperty({
			name:'parent',
			order:5,
			value:{
				value:'',
				options:function(){
					var rtn   = [{ value:'', label:'' }]; 
					var menus = container.GET.fields();

					menus.forEach(function(m){
						if(m.GET.id() != field.GET.id())
							rtn.push({
								value:m.GET.tag(),
								label:m.GET.label()
							});
					});

					return rtn;
				}
			}
		
		});

	};

}
VARS.getGen().declareContainer({
	name:'verticalmenu',
	container:GENVERTICALMENU
});