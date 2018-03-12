
(function ($) {
	if($){
		$.WR 			= {}; //Objeto W web R report
		// WR var file webreport.config
		$.WR.id 			= null;
		$.WR.title 			= null;
		$.WR.newDocument 	= false;
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
										if($.WR.id)
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
			setVal : function(xml){
				var option = null;
				if(xml && xml != undefined){
					$('.wr-editdatasource').addClass('active');
					$("option",$.WR.objDataSource).remove();
					xml.find('option').each(function(i,e){
						option = new Option(
							$(e).find("text").text(),
							$(e).find("value").text()
						);

						if($(e).attr('selected'))
							option.selected = true;

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
								$.WR.set.data('');
							}
						}	
					});
				});
			},
			init : function(){
				$.WR.fieldApp.onChange();
			}	
		};

		$.WR.document = {
			modal:function(p){
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
										code = e.value;
									else
										$.WR.reportTitle = e.value;
								});

								if($.WR.reportTitle && !$.WR.id){
									$('#igrp-app-title').html($.WR.reportTitle+' *');
									$.WR.newDocument = true;
									//add new documento edito
									$.WR.set.data(' ');
								}

								if($.WR.id && $.WR.reportTitle){// if edit
									$.ajax({
										url  : p.url,
										data : data,
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
											obj.attr('code',code);
											$('span',obj).html($.WR.reportTitle);
											$('#igrp-app-title').html($.WR.reportTitle);
										}
									});
								}
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
			new : function(){
				$('body').on('click','.wr-newdocument',function(){
					$.WR.id = null;
					$.WR.document.modal({
						titleName  : wr_nameInputTitle,
						titleLabel : wr_labelTitle,
						codeName   : wr_nameInputCode,
						codeLabel  : wr_labelCode,
						titleModal : wr_newDocumentTitle
					});
				});
			},
			edit:function(){
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
						url 		: $('#p_edit_name_report').val()
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

						$.WR.set.data(data.textreport);

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
			init : function(){
				$.WR.document.new();
				$.WR.document.edit();
				$.WR.document.onClick();
			}
		};

		$.WR.listType = function(p){
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
								list = tag != 'table' ? 'list' : 'table',
								html = $.WR.list[list]({
									list 		: p.list,
									parentTag 	: p.parentTag,
									parentPos 	: p.parentPos,
									tag 		: tag
								});

							$.WR.set.html(html);
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
		};

		$.WR.list = {
			table 	: function(p){
				var obj = '<table no="'+p.parentTag+'" pos="'+p.parentPos+'" class="table table-striped gen-data-table"><thead><tr>',
					td 	= '',
					th  = '';

			    p.list.forEach(function(e,i){
			      th += '<th rel="'+e.tag+'">'+e.label+'</th>';
			      td += '<td rel="'+e.tag+'">Text '+(i+1)+'</td>';
			    });

			    obj +=th+'</tr></thead></tbody><tr>';
			    obj +=td+'</tr></tbody></table>';

				return obj;
			},
			list  : function(p){
				var obj = '<'+p.tag+' no="'+p.parentTag+'" pos="'+p.parentPos+'">',
					li  = '';

				p.list.forEach(function(e,i){
			      li += '<li rel="'+e.tag+'">'+e.label+'</li>';
			    });

			    obj += li+'</'+p.tag+'>';
				return obj;
			}
		};

		$.WR.elementType = {
			table	: function(p){
				$.WR.listType(p);
				return null;
			},
			image	: function(p){
				return '<img src="'+path+'/assets/img/iconApp/default.png" pos="'+p.parentPos+'" no="'+p.parentTag+'" tag="'+p.tag+'" style="height:80px; margin:5px; width:80px"/>';
			},
			chart	: function(p){
				return null;
			},
			form	: function(p){
				return '<span key="'+p.iskey+'" tag="'+p.tag+'" no="'+p.parentTag+'" pos="'+p.parentPos+'">'+p.label+'</span>';
			}
		};

		$.WR.get = function(){
			return $.WR.editor.getData();
		};

		$.WR.set = {
			data: function(p){
				$.WR.editor.setData(p);
			},
			html:function(p){
				$.WR.editor.insertHtml(p);
			}
		};

		$.WR.instanceReady = function(){
			CKEDITOR.on( 'instanceReady', function(ev) {

				$.WR.editor = CKEDITOR.instances[WR.editor];

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

					html = $.WR.elementType[element.parentType](element);

					if(html != null){
						html +='&nbsp;';
						$.WR.set.html(html);
					}
				});
			});
		};

		$.WR.init = function(){
			CKEDITOR.config.protectedSource.push( /(<xsl:[^\>]+>[\s|\S]*?<\/xsl:[^\>]+>)|(<xsl:[^\>]+\/>)/gi );
			CKEDITOR.config.forceEnterMode = true;
			CKEDITOR.config.forcePasteAsPlainText = true;
			CKEDITOR.config.toolbarCanCollapse = false;
			CKEDITOR.config.height = $(window).height() - parseInt($(window).height()/3);

			$.WR.instanceReady();
			$.WR.document.init();
			$.WR.fieldApp.init();
			$.WR.fieldDataSource.init();
		};

		$.WR.init();

		//console.log($.WR);
	}
}($));