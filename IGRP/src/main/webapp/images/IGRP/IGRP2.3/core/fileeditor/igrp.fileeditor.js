(function(){

	var app,

		selectors = {

			leftPanelClss : 'igrp-fileeditor-left-panel',

			saveClss 	  : 'igrp-fileeditor-save'
		};

	function FileEditor(dom){

		var fileEditor = this;

		fileEditor.templates = app.classes.get('templates');

		fileEditor.menu 	 = null;

		fileEditor.viewr   	 = $('.igrp-fileeditor-tab',dom);

		function Save(){

			var active = GetActiveTab();

			var cm = active.pane.find('.CodeMirror')[0].CodeMirror;

			return false;

		};

		function GetActiveTab(){

			return fileEditor.viewr.Tab('get-active');

		};

		function Events(){

			$('li.file',fileEditor.menu).on('click',function(){

				var li 		= this,

					tabID   = 'file-'+$(li).attr('id'),

					path 	= $(li).attr('file-path'),

					name    = $(li).attr('name');

				if(!li.request){

					$(li).addClass('loading');

					li.request = $.get( path );

					li.request.then( function(d){

						fileEditor.viewr.Tab('add-item',{

							id    : tabID,

							title : name,

							content : GetCodeEditor( { id : tabID, content : d } ),

							active : true

						});

						$(li).removeClass('loading');

					});

				}else{

					fileEditor.viewr.Tab('activate', tabID );

				}

			});

			$('.'+selectors.saveClss,dom).on('click',Save);

		};

		function DrawList(dir){

			fileEditor.menu = $(fileEditor.templates.tree(dir));

			$('.'+selectors.leftPanelClss,dom).html(fileEditor.menu);

			Events();

		};

		function Config(){

			var dataURL = $(dom).attr('data-url');
			
			if(dataURL)
				
				$.get(dataURL).then(function(d){	
					
					DrawList( d.dir );

					if(d.default_file){

						d.default_file.forEach(function(f){

							$('.file[file-path="'+f.path+'"]').click();
						
						});

					}

				},ErrorHandler);

		};

		function ErrorHandler(e){

			console.log(e);
			
		};

		Config();

	};

	function GetCodeEditor(o){

		var editr = $('<div class="igrp-fileeditor-coder" id="coder-'+o.id+'"></div>');

		setTimeout(function(){

			CodeMirror(editr[0], {
		    	lineNumbers: true,
		   		matchBrackets: true,
		   		autoCloseBrackets: true,
		   		mode: "text/x-java",
		   		extraKeys: {
		   		 	"Ctrl-Space": "autocomplete"
		   		},
		   		autohint: true,
				lineWrapping: true,
				foldGutter: true,
				value : o.content

	        });

		},50);
		

		return editr;

	};

	$.IGRP.component('fileeditor',{

		classes : {

			list : { },

			set : function(name,o){
				
				if(!this.list[name])

					this.list[name] = o;

			},

			get : function(name){

				return this.list[name];

			}

		},
		
		init : function(){

			app = this;

			$('.igrp-fileeditor').each( function(i,f){

				var fileEditor = new FileEditor(f);

			});

		}

	},true);

})();