$(function () {
	let namefp   = '',
		holderfp = '';
	if ($.IGRP && !$.IGRP.components.fp) {
		$.IGRP.components.fp = {
			set : {
				img : function(o,v){
					$.IGRP.utils.loading.hide(o);

					if(v && v != undefined){
						if($('img',o).attr('src'))
							$('img',o).fadeOut("slow").attr("src", v).fadeIn("slow");
						else
							$('img',o).attr("src", v);
					}else
						$.IGRP.components.fp.set.error(o);
				},
				error : function(o){
					if($('.fa',o)) $('.fa',o).remove();

					o.addClass('error').stop().fadeOut("slow",function(){ 
		                o.append('<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>');
		            }).fadeIn("slow");
				},
				field : function(p){
					p.map((o) => {
						if($('input[name="'+o.name+'"]')[0])
							$('input[name="'+o.name+'"]').val(o.value);
						else
							$.IGRP.utils.createHidden({name : o.name, value : o.value});
					});
				},
				types : {
					FINGER : function(xml){
						let fl = xml.find(namefp+'_fingerleft value'),
							fr = xml.find(namefp+'_fingerright value');

						$.IGRP.components.fp.set.img($('.fp-left .fp-box',holderfp),fl.text().toString());
						$.IGRP.components.fp.set.img($('.fp-right .fp-box',holderfp),fr.text().toString());

						$.IGRP.components.fp.set.field([{
								name  : 'p_fingerleft_id',
								value : fl.attr('fingerleft_id')
							},{
								name  : 'p_fingerleft_wsq_id',
								value : fl.attr('fingerleft_wsq_id')
							},{
								name  : 'p_fingerright_id',
								value : fr.attr('fingerright_id')
							},{
								name  : 'p_fingerright_wsq_id',
								value : fr.attr('fingerright_wsq_id')
							}
						]);
					},
					FACE : function(xml){
						let fp = xml.find(namefp+'_photo value');
						$.IGRP.components.fp.set.img($('.fp-photo .fp-box',holderfp),fp.text().toString());

						$.IGRP.components.fp.set.field([{
								name  : 'p_photo_id',
								value : fp.attr('photo_id')
							},
							{
								name  : 'p_photo_jp2000_id',
								value : fp.attr('photo_jp2000_id')
							}
						]);
					},
					SIG : function(xml){
						let fs = xml.find(namefp+'_signature value');
						$.IGRP.components.fp.set.img($('.fp-signature .fp-box',holderfp),fs.text().toString());

						$.IGRP.components.fp.set.field([{
								name  : 'p_signature_id',
								value : fs.attr('signature_id')
							}
						]);
					},
					ALL : function(xml){
						$.IGRP.components.fp.set.types.FINGER(xml);
						$.IGRP.components.fp.set.types.SIG(xml);
						$.IGRP.components.fp.set.types.FACE(xml);
					}
				}
			},
			getData  : function(o){
				let type = o.attr('type') && o.attr('type') != undefined ? o.attr('type').toUpperCase() : '';
				
				holderfp = o.parents('.fp');
				namefp 	 = holderfp.attr('item-name'),
				paramfp  = holderfp.parents('.fingerprint.box').attr('param');

				let url = holderfp.attr('href') || window.location.href;
					
				if(type != ''){
					let param = 'p_type='+type,
						types = type == 'SELF' || type == 'START' ? 'ALL' : type,
						rel   = type.toLowerCase(),
						obj   = $('div[rel="'+rel+'"]',holderfp)[0] ? $('div[rel="'+rel+'"] .fp-box',holderfp) : $('.fingerprint .fp-box',holderfp);
					
					$.IGRP.utils.loading.show(obj); 
					$.IGRP.components.fp.set.img(obj,'');

					if(type == 'SELF') param +='&p_number_process='+$('input.fp_process',holderfp).val();

					if(paramfp){
						paramfp = paramfp.split(',');

						paramfp.map(fp => {
							let field = $(`:input[name="${fp}"]`);

							field = field[0] ? field : $(`:input[name="${fp}_fk"]`);
							
							if(field[0]){
								const val = field.val();
								if(val && val !== undefined)
									param += `&${field.attr('name')}=${val}`;
							}
						});
					}
					
					$.ajax({
						url : $.IGRP.utils.getUrl(url)+param,
						dataType : "xml",
						success : function(data){
							if(data){
								
								try{
									let xml = $(data).find(namefp+'[type="fingerprint"] fields');
									let np  = $.IGRP.utils.isNotNaN(xml.find(namefp+'_process value').text());
									np      = np > 0 ? np : '';

									$("input.fp_process",holderfp).val(np);
									
									xml.find('hidden').each(function() {
										$.IGRP.components.fp.set.field([{
											name  : $(this).attr('name'),
											value : $(this).find('value').text()
										}]);
			                        });

			                        $.IGRP.components.fp.set.types[types](xml);

								}catch(e){
									console.log(e);
									$.IGRP.notify({
										message : 'Tente Novamente!!',
										type	: 'warning'
									});
									$.IGRP.utils.loading.hide(obj);
									$.IGRP.components.fp.set.error(obj);
									null;
								}
							}else{
								$.IGRP.notify({
									message : 'Dados Inv&aacute;lido!!',
									type	: 'warning'
								});
								$.IGRP.utils.loading.hide(obj);
								$.IGRP.components.fp.set.error(obj);
								return;	
							}
						},error : function(error,status,statusText){
							$.IGRP.notify({
								message : statusText,
								type	: 'danger'
							});
							$.IGRP.utils.loading.hide(obj);
							$.IGRP.components.fp.set.error(obj);
						}
					});
				}else{
					$.IGRP.notify({
						message : 'Error type',
						type	: 'danger'
					});
				}
			},
			fieldNp : {//NP NUMERO PROCESSO
				get : function(f){
					let rt 	   = true,
						type   = f.attr('type') ? f.attr('type').toLowerCase() : '',
						field  = $('.fp_process',f.parents('.fp'));
					if (type == 'self') {
						let np = $.IGRP.utils.isNotNaN(field.val());

						$.IGRP.utils.loading.hide($('.fp-box',field));

						if (!np) {
							field.addClass('error');
							$.IGRP.notify({
								message : jQuery.validator.messages.required,
								type	: 'danger'
							});
							rt = false;
						}else
							field.removeClass('error');
					}else
						field.removeClass('error');

					return rt;
				},
				onKeyup : function(){
					$('.fp_process').on('keyup',function(e){
						$.IGRP.utils.isNotNaN($(this).val()) ? $(this).removeClass('error') : $(this).addClass('error');
					});
				}
			},
			onClick : function(){
				$('body').on('click','.fp-click',function(){
					if($('div[data-notify="container"]')[0]) $('div[data-notify="container"]').remove();
					
					if($.IGRP.components.fp.fieldNp.get($(this)))
						$.IGRP.components.fp.getData($(this));
				});
			},
			init : function(){
				$.IGRP.components.fp.fieldNp.onKeyup();
				$.IGRP.components.fp.onClick();
			}
		};

		$.IGRP.components.fp.init();
	}
});