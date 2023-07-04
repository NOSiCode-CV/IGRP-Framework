(function(){
	
	var utils = GIS.module('Utils'),
	
	Query = {
		
		getQueryOptions : function(layer, attrs){
			
			var rtn = {},
			
				type = layer.data('type');
			
			//WFS Layers
			if(type == 'WFS'){
				
				var options = $.extend( attrs, layer.requestOptions);
				
				delete options.maxFeatures;
				
				delete options.bbox;
				
				rtn.url 	= layer.data('url');
				
				rtn.options = options;
			
			}
			
			//WMS Layers
			if(type == 'WMS'){
				
				var wmsUrl 		  = layer._url;
				
					indexOfWmsStr = wmsUrl.lastIndexOf('/wms'),//remove wms from url
				
					url 		  = wmsUrl.substring(0,indexOfWmsStr)+'/ows'; //add ows for the geojson service
			
				rtn.url = url;
				
				rtn.options = {
						
					version 	: '1.0.0',

					service 	: 'WFS',

					request     : 'GetFeature',

					outputFormat:'application/json',
						
					typeName    : layer.data('options').layers,
						
					cql_filter  : attrs.cql_filter

				}
				
			}

			return rtn;
			
		},
		
		cql : function (layer,o){
						
			var attributes   = o.attributes || [],
			
				value  		 = o.value || '',
				
				queryRequest = null,
				
				cql    		 = o.cql || '';
			
			if(layer){

				if(value){
										
					for(var i=0; i < attributes.length; i++){
						
						var attr 	   = attributes[i],
						
							isNumber   = utils.feature.properties.isNumber[attr],
							
							comparison = isNumber ? "LIKE '%"+value+"%'" : "LIKE '%"+value.toLowerCase()+"%'",
									
							attr       = /*isNumber ? attr :*/ "strToLowerCase("+attr+")";
						
						cql+= attr +' '+ comparison;
						
						if(i < attributes.length - 1)
							
							cql+= ' OR '
					}
				}
				
				if(cql){
					var queryOptions = Query.getQueryOptions( layer,{
						
						cql_filter : cql
						
					});
										
					queryRequest = $.get( queryOptions.url, queryOptions.options );
					
				}	
				
				return queryRequest;

			}
			
		}
		
	}
	
	
	GIS.module('Query', Query);
	
})();