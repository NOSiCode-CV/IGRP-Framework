var GENPANELS = function(name,tparams){
	CONTAINER.call(this,name,tparams);
	var GEN = __GEN;

	var container = this;
	
	var classes = {
		tabHolder      : 'panel-group',
		ul             : 'nav-tabs',
		contentsHolder : 'tab-content',
		contentItem    : 'tab-pane',
		adder          : 'gen-tab-adder',
		remover        : 'gen-tab-remover'
	};

	container.xml.type = 'tabs';

	container.xml.structure = 'form';

	container.xslValidation = false;

	//container.xml.genType = 'menu';

	container.canRecieveFields = false;//container does not recieve any field

	container.contents = [];

	var contentsIdx =  container.contents.length+1;

	container.includes = {
		xsl : [],
		css : [{ path:'/plugins/panels/igrp.panels.css' }],
		js  : [{ path:'/plugins/panels/igrp.panels.js' }]
	};

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
						value:'igrp-accordion-group',
						label:'Accordion Menu'
					}
				]
			},
			transform:false,
			onChange:function(val){
				//console.log(container.holder.find('>.container-contents'))
				$(container.holder.find('.container-contents>.panel-group')[0]).attr('template',val);
			}
		});
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

	container.XSLToString = function(ee){
		
		updateContents();

		var rtn = "";

		try{
			var xsl = $(container.getXSL());
			
			container.contents.forEach(function(content,cidx){
				
				var titleXSL     = container.GET.path()+'/fields/'+content.GET.tag();

				var contentRows  = GEN.designRows(content.rows);

				var hClss  = cidx != 0 ? 'collapsed' : '';
				//var bClss  = cidx == 0 ? 'in' : '';
				var bClss  = '';

				var rel          = container.GET.tag()+'-'+content.GET.tag();//(new Date()).getTime();
										
				var contentXML   = $.parseXML(setXmlnsAttr('<xsl:if test="'+titleXSL+'">'+getPanelItem('<xsl:value-of select="'+titleXSL+'/label"/>',rel,hClss,bClss,content,contentRows)+'</xsl:if>'));

				xsl.append(contentXML.documentElement);	

			});

			rtn = (new XMLSerializer()).serializeToString(xsl[0]);

			rtn = rtn.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"','');

		}catch(e){
			console.log(e);
		}

		return rtn;
	}

	container.onDrawEnd = function(c){
		
		var adder = $('<button class="btn btn-box-tool '+classes.adder+'"><i style="color:green" class="fa fa-plus"></i></button>');
		//html controllers
		container.HTML = {
			holder         : $(container.holder.find('> .container-contents > .'+classes.tabHolder)[0]),
			menu           : $(container.holder.find('> .container-contents > .'+classes.tabHolder+' > .'+classes.ul)[0]),
			contentsHolder : $(container.holder.find('> .container-contents > .'+classes.tabHolder+' > .'+classes.contentsHolder)[0]),
			adder 		   : adder
		}

		//append adder
		container.holder.find('.gen-container-setts').prepend(adder)
		//design contents rows
		container.setContents(tparams.contents);
		//set interface events
		setEvents();
		//cancel transform operation - so we dont lose containers in tabs ;) - to be fixed
		container.Transform = function(){ return false; }
	}
	
	var sortableMenu = function(){
		if(container.HTML.holder.data('ui-sortable'))
				container.HTML.holder.sortable('destroy');


		if(!container.copyOptions){
			container.HTML.holder.sortable({
				items:'>.panel',
				axis:'y',
				//placeholder:'gen-panel-placeholder',
				tolerance  :'pointer',
				scroll:false,
				containment:'parent',
				handle: '.panel-heading',
				delay:250,
				stop:function(){
					updateContents();
				}
			});
		}
		
	}

	var setEvents = function(){
		
		container.HTML.adder.on('click',function(){
			container.addMenu();
			return false;
		});

		sortableMenu();

		//__GEN.layout.setViewSortable(container.HTML.contentsHolder.find('> .'+classes.contentItem));
	}

	var checkContents = function(){
		//console.log(container.contents)
		/*if(!container.contents[0])
			container.addMenu();*/
	}

	var clearContents = function(){
		$.each(container.HTML.menu.find('li'),function(i,li){
			container.removeMenu( $(li).attr('rel'),false);
		});
	}

	container.setContents = function(contents){
		clearContents();
		//console.log(container.contents)
		if(contents && contents[0])
			contents.forEach(function(c,i){container.addMenu(c);});
		else
			container.addMenu();

		//container.HTML.menu.find('li:first-child>a').click();

	}

	var newBtn = function(p){

		var btn = null;

		var f   = GEN.getDeclaredField('button');

		if(f) {

			var btnParams = p ? $.extend({},p) : {};

			if(btnParams) delete btnParams.rows;

			btn = new f.field(f.type,btnParams);

			btn.parent = container;

			btn.autoTag = true;

			//console.log( container.incrementTag('fields',btn.properties.tag) );
			//console.log( btnParams )
		
			btn.init();

			//console.log(btn.proprieties.tag);

			if(!p)
				btn.proprieties.tag = container.incrementTag('contents',btn.type);

			btn.unsetProprieties(['class','action','target','transaction','service']);

			btn.onEditionConfirm = setBtnIcon;

		}

		return btn;
	}

	container.addMenu = function(_params,callback){

		var title = _params && _params.properties && _params.properties.label ? _params.properties.label : 'Panel Item '+(container.contents.length+1);

		var btn = newBtn(_params);

		btn.SET.label(title);
	
		if(btn){

			var idx = _params && _params.properties && _params.properties.rel ? _params.proprieties.rel.split('-')[1] : contentsIdx;
			
			var headClss = idx != 1 ? 'collapsed' : '';

			var contentClss = idx == 1 ? 'in' : '';

			var rel = (new Date()).getTime();

			var item = $(getPanelItem(title,rel,headClss,contentClss,btn)); //$('<li class="'+activeClass+'" rel="tab-'+(i+1)+'">'+c.title+'</li>');

			var rowsHolder = item.find('.panel-collapse>.panel-body>.gen-rows-holder');

			var btnHolder = item.find('>.panel-heading');

			$(container.holder.find('> .container-contents > .panel-group')[0]).append(item);

			btn.rel    = 'pnl-'+rel;
			
			btn.holder = btnHolder;

			setBtnIcon(btn);

			btn.holder.attr('id',btn.GET.id());

			btn.holder.append(container.getFieldEditOptions(btn,{
				//onRemove:container.removeMenu,
				onRemove:function(e){
					var fieldHolder = $($(e.target).parents('.'+VARS.class.fieldsHolder)[0])
					var rel =  fieldHolder.attr('rel');
					container.removeMenu(rel);
				}
			}));

			if(_params && _params.rows && _params.rows[0]){
				
				var arr = __GEN.addContainersPerRow(_params.rows,rowsHolder);
		
				__GEN.dropContainers_ROW(arr,{
					callback:function(){	
						checkCopyClass();
						if(callback) callback();						
					}
				});



			}else{
				__GEN.layout.addRow({
					parent:rowsHolder
				});
			}

			checkCopyClass();

			container.contents.push(btn);

		//	console.log(rowsHolder)

			__GEN.layout.setViewSortable(rowsHolder);

			contentsIdx++;
		}

	}

	container.removeMenu = function(rel,alert){
		var content = getContent(rel);
		var ask     = alert == false ? false : true;

		if(content){
			var idx = container.contents.indexOf(content);

			if (idx > -1) {

				var _remove = function(){
					var header = container.holder.find('.panel-group >.panel>.panel-heading[rel="'+rel+'"]');
					var contentItemHTML = header.parent();
					
					container.contents.splice(idx, 1);

					removeContainersInTab(contentItemHTML);

					contentItemHTML.remove();
				    
					checkContents();

				    updateContents();
				}
				if(ask){
					if(confirm('Remove Item?'))
						_remove();
				}else{
					_remove();
				}
				//REMOVE GEN.CONTAINERS IS ARR
			}
		}
		//clearContents();
	}

	var checkCopyClass = function(){
		if(container.copyOptions){
			container.holder.addClass('gen-container-copy');
			container.holder.find('.'+VARS.class.containersHolder).addClass('gen-container-copy');
			container.HTML.adder.hide();
		}else{
			container.holder.removeClass('gen-container-copy');
			container.holder.find('.'+VARS.class.containersHolder).removeClass('gen-container-copy');
			container.HTML.adder.show();
		}

		sortableMenu();
	}

	container.onEditionConfirm = function(e){

		checkCopyClass();
		if( !container.copyOptions ){
			$.each( container.holder.find('.'+VARS.class.containersHolder),function(i,c){
				var id = $(c).attr('id');
				var container = GEN.getContainer(id);
				
				if(container)
					container.Transform();
			} );
		}
	}	

	var removeContainersInTab = function(holder){
		var contentsContainers = holder.find('.gen-container-holder');

		$.each(contentsContainers,function(i,c){
	   		var cId   = $(c).attr('id');
	   		var cType = $(c).attr('type');

	   		if(cId) GEN.removeContainer(cId);
	   		
	    });
	};

	var getContent = function(rel){
		var rtn = null;
		for(i = 0; i < container.contents.length; i++){
			
			var content = container.contents[i];
			
			if(content){
				if(rel == content.rel){
					content.title = $('> .container-contents > .panel-group > .panel > .panel-heading > .panel-title > a > span',container.holder).text();
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
		$.each(container.holder.find('> .container-contents > .panel-group > .panel '),function(i,li){
			var rel = $('>.panel-heading',li).attr('rel');
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
				var holder = $($('> .container-contents > .panel-group > .panel >.panel-collapse>.panel-body>.gen-rows-holder[rel="'+t.rel+'"]',container.holder)[0]);

				var rows   = GEN.layout.getContainersOnRows(holder,{
					includeContainerId:true
				});
				t.rows = rows;

			}else{
				console.log(t);
			}
			
		});
	}

	var setBtnIcon =function(btn){
		btn.holder.find('.panel-title>a>.fa').removeAttr('class').addClass('fa '+btn.GET.img());
	}

	var getPanelItem = function(title,rel,headClss,contentClss,btn,contents){
		var innerC = contents || '';

		var rtn = 	'<div class="panel panel-default no-shadow ">'+
					    

					    '<div class="panel-heading '+VARS.class.fieldsHolder+'" rel="pnl-'+rel+'">'+
					        '<h4 class="panel-title">'+
					        	'<a data-toggle="collapse" data-parent="#'+container.GET.tag()+'" href="#'+container.GET.tag()+'-'+btn.GET.tag()+'" class="collapse-icon-ctrl '+headClss+'">'+
						        	'<span gen-lbl-setter="true">'+title+'</span>'+
					                '<i class="fa '+btn.GET.img()+'" text-color="1"></i>'+
					            '</a>'+
					        '</h4>'+
					    '</div>'+


					    '<div id="'+container.GET.tag()+'-'+btn.GET.tag()+'" class="panel-collapse collapse '+contentClss+'">'+
					        '<div class="panel-body">'+
					        	'<div class="gen-rows-holder" rel="pnl-'+rel+'">'+innerC+'</div>'+
					        '</div>'+
					    '</div>'+

					'</div>';

		return rtn;

	}

	
}

this[VARS.name].declareContainer({
	name:'panels',
	container:GENPANELS
});