var GENSERVICE = function(GEN){

	var service = this;

	var checkService = function(field){
		if(field.GET.service().code)
			$('.gen-btn-service a.gen-serv-links').addClass('active');
		else
			$('.gen-btn-service a.gen-serv-links').removeClass('active');
	}


	var getXSDPage = function(o){

		$('.gen-service-panel#target .content').html('').XMLTransform({
			xml           : GEN.UTILS.link_service_xsd+'?p_code='+o.code+'&p_tipo='+o.type,
			xsl           : GEN.path+'/util/IGRP-xsdToHtml.tmpl.xsl',
			excludePrefix : 'xs:',
			
			complete      : function(d){

				var contents = GEN.getAllContents();

				setSourceFields(contents);

				var title = o.type == 'REQ' ? 'REQUEST' : 'RESPONSE';

				$('.gen-service-panel#source h3').text('XSD '+title);

				$('#gen-service-mapper').modal('show');
				
				setTimeout(function(){
					$('#gen-service-mapper').XSDMapper({
						source      :'#source .row-name',
						target      :'#target .row-name',
						confirmBtn  :'button[rel="confirm"]',
						connections :o.connections,
						onConfirm   :function(conns,jsPlubmConns){
							o.onConfirm(conns,jsPlubmConns);
						}
					});
				},600)
				
					
			}
		});
	}

	service.set = function(field){
		field.setPropriety({
			name:'service',
			propriety : {
				value : {
					code       : field.proprieties.service && field.proprieties.service.code ? field.proprieties.service.code : '',
					desc       : field.proprieties.service && field.proprieties.service.desc ? field.proprieties.service.desc : '',
					connectionsReq: [],
					connectionsRes: []
				},
				setter:function(){

					var holder = $('<div class="gen-btn-service"></div>');
					var lookup = $('<div class="input-group">'+
										'<input type="hidden" value="'+field.GET.service().code+'" id="service_code" name="p_toolbar_tformservico"/>'+
										'<input type="text" value="'+field.GET.service().desc+'"  class="form-control gen-lookup" id="service_desc" name="p_toolbar_tformservdesc"/>'+
									    '<span href="'+GEN.UTILS.link_service_list+'" input-rel="service_desc" class="input-group-btn IGRP_lookupPopup" ctx_param="p_lookup_1">'+
									        '<span class="btn btn-default">'+
									            '<i class="fa fa-search"></i>'+
									        '</span>'+
									    '</span>'+
									'</div>');

					var req = $('<a class="gen-serv-req gen-serv-links" href="#">request</a>');
					var res = $('<a class="gen-serv-res gen-serv-links" href="#">response</a>');

					$('#service_desc',lookup).on('keyup',function(){
						
						if(!$(this).val()){//reset if is empty
							field.SET.service({
								code:'',
								desc:'',
								connectionsReq:[],
								connectionsRes:[]
							});
						}
						checkService(field);
					});

					$('#service_code',lookup)[0].lookupCallback = function(obj){
						field.SET.service({
							code:obj.val(),
							desc:$('#service_desc').val() ? $('#service_desc').val() : obj.val(),
							connectionsReq:[],
							connectionsRes : []
						});

						checkService(field);
					}

					req.on('click',function(){
						getXSDPage({
							code        : field.GET.service().code,
							type        :'REQ',
							connections : field.GET.service().connectionsReq && field.GET.service().connectionsReq[0] ? field.GET.service().connectionsReq :[],
							onConfirm   : function(c,jsC){
								
								field.SET.service({
									code:field.GET.service().code,
									desc:field.GET.service().desc,
									connectionsReq:c,
									connectionsRes:field.GET.service().connectionsRes
								});

							}
						});
						return false;
					});

					res.on('click',function(){
						getXSDPage({
							code        : field.GET.service().code,
							type        :'RES',
							connections : field.GET.service().connectionsRes && field.GET.service().connectionsRes[0] ? field.GET.service().connectionsRes :[],
							onConfirm   : function(c,jsC){
								
								field.SET.service({
									code:field.GET.service().code,
									desc:field.GET.service().desc,
									connectionsReq:field.GET.service().connectionsReq,
									connectionsRes:c
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

	var drawHolder = function(){
		var html =	'<div class="modal fade" tabindex="-1" id="gen-service-mapper" role="dialog" >'+
					    '<div class="modal-dialog modal-lg">'+
					        '<div class="modal-content">'+
							'<div class="inner" id="gen-service-mapper-contents">'+
				              	'<div class="gen-service-panel" id="source">'+
				                	'<h3>XSD Request</h3>'+
				                	'<div class="content"></div>'+
				              	'</div>'+
				              	'<div class="gen-service-panel" id="target">'+
				                	'<h3>XSD Service</h3>'+
				                	'<div class="content"></div>'+
				              	'</div>'+
				            '</div>'+
				            '<div id="gen-service-buttons" class="modal-footer">'+
								'<button type="button" rel="cancel" class="btn btn-default" data-dismiss="modal">Fechar</button>'+
								'<button class="btn btn-primary" rel="confirm">Confirmar</button>'+
							'</div>'+
					        '</div>'+
					    '</div>'+
					'</div>';

		if($('.gen-service-mapper')[0])
			$('.gen-service-mapper').replaceWith($(html));
		else
			$('body').append(html);
	}

	var setEvents = function(){

		drawHolder();

		$('#gen-service-mapper').on("hidden.bs.modal", function(){
			$('.gen-service-panel#source .content,.gen-service-panel#target .content').html('');
			jsPlumb.detachEveryConnection();
			$('#gen-service-mapper').modal('hide');
		});

	}
	
	setEvents();
	
}