var GENTABCONTENT = function(name,params){
	CONTAINER.call(this,name,params);
	var GEN = __GEN;
	var container = this;

	container.xml.type = 'tabs';

	container.canRecieveFields = false;//container does not recieve any field

	var classes = {
		tabHolder      : 'gen-tab-holder',
		ul             : 'gen-tab-menu-h',
		contentsHolder : 'gen-tab-contents-h',
		contentItem    : 'gen-tab-c-item',
		adder          : 'gen-tab-adder',
		remover        : 'gen-tab-remover'
	};

	container.contents = [];

	var contentsIdx    =  container.contents.length+1;

	container.includes = {
		xsl : [],
		css : [{ path:'igrp.tabs.css' }],
		js  : [{ path:'igrp.tabs.js' }]
	}

	container.ready = function(){

		container.unsetProprieties(['title']);

		container.setPropriety({
			name:'template',
			value:{
				value  : 'default',
				options:[
					{
						value:'default',
						label:'Default'
					},
					{
						value:'clean',
						label:'Clean'
					},
					{
						value:'buttons',
						label:'Buttons'
					},
				]
			},
			transform:false,
			onChange:function(val){
				$(container.holder.find('.gen-tab-holder')[0]).attr('tab-template',val);
			}
		});
	}

	container.XSLToString = function(ee){
		updateContents();
		var rtn = "";
		
		try{
			var xsl = $(container.getXSL());

			container.contents.forEach(function(content,cidx){
				var titleXSL     = container.GET.path()+"/item[@name='"+content.GET.tag()+"']";
				var contentRows  = GEN.designRows(content.rows);
				var activeClass  = cidx == 0 ? 'active' : '';
				var contentTitle = $.parseXML(setXmlnsAttr('<xsl:if test="'+titleXSL+'"><li class="'+activeClass+'" rel="tab-'+(cidx+1)+'"><span><xsl:value-of select="'+titleXSL+'/title"/></span></li></xsl:if>'));
				var contentXML   = $.parseXML(setXmlnsAttr('<xsl:if test="'+titleXSL+'"><div class="gen-tab-c-item gen-rows-holder '+activeClass+'" rel="tab-'+(cidx+1)+'">'+contentRows+'</div></xsl:if>'));

				xsl.find('.gen-tab-menu-h').append(contentTitle.documentElement);					
				xsl.find('.gen-tab-contents-h').append(contentXML.documentElement);
				
			});

			rtn = (new XMLSerializer()).serializeToString(xsl[0]);
			rtn = rtn.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"','');

		}catch(e){
			console.log(e);
		}

		return rtn;
	}

	container.beforeExport = function(c){
		updateContents();
		c.contents = [];
		container.contents.forEach(function(cont){
			var content =  cont.export();
			content.rows = cont.rows;
			c.contents.push(content);
		});

		return c;
	}

	container.onDrawEnd = function(c){
		var adder = $('<div class="'+classes.adder+'"></div>');
		//html controllers
		container.HTML = {
			holder         : $(container.holder.find('> .container-contents > .'+classes.tabHolder)[0]),
			menu           : $(container.holder.find('> .container-contents > .'+classes.tabHolder+' > .'+classes.ul)[0]),
			contentsHolder : $(container.holder.find('> .container-contents > .'+classes.tabHolder+' > .'+classes.contentsHolder)[0]),
			adder 		   : adder
		}
		//append adder
		container.HTML.holder.append(adder);
		//append remover
		container.HTML.menu.find('li').append('<span class="'+classes.remover+'"></span>')
		//design contents rows
		setContents();
		//set interface events
		setEvents();
		//cancel transform operation - so we dont lose containers in tabs ;) - to be fixed
		container.Transform = function(){ return false; }
	}

	var setEvents = function(){
		
		container.HTML.adder.on('click',function(){
			container.addMenu();
		});

		container.HTML.menu.sortable({
			items:'li',
			axis:'x',
			placeholder:'gen-tab-placeholder',
			tolerance  :'pointer',
			scroll:false,
			containment:'parent',
			delay:200,
			stop:function(){
				updateContents();
			}
		});

		__GEN.layout.setViewSortable(container.HTML.contentsHolder.find('> .'+classes.contentItem));
	}

	var checkContents = function(){
		if(!container.contents[0])
			container.addMenu();
	}

	var setContents = function(){
		if(params && params.contents && params.contents[0]){
			params.contents.forEach(function(c,i){
				container.addMenu(c);
			});
		}else{
			container.addMenu();
		}
	}

	var newBtn = function(p){
		var btn = null;
		var f   = GEN.getDeclaredField('button');
		
		if(f) {
			var btnParams = p ? $.extend(true, {}, p) : null;

			if(btnParams) delete btnParams.rows;

			btn = new f.field('button',btnParams);
			
			btn.parent = container;

			btn.autoTag = true;
			
			btn.init();

			btn.unsetProprieties(['action','target']);

		}

		return btn;
	}

	container.addMenu = function(_params,callback){

		var title = _params && _params.label ? _params.label : 'Tab Item '+(container.contents.length+1);

		var btn = newBtn(_params);

		var idx = _params && _params.rel ? _params.rel.split('-')[1] : contentsIdx;

		var activeClass = idx == 1 ? 'active' : '';

		var li = getMenuItem(title,idx,activeClass); //$('<li class="'+activeClass+'" rel="tab-'+(i+1)+'">'+c.title+'</li>');
		
		var contentItem = getContentItem(idx,activeClass); //$('<div class="gen-tab-c-item '+activeClass+'" rel="tab-'+(i+1)+'"></div>')

		$(container.holder.find('> .container-contents > .gen-tab-holder > .'+classes.ul)[0]).append(li);

		$(container.holder.find('> .container-contents > .gen-tab-holder > .'+classes.contentsHolder)[0]).append(contentItem);

		btn.rel    = 'tab-'+contentsIdx;
		
		btn.holder = li;

		btn.SET.label(title);

		btn.holder.attr('id',btn.GET.id());

		btn.holder.append(container.getFieldEditOptions(btn,{
			onRemove:container.removeMenu
		}));

		if(_params && _params.rows && _params.rows[0]){
			
			var arr = __GEN.addContainersPerRow(_params.rows,contentItem);
			__GEN.dropContainers_ROW(arr,{
				callback:function(){	
					if(callback) callback();						
				}
			});
		}else{
			__GEN.layout.addRow({
				parent:contentItem
			});
		}

		container.contents.push(btn);

		__GEN.layout.setViewSortable(contentItem);

		contentsIdx++;	
	}

	container.removeMenu = function(e){
		var fieldHolder = $($(e.target).parents('.'+VARS.class.fieldsHolder)[0])
		var rel =  fieldHolder.attr('rel');
		var content = getContent(rel);
		
		if(content){
			var idx = container.contents.indexOf(content);

			if (idx > -1) {
				if(confirm('Remover item?')){
					var contentItemHTML = container.HTML.contentsHolder.find('> .'+classes.contentItem+'[rel="'+rel+'"]');
					container.contents.splice(idx, 1);

					removeContainersInTab(contentItemHTML);

					container.HTML.menu.find('li[rel="'+rel+'"]').remove();

					contentItemHTML.remove();
				    
					checkContents();

				    updateContents();
				}
				//REMOVE GEN.CONTAINERS IS ARR
			}
		}
	}

	container.onRemove = function(){
		removeContainersInTab(container.HTML.holder);
	}
	
	var removeContainersInTab = function(holder){
		var contentsContainers = holder.find('.gen-container-holder');

		$.each(contentsContainers,function(i,c){
	   		var cId   = $(c).attr('id');
	   		var cType = $(c).attr('type');

	   		if(cId) GEN.removeContainer(cId);
	   		
	    });
	}

	var getContent = function(rel){
		var rtn = null;
		for(i = 0; i < container.contents.length; i++){
			
			var content = container.contents[i];
			
			if(content){
				if(rel == content.rel){
					content.title = $('> .container-contents > .gen-tab-holder > .'+classes.ul+' > li[rel="'+rel+'"] span',container.holder).text();
					rtn = content;
					break;
				}
			}
		}
		return rtn;
	}
	
	var updateContents = function(){
		var _arr = []; 
		//update order

		$.each(container.holder.find('> .container-contents > .gen-tab-holder > .'+classes.ul+ '> li'),function(i,li){
			var rel = $(li).attr('rel');
			var content = getContent(rel);
			if(content)
				_arr.push(content);
		});

		if(_arr.length == container.contents.length)
			container.contents = _arr;
		else
			console.log('error reordering');

		//update rows
		container.contents.forEach(function(t){
			if(t){
				var holder = $($('> .container-contents > .gen-tab-holder > .'+classes.contentsHolder+' > .'+classes.contentItem+'[rel="'+t.rel+'"]',container.holder)[0]);
				var rows   = GEN.layout.getContainersOnRows(holder,{
					includeContainerId:true
				});
				t.rows = rows;
			}else{
				console.log(t);
			}
			
		});
	}

	var getMenuItem = function(title,idx,_class){
		return $('<li class="'+_class+' gen-fields-holder" rel="tab-'+idx+'"><span gen-lbl-setter="true">'+title+'</span></li>');
	}

	var getContentItem = function(idx,_class){
		return $('<div class="'+classes.contentItem+' gen-rows-holder '+_class+'" rel="tab-'+idx+'"></div>');
	}

}

this[VARS.name].declareContainer({
	name:'tabcontent',
	container:GENTABCONTENT
});