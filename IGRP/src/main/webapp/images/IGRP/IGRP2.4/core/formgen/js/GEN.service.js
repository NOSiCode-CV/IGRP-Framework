var GENSERVICE = function(GEN){

	var service 		= this,
		otherFieldsServ = [],
		action 			= 0;

	service.checkService = function(field){
		action = field.DETAILS ? field.DETAILS.id : field.proprieties.action.value;
		
		if(field.GET.service().code)
			$('.gen-btn-service a.gen-serv-links').addClass('active');
		else
			$('.gen-btn-service a.gen-serv-links').removeClass('active');
	}

	var confConnected = function(id){
		$('.gen-service-panel#source').removeClass('confConnected');
		$('.gen-service-panel#target').removeClass('confConnected');

		$('.gen-service-panel#'+id).addClass('confConnected');
	};

	var getTitlePage = function(containers){
		var title = '';
		containers.forEach(function(c){
			var type = c.container.GET ? c.container.GET.type() : c.container.type;

			if (type == 'sectionheader')
				title = c.container.proprieties ? c.container.proprieties.text : c.container.text;
		});
		return title;
	};

	var _getPageJSON = function(id){
		var url 	= GEN.UTILS.link_get_page_json || 'red.form_designer_db.load_form?p_id=',
			json 	= {};

		$.ajax({	
			url:url+action,
			//cache:false,
			success:function(d,s,r){
				var contentType = r.getResponseHeader('Content-Type'),
					type 		= contentType.split(';')[0],
					data 		= d,
					arr  		= [],
					contents;

				if(type.indexOf('xml') != -1)
					data = $(d).to2DOT2();

				contents = GEN.layout.getAllContainers(data.rows);

				contents.forEach(function(c){
					arr.push({
						container : c.proprieties,
						fields    : c.fields
					});
				});

				setSourceFields({
					id 		 : id,
					contents : arr,
					title 	 : getTitlePage(arr),
					package  : data.plsql && data.plsql.package ? data.plsql.package : 'XXXX'
				});
			},
			error:function(){
				console.log('error loading data!');
			}
		});
	}


	var getXSDPage = function(o){
		$('.gen-service-panel#target').removeAttr('package');
		$('.gen-service-panel#target').removeAttr('package');
		
		$('.gen-service-panel#'+o.id+' .content').html('').XMLTransform({
			xml           : GEN.UTILS.link_service_xsd+'?p_code='+o.code+'&p_tipo='+o.type,
			xsl           : GEN.path+'/util/IGRP-xsdToHtml.tmpl.xsl',
			excludePrefix : 'xs:',
			
			complete      : function(d){
				$('.gen-service-panel#target').addClass('confConnected');
				
				var sourceTitle  = 'SERVICE - '+o.code,
					targetTitle  = 'SERVICE - '+o.code,
					id 			 = o.type == 'RESP' ? 'target' : 'source',
					pagId 		 = GEN.DETAILS.id;

				$('.gen-service-panel#source h3').text(sourceTitle);
				$('.gen-service-panel#target h3').text(targetTitle);

				var contents = GEN.getAllContents();

				setSourceFields({
					id 		 : id,
					contents : contents,
					title 	 : getTitlePage(contents)
				});

				if(o.type == 'RESP' && pagId != action){
					_getPageJSON(id);
				}

				//setSourceFields(contents,id);

							
				if (o.showModal)
					$('#gen-service-mapper').modal('show');
				else{
					o.field.SET.service({
						code 			: o.code,
						desc 			: $('#service_desc').val() ? $('#service_desc').val() : o.code,
						proc 			: $('#service_proc').val() ? $('#service_proc').val() : o.proc,
						connectionsReq 	: [],
						fieldsReq 		: getFieldsServices('target','REQ'),
						connectionsRes 	: [],
						fieldsRes 		: getFieldsServices('target','RESP'),
						package  		: $('.gen-service-panel#target').attr('package') 
					});
					service.checkService(o.field);
				}
				
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
					
				},600);
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
					proc       : field.proprieties.service && field.proprieties.service.proc ? field.proprieties.service.proc : '',
					connectionsReq: [],
					fieldsReq  	  : [],
					connectionsRes: [],
					fieldsRes 	  : []
				},
				setter : function(){
					var desc   = field.GET.service().desc || '',
						proc   = field.GET.service().proc || '',
						code   = field.GET.service().code || '',
						holder = $('<div class="gen-btn-service"></div>');
					var lookup = $('<div class="input-group">'+
						'<input type="hidden" value="'+code+'" id="service_code" name="p_toolbar_tformservico"/>'+
						'<input type="hidden" value="'+proc+'" id="service_proc" name="p_toolbar_tformservproc"/>'+
						'<input type="text" value="'+desc+'"  class="form-control gen-lookup" rel="page_service" id="service_desc" name="p_toolbar_tformservdesc"/>'+
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
								code 			: '',
								proc 			: '',
								desc 			: '',
								urlReq			: '',
								urlRes 			: '',
								connectionsReq  : [],
								fieldsReq 		: [],
								connectionsRes  : [],
								fieldsRes 		: [],
								package  		: ''	
							});
						};

						service.checkService(field);
					});

					$('#service_code',lookup)[0].lookupCallback = function(obj){

						getXSDPage({
							code        : obj.val(),
							proc        : $('#service_proc').val() ? $('#service_proc').val() : '',
							type        : 'REQ',
							id 			: 'target',
							connections : [],
							showModal 	: false,
							field 		: field
						});
					}

					req.on('click',function(){

						getXSDPage({
							code        : field.GET.service().code,
							type        : 'REQ',
							id 			: 'target',
							showModal 	: true,
							connections : field.GET.service().connectionsReq && field.GET.service().connectionsReq[0] ? field.GET.service().connectionsReq :[],
							onConfirm   : function(c,jsC){
								
								field.SET.service({
									code 			: field.GET.service().code,
									desc 			: field.GET.service().desc,
									proc 			: field.GET.service().proc,
									connectionsReq 	: c,
									fieldsReq 		: getFieldsServices('target','REQ'),
									connectionsRes 	: field.GET.service().connectionsRes,
									fieldsRes 		: field.GET.service().fieldsRes,
									package  		: $('.gen-service-panel#target').attr('package')
								});

							}
						});
						return false;
					});

					res.on('click',function(){

						getXSDPage({
							code        : field.GET.service().code,
							type        : 'RESP',
							id 			: 'source',
							showModal 	: true,
							connections : field.GET.service().connectionsRes && field.GET.service().connectionsRes[0] ? field.GET.service().connectionsRes :[],
							onConfirm   : function(c,jsC){
								
								field.SET.service({
									code 			: field.GET.service().code,
									desc 			: field.GET.service().desc,
									proc 			: field.GET.service().proc,
									connectionsReq 	: field.GET.service().connectionsReq,
									fieldsReq 		: field.GET.service().fieldsReq,
									connectionsRes 	: c,
									fieldsRes 		: getFieldsServices('target','RESP'),
									package  		: $('.gen-service-panel#target').attr('package')
								});
							}
						});
						return false;
					});

					holder.append([lookup,req,res]);
					
					setTimeout(function(){
						service.checkService(field);
					},50);
					
					return holder;
				}
			},
			setOnConfirm : false
		});	
	}


	var setSourceFields = function(p){
		var ul   = $('<ul class="global tree"/>');

		/*p.contents.forEach(function(c){

			var hasChild = c.fields[0] ? true : false;

			if(hasChild){
				var pClass   = hasChild    ? 'has-child' : '';
				var tag      = c.container.GET.tag();
				var li       = $('<li type="'+c.container.GET.type()+'" name="'+tag+'" gen-id="'+c.container.GET.id()+'" class="'+pClass+'"><span class="row-symbol"/><span class="row-name">'+tag+'</span></li>');
				var ulChild  = $('<ul class="row child"/>');
				var fCount   = 0; 

				if (c.container.hasTableRows)
					ulChild.attr('parent',tag);

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
		});*/
		if (p.contents) {
			
			p.contents.forEach(function(c){

				var hasChild = c.fields[0] ? true : false,
					type 	 = c.container.GET ? c.container.GET.type() : c.container.type;

				if(hasChild && type != 'toolsbar'){
					var pClass   = hasChild    	   ? 'has-child' : '',
						tag      = c.container.GET ? c.container.GET.tag() : c.container.tag,
						genId 	 = c.container.GET ? c.container.GET.id()  : tag,
						li       = $('<li type="'+type+'" name="'+tag+'" gen-id="'+genId+'" class="'+pClass+'"><span class="row-symbol"/><span class="row-name">'+tag+'</span></li>'),
						ulChild  = $('<ul class="row child"/>'),
						fCount   = 0; 

					if (type == 'table' || type == 'separatorlist' || type == 'formlist')
						ulChild.attr('parent',tag);

					if (type == 'separatorlist' || type == 'formlist') {
						ulChild.append('<li type="hidden" name="'+tag+'_id" gen-id="'+genId+'"><span class="row-symbol"/><span class="row-name">'+tag+'_id</span></li>');
						ulChild.append('<li type="hidden" name="'+tag+'_del" gen-id="'+genId+'"><span class="row-symbol"/><span class="row-name">'+tag+'_del</span></li>');
					}

					c.fields.forEach(function(f){
						var fType = f.GET ? f.GET.type() : f.properties.type;
						if(fType != 'button' && fType != 'separator'){
							var tagF 	= f.GET ? f.GET.tag() : f.properties.tag,
								fGenId 	= f.GET ? f.GET.id() : tagF,
								liF  	= $('<li type="'+fType+'" name="'+tagF+'" gen-id="'+fGenId+'"><span class="row-symbol"/><span class="row-name">'+tagF+'</span></li>');
							
							ulChild.append(liF);

							if (type == 'separatorlist' || type == 'formlist') {
								ulChild.append('<li type="hidden" name="'+tagF+'_fk_desc" gen-id="'+fGenId+'"><span class="row-symbol"/><span class="row-name">'+tagF+'_fk_desc</span></li>');
							}

							fCount++;
						}
					});
					

					li.append(ulChild);

					if(fCount>0)
						ul.append(li)
				}
			});
		}

		var obj = $('.gen-service-panel#'+p.id);

		if(p.package)
			obj.attr('package',p.package);

		if(p.title)
			$('h3',obj).html(p.title);

		$('.content',obj).html('').append(ul);
	}

	var setFieldsServices = function(p){
		var found = p.arr.some(function (el) {
		    return el.to === p.name;
		});
		if (!found){
			p.arr.push({to:p.name,from:p.connected,type:p.type});
		}
	};

	var getFieldsServices = function(id,type){
		var fieldsServices 	= [],
			auxParent 		= '',
			length 			= 0,
			auxId 			= type == 'REQ' ? 'source' : 'target';//id == 'target' ? 'source' : 'target';

		$('#'+id+' .global ul.row li:not([name="mimetype"])').not('.has-child').each(function(i,e){
			var name   		= $(e).attr('name'),
				parent 		= $(e).parents('ul:first').attr('parent'),
				connected 	= $(e).attr('connected') ? $(e).attr('connected') : '',
				type 		= $(e).attr('type') ? $(e).attr('type') : '';

			if (connected != '' && type == ''){
				var connectedObj = $('#'+auxId+'  .global li[name="'+connected+'"]');
				type = connectedObj.attr('type') ? connectedObj.attr('type') : type;
			}
			
			if (parent) {
				//type:$(e).parents('li.has-child:first').attr('type')

				if(auxParent != parent){
					/*var obj 	= $('#'+id+' .global li[name="'+parent+'"]'),
					auxConnected 	= obj.attr('connected') ? obj.attr('connected') : '',
					auxType 		= '';
				
					if (auxConnected != ''){
						var auxObj 	= $('#'+auxId+' .global li[name="'+auxConnected+'"]');
						auxType 	= auxObj.attr('type') ? auxObj.attr('type') : auxType;
					}*/
					var _connected = $(e).parents('li.has-child:first').attr('connected') ? $(e).parents('li.has-child:first').attr('connected') : '';

					length 					= fieldsServices.length;
					fieldsServices[length] 	= [];
					auxParent  				= parent;
					fieldsServices[length].push({to : parent,from : _connected ,type : $(e).parents('li.has-child:first').attr('type')});
				}

				setFieldsServices({
					arr 		: fieldsServices[length],
					name 		: name,
					connected 	: connected,
					type 		: type
				});
			}else{
				setFieldsServices({
					arr 		: fieldsServices,
					name 		: name,
					connected 	: connected,
					type 		: type
				});
			}
		});

		//console.log(fieldsServices);

		if (type == 'RESP') {
			if(!$('#source .global ul.row li:not([name="mimetype"])')[0])
				fieldsServices = [];
		}

		return fieldsServices;
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