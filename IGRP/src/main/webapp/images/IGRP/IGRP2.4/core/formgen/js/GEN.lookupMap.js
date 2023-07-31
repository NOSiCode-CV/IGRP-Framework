(function(){
	
	var GEN = VARS.getGen();
	
	GEN.lookupMaps = {
			
		containers : {
			
			treemenu : {
				
				fields : [
					
					'link','link_desc','tmid'
				],
				
				getFields : function(container){
					
					var rtn = [],
					
						tag = container.proprieties.tag;
					
					this.fields.forEach(function(f){
						
						rtn.push({
							value : tag+'_'+f,
							label : tag+'_'+f
						})
						
					})
					
					return rtn;
					
					
				}
				
			}
			
		}
			
	}
	
})();