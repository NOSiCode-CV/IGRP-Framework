(function(){

	var selectors = {
			
		formlistItemID      : 'fl_item_id', // id of the main formlist item
		
		associationFormRel  : 'fl_association_rel', //id related formlist item
			
		associationRel      : 'formlist-a-rel-', //start class of the association main formlist ( formlist-a-rel-TAG_OF_MAIN_FL)

		associationBtnClss  : 'formlist-a-btn', //btn class for open association

		associationFormClss : 'formlist-a-details', //formlist for association class
		
		mergeImportsClss    : 'merge-import-data'
		
	};
	
	function FormlistAssociation( associationForm ){
		
		var parentFormListName, parentFormList, currentRow, associationFormParent, associationFormList;

		function FilterAssociationRows(id){
			
			var aform = $(associationForm);
			
			$('tbody tr',aform).each(function(i,tr){
				
				var rel = $('[name="p_'+selectors.associationFormRel+'_fk"]', tr).val();

				if(rel != id)
					
					$(tr).hide().addClass('not-visible');
				
				else
					
					$(tr).show().removeClass('not-visible');

			});

			if( !$('tbody tr:not(.not-visible)',aform).length )
				
				$('.formlist-row-add',aform).click();


		};
		
		function ShowAssociationForm(){
			
			var btn   = $(this),
				
				row   = btn.parents('tr').first(),
				
				aform = $(associationForm),
				
				atable = aform.find('table'),
				
				aname  = atable.attr('id'),
				
				id    = $('[name="p_'+selectors.formlistItemID+'_fk"]', row).val(),
				
				title = row.find('.formlist-a-title input[rel="F_'+parentFormListName+'"]').val() || 'Associar';
			
			currentRow = id;
			
			FilterAssociationRows(id);
			
			$.IGRP.components.globalModal.set({
				
				title : '<h4 style="float:left; margin:0">'+title+'</h4>',
				
				size : 'lg',
				
				operation : 'appendTo',
				
				buttons : [
					{
						class : 'primary',
						
						icon : 'check',
						
						text : 'Concluir',
						
						onClick:function(){
							
							$.IGRP.components.globalModal.hide();
							
							currentRow = null;
							
							return false;
							
						}
					}
				],
				
				beforeHide : function(){
					
					aform.hide().appendTo( associationFormParent );
					
				},
				
				content: aform.show()
				
			});
			
			$.IGRP.components.globalModal.get().find('.modal-body').css('padding','0')
			
		};
		
		function SetRowID( r ){
			
			var idItem = $('[name="p_'+selectors.formlistItemID+'_fk"]', r),
			
				val    = idItem.val() || parentFormListName+'-item-'+$.IGRP.utils.unique()
			
			idItem.val( val );
			
		};
	
		function SetEvents(){
			
			$('body').on('click', '.'+selectors.associationBtnClss+'> a', ShowAssociationForm);

			parentFormList.on('formlist:add-row', function(e,r){
				
				r.row.removeAttr('style');
			
				SetRowID( r.row[0] );
				
			});
			
			parentFormList.on('formlist:row-remove', function(e,r){
				
				var id = $('[name="p_'+selectors.formlistItemID+'_fk"]', r.row).val(),
				
					rels = associationFormList.find('[name="p_'+selectors.associationFormRel+'_fk"][value="'+id+'"]');
				
				rels.each(function(i,r){
					
					$(r).parents('tr').first().find('.formlist-row-remove').click();
					
				});

			});

			associationFormList.on('formlist:add-row', function(e,r){
				
				$('[name="p_'+selectors.associationFormRel+'_fk"]', r.row).val( currentRow );
				
				r.row.removeAttr('style');
				
			});
			
			parentFormList.on('formlist:row-reset', function(e,r){
				
				SetRowID( r.row[0] );
				
			});
			
		};
		
		function SetVariables (){
			
			associationFormParent = $(associationForm).parent();
			
			associationFormList   = $('.IGRP_formlist', associationForm);
			
			associationForm.classList.forEach(function(c){
				
				if(c.indexOf(selectors.associationRel) == 0){
					
					parentFormListName = c.split(selectors.associationRel).join(''),
					
					parentFormList 	   = $('.IGRP_formlist#'+parentFormListName );

				}
					
			});
			
			//set rowsID
			$('tbody tr', parentFormList).each(function(i, r){
				
				SetRowID( r );
				
			});
			
		};
			
		SetVariables();
			
		SetEvents();
		
	}
	
	
	function Start(){

		var associationForms = $('.'+selectors.associationFormClss);

		associationForms.each(function(i,a){

			new FormlistAssociation( a );

		});

	};

	Start();
	
})();