var TREELIST = function(name,params){

	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();
	
	var container = this;

	container.xml.table       = true;

	container.xml.fieldsValue = false;

	container.xml.genGroup    = true;

	container.sortableOptions.items = 'li[main-parent="true"]';

	container.includes = {

		css : [

			{
				path : '/plugins/treelist/treelist.css'
			}

		],

		xsl :[ 'treelist']

	};

	var keys = {

		uid     : {

			label : 'Id',

			valueKey : 'tag'

		},

		title  : {

			label    : 'Titulo',

			valueKey : 'label'

		},

		link   : {

			label : 'Link',

			valueKey : 'action'

		},

		target : {

			label : 'Target',

			valueKey : 'target'

		},

		icon   : {

			label : 'Icon',

			valueKey : 'img'

		},

		parent : {

			label : 'Parent ID',

			valueKey : 'parent'

		}

	};

	container.xml.getStructure = function(o){
		
		var fields = container.GET.fields(),
			rtn    = '';

		rtn += '<fields>';

		for(var k in keys){

			rtn+='<'+o.tag+'_'+k+'>'+keys[k].label+'</'+o.tag+'_'+k+'>';

		}

		rtn+= '</fields>';

		rtn += '<table>';

		rtn += '<value>';

		fields.forEach(function(f){
			//console.log(f)
			rtn+='<row>';		

			for(var k in keys){

				rtn+='<'+o.tag+'_'+k+'>'+f.GET[ keys[k].valueKey ]()+'</'+o.tag+'_'+k+'>';

			}

			rtn+='</row>';	
			
		});

		rtn += '</value>';

		rtn+= '</table>';

		return rtn;
	}


	container.ready = function(){

//		console.log(container);

	}

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


	}

				
}

this[VARS.name].declareContainer({
	name:'treelist',
	container:TREELIST
});