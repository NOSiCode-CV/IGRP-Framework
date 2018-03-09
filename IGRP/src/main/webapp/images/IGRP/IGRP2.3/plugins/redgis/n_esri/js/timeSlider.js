(function ( jQ ) { 
    jQ.fn.timeSlider = function(params) {
    	var id = this.attr('id');
		var ts = new Widget(id);

		ts.Layers = null;

		var starttime, endtime, thumbcount, thumbmovingrate, timestopsinterval;

		require([
        "esri/layers/ArcGISDynamicMapServiceLayer","esri/TimeExtent", "esri/dijit/TimeSlider",
        "dojo/_base/array", "dojo/dom", "dojo/domReady!"
		], function(
			ArcGISDynamicMapServiceLayer, TimeExtent, TimeSlider, ArrayUtil, dom
		  ) {

			ts.onInit = function(){
			   ts.includeCss('ts.style');
			   setVars();

			   console.log(ts.Layers);

				LayersManager.onLayersAddResult({
					callback:function(e){
						
						var timeSlider = new TimeSlider({
							style: "width: 100%;"
						}, dom.byId("timeSliderDiv"));
						
						map.setTimeSlider(timeSlider);
						
						
					    var timeExtent = new TimeExtent();
			            timeExtent.startTime = new Date(starttime);
			            timeExtent.endTime = new Date(endtime);
			            timeSlider.setThumbCount(thumbcount);
			            timeSlider.createTimeStopsByTimeInterval(timeExtent, timestopsinterval, 'esriTimeUnits'+timestopsunits); //Internvalo de tempo 
			            timeSlider.setThumbIndexes([startindexe, endindexe]); //Posicao para a inicializacao do polegar
			            timeSlider.setThumbMovingRate(thumbmovingrate);	
			            timeSlider.setLoop(loop);			
			            // timeSlider.singleThumbAsTimeInstant(true);	          
			            timeSlider.startup();

			            //add labels for every other time stop
				        var labels = dojo.map(timeSlider.timeStops, function(timeStop, i) { 
				          if ( i%2 === 0 ) {
				            return timeStop.getUTCFullYear(); 
				          } else {
				            return "";
				          }
				        }); 
				        
				        timeSlider.setLabels(labels);
						
				        timeSlider.on("time-extent-change", function(evt) {
				        	var sdate = getDateFormatted(evt.startTime);
				        	var edate = getDateFormatted(evt.endTime);
							//ts.getDateStartDate(evt.startTime);
				        	//ts.getDateEndDate(evt.endTime);	
				        	
                            /// timeSlider.setTimeStops(evt.endtime); 
                            console.log(sdate)
                            console.log(edate)

				            $('.informacoes #daterange .start', ts.Html).text(sdate);
				            $('.informacoes #daterange .end', ts.Html).text(edate);

				         	var __layer = LayersManager.getLayer(ts.Layers[0].id);

				         	__layer.setDefinitionExpression(""+date_attr+" >= date'"+sdate+"' AND "+date_attr+" < date'"+edate+"'")			         	

				        });
					}
				});
			}
			
		    var getDateFormatted = function(date){
		    	var smonth = date.getUTCMonth() + 1 ; //months from 1-12
				var sday = date.getUTCDate();
				var syear = date.getUTCFullYear();

		    	return sday + '-'+ smonth +'-'+ syear;
		    }

			


			var setVars = function(){
				ts.Layers = ts.getLayersObj();
				starttime = params && params.starttime ? params.starttime : '1/1/1921 UTC';
				endtime   = params && params.endtime   ? params.endtime   : '12/31/2009 UTC';
				thumbcount= params && params.thumbcount ? params.thumbcount: 2;
				thumbmovingrate = params && params.thumbmovingrate ? params.thumbmovingrate: 2000;
				timestopsinterval = params && params.timestopsinterval ? params.timestopsinterval: 2;
				startindexe = params && params.startindexe ? params.startindexe: 0;
				endindexe= params && params.endindexe ? params.endindexe: 1;
				loop = params && params.loop ? params.loop: false;
				timestopsunits = params && params.timestopsunits ? params.timestopsunits: 'years';
				date_attr = params && params.date_attr ? params.date_attr: '12/31/2015';
			}

			ts.onActivate = function(){	
				/*ts.Layers.forEach(function(layer){
					//LayersManager.setLayerVisibility(layer.id,false)
				});*/

			}			
			ts.onMapClick = function(e){		
				console.log(new Date(e.graphic.attributes.DATA_REGISTO))		
			}	

			ts.getLayersObj = function(){
		  		var rtn = [];			
				jQ.each(ts.Html.find('layers layer'), function(){
					var _this = jQ(this);						
					var obj = {
						id: _this.attr('id'),
						url:_this.attr('url')
					}
					
					rtn.push(obj)
				})

				return rtn;		
			}


		});
	}
}( jQuery));
