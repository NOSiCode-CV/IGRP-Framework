var GENSERVICE = function(GEN){

	var service = this;

	var checkService = function(field){
		if(field.GET.service().code)
			$('.gen-btn-service a.gen-serv-links').addClass('active');
		else
			$('.gen-btn-service a.gen-serv-links').removeClass('active');
	}

	service.set = function(field){
		field.setPropriety({
			name:'service',
			propriety : {
				value : {
					code       : field.proprieties.service && field.proprieties.service.code ? field.proprieties.service.code : '',
					desc       : field.proprieties.service && field.proprieties.service.desc ? field.proprieties.service.desc : '',
					connections: []
				},
				setter:function(){
					var holder = $('<div class="gen-btn-service"></div>');
					var lookup = $('<div class="itemIcon">'+
										'<input type="hidden" value="'+field.GET.service().code+'" id="service_code" name="p_toolbar_tformservico"/>'+
										'<input type="LOOKUP" value="'+field.GET.service().desc+'" id="service_desc" name="p_toolbar_tformservdesc" class="LOOKUP">'+
										'<a class="IGRP_lookupPopup" href="'+GEN.UTILS.link_service_list+'">'+
											'<img alt="LOOKUP" src="'+path+'/themes/default/img/icon/search.png">'+
										'</a>'+
									'</div>');

					var req = $('<a class="gen-serv-req gen-serv-links" href="#">request</a>');
					var res = $('<a class="gen-serv-res gen-serv-links" href="#">response</a>');

					$('#service_desc',lookup).on('keyup',function(){
						
						if(!$(this).val()){//reset if is empty
							field.SET.service({
								code:'',
								desc:'',
								connections:[]
							});
						}
						checkService(field);
					});

					$('#service_code',lookup)[0].lookupCallback = function(obj){
						field.SET.service({
							code:obj.val(),
							desc:$('#service_desc').val() ? $('#service_desc').val() : obj.val(),
							connections:[]
						});
						checkService(field);
					}

					req.on('click',function(){

						//console.log(GEN.UTILS.link_service_xsd+'?p_code='+field.GET.service().code+'&p_tipo=REQ')

						$('.gen-service-panel#target .content').html('').XMLTransform({
							xml       : GEN.UTILS.link_service_xsd+'?p_code='+field.GET.service().code+'&p_tipo=REQ',
							xsl       : GEN.path+'/util/IGRP-xsdToHtml.tmpl.xsl',
							excludePrefix:'xs:',
							complete:function(d){
								var contents = GEN.getAllFields();
	
								setSourceFields(contents);

								IGRP_blackBody({ pType:true });

								$('#gen-service-mapper').show();

								calcHeight();

								$('#gen-service-mapper').XSDMapper({
									source     :'#source .row-name',
									target     :'#target .row-name',
									confirmBtn :'button[rel="confirm"]',
									connections:field.GET.service().connections && field.GET.service().connections[0] ? field.GET.service().connections :[],
									onConfirm  :function(conns,jsPlubmConns){
										field.SET.service({
											code:field.GET.service().code,
											desc:field.GET.service().desc,
											connections:conns
										});

										IGRP_blackBody({ pType:false });

										$('#gen-service-mapper').hide();
									}
								});
							}
						});

						return false;
					});

					holder.append([lookup,req,res]);
					
					setTimeout(function(){
						checkService(field);
					},50)
					

					return holder;
				}
			}
		});	
	}

	var calcHeight = function(){
		var height    = $('#gen-service-mapper').height();
		var offsetTop = $('#gen-service-mapper').offset().top;
		$('#gen-service-mapper #gen-service-buttons').css('top',height+offsetTop) 
	}

	var setSourceFields = function(contents){
		var ul = $('<ul class="global tree"/>');

		contents.forEach(function(c){

			var hasChild = c.fields[0] ? true : false;

			if(hasChild){
				var pClass   = hasChild    ? 'has-child' : '';
				var tag      = c.container.GET.tag();
				var li       = $('<li name="'+tag+'" gen-id="'+c.container.GET.id()+'" class="'+pClass+'"><span class="row-symbol"/><span class="row-name">'+tag+'</span></li>');
				var ulChild  = $('<ul class="row child" parent="'+tag+'"/>');
				var fCount   = 0; 

				c.fields.forEach(function(f){
					if(f.GET.type() != 'button' && f.GET.type() != 'separator'){
						var tagF = f.GET.tag();
						var liF  = $('<li name="'+tagF+'" gen-id="'+f.GET.id()+'"><span class="row-symbol"/><span class="row-name">'+tagF+'</span></li>');
						ulChild.append(liF);
						fCount++;
					}
					
				});

				li.append(ulChild);

				if(fCount>0)
					ul.append(li)
			}
		});

		$('.gen-service-panel#source .content').html('').append(ul);
	}

	var setEvents = function(){
		$('#gen-service-mapper .closer').on('click',function(){
			$('#gen-service-mapper').hide();
			IGRP_blackBody({ pType:false });
			$('.gen-service-panel#source .content').html('');
			jsPlumb.detachEveryConnection();
		});

		$(window).resize(function(){
			calcHeight();
		});
	}
	
	setEvents();
	
}