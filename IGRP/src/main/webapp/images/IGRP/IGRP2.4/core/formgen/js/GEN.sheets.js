var GEN_SHEETS = function(GEN){
	var sheets = this;

	var active     = 'tab-0';
	var sheetsArr  = [active];
	var menuHolder = $('#gen-sheets-list');

	sheets.add = function(){
		try{
			var idx = sheetsArr.length+1;
			var rel = 'tab-'+idx;

			menuHolder.append('<li gen-tab-rel="'+rel+'">'+idx+'</li>');

			$('#gen-viewr-contents').append('<div class="gen-tab-content-holder" gen-tab-rel="'+rel+'"></div>')

			GEN.layout.addRow({ index:0, rel:rel })

			sheetsArr.push(rel);
		}catch(e){
			console.log(e);
		}
		
		return false;
	}

	sheets.remove = function(){

	}

	sheets.setActive = function(rel){
		active = rel;
		$('.gen-tab-content-holder').removeClass('active');
      	$('.gen-tab-content-holder[gen-tab-rel="'+rel+'"]').addClass('active');
	}

	sheets.getActive = function(){
		return active;
	}

	var init = function(){
		/* PAGE SHEETS CONTROL */
      	$('#gen-sheets-list').on('click','li',function(){
      		var rel = $(this).attr('gen-tab-rel');
      		GEN.sheets.setActive(rel);
      	});

      	$('#gen-sheets-add').on('click',sheets.add);
	}

	init();

}