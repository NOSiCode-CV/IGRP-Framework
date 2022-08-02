$.fn.separatorList = function(o){

	var ichange = $.IGRP.info.params.ichange;
		
	var options = $.extend({
		addBtn    : 'table-row-add',
		editBtn   : 'table-row-edit',
		removeBtn : 'table-row-remove',
		undoBtn   : 'table-row-undo',
		templates : {
			rowOptions: '<td data-row="" class="table-btn">'+
			'<span class="table-row-undo btn btn-warning d-none" title="Undo" data-toggle="tooltip" data-placement="left">'+
				'<i class="fa fa-undo"></i>'+
			'</span>'+
			'<span class="table-row-edit btn btn-warning" title="Edit" data-toggle="tooltip" data-placement="left">'+
				'<i class="fa fa-pencil"></i>'+
			'</span>'+
			'<span class="table-row-remove btn btn-danger" title="Remove" data-toggle="tooltip" data-placement="right">'+
				'<i class="fa fa-times"></i>'+
			'</span>'+
		'</td>'
		}
	},o);

	if(this[0]){

		var rowEdit = {

			set : function(p){

				var slEstorage = {};
				$(p.sl).attr('row-action','edit');
				$(p.sl).attr('row-index',p.indexRow);
				$(p.sl).attr('row-id',p.rowId);

				slEstorage.action 	= 'edit';
				slEstorage.indexRow = p.indexRow;
				slEstorage.rowId 	= p.rowId;

				//rowEdit.params.row = p.row;

				$.IGRP.utils.createHidden({
					name:'p_fwl_'+p.name+'trc',
					value:JSON.stringify(slEstorage).replace(/"/g, "'"),
					class:'submittable'
				});
				
				$(p.sl).parents('form').attr('target','editseparator');
			},
			reset : function(sl){
				$(sl).removeAttr('row-action');
				$(sl).removeAttr('row-index');
				$(sl).removeAttr('row-id');

				$('input[name="p_fwl_'+sl.name+'trc"]').remove();
				$('.splist-form-holder .dynamic-alert',$(sl)).remove();
				$(sl).parents('form').removeAttr('target');
			},
			get : function(sl){

				var sle  = $('input[name="p_fwl_'+sl.name+'trc"]').val();
				sle      = sle ? JSON.parse(sle.replace(/'/g, '"')) : {};

				return {
					rowIndex : sle.indexRow ? sle.indexRow : $(sl).attr('row-index') ? $(sl).attr('row-index') : '',
					rowId 	 : sle.rowId ? sle.rowId : $(sl).attr('row-id') ? $(sl).attr('row-id') : '',
					action   : sle.action ? sle.action : $(sl).attr('row-action') ? $(sl).attr('row-action') : ''
				};
			},
			getValues : {},
			getHtmlRow : function(p){

				var strNode = 'tr-'+p.rowIndex,
					values  = p.html.replace(/"/g, "'");


				if(!rowEdit.getValues.hasOwnProperty(p.sepName))
					rowEdit.getValues[p.sepName] = {};
	
				rowEdit.getValues[p.sepName][strNode] = values;

				localStorage.setItem("rowEditSeparatorlist", JSON.stringify(rowEdit.getValues));
			}
		};

		/**separador list control**/

		var slOptionsCtrl = function(sl){
			var fixed = "#p_"+sl.name+"_no";
			
			if($(fixed+"add")[0] && $(fixed+"add").val())
				$(sl).attr('noadd','true');

			if($(fixed+"del")[0] && $(fixed+"del").val())
				$(sl).attr('nodel','true');

			if($(fixed+"edt")[0] && $(fixed+"edt").val())
				$(sl).attr('noedt','true');

			if($(fixed+"cle")[0] && $(fixed+"cle").val())
				$(sl).attr('nocle','true');
		};

		var appendToTable = function(values,sl){
			
			var	sle 	   = rowEdit.get(sl),
				rowIndex   = sle.rowIndex ? sle.rowIndex : 0,
				rowId 	   = sle.rowId,
				isDialog   = sl.isDialog ? true : false,
				fieldsH    = isDialog ? $('.splist-form-holder',sl)[0] : sl,
				formFields = getFormFields(fieldsH),
				action     = sle.action,
				edition    = action == 'edit' ? true : false,
				counter    = $(sl).find('.IGRP-separatorlist-count-header');
			
			var table    	= $(sl).find('.splist-table>table');
			var tableId     = table.attr('id');
			var row         = $('<tr></tr>'),
				inputRowId 	= '<input type="hidden" class="sl-row-id" name="p_'+tableId+'_id" value="'+rowId+'"/>';
			var contentsObj = {};
			
			if(rowId && rowId != undefined)

				inputRowId += '<input type="hidden" class="sl-row-id-edit" name="p_'+tableId+'_edit" value="'+rowId+'"/>';
			
			var valid = sl.events.execute('valid-row-add',{
				values : values,
				action : action || 'add',
				index  : rowIndex
			}) == false ? false : true;

			if(valid){

				for(var name in values){

					var object    = values[name];
					
					var value     = $.IGRP.utils.arrayValuesToString(object.value,',');

					var text      = $.IGRP.utils.arrayValuesToString(object.text,'; ');

					var tdHiddensStr = '<input type="hidden" name="'+name+'_fk_desc" value="'+text+'"/>';
					
					if(object.type != 'file')
						
						tdHiddensStr += '<input type="hidden" name="'+name+'_fk" value="'+value+'"/>';
					
					var tdHiddens = $(tdHiddensStr);

					var nameSplited = name.split('p_');

					var fieldName   = nameSplited[nameSplited.length-1];
					
					var afterAddCallback = function(){};

					contentsObj[fieldName] = {
						value:value,
						label:text
					}
					

					if(object.table){
						
						var customfieldtmpl = getFieldTemplate(sl,object.type);
						var tdcontent = '<span class="separator-list-td-val">'+text+'</span>';

						if(customfieldtmpl){
							
							try{
								tdcontent = customfieldtmpl({
									name   : name,
									value  : value,
									text   : text,
									target : object.target,
									field  : object.field
								});

								if(object.type == 'file'){
									
									if (value) {
										
										tdcontent = '<a href="'+value+'" class="link bClick" target="_blank">'+text+'</a>';
										
										var readContent = function(input, callback){
											
											if(FileReader){
												
												if (input.files && input.files[0]) {   
													
												    var reader = new FileReader();
												    
												    var filename = value;
												    
												    filename = filename.substring(filename.lastIndexOf('\\')+1);
												    
												    reader.onload = function(ev) {
												    	
												    	if(callback)
												    		
												    		callback(ev);
         
												    }
												    
												    reader.readAsDataURL(input.files[0]);    
												 } 
											}

										}
										
										afterAddCallback = function(td){

											readContent( object.field[0], function(res){
												
												var hyperlink = td.find('>a'),
												
													result   = res.target.result;
												
												hyperlink.attr('href', result);
												
												hyperlink.on('click', function(event){
													
													event.preventDefault();
													
													var win = $.IGRP.utils.openWin({
														url    : '',
														width  : 980,
														height : 520,
														win    : 'IGRP-upload-preview'
													});
													
													win.document.write('<iframe src="' + result  + '" frameborder="0" style="border:0; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%;" allowfullscreen></iframe>');


												    
													
													return false;
													
												});

											});
											
										}

									} else
										tdcontent = '<input type="hidden" name="'+name+'_fk" value=""/>';
								}
							}catch(err){
								console.log(err);
							}
						}
						
						var tdHTML = $('<td item-name="'+fieldName+'" field="'+fieldName+'" class="'+object.type+'">'+tdcontent+tdHiddensStr+'</td>')
						
						row.append(tdHTML);
						
						if(afterAddCallback && typeof afterAddCallback === 'function')
							
							afterAddCallback(tdHTML);
					
					}else
						row.append(tdHiddensStr);
					
				}

				$('td:first',row).append(inputRowId);
				
				row.append(getRowOptions());
				
				/* append counter TD to the line if has Counter Obejct (.IGRP-separatorlist-count-header) */
				if(counter[0]){

					var counterIdx = counter.index();

					row.prepend('<td class="IGRP-separatorlist-count-row"></td>')

				}
				
				if(edition){
					
					var oldrow = $('tbody tr',table).eq(rowIndex);
					
					var dynamicHiddens = $('.igrp-dynamic-hiddens',oldrow);
					
					row.prepend(dynamicHiddens);

					row.addClass('row-edited').data('row-edit-id','tr-'+rowIndex);

					rowEdit.getHtmlRow({
						html    : $('tbody tr',table).eq(rowIndex).clone(true).html(),
						sepName : sl.name,
						rowIndex: rowIndex
					});
					
					$('tbody tr',table).eq(rowIndex).replaceWith(row);
					
				}else
					$('tbody',table).append(row);

				resetForm(formFields,sl);

				sl.events.execute('row-add',{
					row:row,
					values:contentsObj,
					type : edition ? 'edit' : 'add'
				});
				
				$(sl).trigger('row-add', [{
					row:row,
					values:contentsObj,
					type : edition ? 'edit' : 'add'
				}])

				rowEdit.reset(sl);

			}else{
				console.log('not valid');
			}			
		};

		var setFormFieldValue = function(f,val){

			if(f){
				var ftag    = $(f).prop('tagName').toLowerCase();
				var ftype   = ftag == 'select' || ftag == 'textarea' ? ftag : $(f).attr('type');
				var genType = $(f).parents('[item-type]').attr('item-type');
				var rowVal  = val;

				if(rowVal)
					$(f).attr('item-value',rowVal);


				if(ftype != 'file'){
					
					if(ftype == 'select'){
						$(f).val(rowVal.split(','));
						$(f).trigger('change.select2');

					}
					
					else
						if(ftype == 'checkbox' || ftype == 'radio')
							rowVal.split(',').forEach(function(v){
								if( $(f).val() == v ){
									$(f).prop('checked',true);
									//$(f).trigger('change');
								}
							});
						else
							$(f).val(rowVal);
						
						
					//if(ftype == 'select' || ftype == 'checkbox' || ftype == 'radio')
						//$(f).trigger("change");
				}

				//$(f).trigger('change');
			}
		};

		var addRow = function(sl,e){
			var isDialog   = sl.isDialog ? true : false,
				fieldsH    = isDialog ? $('.dummy-form-slist .splist-form-holder')[0] : sl,
				formFields = getFormFields(fieldsH),
				rtn  	   = false,
				valid 	   = formFields.filter(':not(.no-required-validation)').valid();

			if( !formFields[0] || ( valid && hasValue(formFields) )){
				
				var values  = getFormFieldsValue(formFields,sl);
				
				try{
					appendToTable(values,sl);
				}catch(err){
					console.log(err);
				}

				rtn = true;
				
			}else{
				console.log('error')
			}

			return rtn;
		};

		var getCurrentFieldValues = function(values){
			console.log(values);
		}

		var editRow = function(sl,row){
			var isDialog = sl.isDialog;
			var fieldsH  = isDialog ? $('.splist-form-holder',sl)[0] : sl;
			var fields   = getFormFields(fieldsH);
			var tds      = $('td:not(.table-btn)',row);
			var values   = {},
				isChange = false,
				fChange  = null,
				arrField = [];  

			resetForm(fields,sl);
			
			rowEdit.set({
				sl 		 : $(sl),
				rowId 	 : $('.sl-row-id',row).val(),
				indexRow : $(row)[0].rowIndex -1,
				name 	 : sl.name,
				row      : row
			});

			$.each(fields,function(i,f){

				var fname  = $(f).attr('name');

				var rowFk    =  $('[name="'+fname+'_fk"]',row);
	
				if(rowFk[0]){

					var genType = $(f).parents('[item-type]').attr('item-type');

					var rowVal  = $.IGRP.utils.htmlEncode(rowFk.val());
					
					values[$(f).attr('item-name')] = rowVal;

					setFormFieldValue(f,rowVal);
					
					if($(f).hasClass('IGRP_change')){
						isChange = true;
						fChange  = $(f);
					}else
						arrField.push($(f));

					sl.events.execute(genType+'-field-edit',{
						field:$(f),
						value:rowVal,
						row  :row
					});

				}
			});

			getCurrentFieldValues(values);

			if (arrField[0]) {
				$.each(arrField,function(i,f){
					$(f).trigger('change');
				});
			}

			setFormBtnIcon(sl,{
				icon :'fa-check',
				color:'#abc956',
				class:'btn-success'
			});

			$(row).addClass('row-active');
			
			if(sl.isDialog)
				openDialog(sl,true);

			if (isChange) {
				fChange.change();
			}
		};

		var removeRow = function(sl,row){
			if(!$(row).hasClass('row-active')){
				var sltag = $(sl).attr('tag');
				var rowId = $('.sl-row-id',row).val();
				
				if(rowId)
					$("form").prepend('<input type="hidden" name="p_'+sltag+'_del" value="'+rowId+'"/>');
					//$.IGRP.utils.createHidden({ name:"p_"+sltag+"_del",value:rowId });
				

				
				$(row).trigger('removed-from-separatorlist');
				
				$(sl).trigger('before-row-remove', [{
					
					row : row
					
				}]);
				
				$(row).remove();

				sl.events.execute('row-remove',{
					id:row
				});
				
				$(sl).trigger('row-remove', [{
					
					row : row
					
				}]);
				
				
			}
		};

		var undoRow = function(sl,row){
			if(!$(row).hasClass('row-active') && $(row).hasClass('row-edited')){
				var sepName     = sl.name,
					rowEditId   = $(row).data('row-edit-id'),
					storageRows = localStorage.getItem('rowEditSeparatorlist'),
					rowValues   = '';

				storageRows = storageRows ? JSON.parse(storageRows) : {};

				storageRows = storageRows[sepName];

				rowValues = storageRows[rowEditId];

				if(rowValues !== ''){

					delete storageRows[rowEditId];

					$(row).removeClass('row-edited').removeData('row-edit-id').html(rowValues);
					
					if(typeof storageRows === 'object' && storageRows !== null){

						rowEdit.getValues[sepName] = storageRows;

						localStorage.setItem("rowEditSeparatorlist", JSON.stringify(rowEdit.getValues));
					}
					else{
						localStorage.removeItem("rowEditSeparatorlist");
						rowEdit.getValues = {};
					}
				}
			}
		}

		var checkEditedRow = function(sl){
			var sepName     = sl.name,
				storageRows = localStorage.getItem('rowEditSeparatorlist');

			if(storageRows){
				storageRows 	  = JSON.parse(storageRows);

				rowEdit.getValues = storageRows;

				storageRows 	  = storageRows[sepName];

				if(storageRows && $('tbody tr td span.table-row-undo',sl)[0]){
					$('tbody tr',sl).each(function(i,row){
						var idx = $(row)[0].rowIndex -1,
							tag = 'tr-'+idx;

						if(storageRows[tag]){
							
							$(row).addClass('row-edited').data('row-edit-id',tag);
						}
					});
				}

			}
		}

		var openDialog = function(sl,edit,reset){
			
			var content = $('<div class="dummy-form-slist"/>');
			
			var btnText = edit ? 'Editar' : 'Adicionar';

			var row     = $('.row-active',sl)[0] || false;

			/*if(!edit)
				resetForm( getFormFields(sl),sl );*/
			
			content.append($('.splist-form-holder',sl));

			$.IGRP.components.globalModal.set({
				title     :'',
				content   :content,
				size 	  :'lg',
				rel       :'gen-rules-setter',
				operation :'appendTo',
				beforeHide:function(){	
					
					setFormBtnIcon(sl,{
						icon:'fa-plus',
						color:'',
						class:'btn-primary'
					});
					
					$(sl).removeAttr('row-action');
					
					$(sl).removeAttr('row-index');
					
					$(sl).removeAttr('row-id');

					$('.row-active',sl).removeClass('row-active');
					
					$('.splist-form-holder',content).prependTo(sl);

					rowEdit.reset(sl);

					sl.events.execute('before-dialog-hide',{
						content:content
					});
					
					sl.resetForm();

				},
				buttons:[
					{ 
						text:btnText, 
						class:'primary',
						onClick:function(e){ 
							addRow(sl,e);return false; 
						} 
					},
					{ 
						text:btnText+' e Fechar', 
						class:'success',
						onClick:function(e){ 
							if(addRow(sl,e))
								$.IGRP.components.globalModal.hide();
							return false;
						} 
					}
				]
			});

			sl.events.execute('dialog-open',{
				content : content,
				row 	: row
			});
		};

		var getForm = function(sl){
			return $('.splist-form',sl);
		};

		var getTable = function(sl){
			return $('.splist-table table',sl);
		};

		var getFormFields = function(sl){
			return $(':input[name]:not(.not-form)',getForm(sl));
		}

		var hasValue = function(fields){

			var hasval = false;

			$.each(fields,function(i,f){
				var type = $(f).attr('type') ? $(f).attr('type') : $(f).parents('[item-type]').attr('item-type');

				if(type !== 'hidden'){

					if($(f).val()){
						hasval = true;
						return false;
					}
				}
			});

			return hasval;
		}

		var getFormFieldsValue = function(fields,sl){
			
			var values = {};
			
			$.each(fields,function(i,f){

				var field  = $(f),
					fname  = field.attr('name'),
					ftype  = field.attr('type') ? field.attr('type') : field.parents('[item-type]').attr('item-type'),
					frel   = field.parents('[item-name]').attr('item-name'),
					gentype= field.parents('[item-type]').attr('item-type'),
					val    = null;
			
				if(fname){
					
					if(!values[fname]) values[fname] = {value :[],text  :[], target :[]};	

					//CHECKBOX AND RADIO HANDLER
					if(ftype == 'checkbox' || ftype == 'radio'){
						val = field.is(':checked') ? field.val() : null;
						if(val){
							var text = field.attr('label') ? field.attr('label') : field.next('span').text();
							values[fname].value.push(val);
							values[fname].text.push(text);
						}
					//HYPERLINK HANDLER
					}else if(ftype == 'link'){
						val 	= field.val();
						text 	= field.attr('label');
						target 	= field.attr('target');

						values[fname].value.push(val);
						values[fname].text.push(text);
						values[fname].target.push(target);

					//SELECT COMBOBOX HANDLER
					}else if(field.prop('tagName').toLowerCase() == 'select'){
						val = field.val();
						if(val){
							if(typeof val == 'object'){
								values[fname].value = val;
								val.forEach(function(v){
									values[fname].text.push( $('option[value="'+v+'"]',field).text() )
								});
							}else{
								values[fname].value.push(val);
								values[fname].text.push($('option[value="'+val+'"]',field).text())
							}
						}
					//ALL OTHER INPUTS HANDLER
					}else{
						val = field.val();
						values[fname].value.push(val);
						var text = ftype == 'file' ? $('label',field.parents('.form-group')).text() : val;
						
						if (ftype == 'file' && val) {
							var sle  	  = rowEdit.get(sl),
								copyField = field.clone(true);
							
							field.removeAttr('id required class target-rend accept').attr('name',fname+'_fk').hide();
							copyField.insertBefore(field);

							if (sle.action == 'edit'){
								var row = $('table tbody tr:eq('+sle.rowIndex+')',sl);
								$('input[name="'+fname+'_fk"]',row).remove();
								row.prev('input[name="'+fname+'_fk"]:first').remove();
								field.insertBefore(row);
							} 
							else
								field.appendTo($('table tbody',sl));
						}
						values[fname].text.push(text);
					}
					//IS VISIBLE ON TABLE?
					values[fname].table = $('table th[item-name="'+frel+'"]',sl)[0] ? true : false;
					//FORM TYPE 
					values[fname].type  = gentype; 
					values[fname].field = field; 
				}
				
			});
			return values;
		};

		var getFieldTemplate = function(sl,type){
			return sl.events.getList()[type+'-field-add'] ? sl.events.getList()[type+'-field-add'][ sl.events.getList()[type+'-field-add'].length-1 ] : false;
		};

		var setFormBtnIcon = function(sl,p){

			//var defaultsClass = 'table-row-add btn-xs link btn form-link',
			var defaultsClass = 'table-row-add btn-xs link btn form-link',
				setclss       = p.class || 'btn-primary';

			//$('.'+options.addBtn).css('color',p.color);
			$('.'+options.addBtn+' i',sl).replaceWith('<i class="fa '+p.icon+'"></i>');
			
			if(p.class)
				$('.'+options.addBtn,sl).removeAttr('class').addClass(defaultsClass+' '+setclss);


		};	

		var getRowOptions = function(){
			return  options.templates.rowOptions;
		};

		var resetForm = function(fields,sl){
			
			fields = fields || getFormFields(sl);
			//var sl  = fields.parents('.IGRP-separatorlist')[0];
			var form       = fields.parents('.splist-form');
			var isEdition  = $(sl).attr('row-action') == 'edit' ? true : false;
			var firstInput = form.find(':first-child input[type="text"],:first-child input[type="number"],:first-child textarea');
			
			

			$.each(fields,function(i,f){
				var genType  = $(f).parents('[item-type]').attr('item-type');
				var fTag     = $(f).prop('tagName').toLowerCase();
				var fType    = fTag == 'select' || fTag == 'textarea' ? fTag : $(f).attr('type');


				if(fType == 'checkbox' || fType == 'radio'){
					$(f).prop('checked',false);
					//$(f).trigger('change');

				}else if(fType == 'file'){
					$(f).parents('.input-group').find(':text').val('');
					$(f).val('');
				}else
					if(fType != 'link')
						$(f).val('').removeAttr('selected').removeAttr('checked');

				if(fType == 'select')
				 	$(f).trigger('change.select2');

				sl.events.execute(genType+'-field-reset',$(f));
			});

			form.find('.form-validator-label').remove();

			$('tbody tr',sl).removeClass('row-active');

			rowEdit.reset(sl);

			setFormBtnIcon(sl,{
				icon:'fa-plus',
				color:'',
				class:'btn-primary'
			});
			
			setTimeout(function(){
				if(firstInput[0])
					firstInput[0].focus();
			},200);
		

			sl.events.execute('form-reset',fields);
		};
		
		//

		var customFieldsConfig = function(sl){
			//LINK FIELD
			sl.events.declare(["link-field-add"]);
			
			sl.events.on("link-field-add",function(o){

				var _class = o.field.attr('class'),
				
					icon   = o.field.attr('icon') || '';
				
				return '<a id="'+o.field.attr('id')+'" href="'+o.value+'" class="'+_class+'" target="'+o.target+'"><i class="fa '+icon+'"></i><span>'+o.text+'</span></a>'
				
			},true);

			//URL FIELD
			sl.events.declare(["url-field-add"]);
			sl.events.on("url-field-add",function(o){
				return '<a href="'+o.value+'" class="link bClick externalLink" target="_newtab">'+o.text+'</a>'
			},true);

			//FILE FIELD
			sl.events.declare(["file-field-add"]);
			sl.events.on("file-field-add",function(o){
				
				setTimeout(function(){
			
					var row = o.field.next('tr');
					
					row.on('removed-from-separatorlist', function(){

						o.field.remove();
						
					});
					
				},100);
				
				
				/*return $('input[name="'+o.name+'"]').clone(true)
					.removeAttr('class id multiple required accept').attr('name',o.name+'_fk')
					.attr('value',o.value).hide();*/
				return '';
			},true);
		};

		var checkOpenDialog = function(sl){
			
			if(sl.isDialog){
				
				if(ichange){

					var name = $.isArray(ichange) ? ichange[ichange.length-1] : ichange;

					if( $('.splist-form [name="'+name+'"]',sl)[0] )
						
						openDialog(sl);

				}

			}

		};

		var eventsFieldsEdit = function(sl){
			
			sl.events.declare(["select-field-edit"]);

	        sl.events.on('select-field-edit',function(o){
	        	var field = $(o.field);
            	if (field.is('[tags]')){
            		var arr   = o.value.split(','),
            		options   = [];

            		arr.forEach(function(op){
            			if (op) {
            				options.push({
	            				text 	 : op,
	            				value 	 :op,
	            				selected : true
	            			});
            			}
            		});

            		$.IGRP.components.select2.setOptions({
            			select  : field,
            			options : options
            		});
            	}
          	},true);
		};
		
		var onSubmitIsEdited = function(sl,e){
			var $obj = $('input[name="p_fwl_'+sl.name+'trc"]'),
				valid = true;
			
			if($obj[0] && $obj.val()){
				
				if($(e.target).attr('target') == 'editseparator')
					e.preventDefault();
				
				if(!$('.splist-form-holder .dynamic-alert',$(sl))[0]){
					
					$('.splist-form-holder',$(sl)).append($.IGRP.utils.message.alert({
						type : 'warning',
						text : 'Para opcões de insersão mutliplas e necessario clicar em Adicionar.'
					}));
					
				}
				
				if($.IGRP.components.tabcontent)
					$.IGRP.components.tabcontent.activeTabHasFieldsError($('.splist-form-holder',$(sl)));
	
				valid = false;
			}
	
			return valid;
		};

		var setEvents = function(sl){
			
			sl.resetForm = function(){
				
				resetForm( getFormFields(sl), sl );
				
			};

			if($(sl).find('.splist-form').attr('validation-class') != 'false')
				getFormFields().addClass('no-validation');

			customFieldsConfig(sl);

			eventsFieldsEdit(sl);
			
			$(sl).on('click','.'+options.addBtn,function(e){
				//console.log(e);
				//console.log('is dialog: '+sl.isDialog);
				if(sl.isDialog)
					openDialog(sl);
				else
					addRow(sl,e);

				return false;
			});

			$(sl).on('click','.'+options.editBtn,function(e){
				var row = $(e.target).parents('tr')[0];
				editRow(sl,row);
				return false;
			});

			$(sl).on('click','.'+options.removeBtn,function(e){
				var row = $(e.target).parents('tr')[0];
				removeRow(sl,row);
				return false;
			});


			$(sl).on('click','.'+options.undoBtn,function(e){
				var row = $(e.target).parents('tr')[0];
				undoRow(sl,row);
				return false;
			});
			

			sl.toJSON = function(p){
				var options = $.extend({},p);
				var $table  = getTable(sl);
				var rtn     = [];

				$.each( $('tbody tr',$table),function(i,row){
					var inputs = $('input:not(.sl-row-id)',row);
					var row    = {};

					$.each(inputs,function(ii,input){
						var name     = $(input).attr('name');
						var itemName = null;

						try{
							itemName = name.split('_fk').join('').split('_desc').join('').split('p_').join('');
						}catch(e){
							console.log(e);
						}

						if(itemName){
							var isDesc = name.indexOf('_fk_desc') != -1 ? true : false;
							
							if(!isDesc){
								var _name = options.excludeNamePrefix ? itemName.substring(options.excludeNamePrefix.length) : itemName;
								row[_name]= $(input).val();
							}
						}

					});

					if(options.params)
						for(var pr in options.params){
							row[pr] = options.params[pr];
						}
					

					rtn.push(row);

				});

				return rtn;
			}

			sl.setRows = function(arr,p){
				
				var params = $.extend({},p);
				
				var fieldNamePrefix = params.prefix == false ? '' : 'p_';
				
				var triggerChange = params.trigger == false ? false : true;
				
				if(arr && arr[0]){
					
					arr.forEach(function(r){

						for(var o in r){
							var name   = fieldNamePrefix+o;
							var value  = r[o];
							var f      = $('.splist-form [name="'+name+'"]',sl)[0];

							setFormFieldValue(f,value);
							
							if(triggerChange)
								
								$(f).trigger('change');	
						}

						var values  = getFormFieldsValue(getFormFields(sl),sl);
			
						try{
							appendToTable(values,sl);
						}catch(err){
							console.log(err);
						}
					});

				}
			}

			sl.resetAll = function(){
				resetForm(getFormFields(sl),sl);
				$('tbody tr',sl).remove();
				sl.events.execute('reset-all');
			};
			
			
			$.IGRP.events.on('submit',function(o){
				if(o.valid){
					onSubmitIsEdited(sl,o.event);
				}
			});
		
			$.IGRP.events.on('submit-ajax',function(o){
				if(o.valid){
					onSubmitIsEdited(sl,o.event);
				}
			});
		};
		
		$.each(this,function(i,sl){
			sl.name     = $(sl).attr('tag');  
			sl.isDialog = $(sl).attr('dialog') == 'true' ? true : false;
			sl.events   = new $.EVENTS([
				"valid-row-add",
				"row-add",
				"row-remove",
				"row-edit",
				"dialog-open",
				"before-dialog-hide",
				"dialog-hide",
				"form-reset",
				"reset-all"
			]);

			slOptionsCtrl(sl);

			setEvents(sl);

			checkOpenDialog(sl);

			checkEditedRow(sl);

		});
	}
}

$.IGRP.on('init',function(){
	$('.IGRP-separatorlist').separatorList();
	
	$.IGRP.events.on('element-transform',function(p){
        if($('.IGRP-separatorlist',p.content)[0])
            $('.IGRP-separatorlist',p.content).separatorList();
    });

	$.IGRP.events.on('target-click',function(p){
        localStorage.removeItem('rowEditSeparatorlist');
    });

});
	