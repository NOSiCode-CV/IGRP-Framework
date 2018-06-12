(function(){

	var templates = {

		tab : function(){

		},

		treeItem : function(i){

			var clss   	   = i.childs ? 'folder' : 'file',

				unique     = Math.random().toString(36).substr(2, 9),

				id 	   	   = 'folder'+'_' +unique,

				fileId 	   = i.id ? ' file-id='+i.id : '',

				childs 	   = i.childs ? templates.tree(i.childs, id, 'collapse'): '',

				filePath   = i.path ? ' file-path="'+i.path+'"' : '',

				toggleAttr = i.childs ? ' data-toggle="collapse" data-target="#'+id+'"' : '',

				item   = 
				'<li id="'+unique+'" '+fileId+' class="'+clss+'" '+filePath+' name="'+i.name+'">'+
					'<span class="txt-ellipsis" '+toggleAttr+'>'+i.name+'</span>'+
					childs+
				'</li>';

		    return item;
		},

		tree : function(data, id, clss){
			
			id 	 = id || '';

			clss = clss || '';

			var tree = '<ul id="'+id+'" class="'+clss+'">';

			data.forEach(function(d){

				tree+=templates.treeItem(d);;

			});

			tree+='</ul>';

			return tree;

		}

	};

	$.IGRP.components.fileeditor.classes.set('templates', templates );

})();