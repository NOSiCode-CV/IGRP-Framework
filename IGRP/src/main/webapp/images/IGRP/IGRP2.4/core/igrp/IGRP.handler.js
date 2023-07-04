(function($){
	
	var pageInfo ;

	if($ && $.IGRP){
		/* BOX COLLAPSE */
		var boxCollapser = function(){
			$('body').on('click','.box .box-collapser',function(){
				var box       = $(this).parents('.box').first();
				var icon      = $('i',this);
				var collapsed = box.attr('collapsed') == 'true' ? true : false;
				
				if(!collapsed)
					$('>.box-body,>.box-footer',box).slideUp(function(){
						icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
						
						$(window).resize();
					});
				else
					$('>.box-body,>.box-footer',box).slideDown(function(){
						icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
						
						$(window).resize();
					});

				box.attr('collapsed',!collapsed);

			});
		};

		var toolTip = function(){
			
			/*$(document).tooltip({
			    selector: '[data-toggle="tooltip"]'
			});		*/	
		};

		/* DEBUG */
		var debugController = function(){
			//click control
			$('.igrp-debug-ctrl').on('click',function(){
				var ctrl = $(this);

				$('#igrp-debugger').modal('show');
				//ctrl.parent().toggleClass('open');
			});
			//search control
			$(".igrp-debug-search input").on("keyup",function(e) {
				var text = $(this).val();
				if(text){
					$(".igrp-debug-list li").hide();
					$(".igrp-debug-list li:contains('"+text+"')").show();
				}else
					$(".igrp-debug-list li").show();
		    });
		};

		var setUpValidationMessages = function(){
			
			jQuery.extend(jQuery.validator.messages, {
			    required: "Campo obrigat&oacute;rio.",
			    remote: "Corrija este campo.",
			    email: "E-mail inv&aacute;lido.",
			    url: "URL inv&aacute;lido.",
			    date: "Data inv&aacute;lida.",
				datefield:"Data inv&aacute;lida. Formato deve ser DD-MM-YYYY ex: (31-12-2022)",
			    dateISO: "Data (ISO) inv&aacute;lida.",
			    number: "N&uacute;mero inv&aacute;lido.",
			    digits: "Introduza apenas d&iacute;gitos.",
			    creditcard: "Cart&atilde;o de cr&eacute;dito inv&aacute;lido.",
				disablehtml:"Corrija este campo. Não é permitido tags HTML.",
			    equalTo: "Introduza o mesmo valor novamente.",
			    accept: "Introduza Extens&atilde;o valido do tipo: {0}.",
			    maxlength: jQuery.validator.format("Introduza n&atilde;o mais do que {0} caracteres."),
			    minlength: jQuery.validator.format("Introduza n&atilde;o menos do que {0} caracteres."),
			    rangelength: jQuery.validator.format("Introduza um valor entre {0} e {1} caracteres longos."),
			    range: jQuery.validator.format("Introduza um valor entre {0} e {1}."),
			    max: jQuery.validator.format("Introduza um valor menor ou igual a {0}."),
			    min: jQuery.validator.format("Introduza um valor maior ou igual a {0}.")
			});	


			$.validator.addMethod("disablehtml", function(value, element) {
		
				return this.optional(element) || !eval(/(\<\w*)((\s\/\>)|(.*\<\/\w*\>))/gm).test(value);
			});

			$.validator.addMethod("datefield", function(value, element) {
		
				return this.optional(element) || value.igrpValidateDateFormat();
			});
		};

		var checkActiveToolsBarItem = function(){

			$.each($('.toolsbar-holder'),function(i,t){

				var name = $(t).attr('item-name');

				if( !$('.btns-holder a[target="_self"].active',t)[0] ){
					
					var currentURL = $.IGRP.utils.getPageUrl().split('&ichange=')[0],

						btn        = $('.btns-holder a[target="_self"][href="'+currentURL+'"]',t);

					btn.addClass('active');

				}



				/*if(!$.IGRP.store.get('TB_CTRL:'+pageInfo+name)){

					$.IGRP.store.unset('TB_CTRL:'+pageInfo+name);
				
				}*/
				//console.log()


			});

			/*var storedItems = $.IGRP.store.list();
				
			for(var c in storedItems){

				var item = storedItems[c];

				if(c.indexOf('TB_CTRL:'+pageInfo) >=0 ){
					
					var sArr = $.trim(c).split('TB_CTRL:'+pageInfo)
					
					if(sArr[1]){
						
						var name = sArr[1];

						if(!$('.toolsbar-holder[item-name="'+name+'"]')[0])

							$.IGRP.store.unset('TB_CTRL:'+pageInfo+name);
						
					}else{

						console.log('no tb')
					}
				
				}else{

					if(c.indexOf('TB_CTRL:') >= 0)
						$.IGRP.store.unset(c);

				}

			}*/
		};

		var toolsbarCrl = function(){
			
			var lastTarget = $.IGRP.store.get('target-clicked');

			$('.toolsbar-holder>.btns-holder>a').on('click',function(){
				
				var name  = $($(this).parents('.toolsbar-holder')[0]).attr('item-name'),

					title = $('>span',this).text(),

					href  = $(this).attr('href'),

					index = $(this).index();

				/*$.IGRP.store.set({

					name  : 'TB_CTRL:'+pageInfo+name,

					value : JSON.stringify({ title:title,href:href,index:index }) 

				});*/

				$.IGRP.utils.createHidden({
					name :'p_fwl_'+name,
					value:$(this).attr('position'),//value.replace(/"/g, "'"),
					class:'submittable menuCtrl'
				});
				

			});

			$.each($('.toolsbar-holder'),function(i,t){
				
				var name       = $(t).attr('item-name'),

					currentStr = $.IGRP.store.get('TB_CTRL:'+pageInfo+name),

					currentStrPos = $('#p_fwl_'+name).val();

				if(currentStr){

					var current = JSON.parse(currentStr),

						iBtn    = $('.btns-holder>a:eq('+current.index+')',t),

						title   = $('span',iBtn).text(),

						href    = iBtn.attr('href');

					if(title == current.title )

						iBtn.addClass('active');

				}else{
					if (currentStrPos) 
						$('.toolsbar-holder[item-name="'+name+'"] .btns-holder>a[position="'+currentStrPos+'"]').addClass('active');
//					else
//						$('.toolsbar-holder[item-name="'+name+'"] .btns-holder>a:first').addClass('active');
				}

				//if( lastTarget != 'lookup_value' && lastTarget != 'submit_form' && lastTarget != 'submit' && lastTarget != 'alert_submit' && lastTarget != '_self')
					
				$.IGRP.store.unset('TB_CTRL:'+pageInfo+name);
				

			});

			checkActiveToolsBarItem();				
		};

		var setIgrpAppTitleWidth = function(){

			var diff  = $('#igrp-top-nav>#side-bar-ctrl').width() + 

					    $('#igrp-top-nav>.navbar-brand').width() + 

					    $('#igrp-top-menu').width(),

				width = $('#igrp-top-nav').width() - diff - 50;

			$('#igrp-top-nav>#igrp-app-title').css('max-width',width);

		};

		$.IGRP.on('init',function(){
			
			pageInfo = $.IGRP.getPageInfo()+'.tb.';

			boxCollapser();
			
			toolTip();

			debugController();
			
			setUpValidationMessages();

			toolsbarCrl();

			setIgrpAppTitleWidth();
			
		});

		$.IGRP.on('windowResize', setIgrpAppTitleWidth );

	}
}($));
