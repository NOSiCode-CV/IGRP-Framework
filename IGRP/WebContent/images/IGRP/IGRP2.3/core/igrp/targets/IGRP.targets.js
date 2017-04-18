(function($){
	if($ && $.IGRP && !$.IGRP.targets){
		
		var form ;
		var confirmText = '';
		
		//confirm
		var confirm = function(p){
			$.IGRP.utils.loading.show();
			setConfirmModal(function(){
				window.location.replace(p.url);
			});
			return false;	
		}
		//alert_submit
 		var alert_submit = function(p){
 			setConfirmModal(function(){
				submit(p);
			});
			return false;
 		}
		//close
		var close = function(){
			window.opener = top;
			window.close();
			return false;
		}
 		//back
 		var back = function(){
 			window.history.back();

 			return false;
 		}
 		//submit
 		var submit = function(p){
 			$.IGRP.utils.loading.show();
 			var fields   = $.IGRP.utils.getFieldsValidate();//$('input[required],select[required],textarea[required]',form).not('.no-validation'),
 				validate = p.validate === false ? false : true,
 				action   = $.IGRP.utils.getSubmitParams(p.url,p.form,p.scrollTo);
 			try{
 				
 				form.attr('validateCtrl',validate);
 				
 				/*if(validate)
 					fields.valid({
 						exclude : '.no-validation, .IGRP_checkall' //hack for separator list on submit fields from form. 
 					});
 				*/

				form.attr('action',action).submit();

 			}catch(e){
 				console.log(e);
 			}
 			

			return false;
 		}
 		//submit_popup
 		var submit_popup = function(p){
 			var fields = $.IGRP.utils.getFieldsValidate(); //$('input,select,textarea',form).not('.no-validation');
 	
 			if(fields.valid())
 				$.IGRP.utils.openWin({
 					url    : $.IGRP.utils.getFormUrl(p.url),
	 				width  : 980,
	 				height : 520,
	 				win    : 'IGRP'
 				});
 			
			return false;
		}
		//lookup
		var lookup       = function(p){
			console.log(p)
			return false;
		}
		//filter
		var filter       = function(p){
			console.log(p)
			return false;
		}
		//self
		var _self        = function(p){
			//return true;
			$.IGRP.utils.loading.show();
			window.location.replace(p.url);
			return false;
		}
		//specific
		var specific     = function(p){
			console.log(p)
			return false;
		}
		//new tab
		var _newtab      = function(p){
			window.open(p.url,'_blank');
			return false;
		}
		//blanktarget
		var _blankTarget = function(p){
			console.log(p)
			/*var vUrl = IGRP_getUrl(pObj.pUrl);
			vUrl+='p_fwl_'+pObj.pThis.attr('relink')+'tr='+pObj.pThis.parents("tr:first").index()*1+'&p_fwl_relboxopen='+pObj.pThis.attr('relink');
			IGRP_openWin({pUrl:vUrl,pWidth:($(window).width()-100),pHeight:($(window).height()-100),pWin:'_blankTargetOpen'});*/
			return false;
		}
		//link
		var _link 		 = function(p){
			console.log(p)
			return false;
		}
		//blank (popup)
		var _blank       = function(p){
			$.IGRP.utils.openWin({
				url    : p.url,
				width  : 980,
				height : 520,
				win    : 'IGRP'
			});
			return false;
		}

		//blank (popup)
		var modal       = function(p){
			$.IGRP.components.iframeNav.set({
				url:p.url
			});
			return false;
		}

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
			var holder = $('div[item-name="'+p.obj.attr('field')+'"]'),
				obj    = $('*[src]',holder);
				
			if(p.url){
				$.IGRP.utils.loading.show(holder);

				obj.attr('src','');

				var nobj = obj.clone();
				nobj.attr('src',p.url);

				nobj.bind('load',function(e){
					try{
						var contents = nobj.contents();
						contents.ready(function(){
							nobj.height($('html',contents).height());
						});
					}catch(ex){
						console.log(ex);
						null;
					}
					$.IGRP.utils.loading.hide(holder);
				});

				obj.replaceWith(nobj);
			}
		};

		$.IGRP.targets = {
			confirm      : confirm,
			_close       : close,
			_back        : back,
			submit       : submit,
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
		}

		

		$.IGRP.on('init',function(){
			form        = $.IGRP.utils.getForm();
			confirmText = $('#confirm-text').text();

			form.on('submit',function(e){

				var validate  = form.attr('validateCtrl');
					fields    = $.IGRP.utils.getFieldsValidate(),
					canSubmit = true;

				if(validate)
 					canSubmit = fields.valid({
 						exclude : '.no-validation, .IGRP_checkall' //hack for separator list on submit fields from form. 
 					}) == 1 ? true : false;

				return canSubmit;
			});

			/* CLICKS */
			$(document).on('click','a[target], button[target]',function(e){
				e.preventDefault();
				var target       = $(this).attr('target')  ? $(this).attr('target'): '_blank';
				var url          = $(this).attr('fw_href') ? $(this).attr('fw_href') : $(this).attr('href');			
				var targetAction = $.IGRP.targets[target] || _blank;
				
				//try{
				return targetAction({
					url   :url,
					target:target,
					obj   : $(this)
				});
				//}catch(err){
					//console.log(target);
					//console.log(err);
					//return true;
				//}
			});
		})
	}
})($);
