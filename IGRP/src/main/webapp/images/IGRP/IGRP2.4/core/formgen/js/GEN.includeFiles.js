(function(){

	var G = this[VARS.name];
	
	var includer = $('.gen-include-file'),

		iType    = $('.f-type',includer),

		iCount   = $('.f-count',includer),
		
		modal    = $('#gen-include-file-modal'),

		slist    = $('.IGRP-separatorlist',modal)[0],

		type 	 = null;


	$('.gen-include-file').on('click',function(){
		
		$('.modal-title',modal).text('Include '+type);

		slist.resetAll();

		slist.setRows(G.files[type]);

		modal.modal('show');

	});

	$('#gen-inc-confirm').on('click',function(){
		
		if(!$('#p_file').val()){

			//if()

			G.files[type] = slist.toJSON();

			iCount.text(G.files[type].length);

			
			if(type == 'xsl')
				$('#gen-views-ctrl li[rel="gen-xsl"]').click();
			else
				G.files[type].forEach(function(f){
					
					var file =G.getIncludeURL(f.file);

					G.includeToHead({
						type : type,
						path : file
					});
					/*var file =G.getIncludeURL(f.file);

					if(file.indexOf('{$path}') >= 0)
						file = file.replace('{$path}', path);

					var include = type == 'css' ? '<link class="gen-inc-'+type+'" rel="stylesheet" type="text/css" href="'+file+'"/>' :  
								  				  '<script class="gen-inc'+type+'" type="text/javascript" src="'+file+'"></script>';
				
					if(!G.viewFileIncluded(file,type)) 
						$(include).insertBefore( $('style#custom-css') );*/


				});

			modal.modal('hide');
		
		}else{

			$.IGRP.notify({
				message : 'Add File to List',
				type 	: 'warning'
			});
	
		}
		

	});

	//verify
	G.on('view-change',function(p){
		
		type = null;

		includer.attr('type','').hide();

		iType.text('');

		iCount.text('');

		var canInclude = false;
		for(var f in G.files){
			if(p.view == f){
				canInclude = true;
				break;
			}
		};

		if(canInclude){
			type = p.view;
			iType.text(p.view);
			iCount.text(G.files[p.view].length);
			includer.attr('type',p.view).show();
		}
	});


})();