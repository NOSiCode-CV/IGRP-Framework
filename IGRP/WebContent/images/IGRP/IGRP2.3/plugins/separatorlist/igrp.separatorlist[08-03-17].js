jQuery(function($){
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
				
				var rowIndex   = $(sl).attr('row-index')*1;
				var rowId 	   = $(sl).attr('row-id') ? $(sl).attr('row-id') : '',
					isDialog   = sl.isDialog ? true : false,
					fieldsH    = isDialog ? $('.splist-form-holder',sl)[0] : sl,
					formFields = getFormFields(fieldsH),
					action     = $(sl).attr('row-action'),
					rowIndex   = $(sl).attr('row-index')*1,
					rowId 	   = $(sl).attr('row-id') ? $(sl).attr('row-id') : '',
					edition    = action == 'edit' ? true : false;
				
				var table    	= $(sl).find('.splist-table>table');
				var tableId     = table.attr('id');
				var row         = $('<tr><input type="hidden" class="sl-row-id" name="p_'+tableId+'_id" value="'+rowId+'"/></tr>');
				var contentsObj = {};

				for(var name in values){

					var object    = values[name];
					var value     = arrayValuesToString(object.value,',');
					var text      = arrayValuesToString(object.text,'; ');
					var tdHiddens = '<input type="hidden" name="'+name+'_fk_desc" value="'+text+'"/>';
					
					if(object.type != 'file'){
						tdHiddens += '<input type="hidden" name="'+name+'_fk" value="'+value+'"/>';
					}

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
							try{
								tdcontent = customfieldtmpl({
									name   : name,
									value  : value,
									text   : text,
									target : object.target
								});
								if(object.type == 'file'){
									if (value) {
										row.append(tdcontent);
										tdcontent = '<a href="'+value+'" class="link bClick" target="_blank">'+text+'</a>';
									} else
										tdcontent = '<input type="hidden" name="'+name+'_fk" value=""/>';
								}
							}catch(err){
								console.log(err);
							}
						}

						row.append('<td item-name="'+fieldName+'" field="'+fieldName+'" class="'+object.type+'">'+tdcontent+tdHiddens+'</td>');
					}else{
						row.append(tdHiddens);
					}
				}

				row.append(getRowOptions());

				if(edition)
					 $('tbody tr',table).eq(rowIndex).replaceWith(row);
				else
					$('tbody',table).append(row);

				resetForm(formFields,sl);

				sl.events.execute('row-add',{
					row:row,
					values:contentsObj
				});

				$(sl).removeAttr('row-action');
				$(sl).removeAttr('row-index');
				$(sl).removeAttr('row-id');
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
									if( $(f).val() == v )
										$(f).prop('checked',true);
								});
							else
								$(f).val(rowVal);
							
						if(ftype == 'select')
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
				}

				return rtn;
			}

			var editRow = function(sl,row){
				var isDialog = sl.isDialog;
				var fieldsH  = isDialog ? $('.splist-form-holder',sl)[0] : sl;
				var fields   = getFormFields(fieldsH);
				var tds      = $('td:not(.table-btn)',row)
				var values   = {};  

				resetForm(fields,sl);

				$(sl).attr('row-action','edit');
				$(sl).attr('row-index',$(row).index());
				$(sl).attr('row-id',$('.sl-row-id',row).val());

				$.each(fields,function(i,f){
					var fname  = $(f).attr('name');
					var rowFk  =  $('[name="'+fname+'_fk"]',row);
		
					if(rowFk[0]){
						var genType = $(f).parents('[item-type]').attr('item-type');
						var rowVal  = $.IGRP.utils.htmlEncode(rowFk.val());
				
						setFormFieldValue(f,rowVal);

						sl.events.execute(genType+'-field-edit',{
							field:$(f),
							value:rowVal,
							row  :row
						});

					}
				});

				setFormBtnIcon(sl,{
					icon :'fa-check',
					color:'#abc956'
				});

				$(row).addClass('row-active');
				
				if(sl.isDialog)
					openDialog(sl,true);
			}

			var removeRow = function(sl,row){
				if(!$(row).hasClass('row-active')){
					var sltag = $(sl).attr('tag');
					var rowId = $('.sl-row-id',row).val();
					
					if(rowId)
						$.IGRP.utils.createHidden({ name:"p_"+sltag+"_del",value:rowId });
					
					$(row).remove();
				}
			}

			var openDialog = function(sl,edit,reset){
				var content = $('<div class="dummy-form-slist"/>');
				var btnText = edit ? 'Editar' : 'Adicionar';

				if(!edit)
					resetForm(getFormFields(sl),sl);
				
				content.append($('.splist-form-holder',sl));

				$.IGRP.components.globalModal.set({
					title     :'',
					content   :content,
					rel       :'gen-rules-setter',
					operation :'appendTo',
					beforeHide:function(){	
						
						$(sl).removeAttr('row-action');
						$(sl).removeAttr('row-index');
						$(sl).removeAttr('row-id');

						$('.row-active',sl).removeClass('row-active');
						$('.splist-form-holder',content).prependTo(sl);
					},
					buttons:[
						{ text:btnText, class:'primary',onClick:function(e){ addRow(sl,e);return false; } },
						{ text:btnText+' e Fechar', class:'success',onClick:function(e){ if(addRow(sl,e))$.IGRP.components.globalModal.hide();return false;} }
					]
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
							values[fname].text.push(text);
						}
						//IS VISIBLE ON TABLE?
						values[fname].table = $('table th[item-name="'+frel+'"]',sl)[0] ? true : false;
						//FORM TYPE 
						values[fname].type  = gentype; 
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
				return str;
			}

			var getFieldTemplate = function(sl,type){
				return sl.events.getList()[type+'-field-add'] ? sl.events.getList()[type+'-field-add'][ sl.events.getList()[type+'-field-add'].length-1 ] : false;
			}

			var setFormBtnIcon = function(sl,p){
				$('.'+options.addBtn).css('color',p.color);
				$('.'+options.addBtn+' i').replaceWith('<i class="fa '+p.icon+'"></i>')
			}

			var getRowOptions = function(){
				return  options.templates.rowOptions;
			}

			var resetForm = function(fields,sl){
				//var sl  = fields.parents('.IGRP-separatorlist')[0];
				var form      = fields.parents('.splist-form');
				var isEdition = $(sl).attr('row-action') == 'edit' ? true : false;

				$.each(fields,function(i,f){
					var genType  = $(f).parents('[item-type]').attr('item-type');
					var fTag     = $(f).prop('tagName').toLowerCase();
					var fType    = fTag == 'select' || fTag == 'textarea' ? fTag : $(f).attr('type');
					
					if(fType == 'checkbox' || fType == 'radio')
						$(f).prop('checked',false);
					else if(fType == 'file'){
						$(f).parents('.input-group').find(':text').val('');
						$(f).val('');
					}
					else
						if(fType != 'link')
							$(f).val('').removeAttr('selected').removeAttr('checked');

					 if(fType == 'select')
					 	$(f).trigger('change');

					sl.events.execute(genType+'-field-reset',$(f));
				});


				form.find('.form-validator-label').remove();

				$('tbody tr',sl).removeClass('row-active');

				setFormBtnIcon(sl,{
					icon:'fa-plus',
					color:''
				});

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
					return $('input[name="'+o.name+'"]').clone(!0)
						.removeAttr('class').attr('name',o.name+'_fk')
						.removeAttr('id').attr('value',o.value)
						.removeAttr('multiple').hide();
				},true);
			};

			var setEvents = function(sl){

				if($(sl).find('.splist-form').attr('validation-class') != 'false')
					getFormFields().addClass('no-validation');

				customFieldsConfig(sl);
				
				$(sl).on('click','.'+options.addBtn,function(e){
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
									var _name = p.excludeNamePrefix ? itemName.substring(p.excludeNamePrefix.length) : itemName;
									row[_name]= $(input).val();
								}
							}

						});

						if(p.params)
							for(var pr in p.params){
								row[pr] = p.params[pr];
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
				sl.isDialog = $(sl).attr('dialog') == 'true' ? true : false;
				sl.events   = new $.EVENTS(["row-add","row-remove","row-edit","form-reset","reset-all"]);
				setEvents(sl);
			});
		}
	}
});

$(function(){
	$('.IGRP-separatorlist').separatorList();
});