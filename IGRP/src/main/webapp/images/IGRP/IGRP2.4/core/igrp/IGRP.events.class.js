$.EVENTS = function(evArr){
	var events = this;
	
	var list   = {};

	events.execute = function(ev,params){
		var eventList = get(ev);
		var rtn       = true;
		
		if(eventList){
			eventList.forEach(function(f){
				try{
					rtn = f(params);
				}catch(err){
					console.log(err)
				}
			});
		}
		return rtn;
	}

	events.declare = function(arr){
		arr.forEach(function(name){if(!get(name))list[name] = []});
	}

	events.on = function(evs,callback,once){
		var eventsArr    = evs.split(',');
		eventsArr.forEach(function(ev){
			
			if(!get($.trim(ev)))//declare if doesnt exist
				
				events.declare([$.trim(ev)]);
			
			var eventList = get($.trim(ev));
			
			if(eventList && callback && typeof callback == 'function'){
				
				if(once){
					if(!isDeclared(ev,callback))
						eventList.push(callback)
				}
				else eventList.push(callback)
			}
		});
	}

	events.getList = function(){
		return list;
	}

	var get  = function(e){
		var rtn = null;
		for(var ev in list){
			if(e == ev){
				rtn=list[ev];
				break;
			}
		}
		return rtn;
	}
	var isDeclared = function(ev,func){
		var eArray     = get(ev);
		var isDeclared = false;
		for(var i = 0; i< eArray.length;i++){
			var dEvent = eArray[i];
			if($.trim(String(dEvent)) == $.trim(String(func))){
				isDeclared = true;
				break;
			}
		}
		return isDeclared;
	}

	var init = function(){
		if(evArr && evArr[0])
			evArr.forEach(function(e){
				list[e] = [];
			});
	}

	init();

	return this;

}