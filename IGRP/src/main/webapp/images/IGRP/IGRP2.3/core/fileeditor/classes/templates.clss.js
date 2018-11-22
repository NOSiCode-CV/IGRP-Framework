(function(){

	var templates = {

		newItem : function(type){

			return '<li class="'+type+' brand-new"><span><input class="adder-input" type="text"/></span></li>';

		},

		folderOptions : function(){

			var r = $('.add-new-options').html();

			return r;

		},

		folderFiles : function(files, ulID){

			var r = '';

			//r+='<ul>';
			
			files.forEach(function(f){
				
				var id 		 = f.id || Math.random().toString(36).substr(2, 9),

					fileName = f.fileName || '';

				r+='<li id="'+id+'" class="file" file-name="'+fileName+'" file-path="'+f.path+'"  title="'+f.name+'">'+
					
						'<span class="txt-ellipsis">'+f.name+'</span>'+
					
				 	'</li>';

			});

			//r+='</ul>';

			return r;

		},

		treeItem : function(i){

			var clss   	   = i.dir_files && i.dir_files[0] ? 'folder' : 'file',

				uniq       = Math.random().toString(36).substr(2, 9),

				id 	       = 'folder'+'_'+uniq,

				toggleAttr = 'data-toggle="collapse" data-target="#'+id+'"',

				dirs 	   = i.dir &&  i.dir[0] ? templates.tree( i.dir, '', '', false) : '',

				files      = i.dir_files && i.dir_files[0] ? templates.folderFiles( i.dir_files, id ) : '',

				item 	   = '<li id="'+uniq+'" class="folder" dir-path="'+i.dir_path+'">'+
								'<span class="" '+toggleAttr+'>'+i.dir_name+templates.folderOptions()+'</span>'+
								'<div id="'+id+'" class="collapse"><ul>'+
									dirs+files+
								'</ul></div>'+
							 '</li>';

		    return item;
		},

		tree : function(data, id, clss, ul){

			id 	 = id || '';

			clss = clss || '';

			var tree = ul != false ? '<ul id="'+id+'" class="'+clss+'">' : '';

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

			tree+= ul != false ? '</ul>' : '';

			return tree;

		}

	};

	$.IGRP.components.fileeditor.classes.set('templates', templates );

})();