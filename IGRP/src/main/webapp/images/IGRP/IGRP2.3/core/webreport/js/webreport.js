$(function ($) {
	if($){
		$.WR 				= {}; //Objeto W web R report
		// WR var file webreport.config
		$.WR.id 			= null;
		$.WR.hasCarts 		= false;
		$.WR.notCartsInclud = false;
		$.WR.title 			= null;
		$.WR.code 			= null;
		$.WR.newDocument 	= false;
		$.WR.isPreview 		= false;
		$.WR.dataSource 	= [];
		$.WR.keys 			= [];
		$.WR.dataSourcekeys = {};
		$.WR.objDataSource 	= $('#form_1_datasorce_app');
		$.WR.objApp 		= $('#form_1_env_fk');
		$.WR.app 			= $.WR.objApp[0] ? $.WR.objApp.val() : null;
		$.WR.pageUrl 		= $('#p_env_frm_url')[0] ? $('#p_env_frm_url').val() : window.location.href;

		$.WR.dataSourcekeys.datasources = [];
		
		$.WR.fieldDataSource = {
			urlChange:$('#p_link_source')[0] ? $('#p_link_source').val() : 'XXXX',
			onChange : function(){
				$.WR.objDataSource.on('change',function(){
					$.WR.dataSource = $(this).val();
					
					if($.WR.dataSource[0]){
						var param = '', 
							url   = $.IGRP.utils.getUrl($.WR.fieldDataSource.urlChange);
					
						$.WR.dataSource.forEach(function(e,i){
							param += i > 0 ? '&p_id='+e : 'p_id='+e;
						});

						url += param;
					

						if($.WR.app){
							if($.WR.id)
								url = $.IGRP.utils.getUrl(url)+'p_template_id='+$.WR.id;

							$.ajax({
								url   : url,
								error : function(e){
									$.IGRP.notify({
										message : 'Not Found',
										type	: 'danger'
									});
								},
								success : function(data){
									if(data){
										var url 	= $(data).find('fields link_add_source value').text(),
											loading = $('<div/>').addClass('loading loader'),
											tab 	= $('#tab-tabcontent_1-data_source');

										loading.appendTo(tab);

										$('#wr-list-datasource').XMLTransform({
											xsl : path+'/core/webreport/xsl/datasorce.tmpl.xsl',
											xml : $(data).getXMLDocument(),
											complete : function(c){												
												$(loading,tab).remove();
											},
											error 	 : function(c){
												$(loading,tab).remove();
											}
										});
									}
								}
							});
							$('.wr-editdatasource').addClass('active');
							$('.wr-newdatasource').addClass('active');
						}else{
							$('.wr-newdatasource').removeClass('active');
							$.IGRP.notify({
								message : 'Nenhuma Aplicação Selecionado!',
								type	: 'info'
							});
						}
					}else{
						$('#wr-list-datasource').html('');
					}
				});
			},
			setVal : function(data,selected){
				var option    = null,
					selected  = selected ? selected : [],
					activeEdit = false;

				if(data && data != undefined){

					$("option",$.WR.objDataSource).remove();

					data.find('option').each(function(i,e){
						var value = $(e).find("value").text();
						option = new Option(
							$(e).find("text").text(),
							value
						);

						if($(e).attr('selected')){
							option.selected = true;
							activeEdit		= true;
						}

						if(selected.length > 0){
							if ($.inArray(value,selected) != -1){
								option.selected = true;
							}
							activeEdit = true;
						}

						$($.WR.objDataSource).append(option);
					});

					if (activeEdit)
						$('.wr-editdatasource').addClass('active');
				}else
					$('.wr-editdatasource').removeClass('active');

				$.WR.objDataSource.trigger('change.select2');
			},
			getVal : function(){
				$.WR.dataSource = $.WR.objDataSource.val();

				return $.WR.dataSource;
			},
			reset : function(){
				$("option",$.WR.objDataSource).removeAttr('selected');
				$.WR.objDataSource.trigger('change.select2');
			},
			clear : function(){
				$("option",$.WR.objDataSource).remove();
				$.WR.objDataSource.trigger('change.select2');
			},
			new : function(){
				$('body').on('click','.wr-newdatasource',function(e){
					e.preventDefault();
					var url = $(this).attr('href');
					if(url){
				        $.IGRP.components.iframeNav.set({
				         	url       : url,
				          	beforeLoad: function(c){
				            	var modal = $($.IGRP.components.iframeNav.modal);
				            	$('.iframe-nav-close',modal).click(function(){
				            		$.ajax({
										url  	: $.WR.pageUrl,
										data 	: $.WR.objApp.serializeArray(),
										type 	: 'POST',
										success : function(data){
											if(data){
												var datasorceXml = $(data).find('fields datasorce_app list');
												$.WR.fieldDataSource.setVal(datasorceXml,$.WR.dataSource);
											}
										}
									});
				            	});
				          	}
				        });
				      }
					return false;
				});
			},
			edit : function(){
				$('body').on('click','.wr-editdatasource',function(e){
					e.preventDefault();
					var url 	= $(this).attr('href'),
						name 	= $.WR.objDataSource.attr('name');
					
					if($.WR.dataSource.length > 1){
						var content = '';
						$.WR.objDataSource.find("option:selected").each(function(i,e){
							content += WR.html.input({
								name  : name,
								size  : 12,
								type  : 'radio',
								value : $(e).val(),
								label : $(e).text()
							});
						});

						content = '<div class="row rw_datasorce_edit">'+content+'</div>';

						$.IGRP.components.globalModal.set({
							size 		: 'xs',
							content 	: content,
							title 		: 'Editar Data Source',
							buttons 	: [
								{
									class 	: 'success',
									icon  	: 'check',
									text  	: 'Confirmar',
									onClick : function(){
										$.IGRP.targets.modal.action({
											url  	: $.IGRP.utils.getUrl(url)+name+'='+$('.rw_datasorce_edit input[type="radio"]:checked').val(),
											clicked : $(this)
										});
										$.IGRP.components.globalModal.hide();
										return false;
									}
								},
								{
									class 	: 'danger',
									icon  	: 'times',
									text    : 'Cancelar',
									onClick : function(){
										$.IGRP.components.globalModal.hide();
										return false;	
									}
								}
							]	
						});

					}else{
						$.IGRP.targets.modal.action({
							url     : $.IGRP.utils.getUrl(url)+name+'='+$.WR.dataSource,
							clicked : $(this)
						});
					}

					return false;
				});
			},
			init : function(){
				$.WR.fieldDataSource.onChange();
				$.WR.fieldDataSource.getVal();
				$.WR.fieldDataSource.new();
				$.WR.fieldDataSource.edit();
			}
		};

		$.WR.fieldApp = {
			config  : function(){
				if($.WR.app && $.WR.app != undefined){
					$('.wr-newdocument').removeClass('hidden');
					$('#form_1_env_fk').next('.select2:first').removeClass('error');
				
					$.ajax({
						url   : $.WR.pageUrl,
						data  : $.WR.objApp.serializeArray(),
						type  : 'POST',
						error : function(e){
							$.IGRP.notify({
								message : 'Not Found',
								type	: 'danger'
							});
						},
						success : function(data){
							if(data){
								var datasorceXml = $(data).find('fields datasorce_app list'),
									url 		 = $(data).find('fields link_add_source value').text(),
									loading 	 = $('<div/>').addClass('loading loader'),
									tab 		 = $('#tab-tabcontent_1-reports');

								loading.appendTo(tab);

								$('#wr-list-document').XMLTransform({
									xsl 	 : path+'/core/webreport/xsl/reports.tmpl.xsl',
									xml 	 : $(data).getXMLDocument(),
									complete : function(c){
										$(loading,tab).remove();
										$.WR.document.info.show();
										if ($.WR.id)
											$('#list-reports #'+$.WR.id+' .linkReports').click();
									},
									error 	 : function(c){
										$(loading,tab).remove();
									}
								});

								if(url && url != undefined){
									$('.wr-op-datasource .btn').attr('href',url);
									$('.wr-newdatasource').addClass('active');
								}

								$.WR.fieldDataSource.setVal(datasorceXml);

								if(!$.WR.newDocument && $.WR.id){
									$.WR.editor.set.data({});
									$.WR.document.footer.custom.isActive(false);
								}
							}	
						}
					});
				}else{
					$('#wr-list-document').html('');
					$('.wr-newdocument').addClass('hidden');
					$.WR.fieldDataSource.clear();
					$.WR.objDataSource.trigger('change');
					$.WR.editor.set.data({});
				}
			},
			onChange:function(){
				$.WR.objApp.on('change',function(){
					$.WR.app = $(this).val();
					$.WR.fieldApp.config();
				});
			},
			init : function(){
				if ($.WR.objApp.val()) {
					$.WR.app = $.WR.objApp.val();
					$.WR.fieldApp.config();
				}

				$.WR.fieldApp.onChange();
			}	
		};

		$.WR.document = {
			modal : function(p){
				var option = '',
					wrls   = '',
					hasf   = '';
				WR.document.config.printsize.options.forEach(function(e,i){
					var sel = e.selected || '';
					option += '<option value="'+e.value+'" '+sel+'>'+e.text+'</option>';		
				});

				WR.document.config.layout.options.forEach(function(e,i){
					var sel = e.checked || '';
					wrls += '<div class="col-md-6 radio"><label><input class="radiolist" type="radio" name="'+WR.document.config.layout.name+'" value="'+e.value+'" '+sel+'/><span>'+e.text+'</span></label></div>';		
				});

				WR.document.config.footer.has.options.forEach(function(e,i){
					var sel = e.checked || '';
					hasf += '<div class="col-md-6 radio"><label><input class="radiolist" type="radio" name="'+WR.document.config.footer.has.name+'" value="'+e.value+'" '+sel+'/><span>'+e.text+'</span></label></div>';		
				});

				var content = '<div class="row reporttitle"><div class="col-md-12 form-group">'+
					'<div class="col-md-4"><label for="'+p.titleName+'">'+p.titleLabel+'</label></div>'+
					'<div class="col-md-8"><input name="'+p.titleName+'" type="text" class="form-control"/>'+
					'</div></div><div class="col-md-12 form-group">'+
					'<div class="col-md-4"><label for="'+p.codeName+'">'+p.codeLabel+'</label></div>'+
					'<div class="col-md-8"><input name="'+p.codeName+'" class="form-control" type="text"/></div></div>'+
					'<div class="col-md-12 form-group" id="ptsize"><div class="col-md-4">'+
					'<label for="'+WR.document.config.printsize.name+'">'+WR.document.config.printsize.label+'</label></div>'+
					'<div class="col-md-8"><select class="form-control" name="'+WR.document.config.printsize.name+'">'+
					option+'</select></div></div>'+
					'<div class="col-md-12 form-group radiolist clear"><div class="col-md-4">'+
						'<label for="'+WR.document.config.layout.name+'">'+WR.document.config.layout.label+'</label></div>'+
					'<div class="col-md-8">'+wrls+'</div></div>'+
					'<div class="col-md-12 form-group radiolist clear"><div class="col-md-4">'+
						'<label for="'+WR.document.config.footer.has.name+'">'+WR.document.config.footer.has.label+'</label></div>'+
					'<div class="col-md-8">'+hasf+'</div></div>'+
					/*'<div class="col-md-12 form-group"><div class="col-md-4">'+
						'<label for="'+WR.document.config.footer.custom.name+'">'+WR.document.config.footer.custom.label+'</label></div>'+
					'<div class="col-md-8"><input name="'+WR.document.config.footer.custom.name+'" type="checkbox"/></div></div>'+*/
					'</div>';

				$.IGRP.components.globalModal.set({
					size 		: 'xs',
					content 	: content,
					title 		: p.titleModal,
					beforeShow 	: function(){
						if($.WR.id){ // if edit
							$('input[name="'+p.titleName+'"]').val(p.title);
							$('input[name="'+p.codeName+'"]').val(p.code);
							$('#ptsize').addClass('hidden');
						}else
							$('#ptsize').removeClass('hidden');
					},
					buttons 	: [
						{
							class 	: 'success',
							icon  	: 'check',
							text  	: 'Confirmar',
							onClick : function(){
								var data = $('.reporttitle *:not([name="wr_printsize"])').serializeArray();

								data.forEach(function(e,i){
									if(e.name == p.codeName)
										$.WR.code = e.value;
									else if(e.name == p.titleName)
										$.WR.title = e.value;
								});

								if($.WR.title && $.WR.title != undefined){
									if(p.action != 'save'){
										
										$.WR.document.properties();

										if (p.action == 'edit') 
											data.push({name:'p_id',value:$.WR.id});

										$.WR.document.newOrEdit({
											url 	: p.url,
											data 	: data
										});
									}else{
										p.fields.push({name:p.titleName,value:$.WR.title});

										if($.WR.code && $.WR.code != undefined)
											p.fields.push({name:p.codeName,value:$.WR.code});

										//console.log(p.file);

										$.WR.document.save({
							        		url 	 : p.url,
							        		file 	 : p.file,
							        		fields 	 : p.fields,
							        		action   : 'modal'
							        	});
									}

									$.IGRP.components.globalModal.hide();
									
								}else{
									$('.reporttitle input[name="'+p.titleName+'"]').addClass('error');
								}
								return false;
							}
						},
						{
							class   : 'danger',
							icon    : 'times',
							text    : 'Cancelar',
							onClick : function(){
								$.IGRP.components.globalModal.hide();
								return false;	
							}
						}
					]
				});
			},
			info : {
				show : function(){
					var info = $('#wr-list-document .info');

					$('#wr-list-document').on('mouseenter','.infoReport',function(){
					var li  = $(this).parents('li.treeview:first'),
						top = li.position().top + 7;

						info.html(li.attr('info')).css({top:top}).addClass('active');
					});

					$('#wr-list-document').on('mouseleave','.infoReport',function(){
						info.removeClass('active');
						$('#wr-list-document li .infoReport i').attr('data-original-title', '').tooltip('hide');
					});
				},
				copy : function(){
					var copy = document.queryCommandSupported('copy');

					$('#wr-list-document').on('click','.infoReport',function(){
						var info = $(this).parents('li.treeview:first').attr('info');

						if (copy === true) {
							var objCopy = document.createElement("textarea");
							objCopy.value = info;
							document.body.appendChild(objCopy);
	    					objCopy.select();

	    					try {
						      var successful = document.execCommand('copy');
						      var msg = successful ? 'Copiado!' : 'Não Copiado!';
						      $('i',$(this)).attr('data-original-title', msg).tooltip('show');

						    } catch (err) {
						      console.log('Oops, unable to copy');
						    }

						    document.body.removeChild(objCopy);
						}else
							window.prompt("Copy to clipboard: Ctrl+C or Command+C, Enter", info);
					});
				}
			},
			print : {
				size : {
					get : function(){
						return $('select[name="'+WR.document.config.printsize.name+'"]').val() || $.WR.document.print.size.val || 'A4';
					},
					set : function(v){
						var selPrintSize = $('select[name="'+WR.document.config.printsize.name+'"]');
						$('option[selected]',selPrintSize).removeAttr('selected');
						$('option[value="'+v+'"]',selPrintSize).attr('selected','selected');
					}
				},
				layout : {
					get : function(){
						return $('input[name="'+WR.document.config.layout.name+'"]:checked').val() || $.WR.document.print.layout.val || 'P';
					},
					set : function(v){
						$('input[name="'+WR.document.config.layout.name+'"]').filter('[value="'+v+'"]').prop('checked',true);
					}
				}
			},
			footer : {
				custom : {
					isActive : function(type){
						var obj   = $('#footer-wr').parents('.box-wr'),
							input = $('input[name="'+WR.document.config.footer.custom.name+'"]');

						type ? obj.removeClass('hidden') : obj.addClass('hidden');
						input.attr('checked',type).prop('checked',type);
					},
					onClick : function(){
						$('body').on('change','input[name="'+WR.document.config.footer.custom.name+'"]',function(){
							$.WR.document.footer.custom.isActive($(this).is(':checked'));
						});
					},
					get : function(){
						return $('input[name="'+WR.document.config.footer.custom.name+'"]').is(':checked') || $.WR.document.footer.custom.val || 0;
					}
				},
				has : {
					get : function(){
						return $('input[name="'+WR.document.config.footer.has.name+'"]:checked').val() || $.WR.document.footer.has.val || 'Y';
					},
					set : function(v){
						$('input[name="'+WR.document.config.footer.has.name+'"]').filter('[value="'+v+'"]').prop('checked',true);
					}
				}
			},
			properties : function(){
				$.WR.document.print.size.val   	= $.WR.document.print.size.get();
				$.WR.document.print.layout.val 	= $.WR.document.print.layout.get();
				$.WR.document.footer.has.val   	= $.WR.document.footer.has.get();
				$.WR.document.footer.custom.val = $.WR.document.footer.custom.get();
			},
			newOrEdit : function(p){
				if($.WR.title && !$.WR.id){
					$('#igrp-app-title').html($.WR.title+' *');
					$.WR.newDocument = true;
					//add new documento editor
					//$.WR.editor.set.data(WR.document.new);
				}

				if($.WR.id && $.WR.title){// if edit
					$.ajax({
						url   : p.url,
						data  : p.data,
						type  : 'POST',
						error : function(e){
							$.IGRP.notify({
								message : 'Not Found',
								type	: 'danger'
							});
						},
						success : function(e,s,r){
							var xml 	= $(e).find('messages message'),
								type 	= xml.attr('type') || 'danger',
								message = xml.text() || 'Erro';

							type = type == 'error' ? 'danger' : type;

							$.IGRP.notify({
								message : $.IGRP.utils.htmlDecode(message),
								type	: type
							});

							if(type == 'success'){
								var obj = $('#list-reports li#'+$.WR.id);
								obj.attr('code',$.WR.code);
								$('span',obj).html($.WR.title);
								$('#igrp-app-title').html($.WR.title);
							}
						}
					});
				}
			},
			new : function(){
				$('body').on('click','.wr-newdocument',function(){
					$.WR.id = null;
					$.WR.document.modal({
						titleName  : wr_nameInputTitle,
						titleLabel : wr_labelTitle,
						codeName   : wr_nameInputCode,
						codeLabel  : wr_labelCode,
						titleModal : wr_newDocumentTitle,
						action 	   : 'new'
					});
				});
			},
			edit : function(){
				$('body').on('click','.editReport',function(){
					var parent 	= $(this).parents('li:first');
					$.WR.id 	= parent.attr('id');

					$('a.linkReports',parent).trigger('click');

					$.WR.document.modal({
						titleName	: wr_nameInputTitle,
						titleLabel 	: wr_labelTitle,
						codeName   	: wr_nameInputCode,
						codeLabel  	: wr_labelCode,
						titleModal 	: $(this).attr('title')+' '+wr_newDocumentTitle,
						title 		: $('span',parent).text(),
						code 		: parent.attr('code'),
						url 		: $('#p_edit_name_report').val(),
						action 	    : 'edit'
					});
				});
			},
			onLoad : function(url){
				
				$.ajax({
					url   : url,
					error : function(e){
						$.IGRP.notify({
							message : 'Not Found',
							type	: 'danger'
						});
					},
					success : function(data){
						if(data){
							$('#list-reports li').removeClass('active');
							$(this).addClass('active');

							$('#igrp-app-title').html($.WR.reportTitle);

							//data = $.parseJSON(data.responseText.replace(/\s+/g," "));

							$.WR.document.convert2Do(data.textreport);

							if($.WR.objDataSource[0]){
								
								if(data.datasorce_app){
									
									$.WR.datasorce = data.datasorce_app.split(',');
									$.WR.objDataSource.find("option").removeAttr("selected");

									$.WR.objDataSource.find("option").each(function(i,e){
										if($.inArray($(e).val(),$.WR.datasorce) != -1)
											$(e).attr("selected","selected").prop('selected',true);
									});

								}else
									$.WR.objDataSource.find("option").removeAttr("selected");

								$.WR.objDataSource.trigger('change');
							}
						}
					}
				});
			},
			onClick : function(){
				$('body').on('click','.linkReports',function(){
					var parent 		 = $(this).parents('li:first');

					$.WR.id 		 = parent.attr('id');
					$.WR.reportTitle = $('span',parent).text();

					$.WR.document.onLoad(parent.attr('rel'));
				});
			},
			save   : function(p){

				$.WR.document.properties();

				var size  = $.WR.document.print.size.val,
					lsize = $.WR.document.print.layout.val,
					WRLS  = WR.document.config.pagesize[size],
					WRLH  = lsize == 'L' ? WRLS.w : WRLS.h;

				size = lsize == 'L' ? size+lsize : size;
				WRLS = lsize == 'L' ? WRLS.h+' '+WRLS.w : WRLS.w+' '+WRLS.h;
				WRLH = WRLH.replace(/mm/g,'');
				/* files save */

				var files 		= {},
					head 		= WR.document.includ.css.all, /*WR.document.includ.head+*/
					includJs 	= WR.document.includ.js.all,
					includTmpl 	= ''; //WR.document.includ.tmpl.defoult

						
				if ($.WR.hasCarts && !$.WR.notCartsInclud) {
					head 		+= WR.document.includ.css.chart;
					includJs 	+= WR.document.includ.js.chart;
					includTmpl 	+= WR.document.includ.tmpl.chart;

					$.WR.notCartsInclud = true;
				}

				files.text = JSON.stringify($.WR.editor.structures.text());

				files.xsl  = WR.document.xsl.init+head+
					WR.document.xsl.body.replace(/=:WRLS:=/g,WRLS)+
					$.WR.element.filter().replace(/=:WRPS:=/g,size).replace(/=:WRPH:=/g,WRLH)+includJs+
					WR.document.xsl.endbody+includTmpl+
					WR.document.xsl.end;

				p.file.push({name : 'p_xslreport', value  : files.xsl});
				p.file.push({name : 'p_textreport', value : files.text});

				$.IGRP.utils.submitStringAsFile({
		      		pUrl    	: p.url,
		      		pParam 		: {
			        	pArrayFiles : p.file,
			        	pArrayItem  : p.fields
		      		},
		      		pComplete 	: function(rq){
		      			$.WR.keys = [];
		      			$.WR.dataSourcekeys.datasources = [];
		      			if (rq.status == 200) {
			      			if((p.action && p.action == 'modal') || $.WR.newDocument){
			      				if ($.WR.newDocument)
			      					$.WR.newDocument = false;

			      				$('#igrp-app-title').html($.WR.title);
			      				$.WR.objApp.change();
			      				$.WR.id	= $($.parseXML(rq.response)).find('report_id').text();
			      			}

			      			/*if($.WR.isPreview){
			      				$.WR.isPreview = false;
			      				$('a[target="alert_submit"]').click();
			      			}*/
		      			}
		         	}
			   	});
			},
			onSave : function(){
				$.IGRP.targets['submit'].action = function(p){
					if($.WR.app != null){
						var saveDoc 	= {};

						saveDoc.file 	= [];
						saveDoc.fields  = [];

						saveDoc.fields.push({name:'p_env_fk',value:$.WR.app}); // add app id
						//console.log($.WR.element.filter());

						if($.WR.dataSource){//get id datasource
							$.WR.dataSource.forEach(function(e,i){
				              saveDoc.fields.push({name:'p_datasorce_app',value:e});
				            });
						}

						$('#datasorce .btn input:checked').each(function(ikey,ekey){// get key
				          	var val  = $(ekey).val(),
				          	dk    	 = $(ekey).parents('li[data-source-id]').attr('data-source-id'),
				          	javaType = $(ekey).attr('java-type');

				          	//if ($.inArray(val,$.WR.keys) == -1) {
				          	
				            	//saveDoc.fields.push({name:'p_key',value:val});

				            	$.WR.keys.push(val);

				            	var found = -1;

								$.WR.dataSourcekeys.datasources.forEach(function(arr,idarr){
							  		if(arr.id == dk)
							  			found = idarr;
								});

				            	if(found >= 0){
							  		$.WR.dataSourcekeys.datasources[found].parameters.push({
				            			name : val,
				            			type : javaType
				            		});

								}else{
									$.WR.dataSourcekeys.datasources.push({
						            	id : dk,
						            	parameters : [{
						            		name : val,
						            		type : javaType
						            	}]
						            });
								}
				          	//}
				        });

				        if ($.WR.dataSourcekeys.datasources[0])
				        	saveDoc.fields.push({name:'p_datasourcekeys',value:JSON.stringify($.WR.dataSourcekeys.datasources)});
				        	

				        try{// get param url
				          if(p.url.indexOf("?")>-1){
				            var param = p.url.substring(vUrl.indexOf("?")+1),
				              p = param.split("&");
				            for(var i=0; i < p.length; i++){
				              var p1 = p[i].split("=");
				              saveDoc.fields.push({name:p1[0],value:p1[1]});
				            }
				          }
				        }catch(e){null;}

				        if ($.WR.id && $.WR.id != undefined) {
				        	saveDoc.fields.push({name:'p_id',value:$.WR.id});

				        	$.WR.document.save({
				        		url 	: p.url,
				        		file 	: saveDoc.file,
				        		fields 	: saveDoc.fields
				        	});
				        } else {
				        	if ($.WR.title && $.WR.title != undefined) {
				        		saveDoc.fields.push({name : wr_nameInputTitle, value : $.WR.title});

				        		if($.WR.code && $.WR.code != undefined)
				        			saveDoc.fields.push({name : wr_nameInputCode, value : $.WR.code});

				        		$.WR.document.save({
				        			url 	: p.url,
				        			file 	: saveDoc.file,
				        			fields 	: saveDoc.fields
				        		});
				        	} else {

				        		$.WR.document.modal({
									titleName  	: wr_nameInputTitle,
									titleLabel 	: wr_labelTitle,
									codeName   	: wr_nameInputCode,
									codeLabel  	: wr_labelCode,
									titleModal 	: wr_newDocumentTitle,
									action 		: 'save',
									file 		: saveDoc.file,
									fields 		: saveDoc.fields,
									url 		: p.url
								});
				        	}
				        }
				    }else{
				    	$('#form_1_env_fk').next('.select2:first').addClass('error');
				    }
					return false;
				}
			},
			onPreview : function(){
				$.IGRP.targets['alert_submit'].action = function(p){
					if ($.WR.id && $.WR.id != '') {
						$.WR.keys = [];
						var url 	= $.IGRP.utils.getUrl(p.url)+'p_rep_id='+$.WR.id,
							content = '<div class="row reporttitle">';

						$('#datasorce .btn input:checked').each(function(ikey,ekey){// get key
				          	if ($.inArray($(ekey).val(),$.WR.keys) == -1) {
				            	content +='<div class="col-md-12 form-group">'+
								'<div class="col-md-4"><label for="'+$(ekey).attr('name')+'">'+$(ekey).attr('label').capitalizeFirstLetter()+'</label></div>'+
								'<div class="col-md-8"><input name="'+$(ekey).attr('name')+'" type="text" class="form-control"/>'+
								'</div></div>';
				            	$.WR.keys.push($(ekey).val());
				          	}
				        });
				        content +='</div>';

				        if ($.WR.keys.length > 0) {

				        	$.IGRP.components.globalModal.set({
								size 		: 'xs',
								content 	: content,
								title 		: wr_dialogKeysTitle,
								buttons 	: [
									{
										class 	: 'success',
										icon  	: 'check',
										text  	: 'Confirmar',
										onClick : function(){
											var data = $('.reporttitle *').serializeArray(),
												keys = {};

											keys.value 	= '';
											keys.name 	= '';

											data.forEach(function(e,i){
												if(e.value && e.value != undefined){
													if(i > 0){
														keys.value +='&';
														keys.name +='&'; 
													}

													keys.value +='value_array='+e.value;
													keys.name +='name_array='+e.name;
												}
											});

											if(keys.name && keys.name != undefined){
												url += '&'+keys.name+'&'+keys.value;
											}

											$.IGRP.targets.modal.action({
												url:url
											});
											
											$.IGRP.components.globalModal.hide();
											return false;
										}
									},
									{
										class 	: 'danger',
										icon  	: 'times',
										text    : 'Cancelar',
										onClick : function(){
											$.IGRP.components.globalModal.hide();
											return false;	
										}
									}
								]
							});

				        } else {
				        	$.IGRP.targets.modal.action({
								url:url
							});
				        }
					} else {
						//$.WR.isPreview = true;
						//$('a[target="submit"]').click();

						$.IGRP.notify({
							message : 'Documento não foi gravado!!',
							type	: 'info'
						});
					}
					return false;
				}
			},
			convert2Do : function(p){
				var isActive  = false,
					content   = '',
					printsize = 'A4',
					hasfooter = 1,
					layout    = WR.document.config.pagesize[printsize];

				if(p){
					if (!p.content) {
						content = {};

						var report = $(p.content);

						content.head   = report.find('#header').html();
						content.body   = report.find('#content').html();
						content.footer = report.find('#footer').html();
					}else{
						isActive  = p.config.customfooter;
						content   = p.content;
						printsize = p.config.printsize  && p.config.printsize != undefined ? p.config.printsize : printsize;
						layout 	  = p.config.layout  && p.config.layout != undefined ? p.config.layout : layout;
						hasfooter = p.config.hasfooter  && p.config.hasfooter != undefined ? p.config.hasfooter : hasfooter;
					}
				}

				$.WR.document.print.size.set(printsize);

				$.WR.document.print.layout.set(layout);

				$.WR.document.footer.has.set(hasfooter);

				$.WR.document.footer.custom.isActive(isActive);
				
				$.WR.editor.set.data(content);
			},
			init : function(){
				$.WR.document.new();
				$.WR.document.edit();
				$.WR.document.onClick();
				$.WR.document.onSave();
				$.WR.document.onPreview();
				$.WR.document.footer.custom.onClick();
				$.WR.document.info.show();
				$.WR.document.info.copy();
			}
		};

		$.WR.element = {
			modal : function(p){
				var content = '<div class="row">';

				WR.listType.forEach(function(e,i){
					content += WR.html.input({
						name  : 'listtype',
						type  : 'radio',
						value : e.type,
						icon  : e.icon
					});
				});

				content +='</div><div class="row hidden" id="table-group">'+
					'<div class="col-md-12">'+
						WR.html.separator('Agrupar por')+
						'<div class="row" id="list-group">';

				WR.listGroup.forEach(function(e,i){
					content += WR.html.input({
						name  : 'grouplist',
						type  : 'radio',
						value : e.value,
						label : e.label
					});
				});

				content +='</div>'+WR.html.separator('Definir Chaves')+
					'<div class="row" id="listcol"></div>'+
					'<div class="hidden" id="html-group">'+
						WR.html.separator('Html Groupo')+
					'<div class="row">';

				WR.listType.forEach(function(e,i){
					content += WR.html.input({
						name  : 'reslisttype',
						type  : 'radio',
						value : e.type,
						icon  : e.icon
					});
				});

				content += '</div></div></div>';

				$.IGRP.components.globalModal.set({
					size 	: 'xs',
					content : content,
					title 	: 'List Type',
					buttons : [
						{
							class 	: 'success',
							icon  	: 'check',
							text  	: 'Confirmar',
							onClick : function(){
								var tag 		= $('.wr-listtype input:checked').val(),
									group 		= $('#list-group input:checked').val(),
									grouphtml 	= $('#html-group input:checked').val(),
									list 		= tag != 'table' ? 'ulol' : 'table';
								
								p.tag = tag;

								if (tag == 'table') {
									p.group     = group || '';
									p.grouphtml = grouphtml || '';
									p.colgroup  = $.WR.element.colGroup.get() || '';
								}

								var html = $.WR.element.list[list](p);
								$.WR.editor.set.html(html);
								$.IGRP.components.globalModal.hide();

								return false;
							}
						},
						{
							class 	: 'danger',
							icon  	: 'times',
							text    : 'Cancelar',
							onClick : function(){
								$.IGRP.components.globalModal.hide();
								return false;	
							}
						}
					]
				});

				$.WR.element.colGroup.set(p.list);
			},
			colGroup : {
				set : function(c){
					var col = '';
					c.forEach(function(e,i){
						col += WR.html.input({
							name  : 'colgrouplist',
							type  : 'checkbox',
							size  : 3,
							value : e.tag,
							label : e.label
						});
					});
					$('#listcol').html(col);
				},
				get : function(){
					var col = '';
					$('#listcol input:checked').each(function(i,e){
						if (i > 0)
							col += ',';

						col += $(this).val();
					});

					return col;
				}
			},
			list : {
				table 	: function(p){
					var group 		= p.group ? 'group = "'+p.group+'"' : '',
						grouplist 	= p.colgroup ? 'colgroup = "'+p.colgroup+'"' : '',
						grouphtml 	= p.grouphtml ? 'grouphtml = "'+p.grouphtml+'"': '',
						tabel 		= '<table no="'+p.parentTag+'" '+grouphtml+' '+grouplist+' '+group+' pos="'+p.parentPos+'" class="table table-striped gen-data-table"><thead><tr>',
						td 			= '',
						th  		= '';

				    p.list.forEach(function(e,i){
				      th += '<th tag="'+e.tag+'">'+e.label+'</th>';
				      td += '<td tag="'+e.tag+'">Text '+(i+1)+'</td>';
				    });

				    tabel += th+'</tr></thead></tbody><tr>';
				    tabel += td+'</tr></tbody></table>';

					return tabel;
				},
				ulol : function(p){
					var obj = '<'+p.tag+' no="'+p.parentTag+'" pos="'+p.parentPos+'">',
						li  = '';

					p.list.forEach(function(e,i){
				      li += '<li tag="'+e.tag+'">'+e.label+'</li>';
				    });

				    obj += li+'</'+p.tag+'>';
					return obj;
				}
			},
			onCheckListType : function(){
				$('body').on('change','.wr-listtype input',function(e,i){
					if($(this).val() == 'table'){
				        $('#table-group').removeClass('hidden');
				    }else{
				       $('#table-group input:checked').removeAttr('checked');
				       $('#table-group').addClass('hidden');
				    }
				});

				$('body').on('change','#list-group input[name="grouplist"]',function(){
					var val = $(this).val();
					if(val == ''){
						$('#listcol input:checked').removeAttr('checked');
						$('#html-group').addClass('hidden');
					}else if(val == 'col'){
						$('#html-group input:checked').removeAttr('checked');
						$('#html-group').addClass('hidden');
					}else
						$('#html-group').removeClass('hidden');
				});
			},
			type : {
				table	: function(p){
					console.log(p);
					$.WR.element.modal(p);
					return null;
				},
				image	: function(p){
					return '<img src="'+path+'/assets/img/iconApp/default.png" pos="'+p.parentPos+'" no="'+p.parentTag+'" tag="'+p.tag+'" style="height:80px; margin:5px; width:80px"/>';
				},
				chart	: function(p){
					var transCharts = $('#transfome');
					$.ajax({
						url     : $.IGRP.utils.getPageUrl(),
						success : function(data){
						
							$('.charts',transCharts).XMLTransform({
								xsl 		: path+'/xsl/tmpl/IGRP-charts.tmpl.xsl',
								xml 		: $(data).find('rows content '+p.tag).getXMLDocument(),
								xslParams 	: {pheight:250},
								complete 	: function(e,c){
									$.WR.hasCarts 		= true;
									var chart 			= $('div[chart-id="id-'+p.tag+'"]'),
										renderCharts 	= $.IGRP.components.charts.renderCharts({
											chart : chart
										});

									if(p.type != 'tablecharts'){
										$('g.highcharts-button',chart).remove();
						                $('.highcharts-credits',chart).remove();

										setTimeout(function(){
											//contenteditable="false"
						                	var html = '<span  key="'+p.iskey+'" type="'+p.type+'" tag="'+p.tag+'" no="'+p.parentTag+'" pos="'+p.parentPos+'">'+renderCharts.getSVG()+'</span>';
						                	$.WR.editor.set.html(html);
						                	
							            },1000);
						            }
								},
								error		: function(c){
									$.IGRP.notify({
										message : 'Error Transforming Component',
										type    : 'warning'
									});
								}
							});
						}
					});

					return null;
				},
				form : function(p){
					return '<span key="'+p.iskey+'" type="'+p.type+'" tag="'+p.tag+'" no="'+p.parentTag+'" pos="'+p.parentPos+'">'+p.label+'</span>';
				}
			},
			getStyle : function(e){
				return e.attributes.style && e.attributes.style != undefined ? ' style="'+e.attributes.style+'" ' : '';
			},
			template : {
				table : function(p){
					var table = '';

					switch(p.group.toLowerCase()){
						case 'row':// caso row
							var path = p.cond ? p.path+'['+p.cond+']' : p.path,
								td 	 = '',
								th   = '',
								tdg  = '',
								thg  = '',
								vars = ''; 

							p.td.item.forEach(function(e,i){
								var tag = p.grouphtml && p.grouphtml != 'table' ? 'li' : 'td';

								td += '<'+tag+' '+e.style+'>'+
									'<xsl:value-of select="'+e.value+'" disable-output-escaping="yes"/>'+
								'</'+tag+'>';

								th += '<th '+e.th.style+'>'+e.th.value+'</th>';
							});

							if (p.td.group[0]) {
								p.td.group.forEach(function(e,i){
									var value = e.value;
									thg += '<th '+e.th.style+'>'+e.th.value+'</th>';

									if (p.grouphtml && p.grouphtml != 'table'){
										tdg += '<td '+e.style+'>'+
											'<div class="row separator">'+
												'<xsl:value-of select="'+value+'" disable-output-escaping="yes"/>'+
											'</div>'+
											'<'+p.grouphtml+'>'+
												'<xsl:for-each select="//'+p.path+'[$v'+value+' = '+value+']">'+
													td+
												'</xsl:for-each>'+
											'</'+p.grouphtml+'>'+
										'</td>';
									}else{
										tdg += '<td '+e.style+'>'+
											'<xsl:value-of select="'+value+'" disable-output-escaping="yes"/>'+
										'</td>';
										
										if (i > 0) 
											vars += ' and ';

										vars += '$v'+value+' = '+value;
									}
								});

								var grouphtml = '';

								if (p.grouphtml && p.grouphtml == 'table') {
									grouphtml = '<tr><td colspan="'+p.td.group.length+'">'+
										'<table><thead><tr>'+th+'</tr></thead>'+
										'<tbody>'+
											'<xsl:for-each select="//'+p.path+'['+vars+']">'+
												'<tr>'+td+'</tr>'+
											'</xsl:for-each>'+
										'</tbody></table>'+
									'</td></tr>';
								}

								table = '<thead><tr>'+thg+'</tr></thead>'+
								'<tbody>'+
									'<xsl:for-each select="'+path+'">'+
										p.vars+
										'<tr>'+tdg+'</tr>'+
										grouphtml+
									'</xsl:for-each>'+
								'</tbody>';

							}else{
								table = '<thead>'+p.thead+'</thead>'+
								'<tbody>'+
									'<xsl:for-each select="'+path+'">'+
										'<tr>'+td+'</tr>'+
									'</xsl:for-each>'+
								'</tbody>';
							}

						break;
						default:
							var td = '',
								th = '';

							p.td.item.forEach(function(e,i){
								td += '<td '+e.style+'><xsl:value-of select="'+e.value+'" disable-output-escaping="yes"/></td>'
								//th += '<th '+e.th.style+'>'+e.th.value+'</th>';
							});

							table = '<thead>'+p.thead+'</thead>'+
							'<tbody>'+
								'<xsl:for-each select="'+p.path+'">'+
									'<tr>'+td+'</tr>'+
								'</xsl:for-each>'+
							'</tbody>';

						break;
					}

					if(p.tfoot != null)
						table += p.tfoot;

					return table;
				}
			},
			filter : function(){
				var filter = new CKEDITOR.htmlParser.filter({
			      	text: function(value) {
			        	return value;
			    	},
			    	elements:{
			    		span : function(element){
			    			var span  = {};
			    			span.tag  = element.attributes.tag || element.attributes.tag;
			    			span.pos  = element.attributes.pos;
			    			span.no   = element.attributes.no;
			    			span.key  = element.attributes.key;
			    			span.type = element.attributes.type;

			    			if (span.tag && span.tag != undefined) {
			    				var pos 	= '['+$.WR.utils.getContentPositon(span.pos)+']',
			    					path 	= 'rows/content'+pos+'/'+span.no+'/fields/'+span.tag+'/value';
			    				
			    				if (element.attributes.footer) 
			    					path = 'rows/'+span.no+'/'+span.tag;

			    				span.element = '<xsl:value-of select="'+path+'"/>';
			    				
			    				if(span.type == 'chart'){

			    					span.element  = '<div class="box-body"><xsl:call-template name="igrp-graph">'+
		                                '<xsl:with-param name="table" select="rows/content'+pos+'/'+span.tag+'"/>'+
		                                '<xsl:with-param name="chart_type" select="rows/content'+pos+'/'+span.tag+'/chart_type"/>'+
		                                '<xsl:with-param name="height" select="rows/content'+pos+'/'+span.tag+'/height"/>'+
		                                '<xsl:with-param name="title" select="rows/content'+pos+'/'+span.tag+'/caption"/>'+
		                            '</xsl:call-template></div>';

			    				} else if(span.type == 'select'){
			    					span.element = '<xsl:value-of select="rows/content'+pos+'/'+span.no+'/fields/'+span.tag+'/list/option[@selected='+"'"+'true'+"'"+']/text"/>';
			    				}

			    				element.setHtml(span.element);

			    				delete element.attributes.tag;
			    				delete element.attributes.rel;
				    			delete element.attributes.pos;
				    			delete element.attributes.no;
				    			delete element.attributes.key;
				    			delete element.attributes.type;
				    			delete element.attributes.footer;
			    			}
			    		},
			    		table : function(element){
			    			
			    			var html 		= $(element.getHtml()),
			    				hasTfoot 	= html.filter('tfoot'),
			    				table  		= {},
			    				colgroup 	= element.attributes.colgroup || element.attributes.groupcolitem;
			    			
			    			table.pos  		= element.attributes.pos;
			    			table.no   		= element.attributes.no || element.attributes.rel;
			    			table.group 	= element.attributes.group || '';
			    			table.grouphtml = element.attributes.grouphtml || '';
			    			table.vars 		= '';
			    			table.cond 		= '';
			    			table.colgroup 	= colgroup ? colgroup.split(',') : [];
			    			table.thead 	= element.children[0].getHtml();
			    			table.footer 	= hasTfoot[0] ? hasTfoot.html() : null;

			    			if(table.no && table.no != undefined){
			    				var th   		= [],
			    				idx  			= 0,
			    				index 			= 0;
			    				table.td   		= {};
			    				table.td.group 	= [];
			    				table.td.item  	= [];

			    				var path = 'rows/content['+$.WR.utils.getContentPositon(table.pos)+']/'+table.no+'/table/value/row';

			    				element.forEach(function(node){
			    					var notTfoot = node.parent.parent.name != 'tfoot';

			    					if(node.name == 'th' && notTfoot){

			    						//table.th +='<th '+$.WR.element.getStyle(node)+'>'+node.getHtml().capitalizeFirstLetter()+'</th>'
			    						th.push({
			    							value : node.getHtml().capitalizeFirstLetter(),
			    							style : $.WR.element.getStyle(node)
			    						});
			    					}

			    					if(node.name == 'td' && notTfoot){
			    						//table.element.value = node.getHtml().replace(/&nbsp;/g, " ").replace(/\s+/g," ");
			    						var tag   = node.attributes.tag || node.attributes.rel;

			    						if(tag && tag != undefined){
			    							var value = tag,
			    								style = $.WR.element.getStyle(node);

			    							if ($.inArray(tag,table.colgroup) != -1){
		    									if (table.group == 'col'){
		    										value += '[not(.=preceding::*)]';

		    										table.td.item.push({
		    											style : style,
		    											value : value,
		    											th    : th[index]
		    										});
		    									}
		    									else{
		    										if (idx > 0)
		    											table.cond += ' or ';

		    										table.cond += 'not('+tag+'=preceding::'+tag+')';
		    										table.vars += '<xsl:variable name="v'+tag+'" select="'+tag+'"/>';
		    										idx ++;

		    										table.td.group.push({
		    											style : style,
		    											value : value,
		    											th    : th[index]
		    										});
		    									}
		    								}
		    								else{
		    									table.td.item.push({
		    										style : style,
		    										value : value,
		    										th    : th[index]
		    									});
			    								//table.element.td +='<td '+style+'><xsl:value-of select="'+value+'" disable-output-escaping="yes"/></td>';
		    								}
			    						}
			    						index ++;
			    					}
			    					
			    				});

			    				idx = 0;
			    				table.path = path;

			    				var value = $.WR.element.template['table'](table);

			    				element.setHtml(value);

			    				delete element.attributes.pos;
				    			delete element.attributes.no;
				    			delete element.attributes.rel;
				    			delete element.attributes.group;
				    			delete element.attributes.colgroup;
				    			delete element.attributes.grouphtml;
			    			}
			    		},
			    		ul : function(element){
			    			var ul  = {};
			    			
			    			ul.pos  = element.attributes.pos;
			    			ul.no   = element.attributes.no || element.attributes.rel;

			    			ul.element = '';

			    			if (ul.no && ul.no != undefined) {
			    				element.forEach(function(node){
			    					if (node.name == 'li'){
			    						var tag = node.attributes.tag || node.attributes.rel;
			    						ul.element += '<li '+$.WR.element.getStyle(node)+'><xsl:value-of select="'+tag+'"/></li>';
			    					}
			    				});

			    				element.setHtml('<xsl:for-each select="rows/content['+$.WR.utils.getContentPositon(ul.pos)+']/'+ul.no+'/table/value/row">'+ul.element+'</xsl:for-each>');
			    				
			    				delete element.attributes.pos;
				    			delete element.attributes.no;
				    			delete element.attributes.rel;
			    			}
			    		},
			    		ol : function(element){
			    			var ol  = {};
			    			
			    			ol.pos  = element.attributes.pos;
			    			ol.no   = element.attributes.no || element.attributes.rel;

			    			ol.element = '';

			    			if (ol.no && ol.no != undefined) {
			    				element.forEach(function(node){
			    					if (node.name == 'li'){
			    						var tag = node.attributes.tag || node.attributes.rel;
			    						ol.element += '<li '+$.WR.element.getStyle(node)+'><xsl:value-of select="'+tag+'"/></li>';
			    					}
			    				});

			    				element.setHtml('<xsl:for-each select="rows/content['+$.WR.utils.getContentPositon(ol.pos)+']/'+ol.no+'/table/value/row">'+ol.element+'</xsl:for-each>');
			    				
			    				delete element.attributes.pos;
				    			delete element.attributes.no;
				    			delete element.attributes.rel;
			    			}
			    		},
			    		img : function(element){
			    			var img  = {};
			    			
			    			img.tag  = element.attributes.tag || element.attributes.rel;
			    			img.pos  = element.attributes.pos;
			    			img.no   = element.attributes.no;

			    			if (img.tag && img.tag != undefined) {

			    				element.attributes.src ='{rows/content['+$.WR.utils.getContentPositon(img.pos)+']/'+img.no+'/fields/'+img.tag+'/value}';
			    			
			    				delete element.attributes.tag;
				    			delete element.attributes.pos;
				    			delete element.attributes.no;
				    			delete element.attributes.rel;
				    		}
			    		}
			    	}
			    });

				var fragment = CKEDITOR.htmlParser.fragment.fromHtml($.WR.editor.structures.html()),
			    	writer 	 = new CKEDITOR.htmlParser.basicWriter();

			    filter.applyTo( fragment );
			    fragment.writeHtml( writer );

			    return writer.getHtml();
			}
		};

		$.WR.editor = {
			get : function(id){
				return CKEDITOR.instances[id];
			},
			getData : function(){
				var editor = {};
				$('.editor').each(function(){
					editor[$(this).attr('name')] = CKEDITOR.instances[$(this).attr('id')].getData();
				});

				return editor;
			},
			set : {
				data : function(v){
					$('.editor').each(function(){
						CKEDITOR.instances[$(this).attr('id')].setData(v[$(this).attr('name')]);
					});
					//$.WR.texteditor.setData(v);
				},
				html : function(v){
					$.WR.texteditor.insertHtml(v);
				}
			},
			structures : {
				text : function(){
					var structure  = {},
						data 	   = $.WR.editor.getData();

					structure.config  			  = {};
					structure.config.printsize 	  = $.WR.document.print.size.val;
					structure.config.layout 	  = $.WR.document.print.layout.val;
					structure.config.customfooter = $.WR.document.footer.custom.val;
					structure.config.hasfooter 	  = $.WR.document.footer.has.val;

					structure.content 		 = {};
					structure.content.head 	 = $.trim(data.head.replace(/"/g, "'").replace(/\s+/g," "));
					structure.content.body 	 = $.trim(data.body.replace(/"/g, "'").replace(/\s+/g," "));
					structure.content.footer = $.WR.document.footer.has.val == 'Y' ? $.trim(data.footer.replace(/"/g, "'").replace(/\s+/g," ")) : "";
					
					return structure;
				},
				html : function(){
					var data = $.WR.editor.getData(),
						html = '<div class="page" hasfooter="'+$.WR.document.footer.has.val+'" size="=:WRPS:=" height="=:WRPH:=" layout="'+$.WR.document.print.layout.val+'"><div id="header">';

					html += data.head+'</div>';
					html += '<div id="content"><div class="holder">'+data.body+'</div></div>';

					if ($.WR.document.footer.has.val == 'Y'){
						var footer = data.footer ? data.footer : WR.document.config.footer.custom.value;
						html += '<footer></footer><div id="footer">'+footer+'</div>';
					}

					html += '</div>';
					
					return html;
				}
			},
			instanceReady : function(){
				CKEDITOR.on( 'instanceReady', function(ev) {

					if(ev.editor.name === 'footer-wr')
						$.WR.editor.get(ev.editor.name).setData(WR.document.config.footer.custom.value);

					ev.editor.on('focus',function(fc){
						fc.stop();

						$.WR.texteditor = CKEDITOR.instances[fc.editor.name];

						fc.editor.execCommand( 'removeFormat', fc.editor.getSelection() );

						CKEDITOR.document.getById('wr-list-datasource').on( 'dragstart', function( evt ) {
							evt.stop();
							var target = evt.data.getTarget().getAscendant( 'li', true );
							
							CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );

							var dataTransfer = evt.data.dataTransfer,
								$target 	 = $(target.$),
								element		 = {},
								html 		 = null;

							element.tag			= $target.attr('rel');
							element.tagtype		= $target.attr('tagtype') ? $target.attr('tagtype') : false;
							element.label 		= '<b>['+target.getText()+']</b>';
							element.type		= $target.attr('notype') ? $target.attr('notype') : $target.attr('type');
							element.parentTag 	= $target.attr('tag');
							element.parentType 	= $target.attr('parentType') || 'form';
							element.parentPos 	= $target.attr('parentPos');
							element.iskey 		= $target.find('.btn input[name="p_'+element.tag+'"]').is(':checked');

							element.type = element.type.replace(/xs:/g, "");

							if(element.parentType == 'table'){
								element.list = [];
								if(element.type == 'node'){
									var obj  	= $('ul[tag="'+element.parentTag+'"]')[0] ? $('ul[tag="'+element.parentTag+'"]') : $('ul[tag="'+element.tag+'"]'),
										seletor = $target.find('input[name="p_'+element.parentTag+'"]',obj).is(':checked') ? $('li input[name="p_'+element.parentTag+'"]:checked',obj) : $('li input[name="p_'+element.parentTag+'"]',obj);
									
									seletor.each(function(i,e){
										var item 	= {},
											parents = $(e).parents('li:first');

										item.tag 	= parents.attr('rel');
										item.label 	= parents.attr('label');

										element.list.push(item);
									});
								}else{
									element.list[0] = {
										tag  :element.tag,
										label:target.getText()
									};
								} 
							}

							if(element.parentType == 'chart')
								element.type = element.parentType;

							html = $.WR.element.type[element.parentType](element);

							if(html != null){
								html +='&nbsp;';
								$.WR.editor.set.html(html);
							}
						});
					});
					//ev.editor.fire('focus');
				});
			}
		};

		$.WR.utils = {
			getContentPositon : function(pos){
				console.log(pos);
				return isNaN(pos+1) ? "@uuid='"+pos+"'" : 'position()='+pos;
			}
		};

		$.WR.init = function(){
			var h = $(window).height();
			CKEDITOR.config.protectedSource.push( /(<xsl:[^\>]+>[\s|\S]*?<\/xsl:[^\>]+>)|(<xsl:[^\>]+\/>)/gi );
			CKEDITOR.config.forceEnterMode = true;
			CKEDITOR.config.forcePasteAsPlainText = true;
			CKEDITOR.config.toolbarCanCollapse = false;
			CKEDITOR.config.height = h - parseInt(h/3 + 30);

			$.WR.editor.instanceReady();

			$.WR.document.init();
			$.WR.fieldApp.init();
			$.WR.fieldDataSource.init();

			$.WR.element.onCheckListType();

			$('#wr-list-document').height(h - 250);
		};

		$.WR.init();
	}
});