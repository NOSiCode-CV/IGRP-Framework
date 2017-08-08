(function($){
	
	if($ && $.IGRP){
		/* BOX COLLAPSE */
		var boxCollapser = function(){
			$('body').on('click','.box .box-collapser',function(){
				var box       = $(this).parents('.box').first();
				var icon      = $('i',this);
				var collapsed = box.attr('collapsed')=='true' ? true : false;
				
				if(!collapsed)
					$('>.box-body,>.box-footer',box).slideUp(function(){
						icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
					});
				else
					$('>.box-body,>.box-footer',box).slideDown(function(){
						icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
					});

				box.attr('collapsed',!collapsed);
			});
		};

		var toolTip = function(){
			$('body').tooltip({
			    selector: '[data-toggle="tooltip"]'
			});
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
			    dateISO: "Data (ISO) inv&aacute;lida.",
			    number: "N&uacute;mero inv&aacute;lido.",
			    digits: "Introduza apenas d&iacute;gitos.",
			    creditcard: "Cart&atilde;o de cr&eacute;dito inv&aacute;lido.",
			    equalTo: "Introduza o mesmo valor novamente.",
			    accept: "Please enter a value with a valid extension.",
			    maxlength: jQuery.validator.format("Introduza n&atilde;o mais do que {0} caracteres."),
			    minlength: jQuery.validator.format("Introduza n&atilde;o menos do que {0} caracteres."),
			    rangelength: jQuery.validator.format("Introduza um valor entre {0} e {1} caracteres longos."),
			    range: jQuery.validator.format("Introduza um valor entre {0} e {1}."),
			    max: jQuery.validator.format("Introduza um valor menor ou igual a {0}."),
			    min: jQuery.validator.format("Introduza um valor maior ou igual a {0}.")
			});
		};

		var toolsbarCrl = function(){
			
			var pageInfo = $.IGRP.getPageInfo()+'.tb.';

			$('.toolsbar-holder>.btns-holder>a[target="_self"]').on('click',function(){
				
				var name  = $($(this).parents('.toolsbar-holder')[0]).attr('item-name'),

					title = $('>span',this).text(),

					href  = $(this).attr('href'),

					index = $(this).index();

				$.IGRP.store.set({

					name  : pageInfo+name,

					value : JSON.stringify({ title:title,href:href,index:index }) 

				});
				
			});

			$.each($('.toolsbar-holder'),function(i,t){
				
				var name       = $(t).attr('item-name'),

					currentStr = $.IGRP.store.get(pageInfo+name);

				if(currentStr){

					var current = JSON.parse(currentStr),

						iBtn    = $('.btns-holder>a:eq('+current.index+')',t),

						title   = $('span',iBtn).text(),

						href    = iBtn.attr('href');

					if(title == current.title && href == current.href)

						iBtn.addClass('active')

				}

				//$.IGRP.store.unset(pageInfo+name);

			});
		};

		$.IGRP.on('init',function(){

			boxCollapser();
			
			toolTip();

			debugController();
			
			setUpValidationMessages();

			toolsbarCrl();
			
		});

	}
}($));
