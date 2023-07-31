var GENTemplateRenderer = {
	
	"table-rows-hiddens" : function(container){
		var rtn = '';
		var hiddens = container.GET.fieldsByType('hidden');
		
		hiddens.forEach(function(f){
			var tag = f.GET.tag();
			rtn+= '<input type="hidden" name="p_'+tag+'_fk" value="{'+tag+'}" />'+
	              '<input type="hidden" name="p_'+tag+'_fk_desc" value="{'+tag+'_desc}" />'
		});

		return $(rtn);
	},

	render:function(o){
		$.each(o.templates,function(i,t){
			var templateName     = $(t).attr('name');
			
			if(templateName && GENTemplateRenderer[templateName]){
				try{
					var temp = GENTemplateRenderer[templateName](o.container);
					$(t).replaceWith(temp);

				}catch(err){
					console.log(err);
					$(t).remove();
				}
			}else
				$(t).remove();
			
		});

	}
};

