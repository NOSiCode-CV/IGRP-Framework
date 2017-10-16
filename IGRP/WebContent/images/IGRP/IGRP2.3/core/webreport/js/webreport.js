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
		$.WR.objDataSource 	= $('#form_1_datasorce_app');
		$.WR.objApp 		= $('#form_1_env_fk');
		$.WR.app 			= $.WR.objApp[0] ? $.WR.objApp.val() : null;
		$.WR.pageUrl 		= $('#p_env_frm_url')[0] ? $('#p_env_frm_url').val() : window.location.href;

		
		$.WR.fieldDataSource = {
			urlChange:$('#p_link_source')[0] ? $('#p_link_source').val() : 'XXXX',
			onChange : function(){
				$.WR.objDataSource.on('change',function(){
					$.WR.dataSource = $(this).val();
					var param = '', 
						url   = $.IGRP.utils.getUrl($.WR.fieldDataSource.urlChange);
						//url   = $.IGRP.utils.getUrl('http://igrp.teste.gov.cv/images/IGRP/IGRP2.3/app/RED/xml/RED_REPORT_REP_dash-new.xml');
					
					if($.WR.dataSource){
						$.WR.dataSource.forEach(function(e,i){
							param += i > 0 ? '&p_id='+e : 'p_id='+e;
						});

						url += param;

						if($.WR.id)
							url = $.IGRP.utils.getUrl(url)+'p_template_id='+$.WR.id;

						$.ajax({
							url : url
						})
						.fail(function(e){
							$.IGRP.notify({
								message : 'Not Found',
								type	: 'danger'
							});
						})
						.success(function(data){
							if(data){
								var url 	= $(data).find('fields link_add_source value').text(),
									loading = $('<div/>').addClass('loading loader'),
									tab 	= $('#tab-tabcontent_1-data_source');

								loading.appendTo(tab);

								$('#wr-list-datasource').XMLTransform({
									xsl : path+'/core/webreport/xsl/datasorce.tmpl.xsl',
									xml : $(data).getXMLDocument(),
									complete : function(c){
										//if($.WR.id)
											$('.wr-editdatasource').addClass('active');

										$(loading,tab).remove();
									},
									error 	 : function(c){
										$(loading,tab).remove();
									}
								});
							}
						});
					}else
						$('.wr-editdatasource').removeClass('active');
				});
			},
			setVal : function(data,selected){
				var option  = null,
					selected = selected ? selected : [];
				if(data && data != undefined){
					$('.wr-editdatasource').addClass('active');
					$("option",$.WR.objDataSource).remove();
					data.find('option').each(function(i,e){
						var value = $(e).find("value").text();
						option = new Option(
							$(e).find("text").text(),
							value
						);

						if($(e).attr('selected'))
							option.selected = true;

						if(selected.length > 0){
							if ($.inArray(value,selected) != -1){
								option.selected = true;
							}
						}

						$($.WR.objDataSource).append(option);
					});
				}else
					$('.wr-editdatasource').removeClass('active');

				$.WR.objDataSource.trigger('change');
			},
			getVal : function(){
				$.WR.dataSource = $.WR.objDataSource.val();
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
										url  : $.WR.pageUrl,
										data : $.WR.objApp.serializeArray(),
										type : 'POST'
									}).success(function(data){
										if(data){
											var datasorceXml = $(data).find('fields datasorce_app list');
											$.WR.fieldDataSource.setVal(datasorceXml,$.WR.dataSource);
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
							content += '<div class="col-md-12 form-group">'+
								'<input name="'+name+'" type="radio" value="'+$(e).val()+'"/>'+
								'<span>'+$(e).text()+'</span></div>';
						});

						content = '<div class="row rw_datasorce_edit">'+content+'</div>';

						$.IGRP.components.globalModal.set({
							size 		: 'xs',
							content 	: content,
							title 		: 'Edit Data Source',
							buttons 	: [
								{
									class 	: 'success',
									icon  	: 'check',
									text  	: 'Confirmar',
									onClick : function(){
										$.IGRP.targets.modal.action({
											url:$.IGRP.utils.getUrl(url)+name+'='+$('.rw_datasorce_edit input[type="radio"]:checked').val()
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
							url:$.IGRP.utils.getUrl(url)+name+'='+$.WR.dataSource
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
			onChange:function(){
				$.WR.objApp.on('change',function(){
					$.WR.app = $(this).val();
					if($.WR.app && $.WR.app != undefined){
						$('#form_1_env_fk').next('.select2:first').removeClass('error');
					
						$.ajax({
							url  : $.WR.pageUrl,
							data : $.WR.objApp.serializeArray(),
							type : 'POST'
						})
						.fail(function(e){
							$.IGRP.notify({
								message : 'Not Found',
								type	: 'danger'
							});
						})
						.success(function(data){
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

								if(!$.WR.newDocument){
									$.WR.editor.set.data({});
									$.WR.document.customfooter.isActive(false);
								}
							}	
						});
					}
				});
			},
			init : function(){
				$.WR.fieldApp.onChange();
			}	
		};

		$.WR.fieldPrintSize = {
			getVal : function(){
				return $('select[name="'+WR.document.config.printsize.name+'"]').val() || 'A4';
			},
			setVal : function(v){
				var selPrintSize = $('select[name="'+WR.document.config.printsize.name+'"]');
				$('option[selected]',selPrintSize).removeAttr('selected');
				$('option[value="'+v+'"]',selPrintSize).attr('selected','selected');
			}
		}

		$.WR.document = {
			modal : function(p){
				var option = '';
				WR.document.config.printsize.options.forEach(function(e,i){
					var sel = e.selected || '';
					option += '<option value="'+e.value+'" '+sel+'>'+e.text+'</option>';		
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
					/*'<div class="col-md-12 form-group"><div class="col-md-4">'+
						'<label for="'+WR.document.config.customfooter.name+'">'+WR.document.config.customfooter.label+'</label></div>'+
					'<div class="col-md-8"><input name="'+WR.document.config.customfooter.name+'" type="checkbox"/></div></div>'+*/
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
						top = li.position().top + 16;

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
			newOrEdit : function(p){
				if($.WR.title && !$.WR.id){
					$('#igrp-app-title').html($.WR.title+' *');
					$.WR.newDocument = true;
					//add new documento editor
					//$.WR.editor.set.data(WR.document.new);
				}

				if($.WR.id && $.WR.title){// if edit
					$.ajax({
						url  : p.url,
						data : p.data,
						type : 'POST'
					})
					.fail(function(e){
						$.IGRP.notify({
							message : 'Not Found',
							type	: 'danger'
						});
					})
					.success(function(e,s,r){
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
					url : url
				})
				.fail(function(e){
					$.IGRP.notify({
						message : 'Not Found',
						type	: 'danger'
					});
				})
				.success(function(data){
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

								for (var i = 0; i < $.WR.datasorce.length; i++) {
									$.WR.objDataSource.find("option").each(function(i,e){
										if($(e).val() == $.WR.datasorce[i]){
											$(e).attr("selected","selected");
										}
									});
								}
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

				var size = $.WR.fieldPrintSize.getVal();

				p.file.forEach(function(e,i){
					if (e.name == 'p_textreport') {
						e.value.config.customfooter = $.WR.document.customfooter.getChecked();
						e.value.config.printsize 	= size;

						e.value = JSON.stringify(e.value);
					}
					else if(e.name == 'p_xslreport'){
						e.value = e.value.replace(/=:WRPZ:=/g,size);
					}
				});

				/*console.log(p.file[0].value);
				console.log('--------------------');
				console.log(p.file[1].value);
				console.log('-----------------');
				console.log(p.fields);*/

				$.IGRP.utils.submitStringAsFile({
		      		pUrl    	: p.url,
		      		pParam 		: {
			        	pArrayFiles : p.file,
			        	pArrayItem  : p.fields
		      		},
		      		pComplete 	: function(rq){
		      			$.WR.keys = [];
		      			if (rq.status == 200) {
			      			if((p.action && p.action == 'modal') || $.WR.newDocument){
			      				$.WR.newDocument = false;
			      				$('#igrp-app-title').html($.WR.title);
			      				$.WR.objApp.change();
			      				//$.WR.id =  get id in c
			      			}

			      			if($.WR.isPreview){
			      				$.WR.isPreview = false;
			      				$('a[target="alert_submit"]').click();
			      			}
		      			}
		         	}
			   	});
			},
			onSave : function(){
				$.IGRP.targets['submit'].action = function(p){
					if($.WR.app != null){
						var saveDoc 	= {},
							head 		= WR.document.includ.css.all, /*WR.document.includ.head+*/
							includJs 	= WR.document.includ.js.all,
							includTmpl 	= ''; //WR.document.includ.tmpl.defoult

						
						if ($.WR.hasCarts && !$.WR.notCartsInclud) {
							head 		+= WR.document.includ.css.chart;
							includJs 	+= WR.document.includ.js.chart;
							includTmpl 	+= WR.document.includ.tmpl.chart;

							$.WR.notCartsInclud = true;
						}

						saveDoc.text = $.WR.editor.structures.text();

						saveDoc.xsl  = WR.document.xsl.init+head+
							WR.document.xsl.body+
							$.WR.element.filter()+includJs+
							WR.document.xsl.endbody+includTmpl+
							WR.document.xsl.end;

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
				          if ($.inArray($(ekey).val(),$.WR.keys) == -1) {
				            saveDoc.fields.push({name:'p_key',value:$(ekey).val()});
				            $.WR.keys.push($(ekey).val());
				          }
				        });

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

				        saveDoc.file.push({name:'p_xslreport',value:saveDoc.xsl});
				        saveDoc.file.push({name:'p_textreport',value:saveDoc.text});

				        if ($.WR.id && $.WR.id != undefined) {
				        	saveDoc.fields.push({name:'p_id',value:$.WR.id});

				        	$.WR.document.save({
				        		url 	: p.url,
				        		file 	: saveDoc.file,
				        		fields 	: saveDoc.fields
				        	});
				        } else {
				        	if ($.WR.title && $.WR.title != undefined) {
				        		saveDoc.fields.push({name:'p_title',value:$.WR.title});

				        		if($.WR.code && $.WR.code != undefined)
				        			saveDoc.fields.push({name:'p_code',value:$.WR.code});

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
						var url 	= $.IGRP.utils.getUrl(p.url)+'p_id='+$.WR.id,
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
						$.WR.isPreview = true;
						$('a[target="submit"]').click();
					}
					return false;
				}
			},
			convert2Do : function(p){
				var isActive  = false,
					content   = '',
					printsize = 'A4';

				
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
				}

				$.WR.fieldPrintSize.setVal(printsize);

				$.WR.document.customfooter.isActive(isActive);
				
				$.WR.editor.set.data(content);
			},
			customfooter : {
				isActive : function(type){
					var obj   = $('#footer-wr').parents('.box-wr'),
						input = $('input[name="'+WR.document.config.customfooter.name+'"]');

					type ? obj.removeClass('hidden') : obj.addClass('hidden');
					input.attr('checked',type).prop('checked',type);
				},
				onClick : function(){
					$('body').on('change','input[name="'+WR.document.config.customfooter.name+'"]',function(){
						$.WR.document.customfooter.isActive($(this).is(':checked'));
					});
				},
				getChecked : function(){
					return $('input[name="'+WR.document.config.customfooter.name+'"]').is(':checked');
				}
			},
			init : function(){
				$.WR.document.new();
				$.WR.document.edit();
				$.WR.document.onClick();
				$.WR.document.onSave();
				$.WR.document.onPreview();
				$.WR.document.customfooter.onClick();
				$.WR.document.info.show();
				$.WR.document.info.copy();
			}
		};

		$.WR.element = {
			modal : function(p){
				var content = '<div class="row">';

				WR.listType.forEach(function(e,i){
					content +='<div class="col-md-4"><div class="wr-listtype">'+
						'<input type="radio" name="listtype" value="'+e.type+'" class="radio"/>'+
						'<span><i class="fa '+e.icon+'"/></span></div></div>';
				});

				content +='</div><div class="row hidden" id="table-group"><div class="col-md-12">'+
					'<div class="box-head subtitle" text-color="1">'+
					'<span>Agrupar por</span></div><div class="row" id="list-group">';

				WR.listGroup.forEach(function(e,i){
					content +='<div class="col-md-4"><div class="form-group">'+
						'<div class="radio"><label><input type="radio" value="'+e.value+'" name="grouplist" class="checkbox">'+
						'<span>'+e.label+'</span></label></div></div></div>';
				});

				content +='</div><div class="box-head subtitle" text-color="1">'+
					'<span>Definir Chaves</span></div><div class="row" id="listcol">'+
					'</div><div class="hidden" id="html-group">'+
					'<div class="box-head subtitle" text-color="1">'+
					'<span>Html Groupo</span></div><div class="row">';

				WR.listType.forEach(function(e,i){
					content +='<div class="col-md-4"><div class="form-group">'+
						'<div class="radio"><label>'+
						'<input type="radio" name="reslisttype" value="'+e.type+'" class="radio"/>'+
						'<span><i class="fa '+e.icon+'"/></span></label></div></div></div>';
				});

				content += '</div></div></div></div>';

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
						col += '<div class="col-md-3"><div class="form-group"><div class="checkbox"><label>'+
						'<input type="checkbox" name="colgrouplist" class="checkbox" value="'+e.tag+'"/>'+
						'<span>'+e.label+'</span></label></div></div></div>'
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
					$.WR.element.modal(p);
					return null;
				},
				image	: function(p){
					return '<img src="'+path+'/assets/img/iconApp/default.png" pos="'+p.parentPos+'" no="'+p.parentTag+'" tag="'+p.tag+'" style="height:80px; margin:5px; width:80px"/>';
				},
				chart	: function(p){
					var transCharts = $('#transfome');
					$.ajax({
						url:$.IGRP.utils.getPageUrl()

					}).done(function(data){
						
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
								table = '<thead><tr>'+th+'</tr></thead>'+
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
								th += '<th '+e.th.style+'>'+e.th.value+'</th>';
							});

							table = '<thead><tr>'+th+'</tr></thead>'+
							'<tbody>'+
								'<xsl:for-each select="'+p.path+'">'+
									'<tr>'+td+'</tr>'+
								'</xsl:for-each>'+
							'</tbody>';

						break;
					}

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
			    				var pos 	= '[position()='+span.pos+']',
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
			    			var table  		= {},
			    				colgroup 	= element.attributes.colgroup || element.attributes.groupcolitem;
			    			
			    			table.pos  		= element.attributes.pos;
			    			table.no   		= element.attributes.no || element.attributes.rel;
			    			table.group 	= element.attributes.group || '';
			    			table.grouphtml = element.attributes.grouphtml || '';
			    			table.vars 		= '';
			    			table.cond 		= '';
			    			table.colgroup 	= colgroup ? colgroup.split(',') : [];

			    			if(table.no && table.no != undefined){
			    				var th   		= [],
			    				idx  			= 0,
			    				index 			= 0;
			    				table.td   		= {};
			    				table.td.group 	= [];
			    				table.td.item  	= [];

			    				var path = 'rows/content[position()='+table.pos+']/'+table.no+'/table/value/row';

			    				element.forEach(function(node){
			    					if(node.name == 'th'){

			    						//table.th +='<th '+$.WR.element.getStyle(node)+'>'+node.getHtml().capitalizeFirstLetter()+'</th>'
			    						th.push({
			    							value : node.getHtml().capitalizeFirstLetter(),
			    							style : $.WR.element.getStyle(node)
			    						});
			    					}

			    					if(node.name == 'td'){
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

			    				element.setHtml('<xsl:for-each select="rows/content[position()='+ul.pos+']/'+ul.no+'/table/value/row">'+ul.element+'</xsl:for-each>');
			    				
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

			    				element.setHtml('<xsl:for-each select="rows/content[position()='+ol.pos+']/'+ol.no+'/table/value/row">'+ol.element+'</xsl:for-each>');
			    				
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

			    				element.attributes.src ='{rows/content[position()='+img.pos+']/'+img.no+'/fields/'+img.tag+'/value}';
			    			
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
					structure.config.printsize 	  = $.WR.fieldPrintSize.getVal();
					structure.config.customfooter = $.WR.document.customfooter.getChecked();

					structure.content 		 = {};
					structure.content.head 	 = $.trim(data.head.replace(/"/g, "'").replace(/\s+/g," "));
					structure.content.body 	 = $.trim(data.body.replace(/"/g, "'").replace(/\s+/g," "));
					structure.content.footer = $.trim(data.footer.replace(/"/g, "'").replace(/\s+/g," "));
					
					return structure;
				},
				html : function(){
					var data = $.WR.editor.getData(),
						size = $('select[name="'+WR.document.config.printsize.name+'"]').val();

					size = size && size != undefined ? size : '=:WRPZ:=';

					var html   = '<div class="page" size="'+size+'"><div class="head">',
						footer = data.footer ? data.footer : WR.document.config.customfooter.value;

					html += data.head+'</div>';
					html += '<div class="content">'+data.body+'</div>';
					html += '<div class="footer">'+footer+'</div></div>';
					
					return html;
				}
			},
			instanceReady : function(){
				CKEDITOR.on( 'instanceReady', function(ev) {

					if(ev.editor.name === 'footer-wr')
						$.WR.editor.get(ev.editor.name).setData(WR.document.config.customfooter.value);

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
							element.parentType 	= $target.attr('parentType');
							element.parentPos 	= $target.attr('parentPos');
							element.iskey 		= $target.find('.btn input[name="p_'+element.tag+'"]').is(':checked');

							if(element.parentType == 'table'){
								element.list = [];

								if(element.type == 'node'){
									$('ul[tag="'+element.tag+'"] li').each(function(i,e){
										var item 	= {};
										item.tag 	= $(e).attr('rel');
										item.label 	= $(e).attr('label');

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