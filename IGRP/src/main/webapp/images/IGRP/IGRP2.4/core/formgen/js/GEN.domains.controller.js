(function(){

	var GEN 	     = VARS.getGen(),
	
		modalContent = '';
	
	function GetHTML(){
		$.get(path+'/core/formgen/util/domains/gen.domain.adder.html').then(function(h){
			modalContent = h;
			
			
		});
	}
	
	function Save(){
		
		var modal = $.IGRP.components.globalModal.get(),
		
			data  = new FormData(); 
	
		data.append("p_domain_name", $('#domain_name').val() );
		
		console.log($('.IGRP-separatorlist',modal)[0].toJSON());
		
		console.log(data);
		

		$.ajax({
			url : 'http://localhost:8080/IGRP/app/webapps?r=igrp/page/newDomain',
			method : 'POST',
			data : {
				domain_name : $('#domain_name').val(),
				list : $('.IGRP-separatorlist',modal)[0].toJSON()
			}
		})
		
		return false;
	}

	function SetModal(){
		$.IGRP.components.globalModal.set({
			rel    : 'gen-domains-add',
			title : 'New Domain',
			content: function(){
				
				var holder = $('<div class="gen-domains-add-wrapper"/>');
				
				holder.append(modalContent);

				$('.IGRP-separatorlist',holder).separatorList();
				
				$('#domain_save',holder).on('click', Save);
				
				return holder
			},
			closeOnBodyClick : true,
			buttons: [
				/*{
					class   :'success',
					icon    :'check',
					text    :'Confirmar',
					onClick :function(e){
						try{ onClick(); }catch(err){ console.log(err); }
						$.IGRP.components.globalModal.hide();
						return false;
					}
				},*/
				
			]
		});
	}
	
	var init = function(){
		
		GetHTML();
		
		$('#gen-domains').on('click', SetModal)
		
	}();
	
})();
