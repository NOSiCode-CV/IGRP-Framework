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

		},
		
		formlist : function(o){
			
			o.name = o.name || 'flist-attr'+(new Date().getTime());
		
			var flist = $('<table id="'+o.name+'" class="table table-striped gen-data-table IGRP_formlist " rel="T_'+o.name+'" data-control="data-'+o.flistName+'"><thead><tr><th class="table-btn add"><a class="formlist-row-add btn btn-primary" rel="'+o.name+'"><i class="fa fa-plus"/></a></th></tr></thead><tbody><tr row="0"><input type="hidden" name="p_'+o.name+'_id" value=""/><td class="table-btn delete" data-row="0"><span class="formlist-row-remove btn btn-danger" rel="'+o.name+'"><i class="fa fa-times"/></span></td></tr></tbody></table>');
			
			var getInput = function(f){
				
				var input = '<input type="'+f.type+'" name="p_'+f.tag+'_fk" value="" class="text form-control" rel="F_'+o.name+'"/>';
				
				switch(f.type){
					case 'select':
						var options = '<option/>';
						if(f.options && f.options[0]){
							f.options.forEach(function(opt){
								options+='<option value="'+opt.value+'">'+opt.label ||''+'</option>'
							});
						}
						
						input = '<select id="'+f.tag+'_fk" name="p_'+f.tag+'_fk" class="text form-control select2 " rel="F_'+o.name+'">'+options+'</select>'
						
					break;
				}
				
				return input;
				
			};
			
			if(o.fields){
				
				for(var f in o.fields){
					
					var field = o.fields[f],
					
						label = field.label || f,
						
						rows = field.rows && field.rows[0] ? field.rows : [];
					
					field.tag = f;
					
					$('<th><span>'+label+'</span></th>').insertBefore( $('thead .table-btn.add',flist) );
					
					$('<td align="" data-row="0" data-title="'+label+'" class="'+field.type+'" item-name="'+f+'">'+
						'<input type="hidden" name="p_'+f+'_fk_desc" value=""/>'+
							'<div class="form-group" item-name="'+f+'" item-type="'+field.type+'">'+
								getInput( field )+
							'</div>'+
						'</td>').insertBefore( $('tbody .table-btn.delete',flist) );
					
					
				}
			}

			flist.IGRP_formlist({

				data : o.data

			});

			//select2
			$.IGRP.components.select2.init(flist);
	
			
			
			return flist;
			
		}

	};

	GEN.attributes = {

		get : function(options){
			
			var type = options && options.type ? options.type : null,

				html = false;

			if(attrTypes[type])

				html = attrTypes[type]( options )

			return html;
		}

	}

	


})( VARS.getGen() );