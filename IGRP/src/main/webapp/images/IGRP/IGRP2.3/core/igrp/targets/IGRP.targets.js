var mWindow = null,
	mUrl 	= null;
	
(function($){
	if($ && $.IGRP && !$.IGRP.targets){
		
		var form ;

		var confirmText = '';

		var ev = $.IGRP.events;

		ev.declare( ['target-click','submit-ajax','submit','before-change','element-transform'] );

		//confirm
		var confirm = function(p){
			
			setConfirmModal(function(){

				window.location.replace(p.url);

			},p);

			return false;	
		};
		//close
		var close = function(){

			window.opener = top;

			window.close();

			return false;
		};
 		//back
 		var back = function(){

 			window.history.back();

 			return false;
 		};
 	
 		//alert_submit
 		var alert_submit = function(p){
 			
 			setConfirmModal(function(){
				submit(p);
			},p);

			return false;
 		};

 		//submit page
 		var submit = function(p){
 		
 			p = p || {};
 			
 			$.IGRP.utils.clearSubmittables();
 			
 			try{

	 			var sform     = $.IGRP.utils.getForm(),
	
	 				fields    = $.IGRP.utils.getFieldsValidate(sform),//$('input[required],select[required],textarea[required]',form).not('.no-validation'),
	 				
	 				validate  = p.validate === false ? false : true,
	 				
	 				action    = $.IGRP.utils.getSubmitParams(p.url,p.form,p.scrollTo);
	 			
	 			fields.addClass('submittable');
 			
 				if(p.clicked && p.clicked[0]){

					if(p.clicked.parents('li.operationTable')[0]){
						validate = false;
					}
					else if(!p.clicked.is('[notvalidatefields]') || ( p.clicked.is('[notvalidatefields]') && p.clicked.attr('notvalidatefields') !== 'true') ){
						
						validate = true;

					}else if (p.clicked.is('[notvalidatefields]') && p.clicked.attr('notvalidatefields') === 'true'){

						validate = false;
					}
				}

 				form.attr('validateCtrl',validate);

				form.attr('action',action).submit();

 			}catch(e){
 				console.log(e);
 			}
 			
			return false;
 		};
 		//submit form
 		var submit_form = function(p){

 			$.IGRP.utils.clearSubmittables();
 			
 			var parent 	  = p.clicked && p.clicked[0] ? $(p.clicked.parents('.gen-container-item')[0]) : false,

 				actionURL = p.url || $("input[name='p_env_frm_url']").val() || window.location.href,

 				sform     = parent && parent.find('[role="form"]')[0] ? parent.find('[role="form"]') : $.IGRP.utils.getForm(),

 				fields    = $.IGRP.utils.getFieldsValidate(sform),//$('input[required],select[required],textarea[required]',form).not('.no-validation'),
 				
 				validate  = p.validate === false ? false : true,
 				
 				action    = $.IGRP.utils.getSubmitParams(actionURL,p.form,p.scrollTo);

 				fields.addClass('submittable');

				if( p.clicked && p.clicked[0] && p.clicked.is('[notvalidatefields]') && p.clicked.attr('notvalidatefields') === 'true')
					validate = false;
				else
					validate = true;

 				if(parent.parents('.gen-tab-holder')[0]){
 					var tab     = parent.parents('.gen-tab-holder').first(),
 						tabname = tab.attr('item-name'),
 						tabCtrl = $('.'+tabname+'Ctrl');
 						tabCtrl.addClass('submittable');
 				}

 			try{
 				
 				form.attr('validateCtrl',validate);

				form.attr('action',action).submit();

 			}catch(e){
 				console.log(e);
 			}
 			
			return false;
 		};
 		
 		var _submit_popup = function(p){

			var valid = p?.validate ? p.validate :  p.fields.valid();
 			
 			if(valid){

				clearErrors(form);
 				
 				form.attr({'target' : 'winIGRP', 'action' : p.url});

 				$.IGRP.utils.openWin({
 					url    : p.url,
	 				width  : 980,
	 				height : 520,
	 				win    : 'winIGRP'
 				});

 				form.submit().removeAttr('target action');
 			}
 		};
 		
 		//submit_popup
 		var submit_popup = function(p){

 			p.fields = $.IGRP.utils.getFieldsValidate(); //$('input,select,textarea',form).not('.no-validation');
 			
 			_submit_popup(p);

			return false;
		};

		var afterSubmitAjax = function (p) {
			var xml = p.xml,
							
				hasRefreshAttr = p.clicked[0].hasAttribute("refresh-components"),
				
				refresh_components = hasRefreshAttr ? p.clicked.attr("refresh-components") : null;

				nodes 	 = hasRefreshAttr && refresh_components != '' ? refresh_components.split(',') : [];
			
			if( !hasRefreshAttr ){
			
				$('.table, .IGRP-highcharts',p.sform).each(function(id,el){
					
					nodes.push($(el).parents('.gen-container-item').attr('item-name'));
					
				});
			}

			if(nodes[0]){
				
				$.IGRP.utils.xsl.transform({
					xsl     : $.IGRP.utils.getXMLStylesheet(xml),
					xml     : xml,
					nodes   : nodes,
					clicked : p.clicked,
					complete: function(res){

						$.IGRP.events.execute('submit-complete',{})

						p.clicked.removeAttr("disabled");
						
					}
				});
				
			}else{
				p.clicked.removeAttr("disabled");
				$.IGRP.events.execute('submit-complete',{})
			}

			$.IGRP.utils.message.handleXML(xml);
		};

		var clearErrors = function (f) {
			$("label.error",f).hide();
  			$(".error",f).removeClass("error");
		}
		
		//submit ajax
		var submit_ajax = function(p){
			
			p.clicked.attr("disabled","disabled");
			
			var sform     	= $.IGRP.utils.getForm(),
				fields    	= $.IGRP.utils.getFieldsValidate(sform),
				action    	= $.IGRP.utils.getSubmitParams(p.url,sform,p.scrollTo),
				events 		= p.clicked[0].events,
				valid 		= p?.validate ? p.validate :  fields.valid();
				
			if (valid) {

				clearErrors(sform);

				ev.execute('submit-ajax',{
					clicked    : p.clicked,
					url  	   : action,
					valid 	   : valid
				});
				
				var arrayFiles 	= $.IGRP.utils.submitPage2File.getFiles(),
					pArrayItem  = sform.find('*').not(".notForm").serializeArray();
				
				if(events){
					events.execute('before-submit_ajax',{
						pArrayItem : pArrayItem,
						clicked    : p.clicked,
						url  	   : action
					});
				}
				
				$.IGRP.utils.submitStringAsFile({
					pParam 		: {
						pArrayFiles : arrayFiles,
						pArrayItem 	: pArrayItem
					},
					pUrl   		: action,
					pNotify 	: false,
					pComplete 	: function(resp){

						//$.IGRP.utils.loading.hide();

						try{

							var xml = resp.responseXML || $($.parseXML(resp.response));

							afterSubmitAjax({
								xml 	: xml,
								clicked : p.clicked,
								sform   : sform
							});

						}catch(e){
							var str = resp.response;
							if(str.indexOf('<html') != -1){
								str = str.substring(str.indexOf('<html'),str.length);
							}
							alert = $.IGRP.utils.message.alert({
								type : 'danger',
								text : $.IGRP.utils.htmlDecode(str)
							});
							
							//$.IGRP.utils.loading.hide();
							
							p.clicked.removeAttr("disabled");
						}

						ev.execute('submit-ajax-complete',{
							xml : xml
						});

						if(events){

							events.execute('success-submit_ajax',{
								xml : xml
							});
						}
					}
				});
			}else{
				$.IGRP.components.form.hasFieldsError();
				
				p.clicked.removeAttr("disabled");
			}
		};
		
		var listAssociation = function(p){
			
			var clicked = p.clicked;
			
			var clickedID = clicked.attr('id');
			
			var sourceInput     = $('.list-association-source [name*="p_'+clickedID+'_association_rel"]');
			
			if(sourceInput[0]){
				
				var ListSource = sourceInput.parents('.list-association-source').first();

				$.IGRP.components.ListAssociation.set({
					
					source : ListSource,
					
					target : p.clicked.parents('.gen-container-item[item-name]'),
					
					row    : p.clicked.parents('tr').first(),
					
					clicked : p.clicked
					
				});
				
			}
			
			return false;
			
		};
		
		//submit not validate
		var submit_notvalidate = function(p){
			
			p.validate = true;
			
			submitpage2file(p);

			return false;
		};
		
		//var associatedList
		
		var submitpage2file = function(p){
			
			p.clicked.attr('disabled','disabled');
			
			var sform     	= $.IGRP.utils.getForm(),
				fields    	= $.IGRP.utils.getFieldsValidate(sform),
				events 		= p.clicked[0].events,
				valid   	= p?.validate ? p.validate :  fields.valid();;

			if (valid) {
				
				$.IGRP.utils.loading.show();

				clearErrors(sform);

				if(events){
					events.execute('before-submitpage2file',{
						fields 	: fields,
						clicked : p.clicked,
						url  	: p.url
					});
				}

				$.IGRP.utils.submitPage2File.onSubmit({
					url 			: p.url,
					serialize   	: sform,
					notify 			: false,
					complete    	: function(resp){
						
						if(resp){
							//$.IGRP.utils.message.handleXML(resp.responseXML);

							var xml = resp.responseXML || $($.parseXML(resp.response));

							afterSubmitAjax({
								xml 	: xml,
								clicked : p.clicked,
								sform   : sform
							});
							
							if(events){
								events.execute('success-submitpage2file',{
									resp 	: resp
								});
							}
						}
						
						p.clicked.removeAttr('disabled');
						
						$.IGRP.utils.loading.hide();
					}
				});

				if(events){
					events.execute('after-submitpage2file',{
						fields 	: fields,
						clicked : p.clicked,
						url  	: p.url
					});
				}
			}else{
				p.clicked.removeAttr('disabled');
				
				$.IGRP.components.form.hasFieldsError();
			}
		};
		
		
		//filter
		var filter       = function(p){

			var filterLetter = p.url.split("=");

			var actionURL	 = $("input[name='p_env_frm_url']").val() || window.location.href;

			var action   	 = $.IGRP.utils.getSubmitParams(actionURL,form,p.scrollTo); 	

			var table  	     = $(p.clicked.parents('.gen-container-item')[0]);

			var tableName	 = table.attr('item-name');

			/*if($('input[name="'+filterLetter[0]+'"]')[0])
				$('input[name="'+filterLetter[0]+'"]').remove();

			$.IGRP.utils.createHidden({
				name  : filterLetter[0],
				value : filterLetter[1]
			});*/

			$.IGRP.utils.transformXMLNodes({
				
				nodes : [tableName],

				url   : $.IGRP.utils.getUrl(action)+filterLetter[0]+'='+filterLetter[1],

				data  : form.serialize(),

				success:function(c){
		
					var table = $('.gen-container-item[item-name="'+tableName+'"]');
						
					if ($.IGRP.components.tableCtrl.resetTableConfigurations)
						$.IGRP.components.tableCtrl.resetTableConfigurations(table);
					
					$('.igrp-table-filter [filter-item="'+filterLetter[1]+'"]',table).addClass('active');
						
				},

				error:function(){
					console.log('filter error line 409 IGRP.targets.js')
				}

			});

			/*submit({
				url      : actionURL,
				validate : false
			});*/

			return false;
		};
		
		//self
		var _self        = function(p){

			$.IGRP.utils.loading.show();

			var url 	= p.url,
				param 	= '';

			if($('input.menuCtrl')[0]){
				param = $('input.menuCtrl').serialize();
				
				if(param)
					url = $.IGRP.utils.getUrl(url)+param;
			}

			window.location.href = url;
			
			return false;
		};
		//self
		var _link       = _self;
		//specific
		var specific     = function(p){
			_self(p);
			return true;
		};
		//new tab
		var _newtab      = function(p){
			var name = '_blank';

			if($(p.clicked)[0]){

				var element = $(p.clicked).parents('li');

				if(element[0]){
					var col = $('td:first',element.parents('tr:first'));
					
					name = element.is('[id]') ? element.attr('id') : element.attr('trel');
					
					name = col[0] ? name+col.attr('data-row') : name;
				}
				else
					name = $(p.clicked).attr('position');
			}
				
			window.open(p.url,name);
			
			return false;
		};
		//blank (popup)
		var _blank       = function(p){
			var d = new Date();
			$.IGRP.utils.openWin({
				url    : setTargetParameter(p.url),
				width  : 980,
				height : 520,
				win    : 'IGRP-'+d.getMilliseconds()
			});
			return false;
		};
		
		//_openclose (popup open and automatic close)
		var _openclose = function(p){
			
			form.attr({'target' : 'IGRP-openclose', 'action' : p.url});
			
			var myWindow = $.IGRP.utils.openWin({
				url    : p.url,
				width  : 30,
				height : 30,
				win    : 'IGRP-openclose'
			});
			
			form.submit().removeAttr('target action');

			setTimeout(function () { myWindow.close();}, 6000);

			return false;
		};
		
		//export all - table
		var exportAll       = function(p){
			console.log('EXPORT ALL')
			return false;
		};

		//blank (popup)
		
		var modal       = function(p){
			
			var url = setTargetParameter(p.url);
			
			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0){
				
				mWindow = mWindow ? mWindow : window;
			
				mUrl = url;
			}
			
			$.IGRP.components.iframeNav.set({
				url    :url,
				clicked:p.clicked
			});
			
			return false;
			
		};

		var right_panel       = function(p){
			
			var url = setTargetParameter(p.url);
			
			p.url = url;

			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0){
			
				mWindow = window;
			    mUrl = url;
			}

			$.IGRP.components.rightPanel.set(p);
			
			return false;
		};
		
		var right_panel_submit       = function(p){

			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0)
				mWindow = window;
			
			p.url = setTargetParameter($.IGRP.utils.getUrl(p.url)+form.serialize());

			$.IGRP.components.rightPanel.set(p);
			
			return false;
		};

		var mpsubmit  = function(p){
			
			var formData = p.clicked.parents('table tbody tr')[0] ? '' : form.serialize(),
			
				fields = $.IGRP.utils.getFieldsValidate(),
				
				valid  = formData != '' ? (p?.validate ? p.validate : fields.valid()) : true;

			if(valid){

				clearErrors(form);
			
				if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0)				
						mWindow = window;
				
				$.IGRP.components.iframeNav.set({
					url    : setTargetParameter($.IGRP.utils.getUrl(p.url)+formData),
					clicked:p.clicked
				});
			}
			
			return false;
		};

		var modalpopup = modal;

		var setConfirmModal = function(onClick,p){
			
			var holder 		= $(p.clicked).parents('tr:first'),
				confirmText = '';

			if(holder[0]){
				confirmText = $('#confirm-text').text();
				confirmText.split(' ').forEach(function(str){
					if(str.indexOf('{') !== -1){
						var e = str.substring(1,(str.length - 1)),
						text  = $('td[item-name="'+e+'"] span',holder).text();
						
						confirmText = confirmText.replace(str,text);
					}
				});
			}

			if($(p.clicked).is('[label-confirm]')){

				var labelConfirm = $(p.clicked).attr('label-confirm');

				confirmText = labelConfirm && labelConfirm != undefined ? labelConfirm : confirmText;
			}
			 

			$.IGRP.components.globalModal.set({
				rel    : 'confirm-target',
				content: confirmText,
				buttons: [
					{
						class   :'success',
						icon    :'check',
						text    :'Confirmar',
						onClick :function(e){
							try{ onClick(); }catch(err){ console.log(err); }
							$.IGRP.components.globalModal.hide();
							return false;
						}
					},
					{
						class :'danger',
						icon  :'times',
						text  :'Cancelar',
						attr  :{ 
							"data-dismiss":"modal" 
						}
					}
				]
			});
		};

		var changesrc = function(p){

			var targetFields = p.clicked.attr('target-fields');

			if(targetFields){

				var tfieldsArr = targetFields.split(',');

				tfieldsArr.forEach(function(f,i){

					var holder = $('[item-name="'+f+'"]');

					var field  = $('[src]',holder);

					field.attr('src','');

					var fclone = field.clone();

					fclone.attr('src',p.url);

					field.replaceWith(fclone);

					$.IGRP.components.iframes.init( holder );

				});
			}
		};

		var closerefresh = function(p){
			
			try{
				
				//var popup 	= window.opener ? true : false,

				var _window = window.parent ? window.parent : window.opener,
					url 	= null;

					_window = _window.frames['head_filho'] || _window;
					
				if (mWindow) {
					_window = mWindow;
					
					//popup 	= false;
					mWindow = null;
					
					if(mUrl){
						url 	= mUrl;
						mUrl 	= null;
					}
				}
				
				/*if(popup)
					close();*/
				
				_window.$.IGRP.targets.submit.action({
					url 	 : $('#p_env_frm_url',$(_window.document.forms[0])).val() || url,
					validate : false
				});
					
			}catch(e){console.log(e);}
		};
		
		var gisViewCoords = function(p){
			
			var url 	        = setTargetParameter(p.url),
				
				row 		    = p.clicked.parents('tr').first(),
			
				map		        = p.clicked.attr('map-name'),
				
				propertiesNames = p.clicked.attr('properties'),
				
				coords  		= p.clicked.attr('coordinates'),
				
				properties 		= row[0] ? $.IGRP.components.tableCtrl.exportRow( row, propertiesNames ) : {},

				latLngArr 		= coords ? coords.split(',') : null,
						
				latLng			= latLngArr ? [latLngArr[0]*1, latLngArr[1]*1 ] : null,
	
				mapSettings 	= {
				
					id   : map,
					
					fullscreen : true,
					
					graphics : [
						
						{
							
							infoWindow : true,
							
							features : [
								
								{

									properties : properties,
									
									geometry : {
										
										type : 'Point',
										
										coordinates : latLng
										
									}
									
								}
							]
							
						}
						
					]
					
				};
				
				$.IGRP.components.iframeNav.set({
					
					url     : url,
					
					clicked : p.clicked,
					
					params  : {
						
						gis_map_settings : mapSettings
						
					}
					
				});
			
			return false;
		};
		
		var gisGetCoords = function(p){
			
			var url 	    = setTargetParameter(p.url),
				
				map		    = p.clicked.attr('map-name'),
				
				inputName   = p.clicked.attr('input-name'),
				
				latLngVal 	= $('[name="'+inputName+'"]').val(),
				
				latLngArr 	= latLngVal ? latLngVal.split(',') : null,
				
				latLng		= latLngArr ? [latLngArr[0]*1, latLngArr[1]*1 ] : null,
				
				mapSettings = {
				
					id   : map,
					
					fullscreen : true,
					
					widgets : [
						
						{
							
							type : 'getcoordinates',
							
							title : 'Get Coordinates',
							
							active : 'true',
							
							control : {
								
								button : false
								
							},
							
							html : true,
							
							js : true,
							
							position : 'top',
							
							data : {
								
								parent_field_name : inputName,
								
								latLng 			   : latLng
								
							}
							
						}
						
					]
					
				}
			
			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0)
				
				mWindow = window;

			//url = url+'&gis_map_settings='+encodeURI(JSON.stringify( mapSettings ));

			$.IGRP.components.iframeNav.set({
				
				url    :url,
				
				clicked:p.clicked,
				
				params : {
					
					gis_map_settings : mapSettings
					
				}
				
			});
			
			return false;
		};
		
		var download = function(p){
			
			p.clicked.attr("disabled","disabled");
			
			form.addClass('download');
			
			$.IGRP.targets.submit.action({
				url 	 : p.url,
				validate : false,
				clicked  : p.clicked
			});
			
			setTimeout(function(){

				p.clicked.removeAttr("disabled");
				
				form.removeClass('download');

			},500);
		};

		changesrc.showContents = function(holder){

			setTimeout(function(){

				$.IGRP.utils.loading.hide(holder);

			},300);
		};
		
		var sharpadbclient = function(p){
			if($.IGRP.components.sharpadbclient.run)
				$.IGRP.components.sharpadbclient.run(p);
		};
		
		var handleXMLMessages = function(xml){

			try{

				var alert = '',

					debug = '';

				$.each($(xml).find('messages message'),function(i,row){

					var type = $(row).attr('type');

					if (type != 'debug' && type != 'confirm') {

						type = type == 'error' ? 'danger' : type;

						alert += $.IGRP.utils.message.alert({
							type : type,
							text : $(row).text()
						});

					}else if(type == 'debug'){
						debug += '<li value="'+$(row).text()+'">'+
							$.IGRP.utils.htmlDecode($(row).text())+
						'</li>';
					}
				});

			}catch(err){
				
				console.log(err)
			}

			
			$('.igrp-msg-wrapper').html(alert);

			$('#igrp-debugger .igrp-debug-list').html(debug);
		}

		var configTargetsEvents = function(){
			//submit ajax
			$.each($('a[target], button[target]'),function(i,e){
				e.events = $.EVENTS(['submit-ajax-complete','submit-ajax-error']);
				
				var target = $(e).attr('target');
				
				e.events.declare(['before-'+target,'success-'+target,'after-'+target]);
			});
		};

		var remoteList = function(p){

		};

		var formListLookup = function(p){

			try{

				var table = $('#igrp-contents table').first();

				if(table[0]){

					var selecteds = $('.checkdcontrol',table).filter(':checked'),

						Arr 	  = [],

						form      = null,

						target    = null,

						field = null;

					selecteds.each(function(i, e){

						var tr 			= $(e).parents('tr'),

							object      = tr,

							paramsCount = 1*tr.attr("CTX_PARAM_COUNT")+1,

		  					formName    = tr.attr("CTX_FORM") ? tr.attr("CTX_FORM") : 'formular_default',

		  					formIdx     = tr.attr("CTX_FORM_IDX") ? parseInt(tr.attr("CTX_FORM_IDX")) : 0;

		  				form = window.opener ? window.opener.document.forms[formName] : window.parent.document.forms[formName];

		  				if(form){

		  					list  = {};

		  					for(var i = 1; i < paramsCount; i++){

		  						var vOp   = object.attr("CTX_P"+i).split("=");
		  						
		  						
		  						if(vOp[0]){

		  							var name  	   = vOp[0].replace("p_", "").replace("_fk",""),

		  								value 	   = vOp[1],

		  								inputField = $( '*[name="p_'+name+'_fk"]', form );
		  							
		  							if(!target || !target[0])

		  								target = inputField.parents('table').first();

		  							list[name] = value;

		  						}

		  					}

		  					Arr.push(list);

		  				}

					});

					if(target && target[0] && target[0]._import){
						
						var merge = target.parents('.box').first().hasClass('merge-import-data');
						
						target[0]._import(Arr, merge);
						
					}

					if(window.parent)
						window.parent.$.IGRP.components.iframeNav.hide();
					
					if(window.opener)
						window.close();
					
				}

			}catch(error){

				console.log(error);
			
			}

			return false;

		};
		
		var setTargetParameter = function(url){
			
			if(url){
				var localHostName = location.hostname,
					urlHostName   = $.IGRP.utils.url.getHostName(url);

					console.log('localHostName => '+localHostName);
					console.log('urlHostName => '+urlHostName);

				if(url.indexOf('target=_blank') == -1 && localHostName === urlHostName){
					var symb = getParameterSymbol(url);
					url+=symb+'target=_blank';
				}
			}
			return url;
		}
		
		var getParameterSymbol = function(url){
		
			var symb = "&";
			
			if(url.indexOf('?') == -1)
				symb = '?';
			
			return symb;
		}		
		

		$.IGRP.targets = {
				
			void  : {
				
				label : 'Void',
				
				action : function(){
					return false;
				}
				
			},
			
			download  : {
				
				label : 'Download',
				
				action : download
				
			},
			
			confirm      : {

				label  : 'Confirmar',

				action : confirm

			},
			
			submit       : {

				label : 'Submit',

				action : submit,
				
				type  : 'submit'

			},
			modal 	     : {

				label : 'Modal',

				action : modal

			},
			
			mpsubmit   : {

				label : 'Submit Modal',

				action : mpsubmit,
				
				type  : 'submit'

			},
			right_panel 	     : {

				label : 'Right Panel',

				action : right_panel

			},
			right_panel_submit   : {

				label : 'Submit Right Panel',

				action : right_panel_submit

			},
			_blank       : {

				label : 'Popup',

				action : _blank

			},

			formListLookup : {

				label : 'Set FormList Values',

				action : formListLookup

			},
			
			listAssociation : {
				
				label : 'List Association',
				
				action : listAssociation
				
			},
			
			submit_popup : {

				label : 'Submit Popup',

				action : submit_popup,
				
				type  : 'submit'

			},
			submit_form  : {

				label : 'Submit Form',

				action : submit_form,
				
				type  : 'submit'

			},

			submit_ajax  : {

				label : 'Submit Ajax',

				action : submit_ajax,
				
				type  : 'submit'

			},
			
			submit_notvalidate : {
				label : 'Submit Not Validate',

				action : submit_notvalidate
			},
			
			submitpage2file : {
				label : 'Submit Page to File',

				action : submitpage2file,
				
				type  : 'submit'
			},

			alert_submit : {

				label : 'Alert Submit',

				action : alert_submit,
				
				type  : 'submit'

			},	
			_link       : {

				label : 'Link',

				action : _link,

				selectable : false

			},		
			
			'gis:getCoordinates' : {
				
				label : 'Get Coordinates',
				
				action : gisGetCoords
			},
			
			'gis:viewCoordinates' : {
				
				label : 'View Coordinates',
				
				action : gisViewCoords
			},
			
			_openclose 	: {

				label 	: 'Popup Open Close',

				action : _openclose

			},

			
			filter       : {

				label : 'Filter',

				action : filter,

				selectable : false

			},

			_self        : {

				label : 'Self',

				action : _self

			},
			
			sharpadbclient: {
				label: 'Sharp Adb Client',

				action: sharpadbclient
			},

			specific     : {

				label : 'Specific',

				action : specific,

				selectable : false

			},

			_newtab      : {

				label : 'New Tab',

				action : _newtab

			},

			/*exportall    : {

				label : 'Export All',

				action : exportAll

			},*/

			
			_close       : {

				label  : 'Close',

				action : close

			},

			closerefresh : {

				label  : 'Close and Refresh Parent',

				action : closerefresh

			},

			_back        : {

				label  : 'Back',

				action : back

			},


			changesrc    : {

				label : 'Change Src',

				action : changesrc

			}/*,

			remotelist    : {

				label : 'Remote Lista',

				action : remoteList

			}*/
		};


		$.IGRP.on('init',function(){
			
			form    = $.IGRP.utils.getForm();

			doc 	    = $(document);
			
			confirmText = $('#confirm-text').text();
			
			var target = '_blank',
			
				_this  = null;

			configTargetsEvents();

			/* target clicks controller */
			doc.on('click','a[target], button[target], [href][target]',function(e){
				
				e.preventDefault();

				target       	= $(this).attr('target')  ? $(this).attr('target'): '_blank';
						
				var url          = $(this).attr('fw_href') ? $(this).attr('fw_href') : $(this).attr('href');			
				
				var objTarget 	 = $.IGRP.targets[target];

				var targetAction = objTarget?.action ? objTarget.action : _blank,
				
				validate 		 = $(this).is('[notvalidatefields]') && $(this).attr('notvalidatefields') === 'true' ? true : false;
					
				_this 	     	 = $(this);

				console.log(validate);

				if(objTarget?.type === 'submit' && $.IGRP.info.isPublic){

					grecaptcha.ready(function() {

						grecaptcha.execute(rekey, {action: target}).then(function(token) {
							// Add your logic to submit to your backend server here.
							
							$.IGRP.utils.createHidden({
								name  : 'recaptcha-token',
								value : token,
								class : 'submittable'
							});

							$.IGRP.utils.createHidden({
								name  : 'recaptcha-secret-key',
								value : secretrekey,
								class : 'submittable'
							});

							ev.execute('target-click',{
								target  : target,
								url     : url,
								clicked : _this
							});
			
							$.IGRP.store.set({
								name : 'target-clicked',
								value: target
							});
							
							return targetAction({
								url      : url,
								target   : target,
								clicked  : _this,
								validate : validate
							});

						});
					});
					
				}else{

					ev.execute('target-click',{
						target  : target,
						url     : url,
						clicked : _this,
						validate : validate
					});
	
					$.IGRP.store.set({
						name : 'target-clicked',
						value: target
					});
	
					return targetAction({
						url     : url,
						target  : target,
						clicked : _this,
						validate : validate
					});
				}
			});
		

			/*form submit controller */
			form.on('submit',function(e){ 

				var validate  = form.attr('validateCtrl'),
					fields    = $.IGRP.utils.getFieldsValidate(),
					vfields   = fields.filter('.submittable'),//form.find('.submittable'),//$.IGRP.utils.getFieldsValidate(),
					canSubmit = true;
				
				if(validate != 'false')
					canSubmit = vfields.valid({
						exclude : '.no-validation, .IGRP_checkall' //hack for separator list on submit fields from form. 
					}) == 1 ? true : false;

				
				var eventCB = $.IGRP.events.execute('submit',{
					valid   : canSubmit,
					fields  : fields,
					event   : e,
					clicked : _this,
					target  : target
				});
				
				canSubmit = eventCB == false ? false : canSubmit;

				if (canSubmit){
					
					if(!form.attr('target') && !form.hasClass('download'))
						
						$.IGRP.utils.loading.show();
				}	
				else
					$.IGRP.components.form.hasFieldsError();
				
				//return false;
				return canSubmit;
					
			});

			//set targets on IGRP defaults
			/*var r = [];

			for(var t in $.IGRP.targets){

				r.push({
					value : t,
					label : $.IGRP.targets[t].label
				});
				
			}

			$.IGRP.defaults.buttons.targets = r;*/

			setTimeout(function(){
				
				$.IGRP.store.unset('target-clicked')
			
			},200);

			

		});
	}
})($);
