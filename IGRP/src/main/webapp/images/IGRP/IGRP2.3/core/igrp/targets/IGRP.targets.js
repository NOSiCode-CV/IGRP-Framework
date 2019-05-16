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
 			
 				if(p.clicked && p.clicked.parents('li.operationTable')[0])
 					
 					validate = false;

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

 				console.log(fields);

 				fields.addClass('submittable');

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
 		//submit_popup
 		var submit_popup = function(p){

 			var fields = $.IGRP.utils.getFieldsValidate(); //$('input,select,textarea',form).not('.no-validation');
 	
 			if(fields.valid())
 				$.IGRP.utils.openWin({
 					url    : setTargetParameter($.IGRP.utils.getUrl(p.url))+form.serialize(),
	 				width  : 980,
	 				height : 520,
	 				win    : 'IGRP'
 				});
 			
			return false;
		};
		//submit ajax
		var submit_ajax = function(p){
			
			p.clicked.attr("disabled","disabled");
			
			var sform     	= $.IGRP.utils.getForm(),
				fields    	= $.IGRP.utils.getFieldsValidate(sform),
				action    	= $.IGRP.utils.getSubmitParams(p.url,sform,p.scrollTo),
				events 		= p.clicked[0].events;
				
			if (fields.valid()) {
				
				$.IGRP.utils.loading.show();
				//console.log(p)
				ev.execute('submit-ajax',{
					clicked    : p.clicked,
					url  	   : action
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

							var xml = resp.responseXML || $($.parseXML(resp.response)),
							
							alert = '',

							debug = '',

							nodes 	 = [];

							$('.table, .IGRP-highcharts',sform).each(function(id,el){
								
								nodes.push($(el).parents('.gen-container-item').attr('item-name'));
							});

							$.IGRP.utils.xsl.transform({
								xsl     : $.IGRP.utils.getXMLStylesheet(xml),
								xml     : xml,
								nodes   : nodes,
								clicked : p.clicked
							});

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

						}catch(e){
							var str = resp.response;
							if(str.indexOf('<html') != -1){
								str = str.substring(str.indexOf('<html'),str.length);
							}
							alert = $.IGRP.utils.message.alert({
								type : 'danger',
								text : $.IGRP.utils.htmlDecode(str)
							});
							
							$.IGRP.utils.loading.hide();
							
							p.clicked.removeAttr("disabled","disabled");
						}

						$('.igrp-msg-wrapper').html(alert);

						$('#igrp-debugger .igrp-debug-list').html(debug);

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
		
		var submitpage2file = function(p){
			
			p.clicked.attr('disabled','disabled');
			
			var sform     	= $.IGRP.utils.getForm(),
				fields    	= $.IGRP.utils.getFieldsValidate(sform),
				events 		= p.clicked[0].events;;

			if (fields.valid()) {
				
				$.IGRP.utils.loading.show();

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
					//fileName    	: 'p_igrpfile',
					//contentType 	: 'plain/xml',
					//format		: 'xml',
					notify 			: true,
					complete    	: function(resp){
						if(resp){
							handleXMLMessages(resp);
							
								if(events){
									events.execute('success-submitpage2file',{
										resp 	: resp
									});
								}
						}
						
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

						$('.igrp-table-filter [filter-item="'+filterLetter[1]+'"]',table).addClass('active');
						
				},

				error:function(){
					console.log('filter error line 272 IGRP.targets.js')
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
				input 	= $('input.menuCtrl');

			if (input[0]) 
				url = $.IGRP.utils.getUrl(url)+input.attr('name')+'='+input.val();

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
			window.open(p.url,'_blank');
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
			var myWindow = $.IGRP.utils.openWin({
				url    : setTargetParameter($.IGRP.utils.getUrl(p.url))+form.serialize(),
				width  : 30,
				height : 30,
				win    : 'IGRP-openclose'
			});

			setTimeout(function () { myWindow.close();}, 6000);

			return false;
		};
		
		//export all - table
		var exportAll       = function(p){
			console.log('EXPORT ALL')
			return false;
		};

		//blank (popup)
		var mWindow = null,
			mUrl 	= null;
		
		var modal       = function(p){
			
			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0)
				
				mWindow = mWindow ? mWindow : window;
		
			var url = setTargetParameter(p.url);
			
			mUrl = url;
			
			$.IGRP.components.iframeNav.set({
				url    :url,
				clicked:p.clicked
			});
			return false;
		};

		var right_panel       = function(p){

			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0)
				
				mWindow = window;
			
			var url = setTargetParameter(p.url);
			
			p.url = url;
			
			mUrl = url;

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
			
			var formData = p.clicked.parents('table tbody tr')[0] ? '' : form.serialize();
			
			if (p.clicked && p.clicked.attr('close') && p.clicked.attr('close').indexOf('refresh') >= 0)				
				mWindow = window;
			
			$.IGRP.components.iframeNav.set({
				url    : setTargetParameter($.IGRP.utils.getUrl(p.url)+formData),
				clicked:p.clicked
			});
			
			return false;
		};

		var modalpopup = modal;

		var setConfirmModal = function(onClick,p){
			
			var holder = $(p.clicked).parents('tr:first');

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
			
			var params 	   = $.extend({},p),
			
				reloadType = params.type || 'refresh';
			
			try{

				var popup 	= window.opener || false,

					_window = popup || window.parent,

					_window = _window.frames['head_filho'] || _window,
					url 	= null;

				if (mWindow) {
					_window = mWindow;
					popup 	= false;
					mWindow = null;
					
					if(mUrl){
						url 	= mUrl;
						mUrl 	= null;
					}
				}
				
				if(popup)
				
					close();
				
				/*if(reloadType == 'refresh')
				 
				 	_window.location.reload();
					
				
				if(reloadType == 'refresh_submit'){
					
					submit({
						url 	 : $('#p_env_frm_url',$(_window.document.forms[0])).val() || _window.location.href
					});
				}*/
				
				_window.$.IGRP.targets.submit.action({
					url 	 : $('#p_env_frm_url',$(_window.document.forms[0])).val() || url,
					validate : false
				});
					
			}catch(e){null;}
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

		changesrc.showContents = function(holder){

			setTimeout(function(){

				$.IGRP.utils.loading.hide(holder);

			},300);
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

		  							var name  	   = vOp[0].replace("p_", ""),

		  								value 	   = vOp[1],

		  								inputField = $( '*[name="p_'+name+'_fk"]',form );

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
				if(url.indexOf('target=_blank') == -1){
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
			
			confirm      : {

				label  : 'Confirmar',

				action : confirm 

			},
			
			submit       : {

				label : 'Submit',

				action : submit

			},
			modal 	     : {

				label : 'Modal',

				action : modal

			},
			
			mpsubmit   : {

				label : 'Submit Modal',

				action : mpsubmit

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
			
			submit_popup : {

				label : 'Submit Popup',

				action : submit_popup

			},
			submit_form  : {

				label : 'Submit Form',

				action : submit_form

			},

			submit_ajax  : {

				label : 'Submit Ajax',

				action : submit_ajax

			},
			
			submitpage2file : {
				label : 'Submit Page to File',

				action : submitpage2file
			},

			alert_submit : {

				label : 'Alert Submit',

				action : alert_submit

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
			
			form        = $.IGRP.utils.getForm(),

			doc 	    = $(document),

			confirmText = $('#confirm-text').text();

			configTargetsEvents();

			/* target clicks controller */
			doc.on('click','a[target], button[target], [href][target]',function(e){
				
				e.preventDefault();
				
				var clicked 	 = $(this),
					target       = $(this).attr('target')  ? $(this).attr('target'): '_blank';
				
				var url          = $(this).attr('fw_href') ? $(this).attr('fw_href') : $(this).attr('href');			
				
				var targetAction = $.IGRP.targets[target] && $.IGRP.targets[target].action ? $.IGRP.targets[target].action : _blank;

				ev.execute('target-click',{
					target  : target,
					url     : url,
					clicked : this
				});

				$.IGRP.store.set({
					name : 'target-clicked',
					value: target
				});
				
				return targetAction({
					url     : url,
					target  : target,
					clicked : clicked
				});

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

 				
 				var eventCB  = $.IGRP.events.execute('submit',{
 					valid  : canSubmit,
 					fields :  fields
 				});

 				canSubmit = eventCB == false ? false : canSubmit;

 				if (canSubmit){
 					
 					clicked.attr("disabled","disabled");
 					
 					$.IGRP.utils.loading.show();
 					
 				}else
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
