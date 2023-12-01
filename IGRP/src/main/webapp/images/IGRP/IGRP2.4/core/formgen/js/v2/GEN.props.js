(function(){
    
    var GEN = VARS.getGen();

    GEN.globalProperties = {};

    GEN.setPropertyGroup = ( object, groupParams={} )=>{
        if(groupParams.name){

            object.setProperty({
                name: groupParams.name,
                type:'separator',
                value : groupParams.value || groupParams.label
            });

            groupParams.properties?.forEach( (prop,i)=>{
                prop.group = groupParams.name;
                object.setProperty(prop);
            } );
            
        }
        
        
       /* object.setProperty({
            name : 
        })*/
	}

    GEN.defineGlobalProperty = function( name, p ){
		GEN.globalProperties[name] = p;
	}
	GEN.getGlobalProperty = function(name){
		return GEN.globalProperties[name] && typeof GEN.globalProperties[name] === 'function' ? GEN.globalProperties[name] : ()=>{}
	}

    GEN.defineGlobalProperty("title-options", (object, defaults = { hasTitle:true, collapsible:true,collapsed:true }) => {
        
        if(defaults.hasTitle)
            object.setProperty({
                name:'hasTitle',
                value : true,
            });

        if(defaults.collapsible)
            object.setProperty({
                name:'collapsible',
                label : 'Abrir/Fechar',
                value : false,
            });

        if(defaults.collapsed)
            object.setProperty({
                name:'collapsed',
                label : 'Fechado',
                value : false,
            });

    });

})();