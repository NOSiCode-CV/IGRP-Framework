(function(){

	var app,

		selectors = {

			leftPanelClss : 'igrp-fileeditor-left-panel',

			saveClss 	  : 'igrp-fileeditor-save'
		};

	function FileEditor(dom){

		var fileEditor = this,

			newRequest = null,

			createURL  = $(dom).attr('create-url');

		fileEditor.templates = app.classes.get('templates');

		fileEditor.menu 	 = null;

		fileEditor.viewr   	 = $('.igrp-fileeditor-tab',dom);

		fileEditor.addModal = $('#fileeditor-add-modal');

		var AddCallBack = function(){};

		function removeEditorsErrors(resize){
		
			/*$('.igrp-fileeditor-coder').remove();
			
			$('.server-editor').removeClass('has-error');
			
			$('.server-transform').removeClass('has-error');*/
			
			$('.CodeMirror-gutter-wrapper').removeClass('has-error');
			
			if(resize)
				
				resizeCodeMirrorArea();

		};

		function resizeCodeMirrorArea(){

			var h = $(window).height()-86;
			
			$('.cm-s-default').each(function(i,cm){
				
				if( $(cm).hasClass('has-error') ){
						
					$(cm).height(h-160);
					
				}else{
					
					$(cm).height(h);
					
				}
				
			});

		};

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
											
		};

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
			           		},
			           		{
			           			name : 'fileName', 
			           			value : $(active.li).attr('file-name')
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

		};

		function OpenFile(e){

			var li 		= this,

				fileId  = $(li).attr('file-id'),

				tabID   = 'file-'+$(li).attr('id'),

				path 	= $(li).attr('file-path'),

				name    = $(li).attr('title'),

				file    = $(li).attr('file-name');

			if(!li.request){

				$(li).addClass('loading');

				li.request = $.get( path );

				li.request.then( function(d){

					fileEditor.viewr.Tab('add-item',{

						id      : tabID,

						title   : name,

						ident   : fileId,

						content : GetCodeEditor( { id : tabID, content : d } ),

						active  : true,

						close   : true,

						attrs   : {

							'file-name' : file

						},

						callback:function(r){

							var closer = $('<div class="fileeditor-menu-closer"><i class="fa fa-times"></i></div>');

							closer.on('click',function(){

								r.body.remove();

								r.li.remove();

								li.request = null;

								$(li).removeClass('active');

								$('.igrp-fileeditor-tab ul li a').first().click();

							});

							r.li.append(closer);

						}

					});

					$(li).removeClass('loading');

				});

			}else{

				fileEditor.viewr.Tab('activate', tabID );

			}

		}

		function AddNew(e){

			if(!newRequest){

				var input = $(this),

					text  = input.val(),

					options = input.data('add-options'),

					enter = e.keyCode === 13 ? true : false,

					blur  = e.type == 'focusout',

					esc   = e.keyCode === 27,

					remove = function(){

						try{

			        		input.parents('.'+options.type).first().remove();

			        	}catch(er){
			        		
			        		null;

			        	}

					};

				if ( (enter || blur )  && !esc ){
			        
			        e.preventDefault();

			        if(text){

			        	var options = input.data('add-options');

			        	if(options){

			        		$('#igrp-fileeditor').addClass('requesting');

			        		options.item.addClass('loading');

			        		newRequest = $.post( createURL, {

					        	type : options.type,

					        	path : options.path,

					        	file_type : options.fileExtension,

					        	name : text

					        }).then(function(r){

					        	var newItem = options.type == 'folder' ? $(fileEditor.templates.treeItem(r)) : $(fileEditor.templates.folderFiles([r])) 

					        	options.item.replaceWith( newItem );

					        	newRequest = null;

					        }).always(function(){

					        	options.item.remove();

					        	$('#igrp-fileeditor').removeClass('requesting');

					        });

			        	}

			        }else

			        	remove();

			        e.stopPropagation();

			        return false;

			    }

			    if (e.keyCode === 27 ) 

			    	remove();

			   	if(options.fileExtension && e.keyCode != 8){
			   		
			   		var ext     = options.fileExtension,

			   			startAt = input[0].selectionStart,

			   			newVal = text.split('.'+ext)[0];

			   		input.val( newVal+'.'+ext );

			   		input[0].selectionStart= startAt;

			   	}

			};

		    return false;

		};

		function DrawNew(o){

			var container = o.folder.find('>.collapse>ul'),

				item      = $(fileEditor.templates.newItem(o.type)),

				operation = o.type == 'folder' ? 'prepend' : 'append';

			o.item = item;

			$('input',item).data('add-options',o);

			container[operation]( item );

			o.folder.find('>span>.dropdown>a').dropdown("toggle");

			o.folder.find('>.collapse').collapse("show");			

			$('.adder-input',container).focus();

		};

		function ShowAddMenu(e){

			e.preventDefault();

			$(this).find('>span>.dropdown>a.dropdown-toggle').click()

			return false;
		
		};

		function HandleNew(e){

			e.preventDefault();

			var folder   = $(this).parents('li.folder').first(),

				type     = $(this).attr('type'),

				fileType =  $(this).attr('file-type'),

				fileExt  =  $(this).attr('file-ext'),

				dirPath  = folder.attr('dir-path');

			DrawNew({

				folder : folder,

				type : type,

				path : dirPath,

				fileType : fileType,

				fileExtension : fileExt

			});

			return false;

		};

		function Events(){

			$(fileEditor.menu).on('click','li.file:not(.brand-new)', OpenFile );

			$(dom).on('click','.add-new', HandleNew );

			$(dom).on('contextmenu','li.folder', ShowAddMenu );

			$(dom).on('keyup blur','.adder-input', AddNew );

			$(dom).on('click','.'+selectors.saveClss, Save);

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

					if(d.default_file){

						d.default_file.forEach(function(f){

							var fileItem = $('.file[file-name="'+f.fileName+'"]');

							if(fileItem[0]){

								var parents = fileItem.parents('.folder');

								parents.find('span[data-toggle]').click();

								fileItem.click();

							}
					
						});

					}

				},ErrorHandler);

			$('.igrp-fileeditor-main-panel').on('shown.bs.tab','.nav-tabs a', function(event){
				
				var href = $(this).attr('href'),

					id   = href ? href.split('#file-')[1] : false;

				if(id){

					$('.file').removeClass('active');

					$('.file#'+id).addClass('active'); 

				}

			});

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