(function(GEN){

	'use strict';

	var attrTypes = {

		separatorlist : function(o){
				
			var title = o.options.label || capitalizeFirstLetter(o.options.name), 

				html = $('<label>'+title+'</label><div class="box gen-container-item" ><div class="box-body IGRP-separatorlist" tag="gen-separatorlist-attr" dialog="false"><div class="splist-form-holder"><div class="splist-form" role="form"></div></div><div class="table-box box-body box-table-contents splist-table"><table rel="T_separatorlist_1" id="gen-separatorlist-attr" class="table table-striped gen-data-table"><thead><tr><th class="table-btn"><a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left"><i class="fa fa-plus"/></a></th></tr></thead><tbody></tbody></table></div></div></div>');
			
			if(o.options.data){

				var fieldsWrapper   = $('.splist-form',html),

					fieldsTHWrapper =  $('thead tr',html);

				if(o.options.data.fields && o.options.data.fields[0]){

					o.options.data.fields.forEach(function(f){
						
						var fieldHtml = '',

							fieldSize = f.size || 6,

							addBtnIdx = $('.table-btn',html).index();

						switch(f.type){

							case 'select':

							break;

							default:

								fieldHtml = '<div class="form-group col-sm-'+fieldSize+'" item-name="'+f.tag+'" item-type="'+f.type+'">'+
											  '<label>'+f.label+'</label>'+
											  '<input type="'+f.type+'" class="form-control" name="p_'+f.tag+'"/>'+
											'</div>';
						}

						fieldsWrapper.append(fieldHtml);

						if(f.visibleOnTable != false)

							fieldsTHWrapper.insertAt( '<th field="'+f.tag+'" item-name="'+f.tag+'" class="'+f.type+'">'+f.label+'</th>', addBtnIdx );

					});

				}

			}

			console.log($('.IGRP-separatorlist',html))
			$('.IGRP-separatorlist',html).separatorList();

			return html;

		}

	}

	GEN.attributes = {

		get : function(options){
			
			var type = options && options.type ? options.type : null,

				html = null;

			if(attrTypes[type])

				html = attrTypes[type]( options )

			return html;
		}

	}

	


})( VARS.getGen() );