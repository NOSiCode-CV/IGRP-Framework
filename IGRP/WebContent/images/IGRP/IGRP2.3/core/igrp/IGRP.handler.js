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
		}

		var toolTip = function(){
			$('[data-toggle="tooltip"]').tooltip(); 
		}

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
			    number: "Número inv&aacute;lido.",
			    digits: "Introduza apenas d&iacute;gitos.",
			    creditcard: "Cart&atilde;o de cr&eacute;dito inv&aacute;lido.",
			    equalTo: "Introduza o mesmo valor novamente.",
			    accept: "Please enter a value with a valid extension.",
			    maxlength: jQuery.validator.format("Introduza não mais do que {0} caracteres."),
			    minlength: jQuery.validator.format("Introduza não menos do que {0} caracteres."),
			    rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
			    range: jQuery.validator.format("Please enter a value between {0} and {1}."),
			    max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
			    min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
			});

		}

		$.IGRP.on('init',function(){

			boxCollapser();
			toolTip();
			debugController();
			setUpValidationMessages();

			
			
		});

	}
}($));
