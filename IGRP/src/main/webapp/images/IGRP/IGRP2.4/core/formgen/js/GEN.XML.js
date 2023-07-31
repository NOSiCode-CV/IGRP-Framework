var _XML = {
	build:function(p){
		var xml = this;
		var rtn = null;
		if(p.tag){
			var attrs   = p.attributes && p.attributes[0] ? xml.geAttrs(p.attributes) : '';
			var content = p.content ? (typeof p.content == 'function') ? p.content() : p.content : '';
			
			rtn = '<'+p.tag+' '+attrs+'>'+content+'</'+p.tag+'>';

		}
		return rtn;
	},
	geAttrs:function(attrs){
		var rtn = '';
		attrs.forEach(function(attr){
			if(attr.name){
				var value = attr.value ? '="'+attr.value+'"' : '=""';
				rtn = rtn+attr.name+value+' ';
			}
			//return rtn = rtn + attr.name+'='+attr.value+' ';
		});
		return rtn;
	}
}