(function ( jQ ) { 
    jQ.fn.MeasureDefault = function() {
    	var id = this.attr('id');
    	var measure = new Widget(id);
    	measure.holderid = 'measure-holder';
    	measure.tool = null
    	measure.currentAction = null;
    	measure.measureHolder = null;

    	measure.onInit = function(){
    		measure.config();
    	}
    	measure.onMapClick = function(e){
    	}
    	measure.onActivate = function(){
    		Mapp.isDrawing = true;
    		//measure.tool.show();
    	}
    	measure.onDeactivate = function(){
    		measure.unsetAction();
    	}
    	measure.setAction = function(action){
    		try{
	    		measure.currentAction = action;
	    		measure.tool.setTool(action,true);
	    		measure.Html.find('#'+measure.holderid).attr('active','true')
    		}catch(e){
    			console.log(e)
    		}
    	}
    	measure.unsetAction = function(){
    		try{
	    		if(measure.currentAction){
	    			measure.tool.setTool(measure.currentAction,false);
	    			measure.tool.clearResult();
	    		}
	    		measure.Html.find('#'+measure.holderid).attr('active','');
	    		measure.Html.find('ul.widget-option-group li').removeClass('active');
    		}catch(e){
    			console.log(e)
    		}
    	}

    	measure.config = function(){
    		measure.measureHolder = measure.Html.find('#measure-holder');    		
    		measure.Html.find('ul.widget-option-group li').on('click',function(){
    			try{
	    			var action = jQ(this).attr('rel');
	    			measure.unsetAction();
	    			measure.setAction(action);
	    			measure.Html.find('ul.widget-option-group li').removeClass('active');
	    			jQ(this).addClass('active');
	    		}catch(e){
	    			console.log(e);
	    		}
    		});

    		measure.tool = new esri.dijit.Measurement({
	          map: map,
			  defaultAreaUnit: esri.units.SQUARE_METERS,
	   		  defaultLengthUnit: esri.units.METERS,
			  
	        }, dojo.byId(measure.holderid));
	        measure.tool.startup();
	        measure.tool.on('measure-end',function(e){
	        	console.log(e);
	        });

	        measure.tool.startup();
    	}
	};
}( jQuery ));
