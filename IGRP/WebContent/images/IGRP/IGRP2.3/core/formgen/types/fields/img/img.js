var IMGFIELD = function(type,params){
	Field.call(this,type,params);

	var field 	 		= this,
		fileCrop 		= false,
		jsIncludCropFiles = [
			{path :'/plugins/croppie/croppie.js'},
			{path :'/plugins/croppie/croppie.min.js'}
		],
		cssIncludCropFiles = [
			{ path :'/plugins/croppie/croppie.css'}
		],
		removeIncluds = function(arr,type){
			arr.forEach(function(e){
				for( var i = 0; i < field.includes[type].length; i++){
					var inc = field.includes[type][i];
					if(inc.path == e.path){
						var index = field.includes[type].indexOf(inc);
						if (index > -1) 
						    field.includes[type].splice(index, 1);
						break;
					}
				}
			});
		};

	field.ready = function(){
		
		field.setPropriety({
			name:'img',
			label:'Image',
			value:'',
			size:'12',
			valuePersist : true,
			onChange:function(v){
				field.xml.dataValue = v;
			}
		});

		field.setPropriety({
			name :'width',
			label:'Width Crop (Pixel value)',
			value:'',
			onEditionStart : function(o){
				if(field.GET.croppie && field.GET.croppie())
					o.input.show();
				else
					o.input.hide();
			}
		});

		field.setPropriety({
			name :'height',
			label:'Height Crop (Pixel value)',
			value:'',
			onEditionStart : function(o){
				if(field.GET.croppie && field.GET.croppie())
					o.input.show();
				else
					o.input.hide();
			}
		});

		field.setPropriety({
			name :'croppie',
			value:false,
			xslValue:'croppie',
			onEditionStart : function(v){
				$('input',v.input).on('change',function(){

					var isChecked 	 = $(this).is(':checked'),
						action  	 = isChecked ? 'show' : 'hide',
						holderWidth  = $('.gen-properties-setts-holder div[rel="width"]'),
						holderHeight = $('.gen-properties-setts-holder div[rel="height"]'); 

					holderWidth[action]();
					
					holderHeight[action]();

					if (!isChecked) {
						$('input',holderWidth).val('');
						$('input',holderHeight).val('');
					}

				});
			},
			onChange : function(v){
				if (v) {

					if (!fileCrop) {

						jsIncludCropFiles.forEach(function(e){
							field.includes.js.unshift(e);
						});

						cssIncludCropFiles.forEach(function(e){
							field.includes.css.unshift(e);
						});

						fileCrop = true;
					}
				}else{
					removeIncluds(jsIncludCropFiles,'js');
					removeIncluds(cssIncludCropFiles,'css');
					fileCrop = false;
				}
			}
		});

		field.setPropriety({
			name :'rounded',
			value:false,
			xslValue:'img-rounded'
		});
		
		console.log(field);

	}


}

VARS.getGen().declareField({
	type:'img',
	field:IMGFIELD
});