var TREELIST = function(name,params){

	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();
	
	var container = this;

	container.xml.table       = true;

	container.xml.fieldsValue = false;

	container.xml.genGroup = true;

	container.xml.getStructure = function(o){
		
		var fields = container.GET.fields(),
			rtn    = '';

		rtn += '<fields>';

			rtn+='<'+o.tag+'_title></'+o.tag+'_title>';

			rtn+='<'+o.tag+'_link></'+o.tag+'_link>';

			rtn+='<'+o.tag+'_target></'+o.tag+'_target>';

			rtn+='<'+o.tag+'_parent></'+o.tag+'_parent>';			

		rtn+= '</fields>';

		rtn += '<table>';

		rtn += '<value>';

		fields.forEach(function(f){

			rtn+='<row>';		

				rtn+='<'+o.tag+'_title>'+f.GET.label()+'</'+o.tag+'_title>';

				rtn+='<'+o.tag+'_link></'+o.tag+'_link>';

				rtn+='<'+o.tag+'_target>'+f.GET.target()+'</'+o.tag+'_target>';

				rtn+='<'+o.tag+'_parent></'+o.tag+'_parent>';

			rtn+='</row>';	
			
		});

		rtn += '</value>';

		rtn+= '</table>';

		return rtn;
	}

	container.includes = {

		xsl :[ 'table-utils'],
		
		css :[ 

			{
				path:'/core/igrp/table/igrp.tables.css'
			}

		],

		js  :[ 

			{
				path:'/core/igrp/table/igrp.table.js'
			}

		]
	};


	container.ready = function(){

		console.log(container);

	}

				
}

this[VARS.name].declareContainer({
	name:'treelist',
	container:TREELIST
});