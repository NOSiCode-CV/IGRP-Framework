
(function ($) {
	if($){
		$.WR 				= {}; //Objeto W web R report
		// WR var file webreport.config
		$.WR.id 			= null;
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
						url   = $.IGRP.utils.getUrl('http://igrp.teste.gov.cv/images/IGRP/IGRP2.3/app/RED/xml/RED_REPORT_REP_dash-new.xml');
					if($.WR.dataSource){
						$.WR.dataSource.forEach(function(e,i){
							param += i > 0 ? '&p_id='+e : 'p_id='+e;
						});

						url += param;

						if($.WR.id)
							url = $.IGRP.utils.getUrl(url)+'p_template_id='+$.WR.id;

						$.ajax({
							url:url
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
									xsl 	 : path+'/core/webreport/xsl/datasorce.tmpl.xsl',
									xml 	 : $(data).getXMLDocument(),
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
				var option   = null,
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
										$.IGRP.targets.modal({
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
						$.IGRP.targets.modal({
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
									$.WR.editor.set.data('');
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

		$.WR.document = {
			modal : function(p){
				var content = '<div class="row reporttitle"><div class="col-md-12 form-group">'+
					'<div class="col-md-4"><label for="'+p.titleName+'">'+p.titleLabel+'</label></div>'+
					'<div class="col-md-8"><input name="'+p.titleName+'" type="text" class="form-control"/>'+
					'</div></div><div class="col-md-12 form-group">'+
					'<div class="col-md-4"><label for="'+p.codeName+'">'+p.codeLabel+'</label></div>'+
					'<div class="col-md-8"><input name="'+p.codeName+'" class="form-control" type="text"/></div></div></div>';

				$.IGRP.components.globalModal.set({
					size 		: 'xs',
					content 	: content,
					title 		: p.titleModal,
					beforeShow 	: function(){
						if($.WR.id){ // if edit
							$('input[name="'+p.titleName+'"]').val(p.title);
							$('input[name="'+p.codeName+'"]').val(p.code);
						}
					},
					buttons 	: [
						{
							class 	: 'success',
							icon  	: 'check',
							text  	: 'Confirmar',
							onClick : function(){
								var data = $('.reporttitle *').serializeArray();

								data.forEach(function(e,i){
									if(e.name == p.codeName)
										$.WR.code = e.value;
									else
										$.WR.title = e.value;
								});

								if($.WR.title && $.WR.title != undefined){
									if(p.action != 'save'){
										$.WR.document.newOrEdit({
											url 		: p.url,
											data 		: data
										});
									}else{
										p.fields.push({name:p.titleName,value:$.WR.title});

										if($.WR.code && $.WR.code != undefined)
											p.fields.push({name:p.codeName,value:$.WR.code});

										$.WR.document.save({
							        		url 	: p.url,
							        		file 	: p.file,
							        		fields 	: p.fields,
							        		action  : 'modal'
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
			},
			newOrEdit : function(p){
				if($.WR.title && !$.WR.id){
					$('#igrp-app-title').html($.WR.title+' *');
					$.WR.newDocument = true;
					//add new documento editor
					$.WR.editor.set.data(WR.document.new);
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
					.success(function(e){
						var type = e.type && e.type != undefined ? e.type : 'danger',
							message = e.msg && e.msg != undefined ? e.msg : 'Erro';
						$.IGRP.notify({
							message : $.IGRP.utils.htmlDecode(e.msg),
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
					url  : url
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

						data = $.parseJSON(data.responseText.replace(/\s+/g," "));

						$.WR.editor.set.data(data.textreport);

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
				$.IGRP.targets['submit'] = function(p){
					if($.WR.app != null){
						var saveDoc  = {},
							head 	 = WR.document.includ.css.all+WR.document.includ.js.all;

						saveDoc.text = $.trim($.WR.editor.get().replace(/"/g, "'").replace(/\s+/g," "));

						saveDoc.xsl  = WR.document.xsl.init+head+
							WR.document.xsl.body+
							$.WR.element.filter()+
							WR.document.xsl.endbody+
							WR.document.xsl.end;

						saveDoc.file 	= [];
						saveDoc.fields  = [];

						saveDoc.fields.push({name:'p_env_fk',value:$.WR.app}); // add app id
						
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
				$.IGRP.targets['alert_submit'] = function(p){
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

											$.IGRP.targets.modal({
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
				        	$.IGRP.targets.modal({
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
			init : function(){
				$.WR.document.new();
				$.WR.document.edit();
				$.WR.document.onClick();
				$.WR.document.onSave();
				$.WR.document.onPreview();
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

				content +='<div>';

				$.IGRP.components.globalModal.set({
					size 	: 'xs',
					content :content,
					title 	: 'List Type',
					buttons :[
						{
							class 	: 'success',
							icon  	: 'check',
							text  	: 'Confirmar',
							onClick : function(){
								var tag  = $('.wr-listtype input:checked').val();
									list = tag != 'table' ? 'ulol' : 'table',
									html = $.WR.element.list[list]({
										list 		: p.list,
										parentTag 	: p.parentTag,
										parentPos 	: p.parentPos,
										tag 		: tag
									});

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
			},
			list : {
				table 	: function(p){
					var obj = '<table no="'+p.parentTag+'" pos="'+p.parentPos+'" class="table table-striped gen-data-table"><thead><tr>',
						td 	= '',
						th  = '';

				    p.list.forEach(function(e,i){
				      th += '<th tag="'+e.tag+'">'+e.label+'</th>';
				      td += '<td tag="'+e.tag+'">Text '+(i+1)+'</td>';
				    });

				    obj +=th+'</tr></thead></tbody><tr>';
				    obj +=td+'</tr></tbody></table>';

					return obj;
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
			type : {
				table	: function(p){
					$.WR.element.modal(p);
					return null;
				},
				image	: function(p){
					return '<img src="'+path+'/assets/img/iconApp/default.png" pos="'+p.parentPos+'" no="'+p.parentTag+'" tag="'+p.tag+'" style="height:80px; margin:5px; width:80px"/>';
				},
				chart	: function(p){
					return null;
				},
				form	: function(p){
					return '<span key="'+p.iskey+'" type="'+p.type+'" tag="'+p.tag+'" no="'+p.parentTag+'" pos="'+p.parentPos+'">'+p.label+'</span>';
				}
			},
			getStyle : function(e){
				return e.attributes.style && e.attributes.style != undefined ? ' style="'+e.attributes.style+'" ' : '';
			},
			filter : function(){
				var filter = new CKEDITOR.htmlParser.filter({
			      	text: function(value) {
			        	return value;
			    	},
			    	elements:{
			    		span : function(element){
			    			var attr  = {};
			    			attr.tag  = element.attributes.tag;
			    			attr.pos  = element.attributes.pos;
			    			attr.no   = element.attributes.no;
			    			attr.key  = element.attributes.key;
			    			attr.type = element.attributes.type;

			    			if (attr.tag && attr.tag != undefined) {

			    				attr.element = '<xsl:value-of select="rows/content[position()='+attr.pos+']/'+attr.no+'/fields/'+attr.tag+'/value"/>';
			    				
			    				if(attr.type == 'chart'){

			    				} else if(attr.type == 'select'){
			    					attr.element = '<xsl:value-of select="rows/content[position()='+attr.pos+']/'+attr.no+'/fields/'+attr.tag+'/list/option[@selected='+"'"+'true'+"'"+']/text"/>';
			    				}

			    				element.setHtml(attr.element);

			    				delete element.attributes.tag;
				    			delete element.attributes.pos;
				    			delete element.attributes.no;
				    			delete element.attributes.key;
				    			delete element.attributes.type;
			    			}
			    		},
			    		table : function(element){
			    			var attr  = {};
			    			attr.pos  = element.attributes.pos;
			    			attr.no   = element.attributes.no;

			    			if(attr.no && attr.no != undefined){
			    				attr.element 	= {};
			    				attr.element.th = '';
			    				attr.element.td = '';

			    				element.forEach(function(node){
			    					if(node.name == 'th'){
			    						attr.element.th +='<th '+$.WR.element.getStyle(node)+'>'+node.getHtml().capitalizeFirstLetter()+'</th>'
			    					}

			    					if(node.name == 'td'){
			    						attr.element.value = node.getHtml().replace(/&nbsp;/g, " ").replace(/\s+/g," ");
			    						attr.element.tag   = node.attributes.tag;

			    						if(attr.element.tag && attr.element.tag != undefined){
			    							attr.element.td +='<td '+$.WR.element.getStyle(node)+'><xsl:value-of select="'+attr.element.tag+'"/></td>';
			    						}
			    					}
			    				});

			    				attr.value = '<thead><tr>'+attr.element.th+'</tr></thead>'+
			    					'<tbody><xsl:for-each select="rows/content[position()='+attr.pos+']/'+attr.no+'/table/value/row">'+
			    					'<tr>'+attr.element.td+'</tr></xsl:for-each></tbody>';

			    				element.setHtml(attr.value);

			    				delete element.attributes.pos;
				    			delete element.attributes.no;
			    			}
			    		},
			    		ul : function(element){
			    			var attr  = {};
			    			attr.pos  = element.attributes.pos;
			    			attr.no   = element.attributes.no;

			    			attr.element = '';

			    			if (attr.no && attr.no != undefined) {
			    				element.forEach(function(node){
			    					if (node.name == 'li')
			    						attr.element +=  '<li '+$.WR.element.getStyle(node)+'><xsl:value-of select="'+node.attributes.tag+'"/></li>';
			    				});

			    				element.setHtml('<xsl:for-each select="rows/content[position()='+attr.pos+']/'+attr.no+'/table/value/row">'+attr.element+'</xsl:for-each>');
			    				
			    				delete element.attributes.pos;
				    			delete element.attributes.no;
			    			}
			    		},
			    		ol : function(element){
			    			var attr  = {};
			    			attr.pos  = element.attributes.pos;
			    			attr.no   = element.attributes.no;

			    			attr.element = '';

			    			if (attr.no && attr.no != undefined) {
			    				element.forEach(function(node){
			    					if (node.name == 'li')
			    						attr.element += '<li '+$.WR.element.getStyle(node)+'><xsl:value-of select="'+node.attributes.tag+'"/></li>';
			    				});

			    				element.setHtml('<xsl:for-each select="rows/content[position()='+attr.pos+']/'+attr.no+'/table/value/row">'+attr.element+'</xsl:for-each>');
			    				
			    				delete element.attributes.pos;
				    			delete element.attributes.no;
			    			}
			    		},
			    		img : function(element){
			    			var attr  = {};
			    			attr.tag  = element.attributes.tag;
			    			attr.pos  = element.attributes.pos;
			    			attr.no   = element.attributes.no;

			    			if (attr.tag && attr.tag != undefined) {

			    				element.attributes.src ='{rows/content[position()='+attr.pos+']/'+attr.no+'/fields/'+attr.tag+'/value}';
			    			
			    				delete element.attributes.tag;
				    			delete element.attributes.pos;
				    			delete element.attributes.no;
				    		}
			    		}
			    	}
			    });

				var fragment = CKEDITOR.htmlParser.fragment.fromHtml($.WR.editor.get()),
			    	writer 	 = new CKEDITOR.htmlParser.basicWriter();

			    filter.applyTo( fragment );
			    fragment.writeHtml( writer );

			    return writer.getHtml();
			}
		};

		$.WR.editor = {
			get : function(){
				return $.WR.texteditor.getData();
			},
			set : {
				data : function(p){
					$.WR.texteditor.setData(p);
				},
				html : function(p){
					$.WR.texteditor.insertHtml(p);
				}
			},
			instanceReady : function(){
				CKEDITOR.on( 'instanceReady', function(ev) {

					$.WR.texteditor = CKEDITOR.instances[WR.editor];

					ev.editor.execCommand( 'removeFormat', ev.editor.getSelection() );

					CKEDITOR.document.getById( 'datasorce' ).on( 'dragstart', function( evt ) {

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

						html = $.WR.element.type[element.parentType](element);

						if(html != null){
							html +='&nbsp;';
							$.WR.editor.set.html(html);
						}
					});
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

			$('#wr-list-document').height(h - 250);
		};

		$.WR.init();
	}
}($));