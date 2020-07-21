(function(){
	
	var utils = GIS.module('Utils');
		
	function TimeSlider( widget, app ){
		
		var Map = app.map.view,
		
			data  = widget.data(),
					
			formatIn = 'DD-MM-YYYY', formatOut = 'DD/MM/YYYY',
			
			sliderVal = 0, sliderValues = [0, 1], sliderInterval = {},slideMax = -1, hasSlider = false, moving = false, 
			
			SliderController, playButton, Times = [], LayerController, attributes  = [],
			
			layers = [], Layer, modalId = '#slider-modal', modal, dateAttr,
			
			settings = $.extend({

				delay      : 500, 
				
				start_date : '01-01-1900',
				
				end_date   : '01-01-2099',	
				
				period	   : 'months',//days,months,years,weeks
				
				step       : 1, //salto
				
				animate    : 'fast', //slow,fast
				
				range      : false,//true,false
				
				increment  : 1,
				
				loop       : false

			}, data );
		
		settings.start_date = moment(settings.start_date, formatIn);
		
		settings.end_date = moment(settings.end_date, formatIn);
		
		widget.templateParams = {
				
			layers 	    : [],
			
			settings    : {},
			
			attributes  : []
		
		};
		
		widget.getValues = function(){
			
			if(settings.range)
				
				sliderValues = SliderController.slider("values");
			
			else 
				
				sliderVal = SliderController.slider("value");
			
		};
		
		widget.getValue = function(indice){
			
			var rtn = null;
			
			if(settings.range)
				  
				rtn = SliderController.slider("values")[indice];
			  					  
		    else
			  
		    	rtn = SliderController.slider("value");
			
			return rtn;
			
		};
		
		widget.setValues = function(previous){
			
			if(!previous){
				
				if(settings.range){
					
					sliderValues[0] += settings.increment;
										
					sliderValues[1] = sliderValues[0] + settings.increment*settings.step;
											
					SliderController.slider("values", sliderValues);
					
				}else{
					
					sliderVal += settings.increment;
					
					SliderController.slider("value", sliderVal);
				}		
				
			}else{
				
				if(settings.range){
										
					sliderValues[0] -= settings.increment*settings.step;
					
					sliderValues[1] -= settings.increment;
																
					SliderController.slider("values", sliderValues);
					
				}else{
					
					sliderVal -= settings.increment;
					
					SliderController.slider("value", sliderVal);
					
				}		

			}			
			
		};
		
		widget.action('run', function(){
			
			if(!moving){
				
				widget.getValues();
								
				sliderInterval = setInterval(function() {
					
					var val = widget.getValue(1);
					  
					if (val < slideMax) 
						
						widget.setValues();				
					
				}, settings.delay);
				
				moving = true;
				
				widget.setIconAnimation();
				
			}else
				
				widget.actions.stop();
			
			var val = widget.getValue(1);
						
			if (val == slideMax && !settings.loop)
				
				widget.slider();
						
		});
		
		widget.action('stop', function(){

			clearInterval(sliderInterval);
			
			moving = false;
			
			widget.setIconAnimation();
			
		});
		
		widget.action('previous', function(){
			
			widget.getValues();
			
			var val = widget.getValue(0);
			  
			if (val > 0) 				  
			
				 widget.setValues('previous');	

			widget.actions.stop();
			
		});
		
		widget.action('next', function(){
			
			widget.getValues();
			
			var val = widget.getValue(1);
		  
			if (val < slideMax) 
			  							
				widget.setValues();	

			widget.actions.stop();
			
		});
		
		widget.setIconAnimation = function(){
			
			if(moving)
				
				playButton.html('<i class="fa fa-pause-circle fa-2x"></i>');
			
			else
				
				playButton.html('<i class="fa fa-play-circle fa-2x"></i>');
				
		}
		
		function SetEvents(){
			
			widget.slider();
						
			SliderController.on("slidechange", function(event, ui) {
										  
				  var val   = widget.getValue(1);
				  				  				  
				  var start = settings.range ? Times[ui.values[0]].value : settings.start_date,
				  
					  end   = settings.range ? Times[ui.values[1]].value : Times[ui.value].value;
			  	
				  widget.SetLayerDefinitions(start, end);
					  
				  if(start)
					  
					  showDate(start, end);				  
				  
				  if (val == slideMax){
					  
					  widget.actions.stop();
					  
					  if(settings.loop){
						  
						  moving = false;
						  
						  widget.slider();
						  
						  playButton.click();
						  						  
					  }
						  
				  }
					
			});
			
		};
		
		function diffDate(pStart, pEnd){
			
			var start = moment(pStart, formatIn); 
			
			var end   = moment(pEnd, formatIn);
			
			return end.diff(start, settings.period); 
			
		};
		
		function calculatesScaleTime(){			
						
			var i = 0;
			
			Times[0] = {id: 0, value: null}
			
			while (i < slideMax) {
				
				var date = moment(
						settings.start_date, formatIn
				).add(
					i, settings.period
				);
				
				date = date.toDate();
				
				i++;
				
				Times[i] = {id: i, value: date}				
				
			}
			
		};
		
		function getFormateDate(date, f){
			
			var f = f || formatOut;
									
			return moment(date).format(f); 
						
		};
		
		function showDate(pStart, pEnd){
			
			$('.slider-time-extent span.start', widget.html).html(getFormateDate(pStart));
			
			$('.slider-time-extent span.end', widget.html).html(getFormateDate(pEnd))
			
		}		
		
		/*
		 * Settings timeslider
		 * 
		*/
		
		widget.action('settings', function(){
			
			$( ".IGRP-form" ).prepend( modal );
			
			modal.modal('show');		
			
			widget.actions.stop();
						
		});
		
		String.prototype.bool = function() {
			
			if (String(this) == "true") return true;
			
		    return false;
		};
		
		widget.action('settings-confirm', function(){
			
			modal.modal('toggle');
			
			settings.range = ($('input[name=range]:checked', modalId).val()).bool();
			
			settings.loop  = ($('input[name=loop]:checked', modalId).val()).bool();
			
			settings.step  = parseInt($('input[name=step]', modalId).val(), 10);
			
			settings.start_date = moment($('input[name=start_date]', modalId).val(), formatIn);
			
			settings.end_date = moment($('input[name=end_date]', modalId).val(), formatIn);
			
			settings.period = $('select[name=period]', modalId).val() || settings.period;
			
			settings.delay = parseInt($('input[name=delay]', modalId).val(), 10);
									
			widget.slider();	
				
		});
		
		widget.slider = function(){
			
			if(hasSlider) {
				
				widget.actions.stop();
				
				SliderController.slider( "destroy" );
				
			}
			
			slideMax = diffDate(settings.start_date, settings.end_date);
			
			calculatesScaleTime();
			
			SliderController.slider({
				
				classes: {
					"ui-slider": "gis-slider"
			    },
				
			    animate: settings.animate,
			    
			    max: slideMax,
			    
			    step: settings.step, 
			    
			    range: settings.range
			    
		    });
		
			
			if(settings.range)
				
				SliderController.slider("values", [0, 1]);
				
			else
				
				SliderController.slider("value", 0);
			
			showDate(settings.start_date, settings.end_date);
			
			$('.slider-min-date span', widget.html).html(getFormateDate(settings.start_date));
			
			$('.slider-max-date span', widget.html).html(getFormateDate(settings.end_date));
			
			hasSlider = true;
				
		};
		
		/*End Settings*/
		
		widget.getLayers = function(){
			
			var grouplayers = app.layers.getLayers();
			
			grouplayers.forEach(function(l){
				
				var layer  =  l.data();
				
				if(layer.type === 'WFS')
					
					layers.push({
						name : layer.name,
						id   : layer.id
					});
				
			});
			
		};
		
		widget.getDateAttr =  function(){
			
			date_attr = $('select[name=attributes]', widget.html).val();
							
		};
			
		function AttributesToSelect(json){
			
			var attributes = [];
			
			for(var key in json){
				
				if(json[key] == 'date')
				
		            attributes.push({
		            	
		            	id : key,
		            	
		            	name : key
		            	
		            });
	            
	        }
			
			return attributes;
		};		
		
		widget.SetLayerDefinitions = function(pStart, pEnd){
			
			widget.getDateAttr();
						
			if(!Layer || !date_attr || !pStart || !pEnd) return false;	
			
			Layer.bringToFront();	
			
			pStart = getFormateDate(pStart, moment.defaultFormat);
			
			pEnd = getFormateDate(pEnd, moment.defaultFormat);
			
			Layer.clearLayers();
			
			for (var key in widget.timelayer){
				
				var layer = widget.timelayer[key];
				
				if(layer.feature.properties[date_attr]){
					
					var datelayer = moment(layer.feature.properties[date_attr], moment.defaultFormat).toDate();
					
					if(moment(datelayer).isBetween(pStart, pEnd, undefined, '[]'))
						
						Layer.addLayer(layer)					
				}
					
			};
						
		};
		
		function LoadHtml(){
			
			widget.getLayers();
			
			var modalData =  $.extend({
				periods: {					
					 'days'  : 'Dia',
					 'weeks' : 'Semana',
					 'months': 'Mês',
					 'years' : 'Ano'
				},
				"items" : [
		            {
		                "label" : "Sim",
		                "active" : true
		            },
		            {
		                "label" : "Não",
		                "active" : false
		            } 
	            ]
			},settings);
			
			modalData.start_date = getFormateDate(settings.start_date, formatIn);
			
			modalData.end_date = getFormateDate(settings.end_date, formatIn);
			
			try{
				
				widget.setTemplateParams({
					
					layers: layers,
					
					settings:  modalData
					
				});
								
			}catch(e){
				
				console.log('Erro Render Modal:: '+e.message)
				
			}
			
		}
		
		function Init(){
						
			modal = $(modalId);
			
			SliderController = $(".slider", widget.html);
						
			playButton = $(".run", widget.html);	
			
			LayerController = $("select[name=layers]", widget.html);
											
			$(".select2-modal").select2({
         		
			    dropdownParent: modal
			    
			});
			
			$(".layers-select").select2();
			
			$('.gen-date-picker').daterangepicker({
				
				singleDatePicker: true,
				
				locale: $.IGRP.components.daterangepicker.locale
				
			});
					
			widget.html.on('change', "select[name=layers]", function(e){	
				
				var val = e.target.value;	
				
				$('div[item-name=attributes]', widget.html).hide();
				
				if(val){
									
					if(Layer) Layer.updateData();
					
					Layer            = app.layers.get(val);
					
					widget.timelayer = Layer.getLayers();
					
					var jsonAttr     = Layer.Description.attributes;	
								
				    attributes = AttributesToSelect(jsonAttr);	
				    
				    $('div[item-name=attributes]', widget.html).show();
					
				}
					
				$("select[name=attributes]", widget.html).select2('destroy');
				
				try{
					
					widget.setTemplateParam('attributes', {attributes: attributes});
					
					$("select[name=attributes]", widget.html).select2();			
									
				}catch(e){
					
					console.log('Erro Render attributos:: '+e.message)
					
				}	
												
			});
					
		}
				
		(function(){
			
			widget.on('load-html', function(){	
				
				LoadHtml();
				
			});
						
			widget.on('activate', function(){	
				
				Init();
				
				SetEvents();
				
				Map.enableTimeSlider = true;
				
			});		
			
			widget.on('deactivate', function(){	
				
				if(Layer) Layer.updateData();
				
				Map.enableTimeSlider = false;
				
			});
						
		})();
	}

	GIS.widgets.register('timeslider', {
	
		dependencies : {
						
			js  : [ 
				path + '/plugins/leaflet/library/plugins/ui/jquery-ui.min.js',
				path + '/plugins/select2/select2.full.min.js',
				path + '/plugins/select2/select2.init.js',
				path + '/plugins/datepicker2/daterangepicker.js',
				path + '/plugins/datepicker2/IGRP.daterangepicker.config.js',
				path + '/plugins/datepicker2/locale/dp.locale.pt.js'
			],
			
			css  : [
				path + '/plugins/leaflet/library/plugins/ui/jquery-ui.min.css',
				path + '/plugins/select2/select2.min.css',
				path + '/plugins/select2/select2.style.css',
				path + '/plugins/datepicker2/daterangepicker.css',
				path + '/plugins/datepicker2/IGRP.daterangepicker.css'
			]
		
		},
		
		init : TimeSlider
		
	});
	
})();