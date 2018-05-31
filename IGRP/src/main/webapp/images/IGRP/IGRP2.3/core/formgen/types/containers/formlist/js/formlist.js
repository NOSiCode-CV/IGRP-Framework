	var GENFORMLIST = function(name,params){
	CONTAINER.call(this,name,params);
	var GEN       = VARS.getGen(); 
	var container = this;
	container.xml.table       = true;
	container.xml.fieldsValue = false;
	container.xml.genGroup = true;
	/*CONFIG FIELD SORT*/
	container.sortableOptions.axis = "x";

	container.xml.clean = true;
	
	//import : { table:'import.all'
	container.includes = {
		xsl : [ 'form-utils','table-utils'],
		css : [ 
			{ 
				path:'/plugins/formlist/igrp.formlist.css' 
			}, 
			/*{
				path:'/core/igrp/form/igrp.forms.css'
			},*/
			{
				path:'/core/igrp/table/igrp.tables.css'
			},
			{
				path:'/core/igrp/table/dataTables.bootstrap.css'
			}
		],
		js  : [ 
			{ 
				path:'/core/igrp/table/igrp.table.js' 
			},  
			{ 
				path:'/plugins/formlist/igrp.formlist.js' 
			},  
			{
				path:'/core/igrp/form/igrp.forms.js'
			} 
		]
	};

	var tableOrderIncludes = [
		{path : '/core/formgen/js/jquery-ui.min.js'}
	],
	tableOrderInc  = false;

	container.sortableOptions.onOver = function(){
		$('tbody',container.holder).hide();
	}

	container.sortableOptions.onOut = function(){
		$('tbody',container.holder).show();
	}

	container.onFieldSet = function(field){
		
		GEN.setFormFieldAttr(field);

		field.unsetProprieties(['size'])

		field.xml.desc = true;
	
	}

	container.onFileFieldSet = function(field){
		GEN.setBTNClass(field);
	}

	container.onDateFieldSet = function(field){
		GEN.setBTNClass(field);
	}
 	
	container.onSelectFieldSet = function(f){
		
		f.setPropriety({
			name:'delimiter',
			value:';'
		});

	}

	container.onDrawEnd = function(){
		$('.IGRP_formlist',container.holder).IGRP_formlist();
	}

	container.setPropriety({
		name:'filterTemplate',
		value:false,
		editable:false,
		xslValue: function(){
			var filterTag = container.GET.tag()+"_filter",
				name	  = "'p_"+filterTag+"'",
				filter    = "'"+container.GET.filter()+"'",
				fltPg     = container.GET.filter()=='filter_num' ? '<xsl:with-param name="filter_pagination" select="'+container.GET.path()+'/fields/'+filterTag+'_pg/value"/>' : '';

			return '<xsl:call-template name="table-filter">'+
                    '<xsl:with-param name="name" select="'+name+'"/>'+
                    '<xsl:with-param name="value" select="'+container.GET.path()+'/fields/'+filterTag+'/value"/>'+
                    fltPg+
                    '<xsl:with-param name="type" select="'+filter+'"/>'+
                  '</xsl:call-template>';
		}
	});
	
	container.setPropriety({
		name:'filter',
		value:{
			value: '',
			options:[
				{value : ''            ,label : ''},
				{value : 'filter_az'   ,label : 'A-Z'},
				{value : 'filter_num'  ,label : '0-9'},
				{value : 'filter_aznum',label : 'A-Z-0-9'}
			]
		},
		onChange:function(v){
			var val = v && v != ''? true : false;
			container.SET.filterTemplate(val);
		}
	});

	container.setPropriety({
		name:'noupdate',
		label:'No Add',
		xslValue:'noupdate',
		value:false
	});

	container.setPropriety({
		name:'nodelete',
		label:'No Delete',
		xslValue:'nodelete',
		value:false
	});

	container.setPropriety({
		name:'ordertable',
		label : 'Order Table',
		value:false,
		xslValue:'ordertable',
		onChange:function(v){
			if(v){

				if(!tableOrderInc){
					tableOrderIncludes.forEach(function(e){
						container.includes.js.unshift(e);
					});
					tableOrderInc = true;
				}					
			}else{
				tableOrderIncludes.forEach(function(e){
					for( var i = 0; i < container.includes.js.length; i++){
						var inc = container.includes.js[i];
						if(inc.path == e.path){
							var index = container.includes.js.indexOf(inc);
							if (index > -1) 
							    container.includes.js.splice(index, 1);
							break;
						}
					}
				});

				tableOrderInc = false;
			}
		}
	});
}

this[VARS.name].declareContainer({
	name:'formlist',
	container:GENFORMLIST
});