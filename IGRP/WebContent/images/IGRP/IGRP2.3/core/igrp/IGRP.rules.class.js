
if($ && $.IGRP && !$.IGRP.rules){

	$.IGRP.rules = {
		satisfy:function(p){
			var rtn = false;
			var fieldValue = $(p.field).val();
			
			p.fieldValue = $(p.field).val();
			
			try{
				rtn = p.condition ? p.condition.satisfy(p)/*p.condition.satisfy(fieldValue,p.testValue)*/ : false;
			}catch(err){
				console.log(err);
			}

			return rtn;
		},
		executeAction:function(p){
			//var rule = p;
			try{

				actionsList[p.action].do(p);
				//actionsList[p.action].do(target,p);
			}catch(err){
				console.log(err);
			}
			
		},
		set:function(data){

			for(var fname in data){
				var rules = data[fname];
				
				rules.forEach(function(r){

					var targetNames = r.targets ? r.targets.split(',') : [];
					var condition   = conditionsList[r.condition];
					var hasOpposite = r.opposite == "1" ? true : false;
					var source   	= r.isTable ? fname+'_fk' : fname;
					
					r.sourceName = source;
					
					if(condition){

						switch(r.event){
							case 'load':
								
								var field       = $('[name="'+fname+'"]')[0];
								var satisfyRule = $.IGRP.rules.satisfy({
									condition : condition,
									field     : field,
									rule      : r
								});

								if(satisfyRule) 
									execute(r,field);
							break;
							default:

								$('body').on(r.event,'*[name="'+source+'"]',function(e){
									
									var satisfyRule = $.IGRP.rules.satisfy({
										condition : condition,
										field     : this,
										rule      : r
									});


									if(satisfyRule) 
										execute(r,this);
									
									//opposite - contra regra
									if(hasOpposite && condition.opposite){

										var oppositeRule = $.IGRP.rules.satisfy({
											condition : conditionsList[condition.opposite],
											field     : this,
											rule      : r
										});

										if(oppositeRule && actionsList[r.action].opposite ){
											var oppositeParams = $.extend({},r);
											oppositeParams.action = actionsList[r.action].opposite;

											execute(oppositeParams, this);
										}
									}
								});
						}
					}
					
					//$('[name="'+source+'"]').trigger(r.event);

				});
			}
		},
		setCondition:function(p){
			if(!conditionsList[p.name]){
				conditionsList[p.name] = {
					satisfy:p.satisfy
				};
				if(p.opposite)
					conditionsList[p.name].opposite = p.opposite
			}
		},
		setAction:function(){
			if(!actionsList[p.name]){
				actionsList[p.name] = {
					do:p.do
				};
				if(p.opposite)
					actionsList[p.name].opposite = p.opposite;
			}
		}
	}

	var execute = function(r,field){
		
		var ruleObj 	= $.extend(true, r, {});
		
		var targetNames = r.targets ? r.targets.split(',') : [];
		
		r.sourceField   = field;

		r.targetFields 	=  getTargets(r.targets,r);

		$.IGRP.rules.executeAction(r);

	}

	var conditionsList = {
		equal:{
			satisfy:function(r){
				return !isNaN(r.fieldValue*1)?(r.fieldValue == r.rule.value):(r.fieldValue.toLowerCase() == r.rule.value.toLowerCase());
			},
			opposite:'diff'
		},
		diff:{
			satisfy:function(r){
				return !isNaN(r.fieldValue*1)?(r.fieldValue != r.rule.value):(r.fieldValue.toLowerCase() != r.rule.value.toLowerCase());
			},
			opposite:'equal'
		},
		greater:{
			satisfy:function(r){
				return !isNaN(r.fieldValue*1)?(r.fieldValue > r.rule.value):(r.fieldValue.toLowerCase() > r.rule.value.toLowerCase());
			},
			opposite:'less'
		},
		less:{
			satisfy:function(r){
				return !isNaN(r.fieldValue*1)?(r.fieldValue < r.rule.value):(r.fieldValue.toLowerCase() < r.rule.value.toLowerCase());
			},
			opposite:'greater'
		},
		notnull:{
			satisfy:function(r){
				return r.fieldValue != null && r.fieldValue != '' && r.fieldValue != undefined;
			},
			opposite:'null'
		},
		null:{
			satisfy:function(r){
				return r.fieldValue == null || r.fieldValue == '' || r.fieldValue == undefined;
			},
			opposite:'notnull'
		},
		contains:{
			satisfy:function(r){
				return r.fieldValue ? ((r.fieldValue.toUpperCase()).match("^.*"+r.rule.value.toUpperCase()+".*$")) : false;
			},
			opposite:'notcontains'
		},
		notcontains:{
			satisfy:function(r){
				return (!(r.fieldValue.toUpperCase()).match("^.*"+r.rule.value.toUpperCase()+".*$"));
			},
			opposite:'contains'
		},
		startwith:{
			satisfy:function(r){
				return ((r.fieldValue.toUpperCase()).match("^"+r.rule.value.toUpperCase()+".*$"));
			},
			opposite:'notstartwith'
		},
		notstartwith:{
			satisfy:function(r){
				return !((r.fieldValue.toUpperCase()).match("^"+r.rule.value.toUpperCase()+".*$"));
			},
			opposite:'startwith'
		},
		endwith:{
			satisfy:function(r){
				return ((r.fieldValue.toUpperCase()).match("^.*"+r.rule.value.toUpperCase()+"$"));
			},
			opposite:'notendwith'
		},
		notendwith:{
			satisfy:function(r){
				return !((r.fieldValue.toUpperCase()).match("^.*"+r.rule.value.toUpperCase()+"$"));
			},
			opposite:'endwith'
		},
		between:{
			satisfy:function(r){
				return isBetween(r);
			},
			opposite:'notbetween'
		},
		notbetween:{
			satisfy:function(r){
				return !isBetween(r);
			},
			opposite:'between'
		},
		regexp:{
			satisfy:function(r){
				return matchRegexp(r);
			},
			opposite:'notregexp'
		},
		notregexp:{
			satisfy:function(r){
				return !matchRegexp(r);
			},
			opposite:'regexp'
		}

	}

	var actionsList = {
		show:{
			do:function(p){
				
				p.targetFields.show();
			
			},
			opposite:'hide'
		},
		hide:{
			do:function(p){
				
				p.targetFields.hide();

			},
			opposite:'show'
		},
		disabled:{
			do:function(p){
				var sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					var name = $(t).attr('item-name');
					$('[name="p_'+name+sfx+'"]',t).attr('disabled',true);
				});
			},
			opposite:'enabled'
		},
		enabled:{
			do:function(p){
				var sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					var name = $(t).attr('item-name');
					$('[name="p_'+name+sfx+'"]',t).removeAttr('disabled');
				});
			},
			opposite:'disabled'
		},
		readonly:{
			do:function(p){
				var sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,target){
					var name = $(target).attr('item-name');
					$('[name="p_'+name+sfx+'"]',target).attr('readonly',true);
				});
			},
			opposite:'notreadonly'
		},
		notreadonly:{
			do:function(p){
				var sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,target){
					var name = $(target).attr('item-name');
					$('[name="p_'+name+sfx+'"]',target).removeAttr('readonly');
				});
			},
			opposite:'readonly'
		},
		required:{
			do:function(p){
				var sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					var name = $(t).attr('item-name');
					$('[name="p_'+name+sfx+'"]',t).attr('required',true);
				});
			},
			opposite:'notrequired'
		},
		notrequired:{
			do:function(p){
				var sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					var name = $(t).attr('item-name');
					$('[name="p_'+name+sfx+'"]',t).removeAttr('required');
				});
			},
			opposite:'required'
		},
		size:{
			do:function(p){
				var sizes = p.sizes.split(',');

				$.each(p.targetFields,function(i,t){
					$(t).removeClass (function (index, css) {
						var initialsize  = this.className.match(/col-md-\d+/)[0]; //get a match to match the pattern some-class-somenumber and extract that classname
					   	this.initialsize = initialsize;
				    	return (css.match (/(^|\s)col-md-\S+/g) || []).join(' ');
					});

					$(t).addClass(sizes[i]);
				});

			},
			opposite:'resetSize'
		},
		resetSize:{
			do:function(p){
				$.each(p.targetFields,function(i,t){
					var initialsize = t.initialsize;
					if(initialsize){
						$(t).removeClass (function (index, css) {
					    	return (css.match (/(^|\s)col-md-\S+/g) || []).join(' ');
						});

						$(t).addClass(initialsize);
					}
				});
			}
		},
		message:{
			do:function(p){
				$.notify(p.msg,{
					type:p.msg_type
				})
			}
		},
		remote_combobox:{
			do:function(p){

				var param = p.sourceName+'='+$(p.sourceField).val();

				$.ajax({
					url: p.procedure,
					dataType: 'xml',
					data: param
				})
				.done(function(list) {
					
					$.each( p.targetFields ,function(i,f){

						var options = [];

						$.each( $('option',list),function(z,o){
							
							var selected = $(o).attr('selected') ? true : false;
							
							options.push({
								text  : $('text',o).text(),
								value : $('value',o).text()
							});

						});

						$.IGRP.components.select2.setOptions({
							select  : $('select',f),
							options : options
						});

					});
					
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});

			}
		}
	}

	var regexList = {
		email:{
			exp    :/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
			example:'email@server.com'
		},
		date :{
			exp    :/^(\d{1,2})-(\d{1,2})-(\d{4})$/,
			example:'01-01-2010'
		}
	}

	var matchRegexp = function(r){
		var roption = r.rule.patern;
		var rtn = false;

		if(roption=='custom'){
			console.log( new RegExp(r.rule.patern_custom).test(r.fieldValue))
		}else{
			var re = regexList[roption];
			rtn = re && re.exp ? re.exp.test(r.fieldValue) : false;
		}
		return rtn;
	}

	var getTargets = function(targets,p){
		var rtn = [];

		var row = p.isTable ? $(p.sourceField).parents('tr')[0] : false;

		if(targets){
			var targetNames = targets.split(',');
			targetNames.forEach(function(t){
				var target = $('*[item-name="'+t+'"]',row);
				if(target[0])
					rtn.push(target[0]);
			});
		}

		return $(rtn);
	}

	var isBetween = function(r){
		var isBetween = false;
		var isDate 	  = $(r.field).hasClass('gen-date');
		var isNum     = $(r.field).attr('type') && $(r.field).attr('type') == 'number' ? true : false;
		
		var value  	  = r.fieldValue;

		if(isDate && value){
			var dateValue = new Date(value.convertToDate()).getTime();
			var dateTest1 = new Date(r.rule.value.convertToDate()).getTime();
			var dateTest2 = new Date(r.rule.value2.convertToDate()).getTime()
			
			isBetween = dateValue.between(dateTest1,dateTest2);
		}

		if(isNum)
			isBetween = (value*1).between(r.rule.value,r.rule.value2);

		return isBetween;
	}

}else{
	console.log('jQuery or IGRP.js missing!')
}