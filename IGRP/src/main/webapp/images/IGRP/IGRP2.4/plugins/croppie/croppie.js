(function(){
	var com,
		$croppie   = null,
		crop 	   = false,
		uploadType = '',
		uploadName = '';

	$.IGRP.component('croppie',{
		croppieFile : {
			get : {
				obj : function(p){
					return $('div[rel="'+p.id+'"] .upload-img').croppie({
						viewport : {
							width 	: p.width,
							height 	: p.height,
							type 	: 'square'
						},
						enableOrientation: true,
						enableExif: true
					});
				},
				result : function(p){
					var type = p.type || 'base64';
					if ($croppie) {
						$croppie.croppie('result', {
							type: type,
							size: 'viewport'
						}).then(function (resp) {
							if (p.target)
								p.target.attr('src',resp);

							if (p.complete) {
								p.complete(resp);	
							}
						});
					}
				}
			},
			set : function(p){
				$('[rel="'+p.id+'"]').addClass('ready');
            	$croppie.croppie('bind', {
            		url:p.url
            	});
			}
		},
		modal : function(f){
			var id 		= f.attr('name'),
				height  = f.attr('height') || 150,
				width   = f.attr('width')  || 150, 
				content = '<div class="row">'+
				'<div class="form-group col-sm-6" item-name="croppie-'+id+'" item-type="file">'+
					'<label for="file-croppie">Escolher Imagem</label>'+
					'<div class="input-group">'+
				        '<input type="text" class="form-control not-form" readonly=""/>'+
				        '<span class="input-group-btn">'+
				            '<span class="btn btn-primary file-btn-holder">'+
				                '<i class="fa fa-upload"></i><input id="croppie-'+id+'" width="'+width+'" height="'+height+'" class="transparent croppie-file" type="file" accept="image/*"/>'+
				            '</span>'+
				        '</span>'+
				    '</div>'+
				'</div></div>'+
				'<div class="row holderCrop" rel="croppie-'+id+'">'+
                  '<div class="col-md-8">'+
                    '<div class="upload-msg">'+
                        'Carrege uma imagem para iniciar corte'+
                    '</div>'+
                    '<div class="upload-wrap">'+
                        '<div class="upload-img"></div>'+
                    '</div>'+
                  '</div>'+
                  '<div class="col-md-4">'+
                  	'<label for="preview" class="lpreview">Pr&eacute;-visualiza&ccedil;&atilde;o</label>'+
                    '<div class="preview pull-right" style="width:'+width+'px;height:'+height+'px;max-width:200px;max-height:200px">'+
                    '<img/></div>'+
                  '</div>'+
                '</div>';

			$.IGRP.components.globalModal.set({
				size 		: 'lg',
				content 	: content,
				title 		: f.attr('data-label') || 'Alterar Imagem',
				buttons 	: [
					{
						class 	: 'primary',
						icon  	: 'crop',
						text  	: 'Cortar',
						onClick : function(e){
							e.preventDefault();
							com.croppieFile.get.result({
								target 	 : $('[rel="croppie-'+id+'"] .preview img'),
								complete : function(){
									crop = true;
								}
							});
							return false;
						}
					},
					{
						class 	: 'success left',
						icon  	: 'check-square-o',
						text  	: 'Confirmar',
						onClick : function(e){
							e.preventDefault();
							if (crop) {
								com.croppieFile.get.result({
									target 	 : $('#id-'+id),
									complete : function(resp){
										crop = false;
										com.onConfirm({
											name  : id,
											value : resp,
											obj   : $('#id-'+id)
										});
										$.IGRP.components.globalModal.hide();
									}
								});
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

			com.onload(f);
		},
		onConfirm : function(p){
			if(!p.obj.hasClass('autoupload')){
				var cropStore  = {
						name  : p.name,
						value : p.value,
						file  : uploadName
					};

				$.IGRP.store.unset(p.name);

				$.IGRP.store.set({
					name : p.name,
					value:JSON.stringify(cropStore)
				});

			}else{

				if (p.value) {

					uploadName = uploadName.split('.');

					$.IGRP.utils.submitStringAsFile({
                        pParam : {
                            pArrayFiles : [
                                {
                                    name    : 'p_file_name',
                                    value   : $.IGRP.utils.base64toBlob({
                                        base64Data  : p.value,
                                        sliceSize   : p.obj.attr('width')*1,
                                        contentType : uploadType
                                    }),
                                    type    : uploadType,
                                    filename: uploadName[0],
                                    format  : uploadName[1]
                                }
                            ],
                            pArrayItem : [
                            	{
                            		name  : 'dad',
                            		value : $('body').attr('app')
                            	}
                            ]
                        },
                        pUrl        : 'webapps?r=igrp/File/save-image',
                        pNotify     : false,
                        pComplete   : function(respdata){
                            try{
                                var resp = respdata.response ? $.parseJSON(respdata.response) : null;
                            
                                if(resp){
                                	var id = resp.id;

                                	if(id === -1){
                                		p.obj.attr('src','');

	                                    $.IGRP.notify({
	                                        message : $.IGRP.utils.htmlDecode(resp.msg),
	                                        type    : 'danger'
	                                    });

                                    }else{
                                    	$.IGRP.utils.createHidden({
                                    		name  : 'p_'+p.name,
											value : id,
											class :'submittable'
                                    	});
                                    	
                                    	$.IGRP.utils.createHidden({
                                    		name  : 'p_'+p.name+'_uuid',
											value : resp.uuid,
											class :'submittable'
                                    	});
                                    }
                                }
                            }catch(e){
                                console.log(e);
                                null;
                            }
                            
                        }
                    });
				}
			}
		},
		onload : function(f){
			var id 	 = 'croppie-'+f.attr('name'),
				src  = f.attr('src');
			if (src) {
				
				if($croppie)
					$croppie.html('');

				$croppie = com.croppieFile.get.obj({
					id  	: id,
					width 	: f.attr('width')*1,
					height 	: f.attr('height')*1
				});
				
				com.croppieFile.set({
            		id 	: id,
            		url : src
            	});

            	$('.cr-image',$croppie).css({
            		'opacity':1,
            		'transform':'translate3d(209.3px, 75.3px, 0px) scale(1)',
            		'transform-origin':'67.7px 67.7px 0px'
            	});

            	$('[rel="'+id+'"] .preview img').attr('src',src);
			}
		},
		uploadFile : function(){
			$('body').on('change','.croppie-file',function(){
				var id 		= $(this).attr('id'),
					files 	= $(this)[0].files[0];

				if($croppie)
					$croppie.html('');

				$croppie = com.croppieFile.get.obj({
					id 	   : id,
					width  : $(this).attr('width')*1,
					height : $(this).attr('height')*1
				});

				uploadType = files.type;
				uploadName = files.name;

				if (files) {
					var reader = new FileReader();
	            
		            reader.onload = function (e) {
		            	com.croppieFile.set({
		            		id 	: id,
		            		url : e.target.result
		            	});
		            }
		            
		            reader.readAsDataURL(files);
				}
			});
		},
		init:function(){
			com = this;

			$('body').on('click','.croppie',function(){
				$.IGRP.store.unset($(this).attr('name'));
				com.modal($(this));
			});

			$.IGRP.on('submit-ajax',function(o){
				
				if($('.croppie')[0]){

					$('.croppie').each(function(){

						if(!$(this).hasClass('autoupload')){

							var name 	  = $(this).attr('name'),
								cropStore = $.IGRP.store.get(name),
								value 	  = '';

							$.IGRP.store.unset(name);
							
							cropStore = cropStore ? JSON.parse(cropStore) : {};
							
							if (cropStore.name) {
								value = $.IGRP.utils.base64toBlob({
									base64Data : cropStore.value,
									sliceSize  : $(this).attr('width')*1
								}); 
							}

							o.pArrayItem.push({
								name 	: 'p_'+name,
								value 	: value
							});
						}
					});
				}
			});

			com.uploadFile();
		}
	},true);
})();