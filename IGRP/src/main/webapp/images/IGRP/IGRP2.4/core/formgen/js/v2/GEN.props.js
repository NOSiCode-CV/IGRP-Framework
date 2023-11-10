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

})();