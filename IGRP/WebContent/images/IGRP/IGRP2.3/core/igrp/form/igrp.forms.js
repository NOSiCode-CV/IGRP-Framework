$(function(){
	if($.IGRP && !$.IGRP.components.form){
  		
  		$.IGRP.components.form = {
  			
  			lookupParser:function(clicked){

  				var isTr   = $(clicked).parents('tr')[0] ? true : false;
  				var object = isTr ?  $(clicked).parents('tr') : $(clicked);
  				
  				var paramsCount = 1*object.attr("CTX_PARAM_COUNT")+1;
  				var formName    = object.attr("CTX_FORM") ? object.attr("CTX_FORM") : 'formular_default';
  				var formIdx     = object.attr("CTX_FORM_IDX") ? parseInt(object.attr("CTX_FORM_IDX")) : 0;

  				var form 		= window.opener?window.opener.document.forms[formName]:window.parent.document.forms[formName];
				var vFwlNoclose = 0;
				var vFwlAdd     = 0; 
				var forminput   = null,
					isChange 	= false,
					oChange 	= null; 

				if(form){
					for(var i = 1; i < paramsCount; i++){
						var vOp = object.attr("CTX_P"+i).split("=");
	
						try{
							vFwlNoclose = (vOp[0]=="p_fwl_noclose")?vOp[1]*1:vFwlNoclose;
							vFwlAdd		= (vOp[0]=="p_fwl_add")?vOp[1]*1:vFwlAdd;
							forminput	= $("*[name='"+vOp[0]+"']", form);

							if(forminput[0]){
								if(formIdx == "" || formIdx == null){
									forminput.val(vOp[1]);
									if($(forminput[(formIdx)])[0].lookupCallback)
										$(forminput[(formIdx)])[0].lookupCallback($(forminput[(formIdx)]));
								}else{
									try {
										$(forminput[(formIdx)]).val(vOp[1]);
										if($(forminput[(formIdx)])[0].lookupCallback)
											$(forminput[(formIdx)])[0].lookupCallback($(forminput[(formIdx)]));
									}
									catch(e){
										if(formIdx == 0)
											forminput.val(vOp[1]);
										if(forminput[0].lookupCallback)
											forminput[0].lookupCallback(forminput);
									}
								}

								if(forminput.prop('tagName').toLowerCase() == 'select')
					 				forminput.trigger('change');

					 			if (forminput.hasClass('IGRP_change')){
									isChange = true;
									oChange  = forminput;
								}
							}
						}catch(e){
							console.log(e);
						}
					}
				}
  				
  				if (isChange)
  					oChange.on('change',$.IGRP.components.form.change);

				if(!vFwlNoclose){
					if(window.parent)
						window.parent.$.IGRP.components.iframeNav.hide();

					if (window.opener)
						window.close();
				}
  			},

  			texteditor:function(o){
  				var v = $.extend({
  					parent  : $('body'),
  					selector: '.gen-texteditor'
  				},o);

  				$.each( $(v.selector,v.parent),function(){
  					var id = $(this).attr('id') ? $(this).attr('id') : 'texteditor'+(new Date().getTime());
  					$(this).attr('id',id);

  					CKEDITOR.replace(id);

  				} );
  			},
  			novalidate:function(){
  				$.IGRP.utils.getForm().unbind('submit');
  			},
  			change:function(o){
  				var target   = o.target,
  					scrollTo = '#id'+$(target).attr('name');
  					//value 	 = target.value ? target.value : target.val();

  				$.IGRP.components.form.novalidate();

				$.IGRP.targets.submit({
					url 	 : $.IGRP.utils.getPageUrl(),
					validate : false,
					scrollTo : scrollTo
				});
				
				return true;
  			},
  			init:function(){
  				/*FILE INPUT*/
				$(document).on('change', '.file-btn-holder :file', function() {
					var input    = $(this),
					    numFiles = input.get(0).files ? input.get(0).files.length : 1,
					    label    = input.val().replace(/\\/g, '/').replace(/.*\//, ''),
					    txtInput = $(this).parents('.input-group').find(':text'),
					    log      = numFiles > 1 ? numFiles + ' files selected' : label;
				  	
				  	if( txtInput.length ) 
				  		txtInput.val(log);

				  	if (input.hasClass('file2base64')) {
				  		$.IGRP.utils.file2base64({
				  			target: $('[item-name="'+input.attr('target-rend')+'"]'),
				  			field : input
				  		});
				  	}
				});

				//IGRP_CHECK ALL - passed to table
				/*$(document).on('change', '.IGRP_checkall', function() {
					var table    = $(this).parents('.table').first(),
						checkrel = $(this).attr('check-rel'),
						checkers = $('[check-rel="'+checkrel+'"]:not(.IGRP_checkall)',table),
						checkAll = $(this).is(':checked');

					checkers.prop('checked',checkAll).attr('checked',checkAll);
				});*/
				
				/*LOOKUP PARSER*/
				$(document).on('click','.lookup-parser',function(){
					$.IGRP.components.form.lookupParser( this );
				});

				/* SELECT CHANGE */
				$(document).on('change','.IGRP_change,[change="true"]',$.IGRP.components.form.change);
				$.IGRP.components.form.texteditor();
  			}
  		}
  	}

	$.IGRP.components.form.init();

});



