(function(){
	
	var Classes = {
			
		separatorlist : {
			
			target : {
				
				set : function(options){
					
					var targetTag   = options.clicked.attr('id');

					var rowUniqueID = $('[name="p_'+targetTag+'_association_id_fk"]', options.row[0]).val();
		
					options.target.data('current', rowUniqueID );
					
					options.source.data('clicked', targetTag);
					//options.target.data('current', rowUniqueID );
					
					options.source.find('tbody tr').hide();
					
					$('[name="p_'+targetTag+'_association_rel_fk"]', options.source).each(function(i, input){
						
						var relID = $(input).val();
						
						if(relID == rowUniqueID){
							
							var tr = $(input).parents('tr').first();
							
							tr.show();
							
						}
						
					});

				},
				
				config : function(wrapper){

					var separatorID = $(wrapper).attr('id');
		
					 $('[list-source]',wrapper).each(function(){
						 
						 var separatorlist = $(wrapper).find('.IGRP-separatorlist'),
							
							tag 		  =  $(this).attr('id'),
							
							idName 		  = 'p_'+tag+'_association_id_fk',
							
							sourcelist    = null;
						
						separatorlist.data('current', null);
						
						separatorlist.find('tbody tr').each(function(i,tr){
							
							if( !$('input[name="'+idName+'"]', tr).val() )
								
								SetTargetRowUniqueID( tr, idName );
							
						});
						
						separatorlist.on('row-add', function(e, params){
							
							SetTargetRowUniqueID( params.row, idName );
							
						});
						
						$(wrapper).data( 'list-association-target-set', true );
						 
					 });
					 
					 $( $.IGRP.components.globalModal.modalid ).on('before-hide', function(){
						 if($(wrapper).find('.IGRP-separatorlist')[0])
							 $(wrapper).find('.IGRP-separatorlist')[0].resetForm();
				
					 });
					
				}
				
			},
			
			source : {
				
				config : function(wrapper, options){
					
					var targetName = $(wrapper).attr('association-target-name'),
					
						target = $('.gen-container-item[item-name="'+targetName+'"]'),

						source = $(wrapper).find('.IGRP-separatorlist'),
						
						setTargetEdit = function(){
							
							var rowOnEdition = $( $.IGRP.components.globalModal.modalid ).data('target-row');
							
							if(rowOnEdition){
								
								var rowID = $('.sl-row-id',rowOnEdition).val();
								
								var tableID = target.find('.splist-table>table').attr('id');
								
								if(rowID){
									
									if( ! $('[name="p_'+tableID+'_edit"]', rowOnEdition)[0]  ){
										
										rowOnEdition.prepend('<input type="hidden" class="sl-row-id-edit" name="p_'+tableID+'_edit" value="'+rowID+'"/>')
										
									}
									
								}
									
									
								
							}

						};
				
					source.on('row-add', function(e, params){
						
						var targetID = $(wrapper).data('clicked');
						
						var sourceInputRel = $('[name="p_'+targetID+'_association_rel_fk"]', params.row[0]);
						
						sourceInputRel.val( target.data('current') );
						
						setTargetEdit();
						
					});
					
					source.on('row-remove', function(e, params){
						
						setTargetEdit();
						
					});
					
					target.on('before-row-remove', function(e, params){
						
						var targetIDs = $(params.row).find('[name*="_association_id_fk"]').not('[name*="_fk_desc"]');
						
						targetIDs.each( function(){
							
							var id = $(this).val(),
							
								sourceInputs = source.find('[value="'+id+'"]');
								
							sourceInputs.each(function(){
								
								$(this).parents('tr').first().remove();
								
							});

						});

					});
					
					$(wrapper).data('list-association-source-set', true);
					
					$( $.IGRP.components.globalModal.modalid ).on('before-hide', function(){
						
						if($(wrapper).find('.IGRP-separatorlist')[0])

							$(wrapper).find('.IGRP-separatorlist')[0].resetForm();
						
					 });
					
				}
				
			}
				
		}
			
	};
	
	
	function SetTargetRowUniqueID( row, name, prefix ){
		
		var idItem = $('[name="'+name+'"]', row),
		
			pre    = prefix || 'list-association-target-item',
		
			val    = idItem.val() || pre+$.IGRP.utils.unique();
		
		idItem.val( val );
		
	};
	
	function GetListType(target){
		
		var type = false;
		
		if($(target).find('table.table')[0])
			
			type = 'separatorlist';
		
		if($(target).find('.IGRP-separatorlist')[0])
			
			type = 'separatorlist';
		
		if($(target).find('.IGRP_formlist')[0])
			
			type = 'formlist';
		
		return type;
		
	}
	
	delete $.IGRP.components.ListAssociation;
	
	$.IGRP.component('ListAssociation',{
		
		openDialog : function(options){
			
			var sourceParent = options.source.parent(),
			
				title        = options.clicked.text() || 'Associar',
				
				targetRow    = options.row;
			
			$( $.IGRP.components.globalModal.modalid ).data('target-row', targetRow);
			
			$.IGRP.components.globalModal.set({
				
				title : '<h4 style="float:left; margin:0">'+title+'</h4>',
				
				size : 'lg',
				
				operation : 'appendTo',
				
				class : 'list-association-modal',
				
				buttons : [
					{
						class : 'grey',
						
						icon  : 'check',
						
						text  : 'Confirmar',
						
						onClick:function(){
							
							$.IGRP.components.globalModal.hide();

							options.target.data('current', false);

							return false;
							
						}
					}
				],
				
				beforeHide : function(){
					
					
					
					$( $.IGRP.components.globalModal.modalid ).removeData('target-row');
					
					options.source.hide().appendTo( sourceParent );
					
					$( $.IGRP.components.globalModal.modalid ).trigger('before-hide');
					
					/*if(options.target.find('.IGRP-separatorlist')[0])
						options.target.find('.IGRP-separatorlist')[0].resetForm();
					
					if(options.source.find('.IGRP-separatorlist')[0])
						options.source.find('.IGRP-separatorlist')[0].resetForm();*/
					
				},
				
				content:options.source.show()
				
			});
			
			
			
		},
		
		set : function(options){
			
			var targetType = GetListType(options.target[0]);
			
			if(Classes[targetType]){
				
				var targetClass = Classes[targetType].target;
				
				targetClass.set(options);
				
				$.IGRP.components.ListAssociation.openDialog(options);
				
			};

		},
		
		init : function(){
			
			$('.list-association-target').each(function(i, target){
				
				var type = GetListType( target );
				
				if(Classes[type]){
					
					$(target).attr('list-association-type',type);
					
					Classes[type].target.config( target );
					
				}
				
			});
			
			$('.list-association-source').each(function(i, source){
				
				var type = GetListType( source );
				
				if(Classes[type]){
					
					$(source).attr('list-association-type',type);
					
					Classes[type].source.config( source );
					
				}
				
			});
			
		}
		
	},true)
	
})();