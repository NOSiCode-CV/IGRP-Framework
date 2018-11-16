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


		function removeEditorsErrors(resize){
		
			/*$('.igrp-fileeditor-coder').remove();
			
			$('.server-editor').removeClass('has-error');
			
			$('.server-transform').removeClass('has-error');*/
			
			$('.CodeMirror-gutter-wrapper').removeClass('has-error');
			
			if(resize)
				
				resizeCodeMirrorArea();
		}

		function resizeCodeMirrorArea(){

			var h = $(window).height()-86;
			
			$('.cm-s-default').each(function(i,cm){
				
				if( $(cm).hasClass('has-error') ){
						
					$(cm).height(h-160);
					
				}else{
					
					$(cm).height(h);
					
				}
				
			});

		}

		function showEditorsErrors(jsonRes,editor){

			if(jsonRes.errors){
												
				for(var file in jsonRes.errors){
					
					var partErrors = jsonRes.errors[file],
					
						part 	   = file.split('.java').join(''),
						
						/*menu 	   = $('.list-group-item.server-transform[file-name="'+file+'"]'),
						
						menuType   = menu.attr('part'),
						
						editor 	   = $('.server-editor[editor-part="'+menuType+'"]'),*/

						errorsW    = $('<div class="gen-editor-errors col-sm-12"><table><tbody/></table></div>');
					
					
					editor.addClass('has-error');
					
					//menu.addClass('has-error');
					
					partErrors.forEach(function(err){
							
						editor[0].CodeMirror.addLineClass( (err.line*1)-1 ,'gutter','has-error');
						
						errorsW.find('tbody').append(
								
							'<tr line="'+err.line+'"><td class="gen-editor-err-line">'+err.line+'</td><td class="gen-editor-err-desc">'+err.error+'</td></tr>'
						);				
						
					});
					
					editor.append(errorsW);
					
					editor[0].CodeMirror.refresh();
				}
			}
											
		}

		function Save(){

			var active 	= GetActiveTab(),

				editor  = GetEditor(active);

			try{

				$.IGRP.utils.submitStringAsFile({
					pUrl        : $(this).attr('href'),
					pNotify     : false,
					pLoading    : true,
		         	pParam      : {
		          		pArrayFiles : [
			          		{
			          			name : 'p_package', 
			          			value : editor[0].CodeMirror.getValue()
			          		}
		          		],
			           	pArrayItem  : [
			           		{
			           			name : 'p_package_id', 
			           			value : $(active.li).attr('item-id')
			           		}
			           	]
			        },
					pComplete   :function(req,text,status){

						var type 	= 'danger',
						
							message = req.statusText;

						removeEditorsErrors(true);

						if (req.status == 200) {
							type = 'success';

							var msgs = $($.parseXML(req.response)).find("message[type!='confirm'][type!='debug']");
							
							$.each(msgs,function(i,msg){
										
								var mtype  	 = $(msg).attr('type'),
									jsonRes  = JSON.parse($(msg).text());
									
								message = jsonRes.msg;
								type    = mtype == 'error' ? 'danger' : mtype;

								console.log(jsonRes);
								
								showEditorsErrors(jsonRes,editor);
							});	

							resizeCodeMirrorArea();	
						}

						$.IGRP.notify({

							message : $.IGRP.utils.htmlDecode(message),

							type	: type

						});
					}
				});

			}catch(e){
				console.log(e);
			}

			return false;
		};

		function GetActiveTab(){

			return fileEditor.viewr.Tab('get-active');

		};

		function GetEditor(active){
			return active.pane.find('.CodeMirror');
		}

		function Events(){

			$('li.file',fileEditor.menu).on('click',function(){

				var li 		= this,

					fileId  = $(li).attr('file-id'),

					tabID   = 'file-'+$(li).attr('id'),

					path 	= $(li).attr('file-path'),

					name    = $(li).attr('name');

				if(!li.request){

					$(li).addClass('loading');

					li.request = $.get( path );

					li.request.then( function(d){

						fileEditor.viewr.Tab('add-item',{

							id      : tabID,

							title   : name,

							ident   : fileId,

							content : GetCodeEditor( { id : tabID, content : d } ),

							active  : true

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
					
					DrawList( d );

					/*if(d.default_file){

						d.default_file.forEach(function(f){

							var file   = $('.file[file-id="'+f.id+'"]'),
							
								parent = file.parents('li.folder');

							if(file[0]){

								file.click();

								if (parent[0])

									$('span[data-toggle]',parent).click();
							}						
						});

					}*/

				},ErrorHandler);

		};

		function ErrorHandler(e){

			console.log(e);
			
		};

		Config();

	};

	function GetCodeEditor(o){

		var editr = $('<div class="igrp-fileeditor-coder clearfix" id="coder-'+o.id+'"></div>');

		setTimeout(function(){

			CodeMirror(editr[0], {
		    	lineNumbers: true,
		   		matchBrackets: true,
		   		autofocus:true,
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