$.fn.separatorList = function(o){
		
	var options = $.extend({
		addBtn    : 'table-row-add',
		editBtn   : 'table-row-edit',
		removeBtn : 'table-row-remove',
		templates : {
			rowOptions: '<td data-row="" class="table-btn">'+
		            		'<span class="table-row-edit btn btn-default">'+
                            	'<i class="fa fa-pencil"></i>'+
                        	'</span>'+
							'<span class="table-row-remove btn btn-danger">'+
                            	'<i class="fa fa-times"></i>'+
                        	'</span>'+
						'</td>'
		}
	},o);

	if(this[0]){

		var appendToTable = function(values,sl){
			
			var	sle 	   = rowEdit.get(sl),
				rowIndex   = sle.rowIndex,
				rowId 	   = sle.rowId,
				isDialog   = sl.isDialog ? true : false,
				fieldsH    = isDialog ? $('.splist-form-holder',sl)[0] : sl,
				formFields = getFormFields(fieldsH),
				action     = sle.action,
				edition    = action == 'edit' ? true : false;
			
			var table    	= $(sl).find('.splist-table>table');
			var tableId     = table.attr('id');
			var row         = $('<tr></tr>'),
				inputRowId 	= '<input type="hidden" class="sl-row-id" name="p_'+tableId+'_id" value="'+rowId+'"/>';
			var contentsObj = {};
			
			var valid = sl.events.execute('valid-row-add',{
				values : values,
				action : action || 'add',
				index  : rowIndex
			}) == false ? false : true;

			if(valid){

				for(var name in values){

					var object    = values[name];
					
					var value     = arrayValuesToString(object.value,',');

					var text      = arrayValuesToString(object.text,'; ');

					var tdHiddensStr = '<input type="hidden" name="'+name+'_fk_desc" value="'+text+'"/>';
					
					if(object.type != 'file')
						tdHiddensStr += '<input type="hidden" name="'+name+'_fk" value="'+value+'"/>';
					
					var tdHiddens = $(tdHiddensStr);

					var nameSplited = name.split('p_');

					var fieldName   = nameSplited[nameSplited.length-1]

					contentsObj[fieldName] = {
						value:value,
						label:text
					}


					if(object.table){
						
						var customfieldtmpl = getFieldTemplate(sl,object.type);
						var tdcontent = '<span class="separator-list-td-val">'+text+'</span>';

						if(customfieldtmpl){
							console.log(customfieldtmpl)
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
										//row.prepend(tdcontent)
										tdcontent = '<a href="'+value+'" class="link bClick" target="_blank">'+text+'</a>';
									} else
										tdcontent = '<input type="hidden" name="'+name+'_fk" value=""/>';
								}
							}catch(err){
								console.log(err);
							}
						}

						row.append('<td item-name="'+fieldName+'" field="'+fieldName+'" class="'+object.type+'">'+tdcontent+tdHiddensStr+'</td>');
						//row.find('td').append(tdHiddens)
					
					}else
						row.append(tdHiddensStr);
					
				}

				$('td:first',row).append(inputRowId);
				
				row.append(getRowOptions());

				console.log('at index: '+rowIndex)

				console.log(table);

				console.log(row);

				console.log(edition);

				if(edition)
					$('tbody tr',table).eq(rowIndex).replaceWith(row);
				else
					$('tbody',table).append(row);
				

				resetForm(formFields,sl);

				sl.events.execute('row-add',{
					row:row,
					values:contentsObj,
					type : edition ? 'edit' : 'add'
				});

				rowEdit.reset(sl);

			}else{
				console.log('not valid');
			}
			
		}

		var setFormFieldValue = function(f,val){
			if(f){
				var ftag    = $(f).prop('tagName').toLowerCase();
				var ftype   = ftag == 'select' || ftag == 'textarea' ? ftag : $(f).attr('type');
				var genType = $(f).parents('[item-type]').attr('item-type');
				var rowVal  = val;


				if(ftype != 'file'){
					
					if($(f).attr('multiple'))
						$(f).val( rowVal.split(',') )
					
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
						
						
					if(ftype == 'select' || ftype == 'checkbox' || ftype == 'radio')
						$(f).trigger("change");
				}
			}
		}

		var addRow = function(sl,e){
			var isDialog   = sl.isDialog ? true : false,
				fieldsH    = isDialog ? $('.dummy-form-slist .splist-form-holder')[0] : sl,
				formFields = getFormFields(fieldsH),
				rtn  	   = false;


			if(!formFields[0] || formFields.valid()){
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
		}

		var rowEdit = {
			set : function(p){
				var slEstorage = {};
				$(p.sl).attr('row-action','edit');
				$(p.sl).attr('row-index',p.indexRow);
				$(p.sl).attr('row-id',p.rowId);

				slEstorage.action 	= 'edit';
				slEstorage.indexRow = p.indexRow;
				slEstorage.rowId 	= p.rowId;

				localStorage.setItem(p.name, JSON.stringify(slEstorage));
			},
			reset : function(sl){
				$(sl).removeAttr('row-action');
				$(sl).removeAttr('row-index');
				$(sl).removeAttr('row-id');

				localStorage.removeItem(sl.name);
			},
			get : function(sl){
				var sle = localStorage.getItem(sl.name);

				sle      = sle ? JSON.parse(sle) : {};

				return {
					rowIndex : sle.indexRow ? sle.indexRow*1 : $(sl).attr('row-index') ? $(sl).attr('row-index')*1 : '',
					rowId 	 : sle.rowId ? sle.rowId*1 : $(sl).attr('row-id') ? $(sl).attr('row-id') : '',
					action   : sle.action ? sle.action : $(sl).attr('row-action') ? $(sl).attr('row-action') : ''
				};
			}
		};

		var editRow = function(sl,row){
			var isDialog = sl.isDialog;
			var fieldsH  = isDialog ? $('.splist-form-holder',sl)[0] : sl;
			var fields   = getFormFields(fieldsH);
			var tds      = $('td:not(.table-btn)',row);
			var values   = {},
				isChange = false,
				fChange  = null;  

			resetForm(fields,sl);

			rowEdit.set({
				sl 		 : $(sl),
				rowId 	 : $('.sl-row-id',row).val(),
				indexRow : $(row).index(),
				name 	 : sl.name
			});

			$.each(fields,function(i,f){

				var fname  = $(f).attr('name');

				var rowFk  =  $('[name="'+fname+'_fk"]',row);
	
				if(rowFk[0]){

					var genType = $(f).parents('[item-type]').attr('item-type');

					var rowVal  = $.IGRP.utils.htmlEncode(rowFk.val());
					
					setFormFieldValue(f,rowVal);
					
					if($(f).hasClass('IGRP_change') && genType != 'select'){
						isChange = true;
						fChange  = $(f);
					}

					sl.events.execute(genType+'-field-edit',{
						field:$(f),
						value:rowVal,
						row  :row
					});

				}
			});

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
		}

		var removeRow = function(sl,row){
			if(!$(row).hasClass('row-active')){
				var sltag = $(sl).attr('tag');
				var rowId = $('.sl-row-id',row).val();
				
				if(rowId)
					$.IGRP.utils.createHidden({ name:"p_"+sltag+"_del",value:rowId });
				
				$(row).remove();

				sl.events.execute('row-remove',{
					id:row
				});
			}
		}

		var openDialog = function(sl,edit,reset){
			
			var content = $('<div class="dummy-form-slist"/>');
			
			var btnText = edit ? 'Editar' : 'Adicionar';

			var row     = $('.row-active',sl)[0] || false;

			if(!edit)
				resetForm(getFormFields(sl),sl);
			
			content.append($('.splist-form-holder',sl));

			$.IGRP.components.globalModal.set({
				title     :'',
				content   :content,
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

				},
				buttons:[
					{ text:btnText, class:'primary',onClick:function(e){ addRow(sl,e);return false; } },
					{ text:btnText+' e Fechar', class:'success',onClick:function(e){ if(addRow(sl,e))$.IGRP.components.globalModal.hide();return false;} }
				]
			});

			sl.events.execute('dialog-open',{
				content : content,
				row 	: row
			});

		}

		var getForm = function(sl){
			return $('.splist-form',sl);
		}

		var getTable = function(sl){
			return $('.splist-table table',sl);
		}

		var getFormFields = function(sl){
			return $(':input:not(.not-form)',getForm(sl));
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
						var text = ftype == 'file' ? $('label span',field.parents('.form-group')).text() : val;
						
						if (ftype == 'file' && val) {
							var sle  	  = rowEdit.get(sl),
								copyField = field.clone(true);
							
							field.removeAttr('id required class target-rend accept').attr('name',fname+'_fk').hide();
							copyField.insertBefore(field);

							if (sle.action == 'edit'){
								var row = $('table tbody tr:eq('+sle.rowIndex+')',sl);
								$('input[name="'+fname+'_fk"]',row).remove();
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
		}

		var arrayValuesToString = function(arr,spliter){
			var str = "";
			arr.forEach(function(a,i){
				str+=a;
				if(i != arr.length-1)
					str+=spliter;
			});
			//console.log(str);
			return str;
		}

		var getFieldTemplate = function(sl,type){
			return sl.events.getList()[type+'-field-add'] ? sl.events.getList()[type+'-field-add'][ sl.events.getList()[type+'-field-add'].length-1 ] : false;
		}

		var setFormBtnIcon = function(sl,p){
			var defaultsClass = 'table-row-add btn-xs link btn form-link',
				setclss       = p.class || 'btn-primary';

			//$('.'+options.addBtn).css('color',p.color);
			$('.'+options.addBtn+' i',sl).replaceWith('<i class="fa '+p.icon+'"></i>');
			
			if(p.class)
				$('.'+options.addBtn,sl).removeAttr('class').addClass(defaultsClass+' '+setclss)
		}	

		var getRowOptions = function(){
			return  options.templates.rowOptions;
		}

		var resetForm = function(fields,sl){
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
					$(f).trigger('change');

				}else if(fType == 'file'){
					$(f).parents('.input-group').find(':text').val('');
					$(f).val('');
				}else
					if(fType != 'link')
						$(f).val('').removeAttr('selected').removeAttr('checked');

				if(fType == 'select')
				 	$(f).trigger('change');

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
		}

		var customFieldsConfig = function(sl){
			//LINK FIELD
			sl.events.declare(["link-field-add"]);
			sl.events.on("link-field-add",function(o){
				return '<a href="'+o.value+'" class="link bClick" target="'+o.target+'">'+o.text+'</a>'
			},true);

			//FILE FIELD
			sl.events.declare(["file-field-add"]);
			sl.events.on("file-field-add",function(o){
				/*return $('input[name="'+o.name+'"]').clone(!0)
					.removeAttr('class id multiple required accept').attr('name',o.name+'_fk')
					.attr('value',o.value).hide();*/
				return '';
			},true);
		};

		var setEvents = function(sl){

			if($(sl).find('.splist-form').attr('validation-class') != 'false')
				getFormFields().addClass('no-validation');

			customFieldsConfig(sl);
			
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

				if(arr && arr[0]){
					
					arr.forEach(function(r){

						for(var o in r){
							var name   = 'p_'+o;
							var value = r[o];
							var f      = $('.splist-form [name="'+name+'"]',sl)[0];

							setFormFieldValue(f,value);		
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
			}
		}
		
		$.each(this,function(i,sl){
			sl.name     = $(sl).attr('tag');  
			sl.isDialog = $(sl).attr('dialog') == 'true' ? true : false;
			sl.events   = new 	$.EVENTS([
									"valid-row-add",
									"row-add",
									"row-remove",
									"row-edit",
									"dialog-open",
									"before-dialog-hide",
									"form-reset",
									"reset-all"
								]);




			setEvents(sl);
		
		});
	}
}

$.IGRP.on('init',function(){
	$('.IGRP-separatorlist').separatorList();
});
	