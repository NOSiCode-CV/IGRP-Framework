$(function ( $ ) { 
	var __xsdMapperEventsSet = false;

	var validateConn = function(sId,tId){
		var rtn = true;
		var Arr = jsPlumb.getAllConnections();

		for(var i = 0; i < Arr.length; i++){
			var con = Arr[i];
			if((con.sourceId == sId && con.targetId == tId) ){
				rtn = false;
				break;
			}
		}

		return rtn;
	}

	var connect = function(sId,tId){
		if(validateConn(sId,tId)){
			var connection = jsPlumb.connect({
				source:sId,
				target:tId,
				connector:"StateMachine",
				hoverPaintStyle:{strokeStyle:"#dbe300"},
				overlays:[ ["PlainArrow", {location:1, width:10, length:12} ]],
				detachable:true
			});	
		}
	};

	var makeTargetAndSource = function(options){

		jsPlumb.makeSource($(options.source),{
			endpoint:"Dot",
			anchor:"Right",
			isTarget:false, 
			isSource:true,
			paintStyle:{ 
				strokeStyle:"#1c7aa9",
				fillStyle:"#1c7aa9",
				radius:3,
				lineWidth:3
			},
			hoverPaintStyle:{ 
				strokeStyle:"#dbe300",
				fillStyle:"#dbe300",
			},
			connectorStyle : { 
				lineWidth:3,
				strokeStyle:"#1c7aa9",
				joinstyle:"round"
			}
		});

		jsPlumb.makeTarget($(options.target),{
			anchor:"Left",
			isTarget:true, 
			isSource:false ,
			endpoint:"Dot",
			paintStyle:{ 
				strokeStyle:"transparent",
				fillStyle:"transparent",
				radius:5,
				lineWidth:5
			}
		});


		if(options.connections[0]){
			var removeble = [];

			options.connections.forEach(function(con){
				
				var fromSplit = con.from.split('.') || con.from;
				var toSplit   = con.to.split('.') || con.to;

				var source = fromSplit.length > 1 ? $('[name="'+fromSplit[0]+'"] ul [name="'+fromSplit[1]+'"] .row-name',$('#source')) : $('[name="'+fromSplit[0]+'"] .row-name',$('#source'));
				var target = toSplit.length   > 1 ? $('[name="'+toSplit[0]+'"] ul [name="'+toSplit[1]+'"] .row-name',$('#target'))     : $('[name="'+toSplit[0]+'"] .row-name',$('#target'));
				
				if(source[0] && target[0]){
					connect(source.attr('id'),target.attr('id'));
					var to 	 = toSplit[1] || con.to,
						from = fromSplit[1] || con.from;

					source.parent('li:first').attr('connected',to);
    				target.parent('li:first').attr('connected',from);
				}
				else{
					var index = options.connections.indexOf(con);

    				source.parent('li:first').removeAttr('connected');
    				target.parent('li:first').removeAttr('connected');
					
					if (index > -1) 
						removeble.push(index);
					    //options.connections.splice(index, 1);
					
					console.log('nao existe: ');
					console.log(con)

				}

			});

			removeble.forEach(function(r){
				options.connections.splice(r, 1);
			});

			removeble = [];


		}
    }

    jsPlumb.bind("beforeDrop",function(info){
    	connect(info.sourceId,info.targetId);
	});

	$(window).resize(function(e) {
	    jsPlumb.repaintEverything();
	});

    $.fn.XSDMapper = function(_options) {
    	//console.log(_options)
    	jsPlumb.detachEveryConnection();

    	var holder  = this;

    	var options = $.extend({
    		source     : '#source .row-name',
    		target     : '#target .row-name',
    		confirmBtn : 'button[rel="btn"]', 
    		connections: [],
    		from       : [],
    		to         : [],

    		onConfirm  : function(){return null;}

    	}, _options );
    	
    	var setEvents = function(){

    		//$('#gen-service-mapper').on("hidden.bs.modal hidden", GEN.edit.hide);

    		$(options.confirmBtn,holder).unbind('click').on('click',function(){

    			var connections	= jsPlumb.getAllConnections(),
    			 	obj   		= [];

    			connections.forEach(function(c){
    				var source      = $(c.source),
    				 	target      = $(c.target),

    				 	sourceName   = source.parent().attr('name'),
    				 	targetName 	 = target.parent().attr('name'),

    					parentSource = source.parents('ul[parent]')[0],
    					parentTaget  = target.parents('ul[parent]')[0],

    				 	sourcePath 	 = parentSource ? $(parentSource).attr('parent')+'.'+sourceName : sourceName,
    				 	targetPath   = parentTaget ? $(parentTaget).attr('parent')+'.'+targetName : targetName;
    				
    				//if((parentSource && parentTaget) || (!parentSource && !parentTaget)){
	    				
    					source.parent('li:first').attr('connected',targetName);
	    				target.parent('li:first').attr('connected',sourceName);
	    				
	    				obj.push({
	    					from:sourcePath,
	    					to  :targetPath
	    				});
    				//}
    				
    			});

    			$('.gen-service-panel.confConnected .row-name:not(._jsPlumb_endpoint_anchor_)').each(function(i,e){
    				$(e).parents('li:first').removeAttr('connected');
    			});

    			options.onConfirm(obj,connections);

    			//jsPlumb.detachEveryConnection();

    			$('#gen-service-mapper').modal('hide');

    			
    			return false;
    		});

    	}

    	var init = function(){
    		setEvents();
    		makeTargetAndSource(options);
    	}
    	
    	init();
    }

});