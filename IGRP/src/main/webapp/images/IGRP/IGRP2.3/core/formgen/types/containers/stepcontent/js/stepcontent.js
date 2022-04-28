var GENTABCONTENT = function(name,tparams){
	CONTAINER.call(this,name,tparams);
	var GEN = __GEN;

	var container = this; 
	
	var classes = {
		tabHolder      : 'gen-step-holder',
		ul             : 'step-steps',
		contentsHolder : 'step-content',
		contentItem    : 'step-tab-panel',
		adder          : 'gen-tab-adder',
		remover        : 'gen-tab-remover'
	};

	container.xml.type = 'tabs';

	container.xml.structure = 'form';

	container.xslValidation = false;

	container.incrementFieldsType = 'contents';
	
	//container.xml.genType = 'menu';

	container.canRecieveFields = false;//container does not recieve any field

	container.contents = [];

	var contentsIdx =  container.contents.length+1;

	container.includes = {
		xsl : [],
		css : [{ path:'/plugins/steps/igrp.steps.css' }],
		js  : [
			{ path:'/plugins/steps/jquery.steps.min.js' },
			{ path:'/plugins/steps/igrp.steps.js' }
		]
	};

	container.ready = function(){

		container.unsetProprieties(['title']);

		/*container.setPropriety({
			name:'template',
			value:{
				value  : 'default',
				options:[
					{
						value:'default',
						label:'Default'
					},
					{
						value:'tabs',
						label:'Tabs'
					}
				]
			},
			transform : false,
			onChange  : container.setTemplate
		});

		container.setProperty({
			name     : 'justified',
			label    : 'Justified',
			value    : false,
			xslValue : 'nav-justified',
			onChange : function(v){
				var operation = v ? 'addClass' : 'removeClass';
				container.holder.find('.step-steps')[operation]('nav-justified');
			} 
		});*/

		container.setProperty({
			name     : 'controlstart',
			label    : 'Control start of step',
			value    : false
		});



	}

	/*container.setTemplate = function(template){

		var tabHolder    = $(container.holder.find('.gen-tab-holder')[0]),

			dclickAction = template == 'navbar'? 'addClass' : 'removeClass';
				
		tabHolder.attr('tab-template',template);

		tabHolder[dclickAction]('dont-click');

	}*/

	container.XSLToString = function(ee){
		
		updateContents();

		var rtn = "";

		try{

			var xsl = $(container.getXSL());

			container.contents.forEach(function(content,cidx){
				var titleXSL     = container.GET.path()+'/fields/'+content.GET.tag();
				var contentRows  = GEN.designRows(content.rows);
				//var activeClass  = cidx == 0 ? 'active' : '';
				var activeClass  = cidx == 0 ? '' : '';
				var rel          = container.GET.tag()+'-'+content.GET.tag();//(new Date()).getTime();
				var contentTitle = $.parseXML(setXmlnsAttr('<xsl:if test="'+titleXSL+'">'+getMenuItem('<xsl:value-of select="'+titleXSL+'/label"/>',rel,activeClass,content,true)+'</xsl:if>'));
				var contentXML   = $.parseXML(setXmlnsAttr('<xsl:if test="'+titleXSL+'">'+getContentItem(rel,activeClass,contentRows,content,true)+'</xsl:if>'));

				xsl.find('>.'+classes.ul).append(contentTitle.documentElement);			

				xsl.find('>.'+classes.contentsHolder).append(contentXML.documentElement);

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
		var adder = $('<button class="btn btn-box-tool '+classes.adder+'"><i style="color:green" class="fa fa-plus"></i></button>');
		//var template = container.GET.template();

		//html controllers
		container.HTML = {
			holder         : $(container.holder.find('> .container-contents > .'+classes.tabHolder)[0]),
			menu           : $(container.holder.find('> .container-contents > .'+classes.tabHolder+' > .'+classes.ul)[0]),
			contentsHolder : $(container.holder.find('> .container-contents > .'+classes.tabHolder+' > .'+classes.contentsHolder)[0]),
			adder 		   : adder
		}

		//container.setTemplate(template)

		//append adder
		container.holder.find('.gen-container-setts').prepend(adder)
		//append remover
		container.HTML.menu.find('li').append('<span class="'+classes.remover+'"></span>')
		//design contents rows
		container.setContents(tparams.contents);
		//set interface events
		setEvents();
		//cancel transform operation - so we dont lose containers in tabs ;) - to be fixed
		container.Transform = function(){ return false; }
	}
	
	var sortableMenu = function(){
		if(container.HTML.menu.data('ui-sortable'))
				container.HTML.menu.sortable('destroy');

		if(!container.copyOptions){
			container.HTML.menu.sortable({
				items:'>li',
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
		}
		
	}

	var setEvents = function(){
		
		container.HTML.adder.on('click',function(){
			container.addMenu();
			return false;
		});

		sortableMenu();

		__GEN.layout.setViewSortable(container.HTML.contentsHolder.find('> .'+classes.contentItem));
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

		container.HTML.menu.find('li:first-child>a').click();

	}

	var newBtn = function(p){
		var btn = null;
		var f   = GEN.getDeclaredField('button');
		
		if(f) {
			
			var btnParams = p ? $.extend({},p) : {};

			if(btnParams) 
				
				delete btnParams.rows;
			

			btn = new f.field(f.type,btnParams);

			btn.parent = container;

			btn.autoTag = true;
			
			btn.init();

			btn.unsetProprieties(['class','action','target','transaction','service']);

			btn.onEditionConfirm = setBtnIcon;

			btn.setEventListner('tagChange',function(v){

				var rel     = btn.holder.attr('rel'),

					content = container.holder.find('>.container-contents>.gen-stap-holder>.step-content>.step-tab-panel[rel="'+rel+'"]');

				content.attr('item-name',btn.GET.tag());

				//console.log(content);

			})

		}

		return btn;
	}

	container.addMenu = function(_params,callback){

		var title = _params && _params.properties && _params.properties.label ? _params.properties.label : 'Step Item '+(container.contents.length+1);

		var btn = newBtn(_params);
		
		if(btn){
			
			var idx = _params && _params.properties && _params.properties.rel ? _params.proprieties.rel.split('-')[1] : contentsIdx;

			//var activeClass = idx == 1 ? 'active' : '';

			var activeClass = idx == 1 ? '' : '';

			var rel = (new Date()).getTime();

			var li = $(getMenuItem(title,rel,activeClass,btn)); //$('<li class="'+activeClass+'" rel="tab-'+(i+1)+'">'+c.title+'</li>');

			var contentItem = $(getContentItem(rel,activeClass,null,btn)); //$('<div class="gen-tab-c-item '+activeClass+'" rel="tab-'+(i+1)+'"></div>')

			$(container.holder.find('> .container-contents > .gen-step-holder > .'+classes.ul)[0]).append(li);

			$(container.holder.find('> .container-contents > .gen-step-holder > .'+classes.contentsHolder)[0]).append(contentItem);

			btn.rel    = 'step-'+rel;
			
			btn.holder = li;

			btn.SET.label(title);

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
				
				var arr = __GEN.addContainersPerRow(_params.rows,contentItem);
		
				__GEN.dropContainers_ROW(arr,{
					callback:function(){	
						checkCopyClass();
						if(callback) callback();						
					}
				});



			}else{
				__GEN.layout.addRow({
					parent:contentItem
				});
			}

			checkCopyClass();

			container.contents.push(btn);

			__GEN.layout.setViewSortable(contentItem);

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
					var contentItemHTML = container.HTML.contentsHolder.find('> .'+classes.contentItem+'[rel="'+rel+'"]');
					
					container.contents.splice(idx, 1);

					removeContainersInTab(contentItemHTML);

					container.HTML.menu.find('li[rel="'+rel+'"]').remove();

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
					content.title = $('> .container-contents > .gen-step-holder > .'+classes.ul+' > li[rel="'+rel+'"] span',container.holder).text();
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
		$.each(container.holder.find('> .container-contents > .gen-step-holder > .'+classes.ul+ '> li '),function(i,li){
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
				var holder = $($('> .container-contents > .gen-step-holder > .'+classes.contentsHolder+' > .'+classes.contentItem+'[rel="'+t.rel+'"]',container.holder)[0]);
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
		btn.holder.find('>a>i.fa').removeAttr('class').addClass('fa '+btn.GET.img());
	}

	var getMenuItem = function(title,idx,_class,btn,xsl){

		var genID         = !xsl ? 'gen-field-id="'+btn.GET.id()+'"' : '';


		var icon = btn.GET.img() ? btn.GET.img() :'fa-dot-circle-o';
		
		var iconHtml = '<i class="fa '+icon+'"></i>';

		return '<li item-name="'+btn.GET.tag()+'" '+genID+' data-step-target="'+btn.GET.tag()+'" class="'+_class+' gen-fields-holder" rel="step-'+idx+'">'+
					'<a data-toggle="tab" aria-expanded="true" href="#step-'+idx+'">'+
						'<span gen-lbl-setter="true">'+title+'</span>'+
					'</a>'+
				'</li>';
	}

	var getContentItem = function(idx,_class,contents,content,xsl){
		

		var rtn = '<div class="'+classes.contentItem+' gen-rows-holder '+_class+'" data-step="'+content.GET.tag()+'" id="step-'+idx+'" rel="step-'+idx+'" item-name="'+content.GET.tag()+'">';
					if(contents) rtn+=contents;
			rtn+='</div>';

		return rtn;
	}
}

this[VARS.name].declareContainer({
	name:'stepcontent',
	container:GENTABCONTENT
});