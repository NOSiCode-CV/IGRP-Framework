function CheckConnections(){
	if(ArrFrom.length > 0 && ArrTo.length >0 && ArrFrom.length == ArrTo.length){
		var source;
		var target;
		for(var i = 0; i < ArrFrom.length ; i++){
			if(ArrFrom[i].indexOf('.') != -1){
				var SourceEl = ArrFrom[i].split('.');
				source = $('#request-panel li[name="'+SourceEl[0]+'"] .child li[name="'+SourceEl[1]+'"] .row-name').attr('id');
			}else{
				source = $('#request-panel li[name="'+ArrFrom[i]+'"] > .row-name').attr('id')
			}
			if(ArrTo[i].indexOf('.') != -1){
				var TargetEl = ArrTo[i].split('.');
				target = $('#service-panel li[name="'+TargetEl[0]+'"] .child li[name="'+TargetEl[1]+'"] .row-name').attr('id');
			}else{
				target = $('#service-panel li[name="'+ArrTo[i]+'"] > .row-name').attr('id')
			}
			if(target && source){
				Connect(source,target);
			}
		}
	}
};

function _init(){
	$('.row-symbol').click(function(){
		
		$(this).toggleClass('closed');
		var parent = $(this).parent();
			parentName = parent.attr('name'),
			child = parent.find('ul:first');
			child.toggleClass('hidden');
			
			var hidden = child.hasClass('hidden');	
			console.log($(this).parents('#request-panel').length)
			
			if(!$('#request-panel > ul li > ul').hasClass('hidden') && !$('#service-panel > ul li > ul').hasClass('hidden')){
				try{ jsPlumb.repaintEverything(); }catch(e){ console.log(e); }		
			}	
			$.each(child.find('._jsPlumb_endpoint_connected'),function(e,i){
				var con = ($(this).attr('connectionId'));
				try{
					var mySVG = document.querySelector('svg._jsPlumb_connector.'+con);
						if(!$(this).parent().parent().hasClass('hidden')){
						mySVG.removeClass('hidden')	
						}
						if(hidden){
							mySVG.addClass('hidden')
						};
				}catch(e){}
 			})
		
			
	});
		var style = { 
	 	endpoint:"Dot",
		connectorStyle : { 
			lineWidth:4,
			strokeStyle:"#61B7CF",
			joinstyle:"round"
		}

	};
	jsPlumb.makeSource($('#request-panel .row-name'),{
		endpoint:"Dot",
		anchor:"Right",
		isTarget:false, 
		isSource:true,
		maxConnections:150,
		paintStyle:{ 
			strokeStyle:"#1c7aa9",
			fillStyle:"#1c7aa9",
			radius:4,
			lineWidth:4
		},connectorStyle : { 
			lineWidth:4,
			strokeStyle:"#1c7aa9",
			joinstyle:"round"
		},
		hoverPaintStyle:{strokeStyle:"#dbe300"},
	});
	jsPlumb.makeTarget($('#service-panel .row-name'),{
		anchor:"Left",
		isTarget:true, 
		isSource:false ,
		maxConnections:240,
		endpoint:"Dot",
		paintStyle:{ 
			strokeStyle:"transparent",
			fillStyle:"transparent",
			radius:5,
			lineWidth:5
		}
	});
	
	
	CheckConnections();
	
	
	jsPlumb.bind('connection',function(info,e){
			var sHasParent = false,
				tHasParent = false,
				sHasChild = false,
				tHasChild = false,
				sourceParent,
				targetParent,
				sourceChild,
				targetChild;
				
			if($(info.source).parent().parent().attr('parent')){
				var parentUl = $(info.source).parent().parent();
				var parentName = parentUl.attr('parent');
				sourceParent = parentUl.parent('[name="'+parentName+'"]').find('.row-name:first');
				sHasParent = true;
			}
			if($(info.target).parent().parent().attr('parent')){
				var targetUl = $(info.target).parent().parent();
				var targetName = targetUl.attr('parent');
				
				targetParent = targetUl.parent('[name="'+targetName+'"]').find('.row-name:first');
				tHasParent = true;
			}
			//if(sHasParent && tHasParent){
				Connect(sourceParent.attr('id'),targetParent.attr('id'))
			//}
			if($(info.source).parent().hasClass('has-child') && $(info.target).parent().hasClass('has-child') ){//connect filhos
				//connectChild($(info.source).parent(),$(info.target).parent());
			}			
	});
	jsPlumb.bind("beforeDrop",function(info){
		Connect(info.sourceId,info.targetId)
	});
	jsPlumb.bind("connectionDetached",function(info, originalEvent){
		if($('#formular_default').find('input#'+info.connection.id).length > 0){//se já existe, remove!
			$('input#'+info.connection.id).remove();
		}
		console.log($('#formular_default').serialize())
	})
	jsPlumb.bind("click",function(e){
		console.log('transform')
	})
	$(window).resize(function(e) {
        jsPlumb.repaintEverything();
    });	
}
function connectChild(source,target){
	var targetChilds = target.find('ul.child li');
	var sourceChilds = source.find('ul.child li');
	$.each(sourceChilds,function(i,sC){
		$.each(targetChilds,function(e,tC){
			if($(sC).attr('name') == $(tC).attr('name')){
				Connect($($(sC).find('.row-name')[0]).attr('id'),$($(tC).find('.row-name')[0]).attr('id'))
			}
		})
	})
}
function Connect(sourceId,targetId){
	if(ConnValidate(sourceId,targetId)){
		var connection = jsPlumb.connect({
			source:sourceId,
			target:targetId,
			connector:"StateMachine",
			hoverPaintStyle:{strokeStyle:"#dbe300"},
			overlays:[ ["PlainArrow", {location:1, width:10, length:12} ]],
			detachable:true
		});	
		
		var conId = connection.id
		connection.addClass(conId)
		var qtdCons = $('#'+targetId).parent().find('> ._jsPlumb_endpoint_connected').length;
		var Targ = $('#'+targetId).parent().find('> ._jsPlumb_endpoint_connected')
		$(Targ[qtdCons-1]).attr('connectionId',conId)
		
		var strSource = "";
		var strTarget = "";
		if($('#'+sourceId).parent().parent().attr('parent')){
				strSource = $('#'+sourceId).parent().parent().attr('parent')+'.';
		}
		if($('#'+targetId).parent().parent().attr('parent')){
				strTarget = $('#'+targetId).parent().parent().attr('parent')+'.';
		}
		
		strSource = strSource + $('#'+sourceId).parent().attr('name');
		strTarget = strTarget + $('#'+targetId).parent().attr('name');

		var alter = false;
		$.each($("input[name='"+fromName+"']"),function(i,el){
			if($(this).val() == strSource){
				alter = true;
				$(this).next($('input[name="'+fromName+'"]')).val(strTarget)
			}
		});
		if(!alter){
			$('#formular_default').append(AppendField("hidden",fromName,strSource,connection.id));
			$('#formular_default').append(AppendField("hidden",toName,strTarget,connection.id));
		}
		console.log($('#formular_default').serialize())
	}
}
function ConnValidate(sourceId,targetId){
	var rtn = true;
	//conjunto de validações
	//se o nome do tag ==  ROWS
	if($('#'+sourceId).parent().attr('name') == 'rows' || $('#'+targetId).parent().attr('name') == 'rows'){
		rtn = false;
	}
	var Arr = jsPlumb.getAllConnections();//todas as conexões existentes

	/*ELEMENTO QUE TEM 'FILHO' NÃO PODE LIGAR COM UM ELEMENTO SEM FILHO*/
	/*if($('#'+sourceId).parent().hasClass('has-child') && !$('#'+targetId).parent().hasClass('has-child') ){ 
		rtn = false;	
	}
	if(!$('#'+sourceId).parent().hasClass('has-child') && $('#'+targetId).parent().hasClass('has-child') ){
		rtn = false;	
	}
	*/
	/*----------------------------------*/
	/*ELEMENTO FILHO SÓ LIGA COM FILHO*/
	/*if($('#'+sourceId).parent().parent().hasClass('child') && !$('#'+targetId).parent().parent().hasClass('child')){
		rtn = false;
	}
	if(!$('#'+sourceId).parent().parent().hasClass('child') && $('#'+targetId).parent().parent().hasClass('child')){
		rtn = false;
	}
	*/
	/************************************/
	/* CONEXÃO JÁ EXISTE */
	Arr.forEach(function(con){
		if((con.sourceId == sourceId && con.targetId == targetId) ){
			rtn = false;
		}
	});	
	
	
	return rtn;
}
function AppendField(type,name,value,id){
	var field = '<input type="'+type+'" name="'+name+'" value="'+value+'" id="'+id+'"/>';
	return field;
}


/*SVG MANIPULATE*/
SVGElement.prototype.hasClass = function (className) {
  return new RegExp('(\\s|^)' + className + '(\\s|$)').test(this.getAttribute('class'));
};
SVGElement.prototype.addClass = function (className) {
  if (!this.hasClass(className)) {
    this.setAttribute('class', this.getAttribute('class') + ' ' + className);
  }
};
SVGElement.prototype.removeClass = function (className) {
  var removedClass = this.getAttribute('class').replace(new RegExp('(\\s|^)' + className + '(\\s|$)', 'g'), '$2');
  if (this.hasClass(className)) {
    this.setAttribute('class', removedClass);
  }
};
SVGElement.prototype.toggleClass = function (className) {
  if (this.hasClass(className)) {
    this.removeClass(className);
  } else {
    this.addClass(className);
  }
};

