VARS.getGen().declareContainer({

	name:'carousel',

	container:function(name,params){
	
		CONTAINER.call(this,name,params);

		var container = this,

			Fields 	  = {

				label : {

					maxlength : 200,

					label : 'Title'

				},

				img : {

					maxlength : 200,

					label : 'Image'

				}

			};

		container.xml.table       = true;

		container.xml.fieldsValue = false;

		container.xml.genGroup = true;

		container.xml.structure   = 'table';

		container.includes = {

			xsl:[ 'carousel' ]

		};

		container.onFieldSet = function(f){

			f.setHiddenProperty('tag');
			
			f.autoTag = false;

		}

		function GetFields(){
			
			var r = '';

			for(var f in Fields){

				var field = Fields[f],

					tag   = container.GET.tag()+'_'+f;

				r+= '<'+tag+' name="p_'+tag+'" type="text" maxlength="'+field.maxlength+'" >'+

	                    '<label>'+field.label+'</label>'+

	                '</'+tag+'>';

			};

			return r;

		}

		function GetValueRows(){

			var r = '';

				container.GET.fields().forEach(function(F){

					r+='<row>';

						for(var f in Fields){

							var field = Fields[f],

								tag   = container.GET.tag()+'_'+f;

							r+= '<'+tag+' name="p_'+tag+'">'+F.GET[f]()+'</'+tag+'>';

						};

					r+='</row>';

				});

			return r;


		};
		

		container.xml.getStructure = function(o){

			return '<fields>'+

						GetFields()+

				   '</fields>'+

				   '<table>'+

					   '<value>'+

					   		GetValueRows()+

					   	'</value>'+

				   	'</table>'

		}
	}

});