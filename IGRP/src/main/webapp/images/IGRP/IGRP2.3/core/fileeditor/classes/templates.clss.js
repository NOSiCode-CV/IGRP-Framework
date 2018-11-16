(function(){

	var templates = {

		tab : function(){

		},

		folderFiles : function(files, ulID){

			var r = '';

			r+='<ul >';
			
			files.forEach(function(f){
				
				var id 		 = f.id || Math.random().toString(36).substr(2, 9),

					fileName = f.fileName || '';

				r+='<li id="'+id+'" class="file" file-name="'+fileName+'" file-path="'+f.path+'"  title="'+f.name+'">'+
					'<span class="txt-ellipsis">'+f.name+'</span>'+
				 '</li>';

			});

			r+='</ul>';

			return r;

		},

		treeItem : function(i){

			var clss   	   = i.dir_files && i.dir_files[0] ? 'folder' : 'file',

				uniq       = Math.random().toString(36).substr(2, 9),

				id 	       = 'folder'+'_'+uniq,

				toggleAttr = i.dir && i.dir[0] || i.dir_files && i.dir_files[0]? ' data-toggle="collapse" data-target="#'+id+'"' : '',

				dirs 	   = i.dir &&  i.dir[0] ? templates.tree( i.dir, '', '') : '',

				files      = i.dir_files && i.dir_files[0] ? templates.folderFiles( i.dir_files, id ) : '',

				item 	   = '<li id="'+uniq+'" class="folder">'+
								'<span class="txt-ellipsis" '+toggleAttr+'>'+i.dir_name+'</span>'+
								'<div id="'+id+'" class="collapse">'+
									dirs+files+
								'</div>'+
								
							 '</li>';

		    return item;
		},

		tree : function(data, id, clss){

			id 	 = id || '';

			clss = clss || '';

			var tree = '<ul id="'+id+'" class="'+clss+'">';

			try{

				if($.isArray(data)){

					data.forEach(function(d){
				
						tree += templates.treeItem(d);

					});

				}else{

					tree += templates.treeItem(data);
				}

				
			
			}catch(err){
				console.log(err)
			}
			

			/*data.forEach(function(d){

				//console.log(d)
				tree+=templates.treeItem(d);

			});*/

			tree+='</ul>';

			return tree;

		}

	};

	$.IGRP.components.fileeditor.classes.set('templates', templates );

})();