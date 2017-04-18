var selectQuery;

var WidgetManager = new Object({
	Widgets: [],
	currentWidget:null,
	init: function(){
		//selectQuery = new esri.tasks.Query();
		this.setTools();
		this.Widgets.forEach(function(w){
			w.init();
			w.MapEventsHandler();
			//console.log(w)
		});
	},
	setWidget: function(widget){
		this.Widgets.push(widget)	
	},
	getWidget: function(id){
		var rtn = false;
		this.Widgets.forEach(function(w){
			if(w.id == id){
				rtn = w
			}
		})	
		return rtn;
	},
	disableAll: function(){
		this.Widgets.forEach(function(w){
			w.disable();
		})	
	},
	deactivateAll:function(){
		this.Widgets.forEach(function(w){
			w.deactivate();
		});
	},
	activateAll:function(){
		this.Widgets.forEach(function(w){
			w.activate();
		});
	},
	activateWidget:function(widgetid){
		var widget = WidgetManager.getWidget(widgetid);
		if(widget){
			if(this.currentWidget){
				this.deactivateWidget(this.currentWidget.id);
			}
			if(!widget.isActive){
				jQ('.widget-controller[widgetid="'+widgetid+'"]').addClass('active');
				widget.activate();
				this.currentWidget = widget;
			}
		}
	},
	deactivateWidget:function(widgetid){
		var widget = WidgetManager.getWidget(widgetid);
		if(widget){
			if(widget.isActive){
				widget.deactivate();
				jQ('.widget-controller[widgetid="'+widgetid+'"]').removeClass('active');
				this.currentWidget = null;
			}
		}
	},
	setTools:function(){
		var _this = this;
		jQ('.widget-controller').on('click',function(){
			var id = jQ(this).attr('widgetid');
			if(!jQ(this).hasClass('active')){
				_this.activateWidget(id);
			}else{
				_this.deactivateWidget(id);	
				jQ(this).removeClass('active');
			}
		});	
	}
});
var Widget = function(id){
	var _widget = this;
	this.id = id;
	this.isActive = false;
	this.Html = jQ('widget#'+id);
	this.stepClass = 'widget-step';
	this.controller = null;
	this.widgetMenu = null;
	this.option = "";
	this.destroy = function(){}//destroy
	this.enable = function(){}//enable
	this.disable = function(){}//disable
	/*Events*/
	this.onPanStart = function(e){ };
	this.onBaseMapChange = function(e){ };
	this.onPanEnd = function(e){ };
	this.onZoomStart = function(e){ };
	this.onZoomEnd = function(e){ };
	this.onMapClick = function(e){ };
	this.onMapDbClick = function(e){ };
	this.onMapExtentChange = function(e){ };
	this.onMapRightClick = function(e){ };
	this.onLayersAddResult = function(e){};
	this.onLayerAddResult = function(e){};
	this.onInit = function(){ /*callback on the initialization of widget */ };
	this.beforeActivate = function(e){ /*callback before activating the widget (widget controll click)*/ };
	this.onActivate = function(e){ /*callback on activating the widget (widget controll click)*/ };
	this.beforeDeactivate = function(e){ /*callback before deactivating the widget (widget controll click)*/ };
	this.onDeactivate = function(e){ /*callback on deactivating the widget (widget controll click)*/ };
	this.ToolsConfig = function(){};
	
	this.init = function(){
		this._interface();
		this.onInit();	//incialize
	}
	this.activate = function(){
		LayersManager.hideLayerMenu();
		jQ('mapp tools').addClass('active');
		this.isActive = true;
		this.show();

		this.onActivate();
	};
	this.deactivate = function(){
		this.beforeDeactivate();
		this.isActive = false;
		this.hide();
		Mapp.isDrawing = false;
		Mapp.isEditing = false;
		LayersManager.unlock();
		/*jQ.each(_widget.Html.find('.'+_widget.stepClass),function(i,step){
			_widget.unsetActiveStep(jQ(this).attr('step'));
			_widget.unsetStepDone(jQ(this).attr('step'));	
		});*/
		this.clearSteps();
		this.onDeactivate();
	}
	this.show = function(){
		var id = this.id;
		if(this.isActive){
			if(this.Html){
				this.Html.addClass('active');
			}
		}
	};
	this.hide = function(){
		var id = this.id;
		if(this.Html){
			this.Html.removeClass('active');
		}
	};
	this._interface = function(){
		if(jQ('.widget-controller[widgetid="'+_widget.id+'"]').length > 0){
			this.controller = jQ('.widget-controller[widgetid="'+_widget.id+'"]');
			this.controller.addClass('set');	
		}
		if(this.Html.find('.widget-option-group').length > 0){
			this.widgetMenu = this.Html.find('.widget-option-group');
			this.setWidgetMenuPosition();
			jQ(window).resize(_widget.setWidgetMenuPosition);
		}
	}
	this.setWidgetMenuPosition = function(){
		if(this.widgetMenu && this.controller){
			var mappOffset = jQ('#mapp-holder').offset().top;
			var _top = this.controller.offset().top - mappOffset;
			this.widgetMenu.css({
				top:_top
			});
		}
	}
	this.setStepInfo = function(p){
		/*
		 * option
		 * step: actual step
		 * type : text,value
		 * tagid: id of the element
		 * value: _value
		 */
		 var element = jQ(_widget.Html.find('.widget-option[rel="'+p.option+'"] .'+_widget.stepClass+'[step="'+p.step+'"] #'+p.tagid));
		 
		 switch(p.type){
		 	case 'text':
		 		element.text(p.value);
		 	break;
		 	case 'value':
		 		element.val(p.value);
		 	break;
		 }
		 
	}

	this.unsetStepInfo = function(option,step){
		var steps = jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"]'));	
	}
	this.setStepDone = function(option,step) {
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"]')).addClass('done');
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"] .step-help')).hide();
	}
	this.unsetStepDone = function(option,step){
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"]')).removeClass('done');
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"] .step-help')).show();
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"] .step-info-list')).html('');
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"] .step-info-text')).text('');
	}
	this.setActiveStep = function(option,step){
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"]')).addClass('active');
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"] .step-help')).show();
	}
	this.unsetActiveStep = function(option,step){
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"]')).removeClass('active');
		jQ(_widget.Html.find('.widget-option[rel="'+option+'"] .'+_widget.stepClass+'[step="'+step+'"] .step-help')).hide();
	}
	this.clearSteps = function(){
		jQ.each(jQ(_widget.Html.find('.widget-option')),function(i,_option){
			var option = jQ(_option).attr('rel');
			jQ.each(jQ(_option).find('.'+_widget.stepClass),function(idx,_step){
				var step = (jQ(_step).attr('step'))
				_widget.unsetStepDone(option,step);
				_widget.unsetActiveStep(option,step);
			});
		});
	}
	this.resetSteps = function(){
		this.clearSteps();
		var opt = jQ(_widget.Html.find('.widget-option:first-child')).attr('rel')
		
		this.setActiveStep(opt,1);

	}
	this.MapEventsHandler = function(){
		//if(this.isActive){
			map.on('zoom-start',function(e){
				if(_widget.isActive){
					_widget.onZoomStart(e);
				}
			});
			map.on('zoom-end',function(e){
				if(_widget.isActive){
					_widget.onZoomEnd(e);
				}
			});
			map.on('pan-start',function(e){
				if(_widget.isActive){
					_widget.onPanStart(e);
				}
			});
			map.on('pan-end',function(e){
				if(_widget.isActive){
					_widget.onPanEnd(e);
				}
			});
			map.on('click',function(e){
				if(_widget.isActive){
					_widget.onMapClick(e);
				}
			});	
			map.on('dbl-click',function(e){
				if(_widget.isActive){
					_widget.onMapDbClick(e);
				}
			});	
			map.on('extent-change',function(e){
				if(_widget.isActive){
					_widget.onMapExtentChange(e);
				}
			});
			map.on('basemap-change',function(e){
				if(_widget.isActive){
					_widget.onBaseMapChange(e);
				}
			});
			map.on('layers-add-result',function(e){
				if(_widget.isActive){
					_widget.onLayersAddResult(e.layers);
				}
			});
			map.on('layer-add-result',function(e){
				if(_widget.isActive){
					_widget.onLayerAddResult(e);
				}
			});
			/* RIGHT CLICK */
			map.on('mouse-down',function(e){
				if(_widget.isActive){
					if(e.which == 3){
						_widget.onMapRightClick(e);
					}
				}
			})
			
		//}
	};

	this.includeCss = function(name){
		var widgetCssPath = path+'/extentions/n_esri/widgets/css/'+name+'.css';
		var head = jQ('.-mapp-parent-holder- includes link[rel="stylesheet"]');
		var exist = false;
		for(var i = 0; i < head.length; i++){
			if( jQ(head[i]).attr('href').indexOf(widgetCssPath) >= 0 ){
				exist = true;
			};
		}
		if(!exist){
			try{
				var d = new Date();
				var nocache = d.getTime();
				var css = jQ(document.createElement('link'));
				css.attr('href',widgetCssPath+'?v='+nocache);
				css.attr('rel','stylesheet');
				css.attr('type','text/css');
				jQ('.-mapp-parent-holder- includes').append(css);
			}catch(err){
				console.log(err)
			}
		}
	}
	WidgetManager.setWidget(this);
}