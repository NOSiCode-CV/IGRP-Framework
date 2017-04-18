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
				var fromSplit = con.from.split('.');
				var toSplit   = con.to.split('.');

				var source = fromSplit.length > 1 ? $('[name="'+fromSplit[0]+'"] ul [name="'+fromSplit[1]+'"] .row-name') : $('[name="'+fromSplit[0]+'"] .row-name' );
				var target = toSplit.length   > 1 ? $('[name="'+toSplit[0]+'"] ul [name="'+toSplit[1]+'"] .row-name')     : $('[name="'+toSplit[0]+'"] .row-name');
				
				if(source[0] && target[0])
					connect(source.attr('id'),target.attr('id'));
				else{
					var index = options.connections.indexOf(con);
					
					
					
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
    			var connections = jsPlumb.getAllConnections();
    			var obj         = [];

    			connections.forEach(function(c){
    				var source     = $(c.source);
    				var target     = $(c.target);
    				var sourceName = source.parent().attr('name');
    				var targetName = target.parent().attr('name');

    				var sourcePath = source.parents('ul[parent]')[0] ? $(source.parents('ul[parent]')[0]).attr('parent')+'.'+sourceName : sourceName;
    				var targetPath = target.parents('ul[parent]')[0] ? $(target.parents('ul[parent]')[0]).attr('parent')+'.'+targetName : targetName;

    				obj.push({
    					from:sourcePath,
    					to  :targetPath
    				});
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