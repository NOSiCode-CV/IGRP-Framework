(function($){
	if($ && $.IGRP && !$.IGRP.targets){
		
		var form ;

		var confirmText = '';

		var ev = $.IGRP.events;

		ev.declare([
			'target-click',
			'submit-ajax'
		]);

		//confirm
		var confirm = function(p){
			
			setConfirmModal(function(){
				window.location.replace(p.url);
			});

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
			});

			return false;
 		};
 		//submit page
 		var submit = function(p){
 			
 			$.IGRP.utils.clearSubmittables();

 			var sform     = $.IGRP.utils.getForm(),

 				fields    = $.IGRP.utils.getFieldsValidate(sform),//$('input[required],select[required],textarea[required]',form).not('.no-validation'),
 				
 				validate  = p.validate === false ? false : true,
 				
 				action    = $.IGRP.utils.getSubmitParams(p.url,p.form,p.scrollTo);

 			fields.addClass('submittable');

 			try{

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
 					url    : $.IGRP.utils.getUrl(p.url)+form.serialize(),
	 				width  : 980,
	 				height : 520,
	 				win    : 'IGRP'
 				});
 			
			return false;
		};
		//submit ajax
		var submit_ajax = function(p){
			var sform     	= $.IGRP.utils.getForm(),
				fields    	= $.IGRP.utils.getFieldsValidate(sform),
				action    	= $.IGRP.utils.getSubmitParams(p.url,sform,p.scrollTo);
				arrayFiles 	= $.IGRP.utils.submitPage2File.getFiles(),
				pArrayItem  = sform.find('*').not(".notForm").serializeArray();
				
			if (fields.valid()) {
				
				$.IGRP.utils.loading.show();
				//console.log(p)
				ev.execute('submit-ajax',{
					pArrayItem : pArrayItem,
					clicked    : p.clicked,
					url  	   : action
				});
				
				$.IGRP.utils.submitStringAsFile({
					pParam 		: {
						pArrayFiles : arrayFiles,
						pArrayItem 	: pArrayItem
					},
					pUrl   		: action,
					pNotify 	: false,
					pComplete 	: function(resp){

						$.IGRP.utils.loading.hide();

						var xml = resp.responseXML || $($.parseXML(resp.response)),
							
							alert = '',

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

						$('.igrp-msg-wrapper').html(alert);

						$('#igrp-debugger .igrp-debug-list').html(debug);

						if(p.clicked[0].events)
							p.clicked[0].events.execute('submit-ajax-complete',{
								xml : xml
							});
					}
				});
			}
		};
		//lookup
		var lookup       = function(p){
			console.log(p)
			return false;
		};
		//filter
		var filter       = function(p){

			var filterLetter = p.url.split("=");

			var actionURL	 = $("input[name='p_env_frm_url']").val() || window.location.href;

			var action   	 = $.IGRP.utils.getSubmitParams(actionURL,form,p.scrollTo); 	

			var table  	     = $(p.clicked.parents('.gen-container-item')[0]);

			var tableName	 = table.attr('item-name')

			if( $('input[name="'+filterLetter[0]+'"]')[0] )
				$('input[name="'+filterLetter[0]+'"]').remove();

			$.IGRP.utils.createHidden({
				name  : filterLetter[0],
				value : filterLetter[1]
			});

			$.IGRP.utils.transformXMLNodes({
				
				nodes : [tableName],

				url   : action,

				data  : form.serialize(),

				success:function(c){
		
					var table = $('.gen-container-item[item-name="'+tableName+'"]'),
						fitem = $('.igrp-table-filter [filter-item="'+filterLetter[1]+'"]',table);
						
					fitem.addClass('active');
					
					if($.IGRP.components.contextMenu)
						$.IGRP.components.contextMenu.set( table );

				},

				error:function(){
					console.log('dsa')
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
			//return true;
			$.IGRP.utils.loading.show();
			window.location.href = p.url;
			return false;
		};
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
		//blanktarget
		var _blankTarget = function(p){
			console.log(p)
			/*var vUrl = IGRP_getUrl(pObj.pUrl);
			vUrl+='p_fwl_'+pObj.pThis.attr('relink')+'tr='+pObj.pThis.parents("tr:first").index()*1+'&p_fwl_relboxopen='+pObj.pThis.attr('relink');
			IGRP_openWin({pUrl:vUrl,pWidth:($(window).width()-100),pHeight:($(window).height()-100),pWin:'_blankTargetOpen'});*/
			return false;
		};
		//link
		var _link 		 = function(p){
			console.log(p)
			return false;
		};
		//blank (popup)
		var _blank       = function(p){
			var d = new Date();
			$.IGRP.utils.openWin({
				url    : p.url,
				width  : 980,
				height : 520,
				win    : 'IGRP-'+d.getMilliseconds()
			});
			return false;
		};
		//blank (popup)
		var modal       = function(p){
			$.IGRP.components.iframeNav.set({
				url:p.url
			});
			return false;
		};
		//export excel
		var exportExcel = function(){

			console.log('tb-export-ctrl')
		};


		var setConfirmModal = function(onClick){
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

		changesrc.showContents = function(holder){

			setTimeout(function(){

				$.IGRP.utils.loading.hide(holder);

			},300);

		}

		var configTargetsEvents = function(){
			//submit ajax
			$.each($('a[target], button[target]'),function(i,e){
				e.events = $.EVENTS(['submit-ajax-complete','submit-ajax-error']);
			});

		}

		$.IGRP.targets = {
			confirm      : confirm,
			_close       : close,
			_back        : back,
			submit       : submit,
			submit_form  : submit_form,
			submit_ajax  : submit_ajax,
			alert_submit : alert_submit,
			submit_popup : submit_popup,
			lookup       : lookup,
			filter       : filter,
			_self        : _self,
			specific     : specific,
			_newtab      : _newtab,
			_blankTarget : _blankTarget,
			_link 		 : _link,
			_blank       : _blank,
			modal 	     : modal,
			modalpopup   : modal,
			changesrc    : changesrc,
			exportexcel  : exportExcel
		};

		$.IGRP.on('init',function(){
			
			form        = $.IGRP.utils.getForm(),

			doc 	    = $(document),

			confirmText = $('#confirm-text').text();

			configTargetsEvents();

			/* target clicks controller */
			doc.on('click','a[target], button[target]',function(e){
				
				e.preventDefault();
				
				var target       = $(this).attr('target')  ? $(this).attr('target'): '_blank';
				var url          = $(this).attr('fw_href') ? $(this).attr('fw_href') : $(this).attr('href');			
				var targetAction = $.IGRP.targets[target] || _blank;

				ev.execute('target-click',{
					target  : target,
					url     : url,
					clicked : this
				});
				
				return targetAction({
					url     :url,
					target  :target,
					clicked : $(this)
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

 				if (canSubmit){
 					//$.IGRP.utils.getFieldsValidate().not('.submittable').attr('disabled',true);
 					$.IGRP.utils.loading.show();
 				}

 				//return false;
				return canSubmit;		

			});

		});
	}
})($);
