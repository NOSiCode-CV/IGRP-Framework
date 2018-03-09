var GENBOX = function(name,tparams){
	CONTAINER.call(this,name,tparams);
	var container = this;
	var GEN = __GEN;

	container.xml.structure = 'form';

	container.contents = [{
		rows:[]
	}];
	
	container.onHasTitleSet = function(has){
		$('>.container-contents>.box>.box-header',container.holder).remove();
		
		if(has)
			$('>.container-contents>.box',container.holder).prepend(getBoxTitle());
	}

	container.onTitleSet = function(title){
		$('>.container-contents>.box>.box-header>.box-title',container.holder).text(title);
	}

	container.onCollapsibleSet = function(){
		container.onHasTitleSet( container.GET.hasTitle() )
	}

	container.onEditionConfirm = function(){
		console.log(container.customStyle.id)
	}

	container.onDrawEnd = function(){
		var boxBody = $('>.container-contents>.box>.box-body',container.holder);
		
		boxBody.addClass('gen-rows-holder');
		
		__GEN.layout.setViewSortable(boxBody);
		
		container.setContents(tparams.contents);
		
		container.Transform = function(){ return false; }
	}

	container.XSLToString = function(e) {
		var rtn = "";
		var xsl = $(container.getXSL());

		container.contents.forEach(function(content,cidx){
			var contentRows  = $.parseXML(setXmlnsAttr( '<div>'+GEN.designRows(content.rows)+'</div>'));
			xsl.find('.box-body').append(contentRows.documentElement)
		});

		rtn = (new XMLSerializer()).serializeToString(xsl[0]);
		rtn = rtn.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"','');

		return rtn;
	}

	container.beforeExport = function(c){
		updateContents();
		c.contents = [];
		container.contents.forEach(function(cont){
			c.contents.push(cont);
		});
		return c;
	}

	var getBoxTools = function(){
		return '<div class="box-tools pull-right">'+
		        	'<a class="btn btn-box-tool"><i class="fa fa-chevron-up"></i></a>'+
		       '</div>';
	};

	var getBoxTitle = function(){
		var isCollapsible    = container.GET.collapsible();
		var collapsibleClass = isCollapsible ? 'box-collapser' : '';
		var toolbox          = isCollapsible ? getBoxTools() : '';

		var rtn = '<div class="box-header '+collapsibleClass+'">'+
				      '<h3 class="box-title">'+container.GET.title()+'</h3>'+
				      toolbox+
				    '</div>'

		return rtn;
	}

	container.setContents = function(contents){
		//var params = p ? p : tparams;
		var holder = $($('> .container-contents > .box > .box-body',container.holder)[0]);
		
		if(contents && contents[0]) {
			//var contents = contents;
			contents.forEach(function(c){
				if(c && c.rows && c.rows[0]){
					var rows = c.rows;
					var arr = __GEN.addContainersPerRow(rows,holder);
					__GEN.dropContainers_ROW(arr,{});
				}
			});
		}else
			__GEN.layout.addRow({ parent:holder });			
	}

	var updateContents = function(){
		container.contents.forEach(function(t){
			var holder = $($('> .container-contents > .box > .box-body',container.holder)[0]);
			var rows   = GEN.layout.getContainersOnRows(holder,{
				includeContainerId:true
			});
			t.rows = rows;
		});
	}

}

this[VARS.name].declareContainer({
	name:'box',
	container:GENBOX
});