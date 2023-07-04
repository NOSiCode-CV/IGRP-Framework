var GEN_TABS = function(GEN){
	var tabs = this;

	var classes = {
		tabHolder      : 'gen-tab-holder',
		ul             : 'gen-tab-menu-h',
		contentsHolder : 'gen-tab-contents-h',
		contentItem    : 'gen-tab-c-item',
		adder          : 'gen-tab-adder',
		remover        : 'gen-tab-remover'
	}

	var filesIncluded = false;

	var tabsArr   = [];

	var genTabSettingsHolder = $('#gen-tabs-settings');

	var TAB = function(p,args){
		var tab = this;
		var contentsIdx =  1;

		includeFiles();

		tab.id            = 'tab-holder-'+(new Date()).getTime();


		tab.menu           = $('<ul class="'+classes.ul+'"></ul>');
		tab.contentsHolder = $('<div class="'+classes.contentsHolder+'"></div>');
		tab.adder          = $('<div class="'+classes.adder+'"></div>');

		tab.holder   = p.holder ? p.holder : GEN.TABS.getItemBeforeDrop('tabholder');
		
		tab.contents = [];

		tab.getContent = function(rel){
			var rtn = null;
			for(i = 0; i < tab.contents.length; i++){
				var content = tab.contents[i];
				if(content){
					if(rel == content.rel){
						content.title = $('> .'+classes.ul+' > li[rel="'+rel+'"] span',tab.holder).text();
						rtn = content;
						break;
					}
				}
			}
			return rtn;
		}

		tab.updateContents = function(){
			var _arr = []; 
			//update order
			$.each(tab.holder.find('> .'+classes.ul+ '> li'),function(i,li){
				var rel = $(li).attr('rel');
				var content = tab.getContent(rel);
				if(content)
					_arr.push(content);
			});

			if(_arr.length == tab.contents.length)
				tab.contents = _arr;
			else
				console.log('error reordering');

			//update rows
			tab.contents.forEach(function(t){
				if(t){
					var holder = $($('> .'+classes.contentsHolder+' > .'+classes.contentItem+'[rel="'+t.rel+'"]',tab.holder)[0]);
					var rows   = GEN.layout.getContainersOnRows(holder,{
						includeContainerId:true
					});
					t.rows = rows;
				}else{
					console.log(t);
				}
				
			});
		}

		tab.removeMenu = function(rel){
			var content = tab.getContent(rel);
			if(content){
				var idx = tab.contents.indexOf(content);
				if (idx > -1) {
					if(confirm('Remover item?')){
						tab.contents.splice(idx, 1);
					    tab.menu.find('li[rel="'+rel+'"]').remove();

					    var contentHtml = tab.contentsHolder.find('> .'+classes.contentItem+'[rel="'+rel+'"]');

					    removeContainersInTab(contentHtml);

					    contentHtml.remove();

						tab.updateContents();
						
					}
					//REMOVE GEN.CONTAINERS IS ARR
				}
			}
		}

		tab.addMenu = function(params,callback){

			var content = params ? params : {
				title:'Tab Item',
				rel  :'tab-'+contentsIdx
			};

			var idx = params && params.rel ? params.rel.split('-')[1] : contentsIdx;

			var activeClass = idx == 1 ? 'active' : '';

			var li = tabs.getMenuItem(content.title,idx,activeClass); //$('<li class="'+activeClass+'" rel="tab-'+(i+1)+'">'+c.title+'</li>');
			
			var contentItem = tabs.getContentItem(idx,activeClass); //$('<div class="gen-tab-c-item '+activeClass+'" rel="tab-'+(i+1)+'"></div>')

			tab.holder.find('> .'+classes.ul).append(li);

			tab.holder.find('> .'+classes.contentsHolder).append(contentItem);

			if(content.rows && content.rows[0]){
				
				var arr = GEN.addContainersPerRow(content.rows,contentItem);
				
				GEN.dropContainers_ROW(arr,{
					callback:function(){	
						if(callback) callback();						
					}
				});
				
			}else{

				GEN.layout.addRow({
					parent:contentItem
				});
			}

			content.rows = GEN.layout.getContainersOnRows(contentItem);

			tab.contents.push(content);

			GEN.layout.setViewSortable(contentItem);

			contentsIdx++;
		}

		tab.export = function(){
			return {
				proprieties:{ type:'tabholder' },
				contents:tab.contents
			};
		}

		/* SET HOLDER*/
		var setHolder = function(){
			
			tab.holder.append(tab.menu);
			tab.holder.append(tab.adder);
			tab.holder.append(tab.contentsHolder);
			tab.holder.attr('id',tab.id);
			tab.holder.prepend('<div class="container-settings"><div class="container-settings-title">tab</div><ul class="container-options"><li class="container-edit gen-edition-btn" rel="gen-edition" alt="Editar" title="Editar"></li><li class="container-remove" alt="Remover" title="Remover"></li></ul></div>');
			
			setUpHolder(tab.holder);

			var holderPh = p.column ? p.column.find('> .gen-column-inner > .gen-container-placeholder') : false;

			if(holderPh) 
				holderPh.insertAt(tab.holder,p.index);

			$('> li:first-child',tab.menu).click();
		}

		var setInitialContents = function(){
			//console.log(p.contents);
			//console.log(p);

			tab.proprieties = {
				template:'default'
			}

			tab.holder.attr('tab-template',tab.proprieties.template);

			if(p.contents && p.contents[0]){
				p.contents.forEach(function(t,i){
					tab.addMenu(t,function(){
						if(i == p.contents.length-1)
							if(args && args.callback) args.callback();
					});
				});
			}else{
				tab.addMenu();
			}
		}

		setHolder();
		setInitialContents();
	}

	tabs.new = function(dropped,args){
		var params   = dropped.params ? dropped.params : {};
		
		var tab = new TAB({
			column   : dropped.column,
			index    : dropped.index,
			holder   : dropped.holder,
			contents : params.contents ? params.contents : false
		},args);

		tabsArr.push(tab);
	}

	tabs.get = function(id){
		var rtn = false;
		for(i = 0; i < tabsArr.length; i++){
			var t = tabsArr[i];
			if(t.id == id){
				t.updateContents();
				rtn = t;
				break;
			}
		}
		return rtn;
	}

	tabs.remove = function(id){
		var tab = tabs.get(id);
		if(tab){
			var idx = tabsArr.indexOf(tab);
			
			removeContainersInTab(tab.holder);

			if(idx > -1)
				tabsArr.splice(idx,1);

			tab.holder.remove();

		}
	}

	var removeContainersInTab = function(holder){
		var contentsContainers = holder.find('.gen-container-holder, .'+classes.tabHolder);
		
		$.each(contentsContainers,function(i,c){
	   		var cId   = $(c).attr('id');
	   		var cType = $(c).attr('type');
	   		
	   		if(cId){
	   			if(cType == 'tabholder')
	   				tabs.remove(cId);
	   			else
	   				GEN.removeContainer(cId);
	   		}
	    });
	}

	var setUpHolder = function(holder){
		var id = holder.attr('id');
		var menu = $('> .'+classes.ul,holder);

		menu.sortable({
			items:'li',
			axis:'x',
			containment:'parent',
			delay:200,
			stop:function(){
				var tab = tabs.get(id);
				if(tab) tab.updateContents();
			}
		});
	}

	var beforeEdit = function(){
		GEN.edit.hide();
		genTabSettingsHolder.attr('tab-id','');
		genTabSettingsHolder.addClass('active');

		$('#content[rel="gen-contents-holder"]').addClass('editing');
		
	}
	var setEvents = function(){
		//draggable
		$(VARS.html.tab).draggable({
			helper:function(e){
				return tabs.getItemBeforeDrop($(e.currentTarget).attr('name'));
			},
			start:function(e,ui){
				$(e.currentTarget).addClass('draggin')
			},
			stop:function(e,ui){
				$(e.target).removeClass('draggin');

			},
			cursor: 'move',
			scroll:false,
			zIndex: 1000,
			connectToSortable:VARS.html.containersPlaceHolder
		});

		//add new tabMenu
		$(GEN.VIEW).on('click','.'+classes.adder,function(){
			var tabId = $(this).parent().attr('id');
			var tab   = tabs.get(tabId);
			
			//if(tab) tab.addMenu();
		});

		//remove a tabMenu
		$(GEN.VIEW).on('click','.'+classes.remover,function(){
			var holder = $($(this).parents('.gen-tab-holder')[0]);
			var tabId = holder.attr('id');
			var tab   = tabs.get(tabId);
			var rel   = $(this).parent().attr('rel');

			if(tab && confirm('Remover Item?')) 
				tab.removeMenu(rel);
		});

		//rename tab title
		$(GEN.VIEW).on('dblclick','.'+classes.ul+' li',function(){
			var li = $(this);
			var rel    = li.attr('rel');
			var holder = $(li.parents('.'+classes.tabHolder)[0]);
			var id     = holder.attr('id');

			var tab = tabs.get(id);

			if(tab){
				var content = tab.getContent(rel);
				if(content){
					var span = $('span:not(.'+classes.remover+')',li);

					li.addClass('tab-title-set');

					span.switchToInput({
						class:'gen-tab-namer',
						onBlur:function(){
							li.removeClass('tab-title-set');
							tab.updateContents();
						}
					});

				}
			}
		});

		$(GEN.VIEW).on('click','.'+classes.tabHolder+' > .container-settings > .container-options > .container-remove',function(){
			var id = $($(this).parents('.'+classes.tabHolder)[0]).attr('id');
			if(confirm('Remover Tab?'))
				tabs.remove(id);
		});

		/*$(GEN.VIEW).on('click','.'+classes.tabHolder+' .gen-edition-btn',function(){
			beforeEdit();
			var tabId = $(this).parents('.'+classes.tabHolder).attr('id');
			var tab = tabs.get(tabId);
			genTabSettingsHolder.attr('tab-id',tabId);
		});

		$(GEN.VIEW).on('click','.'+classes.tabHolder+' .gen-edition-btn',function(){
			beforeEdit();
			var tabId = $(this).parents('.'+classes.tabHolder).attr('id');
			var tab = tabs.get(tabId);
			
			if(tab){
				genTabSettingsHolder.attr('tab-id',tabId);
				for(var prop in tab.proprieties){
					var setter = $('#gen_tab_'+prop);
					var type   = setter.prop('tagName') == 'SELECT' ? 'select' : setter.attr('type');
					if(setter[0] && type){
						setter.val(tab.proprieties[prop]);
						switch (type){
							case 'select':
								setter.trigger('chosen:updated');
							break;
						}
					}
				}
			}
		});

		genTabSettingsHolder.on('change','select',function(){
			var tabId = genTabSettingsHolder.attr('tab-id');
			var tab = tabs.get(tabId);
			if(tab){
				var settingName = $(this).attr('id').split('gen_tab_')[1];
				var settingVal  = $(this).val();

				tab.proprieties[settingName] = settingVal;
				tab.holder.attr('tab-template',settingVal);
			}
		});*/




		//$(GEN.VIEW).on('click',)

	}

	tabs.hideSettings = function(){
		genTabSettingsHolder.removeClass('active');
		genTabSettingsHolder.attr('tab-id','');
	}

	tabs.getItemBeforeDrop = function(type,genType){
		var gType = genType ? genType : 'container';
		var holder = HTML({
			tag   : 'li',
			name  : type,
			type  : type,
			class :'gen-declared-containers '+classes.tabHolder+' gen-rows-holder',
		});
		
		return holder;
	}

	tabs.getMenuItem = function(title,idx,_class){
		return $('<li class="'+_class+'" rel="tab-'+idx+'"><span>'+title+'</span><span class="'+classes.remover+'"></span></li>');
	}

	tabs.getContentItem = function(idx,_class){
		return $('<div class="'+classes.contentItem+' gen-rows-holder '+_class+'" rel="tab-'+idx+'"></div>');
	}

	var includeFiles = function(){
		if(!filesIncluded){

			GEN.includeToHead([
				{ type : 'css', relative : true, path : '/extensions/formgen/types/containers/gentab/css/tab.css'},
				{ type : 'js',  relative : true, path : '/extensions/formgen/types/containers/gentab/js/tab.js'}
			]);

			filesIncluded = true;
		}
	}

	var init = function(){
		setEvents();
	}

	init();
}