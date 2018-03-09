(function ( jQ ) { 
    jQ.fn.IGRPCoordsReturn = function() {
		var id = this.attr('id');
		var w = new Widget(id);
		var pArr = this.attr('points').split(',')
		
		w.Html = this;
		w.drawTool = null;
		w.state = parseInt(this.attr('state'));
		w.type = this.attr('type')
		w.marker = this.attr('marker');
		w._PointZoom = null;
		w._Point = [];
		
		w._Point = [];

		if(pArr && pArr.length > 0){
			pArr.forEach(function(p){
				if(pArr != ''){
					w._Point.push(parseFloat(p));
				}
			});
		};
		
		w.drawSymbol = null;
		
		w.init = function(){

			w.ToolsConfig();

			if(w.state){
				w.activate();
			};

			if(w._Point && w._Point.length > 0){
				w.DrawPoint();
			};
			
		};

		w.activate = function(){
			this.isActive = true;
			//console.log(this.isActive)
			//console.log(this.Html)
			if(this.Html){
				//this.show();
				//this.Html.addClass('active')	
			}
			this.enable();
		};

		w.ToolsConfig = function(){
			w.drawTool = DrawingTool.getTool({showTooltips:true},w.DrawEnd)
			w.drawSymbol = new esri.symbol.PictureMarkerSymbol(w.marker,20,20);
			jQ('.widget-controller[widgetid="'+w.id+'"]').click(function(){
				w.enable();
			});
			jQ('.point-reset').click(function(){
				w._reset();
				//map.graphics.clear();
				//w.hideOptions();
				//w.enable();
			})
			jQ('.igrp-coords-return').click(function(){
				if(window.opener){
					var opener = jQ(window.opener.document.formular_default);
					var x = w._Point.x;
					var y = w._Point.y;
					jQ('input[name="p_coordenadas"]',opener).val(x+','+y+','+w._PointZoom);
					window.close();
				};
				return false;
			});
			require(["esri/dijit/LocateButton"], function(LocateButton) { 
				//var yAreHereIcon = 'http://localhost/images/igrp/extentions/n_esri/widgets/img/igrp/here.png';
				var locateButton = new LocateButton({
				  map: map,
				  visible: true,
				  showPointer: true,
				  symbol: null,
				  scale: null,
				  geolocationOptions: {
					maximumAge: 0,
					timeout: 15000,
					enableHighAccuracy: true
				  }
				});
				
				locateButton.startup();
				
				jQ('widget#'+w.id+' .locator').click(function(){
					locateButton.locate();	
				});
				locateButton.on('locate',function(e){	
					//w.enable();
				});
			});
			
		};
		w.getMenuPosition = function(){
			if(w._Point){
				var _point = esri.geometry.toScreenPoint(map.extent,
							 jQ('#'+Mapp.id).width(),
							 jQ('#'+Mapp.id).height(),
							 w._Point);
	
				jQ('widget#'+w.id+' .points-controller').css({
					top: _point.y ,
					left:_point.x		
				});
			}
		};
		w.showOptions = function(){
			if(w._Point){
				w.getMenuPosition()
				jQ('widget#'+w.id+' .points-controller').addClass('active')	
			};
		};
		w.hideOptions = function(){
			jQ('widget#'+w.id+' .points-controller').removeClass('active')	
		};
		w.startDrawing = function(){
			
			w.hideOptions();
			w.showLocator();
			DrawingTool.activate({
				tool:w.drawTool,
				type:esri.toolbars.Draw.POINT	
			});
		};
		w._reset = function(){
			map.graphics.clear();
			w._Point = null;
			w.startDrawing();
		}
		w.enable = function(){
			w.startDrawing();
			w.show();
		};
		
		w.addPointToMap = function(point,zoom){
			w.hideLocator();
			
			w._Point =esri.geometry.webMercatorToGeographic(point.geometry);
			w._PointZoom = zoom;
			w.showOptions();
			
			map.graphics.add(point);
			if(zoom){
				map.centerAndZoom(point.geometry,zoom)
			}
			DrawingTool.deactivate(w.drawTool);
		};
		w.DrawEnd = function(e){
			var _graphic = new esri.Graphic(e.geometry,w.drawSymbol);
			w.addPointToMap(_graphic,map.getLevel());
		};
		w.DrawPoint = function(){
			
			var geometry = new esri.geometry.Point(w._Point[0], w._Point[1], map.spatialReference);
			var graphic = new esri.Graphic(esri.geometry.geographicToWebMercator(geometry),w.drawSymbol);
			w.addPointToMap(graphic,w._Point[2]);
		}
		w.showLocator = function(){
			jQ('widget#'+w.id+' .locator').addClass('active');
		};
		w.hideLocator = function(){
			jQ('widget#'+w.id+' .locator').removeClass('active');
		}
		
		w.onPanStart = function(e){
			w.hideOptions();
		}
		w.onPanEnd = function(e){
			console.log(w._Point)
			w.showOptions();
		}
		w.onZoomStart = function(e){
			w.hideOptions();
		}
		w.onZoomEnd = function(e){
			w.showOptions();
		}
		
	}
}( jQuery ));

