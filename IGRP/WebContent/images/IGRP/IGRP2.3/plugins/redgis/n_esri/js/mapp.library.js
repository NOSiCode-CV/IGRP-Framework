var CtxPointCtrl = null,
	MenuIdx = 3;
function getLayers(mapp){
	var Layers = new Array();
	jQ.each(mapp.find('layers .layer-theme'),function(){
		jQ.each(jQ(this).find('layer'),function(index){
			var layer = new Object({
				id:jQ(this).attr('id'),
				type:jQ(this).attr('type'),
				url: jQ(this).attr('url'),
				wmsLayers:jQ(this).attr('wms-layers'),
				label:jQ(this).attr('label'),
				editable:parseInt(jQ(this).attr('editable')),
				visible:getVisibility(parseInt(jQ(this).attr('visible'))),
				outfields:getOufields(jQ(this)),
				queries: getQueryExpression(jQ(this)),
				attRenderer:getAttRenderer(jQ(this)),
				geometryType:jQ(this).attr('geometry-type'),
				selectionSymbol: getSelectionSymbol(jQ(this))
			});
			if(parseInt(jQ(this).attr('visible')) == 1){//check on star app
				jQ(this).find('.layer-visibility').prop('checked',true);
				jQ(this).find('.layer-visibility').attr('checked',true);
			}else{
				jQ(this).find('.layer-visibility').prop('checked',false);
				jQ(this).find('.layer-visibility').attr('checked',false);
			}
		Layers.unshift(layer);
		});
	});
	return Layers;
};
function getMapPoints(mapp){
	var Points = new Array();
	jQ.each(mapp.find('mappoints points point'),function(i,point){
		
		var pointInfo = new Object();
		
		jQ.each(jQ(point).find('info i'),function(idx, _info){
			
			if(jQ(_info).attr('name') == 'coords'){
				var _point = jQ(_info).attr('value').split(',');
				
				pointInfo.long = parseFloat(_point[0]);
				pointInfo.lat = parseFloat(_point[1]);
				
				if(_point.length == 3){
					pointInfo.zoom = parseFloat(_point[2]);
				}
				
			}else{
				pointInfo[jQ(_info).attr('name')] = jQ(_info).attr('value');
			}
		})
		
		Points.push(pointInfo);
	});	

	return Points;
}
function getOufields(layer){
	if(layer.find('outfields').attr('fields')){
		return layer.find('outfields').attr('fields').split(',')
	}else{
		return "";	
	}
};
function getQueryExpression(layer){
	var Query = "",
		limit = layer.find('queries query').length,
		jn = " AND ";
	jQ.each(layer.find('queries query'),function(i){
		var field=jQ(this).attr('field'),
			type=jQ(this).attr('type');
			if(type.toUpperCase() == 'NUMBER'){//CASE NUMBER
				value= jQ(this).attr('value')
			}else{ // ASPAS
				value= "'"+jQ(this).attr('value')+"'";	
			}
		if(i == limit-1){
			Query = Query + field +'='+value;
		}else{
			Query = Query + field +'='+value+jn;
		}
	});
	return Query;
};
function getAttRenderer(layer){
	var AttRenderer = new Array();
	jQ.each(layer.find('attrenderer renderer'),function(i){
		var _field = jQ(this).attr('field'),
			_values = [],
			_colors = [];
		jQ.each(jQ(this).find('info'),function(i){
			_values[i] = jQ(this).attr('value');
			_colors[i] = jQ(this).attr('color').split(",");
			_colors[i].forEach(function(e,x){
				_colors[i][x] = +_colors[i][x];
			})
		});
		var renderer = new Object({
			field:_field,
			values:_values,
			colors:_colors
		})
		AttRenderer.push(renderer)
	});
	return AttRenderer;
}
function getVisibility(v){
	if(v == 0){
		return false;	
	}else{
		return true;	
	}
}
function MapdataConfig(){
	jQ( "mapp .slider" ).slider({ 
		value: 100,
		slide: function(e,ui){
			var value = ui.value/100,
				layerid = jQ(this).parents('layer').attr('id'),
				Layer = map.getLayer(layerid);
				Layer.setOpacity(value);
				jQ('layer#'+layerid+' context_menu').css({
					opacity:value	
				})
		}
	});
	jQ('mapp #mapdata-panel-toggle').click(function(){
		jQ('mapp').toggleClass('dataActive')
	});
	
	jQ('mapp .theme-name').click(function(){
		jQ(this).parent().toggleClass('hidden');	
	});	
	
	jQ('#mapp-holder mapp input').on('keydown',function(event){
    	if(event.keyCode == 13) {
     	 	event.preventDefault();
			
			var holder = jQ(this).parents('.submit-holder');
			
			if(holder.length > 0){
				var submitter = holder.find('*[type="submit"]');
				if(submitter.length > 0){
					submitter[0].click();	
				}
			}
      	 	return false;
   	 	}
  });
  
  jQ('#mapp-holder').parent().addClass('-mapp-parent-holder-');
  
  jQ('#mapp-fscreen-controller').on('click',function(){
	  if(!jQ(this).hasClass('active')){
			setFullScreen(true);
	  }else{
			setFullScreen(false);
	  }
  });

  jQ('.layer-theme .check-all-layers').on('change',function(){
		var checker = jQ(this);
		jQ.each(checker.parent().find('layer'),function(i,layer){
			var layerId = jQ(layer).attr('id');
			if(checker.is(':checked'))
				LayersManager.setLayerVisibility(layerId,true);					
			else
				LayersManager.setLayerVisibility(layerId,false);					
		});
	});
}

function setFullScreen(op){
	//alert(op)
	var extent = map.extent;
	if(op){
		jQ('.-mapp-parent-holder-').addClass('full-screen');
		jQ('#mapp-fscreen-controller').addClass('active');
	 	map.setExtent(extent);
	}else{
		jQ('.-mapp-parent-holder-').removeClass('full-screen');
		jQ('#mapp-fscreen-controller').removeClass('active');
		map.centerAt(esri.geometry.webMercatorToGeographic(map.extent.getCenter()))
	}	

	map.resize(true);
	map.reposition();
}

function getParamByName(name){
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function getSelectionSymbol(layer){
	var rtn = [];
	if(layer.find('selection_symbol').attr('color')){
		var corStr = (layer.find('selection_symbol').attr('color')).split(',');
		corStr.forEach(function(c){
			rtn.push(parseInt(c))
		})
	}else{//random RGB
		var color = [];
		for(var i = 0; i < 3; i++){
			color[i] = parseInt(Math.random() * (255 - 0) + 0);
		}
		rtn = color;
	}
	//rtn = [0,170,210]
	return rtn;
}

function MapToolsConfig(){
	if(jQ('#tool-contents').html() == ''){
		jQ('tools').addClass('hidden');
		jQ('body').addClass('no-tools')
	}
	jQ('tools .tool-control').click(function(){
		jQ('mapp tools').toggleClass('active');
		var _w = jQ(this).parent().find('.widget-controller.active');
		
		if(!jQ(this).hasClass('active') && _w.length > 0){
			WidgetManager.deactivateWidget(_w.attr('widgetid'))
		}
		
	});
	/*COLLAPSE CONFIG*/
	jQ('body').on('click','*[data-type="collapser"]',function(){
		var rel = jQ(this).attr('data-rel');
		jQ('*[data-type="collapser"]').removeClass('active');
		jQ(this).addClass('active');
		jQ('*[data-type="collapse-content"]').removeClass('active');
		jQ('*[data-type="collapse-content"][data-rel="'+rel+'"]').addClass('active');
	});	
	Mapp.externalUrlHolder.find('.closer').on('click',function(){
		BackgroundFade(false);
		ExternalPopup(false);
	});

	/*jQ('#mapp-holder .closer').on('click',function(){
		BackgroundFade(false);
		jQ(this).parent().removeClass('active');
	})*/
}
function getToolsContainerSize(){
	var container = jQ('mapp tools #tool-contents');
	var _dist     = 0; 
	var mHeight   = jQ('mapp#mapp').height();
	var mWidth    = jQ('mapp#mapp').width();

	container.height(mHeight-_dist);
}

function rgbValidation(rgb,inverse){
	var rtn = false;
	if(rgb.r != 0 || rgb.g != 0 || rgb.b != 0){
		if(inverse){
		
			rtn = [rgb.b,rgb.r,rgb.g];
		}else{
			rtn = [rgb.r,rgb.g,rgb.b];
		}
	}
	return rtn;
}

function MappReady(){
	jQ('body').removeClass('mapp-loading');	
	MapdataConfig();
	WidgetsControl();
}

function getMappFontFam(){
	
	return jQ('body').css('font-family');
}

function BackgroundFade(op){
	if(op){
		jQ('.black-out').addClass('active');	
	}else{
		jQ('.black-out').removeClass('active');
	}
};
function ExternalPopup(op){
	if(op){
		jQ('.mapp-external-holder').addClass('active');
	}else{
		jQ('.mapp-external-holder').removeClass('active');
	}
}
function WidgetsControl(){
	
}

function isFromMap(graphic){
	var rtn = false;
	if(graphic){
		if(graphic.getLayer()){
			if(graphic.getLayer().id == Mapp.id+'_graphics'){
				rtn = true;	
			}	
		}	
	}
	return rtn;
}
function _gTime(){
	var t = new Date();
	return t.getTime();	
}
function getUrlParamConcat(url){
	var rtn = '?';
	if(url.indexOf('?') != -1){
		rtn = '&';
	}
	return rtn;
}
function calculatePadBoxSize (element,holder){
	var w = parseInt(holder.width())-10;
	var r = element.attr('right');
	var l =element.attr('left');
	var width = w-r-l;
	element.width(width)
}

function parseOpenerValues(p){
	/*p.form
	 *p.feature
	 *p.tags [{
		name:'',
		field:''
	 }]
	 *close:true/false
	*/
	try{
		p.tags.forEach(function(tag){
			var obj = p.form.find('*[name="'+tag.name+'"]');
			var value = "";

			switch(tag.field.toUpperCase()){
				case 'GETCOORDINATES()':
					value = LayersManager.getFeatureCoordinates(p.feature).rings;
				break;
				case 'GETLAYERID()':
					value = p.feature.getLayer ? p.feature.getLayer().id : p.feature._layer.id;
				break;
				default:
					value = p.feature.attributes[tag.field.toUpperCase()];
			}

			if(obj.length > 0){
				obj.val(value);
			}
		});
		if(p.close){
	
			$(window.parent.document).find('.opener-close').click(); 
			window.close();
		}
	}catch(err){
		console.log(err);
	}
}

function cleanArray(arr){
	var rtn = [];
	for(var i = 0; i < arr.length; i++){
		if(arr[i]){
			rtn.push(arr[i]);
		}
	}
	return rtn;
}

Array.prototype.move = function (from, to) {
	//console.log('from: '+from+' to: '+to);
  	this.splice(to, 0, this.splice(from, 1)[0]);
};

jQ(document).ready(function(){
	getToolsContainerSize();
});
jQ(window).resize(function(){
	getToolsContainerSize();
})


/* LOOKUP 2.2 CONTROL  */
// JavaScript Document NOSi 2015
var vPageIndex = 0, vIframeWindow = null;

var setLookupOpener = function(pPage,pInput){
	$.data(document,'lookUpOpener',pPage);
	$.data(document,'lookUpInput',pInput);
}

var getLookupOpener = function(){
	vRtn = null;
	
	if($.data(document,'lookUpOpener') && $.data(document,'lookUpInput')){
		
		vRtn = {
			pOpener : $.data(document,'lookUpOpener'),
			pInput  : $.data(document,'lookUpInput')
		}

	}

	return vRtn;
}
var setOpenerIndex = function(pIdx){
	vPageIndex = pIdx;
}

var getOpenerIndex = function(){
	return (vPageIndex >= 0)?vPageIndex:0
}