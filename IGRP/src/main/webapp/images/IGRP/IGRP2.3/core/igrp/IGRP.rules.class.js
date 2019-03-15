
if($ && $.IGRP && !$.IGRP.rules){

	$.IGRP.rules = {
		
		satisfy:function(p){

			var rtn 		= false,
				field 		= $(p.field),
				type  		= field.attr('type'),
				fieldValue 	= field.val(),
				condition   = typeof p.condition == 'string' ? conditionsList[p.condition] : p.condition;


			if (type == 'radio' || type == 'checkbox') 

				fieldValue =  $('input[name="'+field.attr('name')+'"]:checked').val();

			p.fieldValue = fieldValue;

			try{

				rtn = condition ? condition.satisfy(p)/*p.condition.satisfy(fieldValue,p.testValue)*/ : true;
			
			}catch(err){

				console.log(err);

			}

			return rtn;
		},

		executeAction:function(p){
			//var rule = p;
			try{
				if(actionsList[p.action])
					actionsList[p.action].do(p);
				//actionsList[p.action].do(target,p);
			}catch(err){
				console.log(err);
			}			
		},

		set:function(data,t){
			
			var type = t || false;
			
			if(!type)

				for(var fname in data){
					
					var rules = data[fname];
					
					rules.forEach(function(r){
						
						var targetNames = r.targets ? r.targets.split(',') : [];
						var condition   = conditionsList[r.condition];
						var hasOpposite = r.opposite == "1" ? true : false;
						var source   	= r.isTable ? fname+'_fk' : fname;
						var events      = r.event.split(',').join(' ');
						
						r.sourceName = source;

						if( events.indexOf('load') !== -1){
							
							var field       = $('[name="'+fname+'"]')[0];
							
							var satisfyRule = $.IGRP.rules.satisfy({
								condition : condition,
								field     : field,
								rule      : r
							});


							if(satisfyRule) 
								$.IGRP.rules.execute(r,field);
						}
							
						$('body').on(events,'*[name="'+source+'"]',function(e){
							
							var satisfyRule = $.IGRP.rules.satisfy({
								condition : condition,
								field     : this,
								rule      : r
							});


							if(satisfyRule) 
								$.IGRP.rules.execute(r,this);

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

									$.IGRP.rules.execute(oppositeParams, this);
								}
							}
						});

					});
				}

			else

				$.IGRP.rules.set2(data);

		},

		set2:function(data){
			
			for(var fname in data){
				
				var rules  = data[fname];
				
				rules.forEach(function(rule){
					
					var events = rule.events.split(',');

					var a      = rule.conditions.actions;

					if( rule.events.indexOf('load') !== -1)

						validateAndExecute($('[name="'+fname+'"]'),rule);

					$(document).on(events.join(' '), '[name="'+fname+'"]',function(){
						
						validateAndExecute($(this),rule);
						
					});

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
		},

		getTargets: function(targets,p){
			
			var rtn = [];

			var row = p.isTable ? $(p.sourceField).parents('tr')[0] : document.body;

			if(targets){
				
				var targetNames = typeof targets == 'string' ? targets.split(',') : targets;

				targetNames.forEach(function(t){
					
					var target = $('*[item-name="'+t+'"]',row).not('th,td');

					if(target[0]){
						$.each(target,function(i,tr){
							rtn.push( tr );
						})
						
					}
				});
			}

			return $(rtn);
		}
	};

	$.IGRP.rules.execute2 = function(o){

		o.targetFields = $.IGRP.rules.getTargets(o.targets,o);

		o.sourceName  = o.sourceField.attr('name');
		
		$.IGRP.rules.executeAction(o);

	};

	$.IGRP.rules.execute = function(r,field){
		
		var ruleObj 	= $.extend(true, r, {});
		
		var targetNames = typeof r.targets == 'string' ? r.targets.split(',') : r.targets;
		
		//$(field).data('r-executing', true);

		//console.log(r);

		//console.log(targetNames)

		r.sourceField   = field;

		r.targetFields 	=  $.IGRP.rules.getTargets(r.targets,r);

		//console.log(r);

		$.IGRP.rules.executeAction(r);

		//$(field).data('r-executing', false);

	};

	var getParam = function(fields){
					
		var res = {};

		if(fields){
			var names = fields.split(',');
			
			names.forEach(function(n){
				res['p_'+n] = $('[name="p_'+n+'"]').val();

				if (typeof res['p_'+n] === 'object') 
					res['p_'+n] = $.IGRP.utils.arrayValuesToString(res['p_'+n],';');
				
			});	
		}
		
		return res;
	};

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
		checked:{
			satisfy:function(r){
				return $(r.field).is(':checked');
			},
			opposite:'unchecked'
		},
		unchecked:{
			satisfy:function(r){
				return !$(r.field).is(':checked');
			},
			opposite:'checked'
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
		},

		jsx : {
			satisfy:function(r){

				var conditionStr = r.rule.value,

					xi 			 = '{',

					xe 			 = '}',

					arrInit 	 = $.IGRP.utils.string.getIndices(xi,  conditionStr),

					arrEnd 		 = $.IGRP.utils.string.getIndices(xe,  conditionStr),

					replaceObj   = {};

				arrInit.forEach(function(init,i){

					var end   	  = arrEnd[i],

						xpr   	  = conditionStr.substring(init, end + xe.length),

						fieldName = xpr.slice(xi.length, xpr.indexOf(xe) ),

						field 	  = fieldName == 'this' ? $(r.field) : $('[name="'+fieldName+'"]');

					replaceObj[xpr] = {

						field 	  : field,

						fieldName : fieldName

					};

				});

				for(var o in replaceObj){

					var ro     = replaceObj[o],

						tfield = ro.field,

						val    = tfield.val(),

						xval   = $(r.field).attr('type') == 'number' ? val : "'"+val+"'";

					conditionStr = conditionStr.replaceAll(o, xval);

				}

				conditionStr = conditionStr.replaceAll('&lt;','<');

				conditionStr = conditionStr.replaceAll('&gt;','>');

				conditionStr = conditionStr.replaceAll('&amp;','&');

				console.log(conditionStr);

				return eval(conditionStr);
			},
			opposite:'notjsx'
		},

		notjsx : {
			opposite:'jsx',
			satisfy:function(r){

				var conditionStr = r.rule.value,

					xi 			 = '{',

					xe 			 = '}',

					arrInit 	 = $.IGRP.utils.string.getIndices(xi,  conditionStr),

					arrEnd 		 = $.IGRP.utils.string.getIndices(xe,  conditionStr),

					replaceObj   = {};

				arrInit.forEach(function(init,i){

					var end   	  = arrEnd[i],

						xpr   	  = conditionStr.substring(init, end + xe.length),

						fieldName = xpr.slice(xi.length, xpr.indexOf(xe) ),

						field 	  = fieldName == 'this' ? $(r.field) : $('[name="'+fieldName+'"]');

					replaceObj[xpr] = {

						field 	  : field,

						fieldName : fieldName

					};

				});

				for(var o in replaceObj){

					var ro     = replaceObj[o],

						tfield = ro.field,

						val    = tfield.val(),

						xval   = $(r.field).attr('type') == 'number' ? val : "'"+val+"'";

					conditionStr = conditionStr.replaceAll(o, xval);

				}

				conditionStr = conditionStr.replaceAll('&lt;','<');

				conditionStr = conditionStr.replaceAll('&gt;','>');

				conditionStr = conditionStr.replaceAll('&amp;','&');

				return !eval(conditionStr);
			}
		}

	};

	var actionsList = {
		show:{
			do:function(p){
				
				$.each(p.targetFields,function(i,t){
					var c = $(t).attr('item-type') ? 'no-required-validation' : 'no-validation-required';
					$(':input[required]',t).removeClass(c);

				});

				p.targetFields.show();

				p.targetFields.trigger('igrp.rules.show');
			
			},
			opposite:'hide'
		},
		hide:{
			do:function(p){
				
				$.each(p.targetFields,function(i,t){
					var c = $(t).attr('item-type') ? 'no-required-validation' : 'no-validation-required';
					$(':input[required]',t).addClass(c);

				});

				p.targetFields.hide();

				p.targetFields.trigger('igrp.rules.hide');


			},
			opposite:'show'
		},
		showicon:{
			do:function(p){
				$.each(p.targetFields,function(i,t){
					$('.input-group',t).removeClass('d-block');
					$('.input-group-btn',t).removeClass('hidden');
					$('.datepicker-clear',t).removeClass('hidden');
				});

				p.targetFields.trigger('igrp.rules.showicon');
			},
			opposite:'hideicon'
		},
		hideicon:{
			do:function(p){
				$.each(p.targetFields,function(i,t){
					$('.input-group',t).addClass('d-block');
					$('.input-group-btn',t).addClass('hidden');
					$('.datepicker-clear',t).addClass('hidden');
				});

				p.targetFields.trigger('igrp.rules.hideicon');
			},
			opposite:'showicon'
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
					$(t).attr('required',true);
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
					$(t).removeAttr('required');
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

		remote:{
			
			do : function(p){

				$.IGRP.request( p.procedure ,{
					params  : getParam(p.request_fields),
					headers : {
				       	'X-IGRP-REMOTE' : 1
				   	},
					method 	: 'POST',
					success : function(data){

						var contents = $(data).find('content >*'),
							arrField = [];

						$.each($(contents),function(i,item){

							var o = $.IGRP.utils.setFieldValue(item);
						});
					}
				});
			}
		},

		remote_combobox:{
			do:function(p){
				
				//var param = p.sourceName+'='+$(p.sourceField).val();

				$.ajax({
					url 	: p.procedure,
					headers : {
				       	'X-IGRP-REMOTE' : 1
				   	},
					method 	: 'post',
					dataType: 'xml',
					data 	: getParam(p.request_fields)
				})
				.done(function(list) {
					
					$.each( p.targetFields ,function(i,f){

						var options  = [],
						
							itemName = $(f).attr('item-name'),
							
							wrapper  = $(list).is(itemName) ? list : $(list).find('rows content '+itemName)[0];

						if (wrapper) {
							
							$.each($('option', wrapper), function(z, o) {
								
								var selected = $(o).attr('selected') ? true : false;
								
								options.push({
									text: $('text', o).text(),
									value: $('value', o).text(),
									selected: selected
								});
								
							});
							
							$.IGRP.components.select2.setOptions({
								select: $('select', f),
								options: options
							});
						}
						
					});
					
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});

			}
		},
		remote_list:{
			do : function(p){
				var actionURL	 = p.procedure || $.IGRP.utils.getPageUrl(),
					form		 = $.IGRP.utils.getForm();
				
				$.each( p.targetFields ,function(i,f){
					var tableName = $(f).attr('item-name');
					$.IGRP.utils.transformXMLNodes({
					
						nodes : [tableName],

						url   : $.IGRP.utils.getSubmitParams(actionURL,form,false),

						data  : form.serialize(),

						success:function(c){
							
							$.IGRP.utils.refreshComponents({
								
								wrapper : c.itemHTML,
								
								itemName : tableName
								
							});

						},

						error:function(){
							console.log('dsa')
						}

					});
				});
			}
		},
		cleanValue:{
			do:function(p){
				
				$.each(p.targetFields,function(i,t){
					$('input,select,textarea',t).val('');
				});

			}
		}
	
	};

	var regexList = {
		email:{
			exp    :/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
			example:'email@server.com'
		},
		date :{
			exp    :/^(\d{1,2})-(\d{1,2})-(\d{4})$/,
			example:'01-01-2010'
		}
	
	};

	var matchRegexp = function(r){
		var roption = r.rule.patern || r.rule.pattern;
		var rtn = false;

		if(roption=='custom'){
			rtn =  new RegExp(r.rule.patern_custom).test(r.fieldValue);
		}else{
			var re = regexList[roption];
			rtn = re && re.exp ? re.exp.test(r.fieldValue) : false;
		}
		//console.log(rtn);
		return rtn;
	
	};

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
	
	};

	var vRuleArr = [];

	var validateAndExecute = function(field,o){

		var idx = o.index || 0;

		var response = false;

		var rules = o.conditions.rules;

		if(field[0] && idx < rules.length){

			var r = rules[idx];

			var satisfy = $.IGRP.rules.satisfy({
					
				condition : r.condition,
				
				field     : field[0],
				
				rule      : r

			});

			//console.log(r.condition);

			//console.log(field.val());

			//console.log(r)

			vRuleArr.push(satisfy);

			o.index = idx+1;			

			validateAndExecute(field,o);

		}else{
			
			vRuleArr.forEach(function(v){
				response = v;
			});

			if(response){

				var a = o.conditions.actions;
				
				if(a && a[0])
					
					a.forEach(function(act){	

						act.sourceField = field;

						act.isTable = o.isTable;

						$.IGRP.rules.execute2(act);

					});
			}

			if(rules[0].opposite == "1" ){

				var oppObject = jQuery.extend(true,{}, o);;

				var orule = conditionsList[rules[0].condition].opposite;

				var oactions = oppObject.conditions.actions.slice();

				oactions.forEach(function(a){
					a.action = actionsList[a.action].opposite;
				});
				
				oppObject.conditions.rules[0].condition = orule;

				oppObject.conditions.rules[0].opposite = false;

				oppObject.index = 0;

				validateAndExecute(field,oppObject);

			}

			vRuleArr = [];

			o.index = 0;
			
		}

	};

	var validate = function(o){

		var idx = o.index || 0;

		var response = false;

		if(idx < o.rules.length){

			var r = o.rules[idx];

			var satisfy = $.IGRP.rules.satisfy({
					
				condition : r.condition,
				
				field     : o.field[0],
				
				rule      : {
					value : r.value
				}

			});

			vRuleArr.push(satisfy);

			o.index = idx+1;			

			validate(o);

		}else{
			
			vRuleArr.forEach(function(v){
				response = v;
			});
			
			vRuleArr = [];

			if(response && o.valid)
				o.valid(response)
			
		}
	};

}else{
	console.log('jQuery or IGRP.js missing!')
}