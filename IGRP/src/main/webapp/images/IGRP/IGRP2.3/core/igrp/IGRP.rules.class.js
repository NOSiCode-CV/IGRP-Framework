
if($ && $.IGRP && !$.IGRP.rules){

	$.IGRP.rules = {
			
		getFieldValue : function(field){
			var type  		= field.attr('type') || field.parents('[item-type]').attr('item-type'),
				fieldValue  = field.val(),
				arrType 	= ['radio','radiolist','checkbox','checkboxlist'];
			
			if ($.inArray(type,arrType) !== -1) {
					
					fieldValue = [];
					
					$('input[name="'+field.attr('name')+'"]:checked').each(function(){
						
						fieldValue.push($(this).val());
						
					});
					
			}
			
			return fieldValue;
		},
		
		satisfy:function(p){

			var rtn 		= false,
				condition   = typeof p.condition == 'string' ? conditionsList[p.condition] : p.condition;

			p.fieldValue = $.IGRP.rules.getFieldValue($(p.field));

			try{

				rtn = condition ? condition.satisfy(p)/*p.condition.satisfy(fieldValue,p.testValue)*/ : true;
			
			}catch(err){

				console.log(err);

			}

			return rtn;
		},
		
		getSuffix : function(r){
			var str = null;

			if(r.isTable){
				if(r.hasOwnProperty('isFormlist')){
					if(r.isFormlist)
						str = '_fk';
				}else
					str = '_fk';
			}

			return str;
		},
		
		getRemoteUrl : function(p){
			
			var remote  = $(':input[name="'+p.sourceName+'"]').attr('igrp-remote'),
				url 	= remote && remote != undefined ? remote : $.IGRP.utils.getUrl(p.procedure)+'dad='+$('body').attr('app');
			
			return url;
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

			$.IGRP.configRules = data;
			
			if(!type){

				$.IGRP.typeRules = type;

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

							$.IGRP.lastActionRules = source;


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
			}
			else

				$.IGRP.rules.set2(data);

		},

		set2:function(data){
			
			for(var fname in data){
				
				var rules  = data[fname];
				
				rules.forEach(function(rule){
					
					fname = rule.isTable ? fname+'_fk' : fname;
					
					var events = rule.events.split(',')

						a      = rule.conditions.actions,
						
						obj    = $('[name="'+fname+'"]');

					if( rule.events.indexOf('load') !== -1){

						if (rule.isTable) {

							$.each($('tbody tr',obj.parents('table:first')),function(i,tr){
								
								validateAndExecute($('[name="'+fname+'"]',$(tr)),rule);
								
							});

						}else
							validateAndExecute($('[name="'+fname+'"]'),rule);
					}

					$(document).on(events.join(' '), '[name="'+fname+'"]',function(){
						$.IGRP.lastActionRules = fname;
						validateAndExecute($(this),rule);
						
					});

				});
			}
		},

		setRulesInField : function (obj){
			try {

				let objRules = {},
					has		 = false;

				$(':input',obj).each(function(){
					let name = $(this).attr('name') || 'p_'+$(this).attr('field-name');

					if(name && name !== $.IGRP.lastActionRules && typeof $.IGRP.configRules === 'object'){

						let hasRules = $.IGRP.configRules[name];

						if(typeof hasRules === 'object'){
							has = true;
							objRules[name] = hasRules;
						}
					}
				});

				if(has){
					$.IGRP.rules.set(objRules, $.IGRP.typeRules);

					console.log("objRules:: ",objRules);
				}
				
			} catch (error) {
				console.log(error);
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

	var getParam = function(p){
			
		var fields = p.request_fields,

			res    = {};

		if(fields){
			var names = fields.split(','),
			
				row   = p.isTable ? p.sourceField.parents('tr:first') : false ;
			
			names.forEach(function(n){
				
				var elmnt = row ? row.find('[name="p_'+n+'_fk"]') : $('[name="p_'+n+'"]'),
					
					type  = elmnt.attr('type');
				
				if (type == 'radio' || type == 'checkbox') 

					elmnt =  row ? row.find('[name="p_'+n+'_fk"]:checked') : $('input[name="p_'+n+'"]:checked');
	
				res['p_'+n] = elmnt.val();
	
				if (res['p_'+n] && typeof res['p_'+n] === 'object') 
	
					res['p_'+n] = $.IGRP.utils.arrayValuesToString(res['p_'+n],';');
				
				if(row && row.find('[name="p_'+n+'_check_fk"]')[0])
					res['p_'+n+'_check'] = row.find('[name="p_'+n+'_fk"]').is(':checked');
				
			});
		}
		
		return res;
	};
	
	var ctrlTableFields = function(name,action){
		
		action = action === true ? 'table-cell' : 'none';
		
		if($('table tr>*[item-name="'+name+'"]')[0])
			$('table tr>*[item-name="'+name+'"]').css({'display' : action})
	}

	var conditionsList = {
		equal:{
			satisfy:function(r){
				
				var satisfy = false;
				
				if(r.fieldValue){
					
					if($.isArray(r.fieldValue))
						satisfy = $.inArray(r.rule.value,r.fieldValue) !== -1;
					
					else
						satisfy = !isNaN(r.fieldValue*1) ? (r.fieldValue == r.rule.value) : (r.fieldValue.toLowerCase() == r.rule.value.toLowerCase());
				}
				
				return satisfy;
				
				//return !isNaN(r.fieldValue*1) ? (r.fieldValue == r.rule.value) : (r.fieldValue.toLowerCase() == r.rule.value.toLowerCase());
				
			},
			opposite:'diff'
		},
		diff:{
			satisfy:function(r){
				
				var satisfy = false;
				
				if(r.fieldValue){
					
					if($.isArray(r.fieldValue))
						satisfy = $.inArray(r.rule.value,r.fieldValue) === -1;
					
					else
						satisfy = !isNaN(r.fieldValue*1) ? (r.fieldValue != r.rule.value) : (r.fieldValue.toLowerCase() != r.rule.value.toLowerCase());
				}
				
				return satisfy;
				
				//return !isNaN(r.fieldValue*1) ? (r.fieldValue != r.rule.value) : (r.fieldValue.toLowerCase() != r.rule.value.toLowerCase());
			
			},
			opposite:'equal'
		},
		greater:{
			satisfy:function(r){
				
				return !isNaN(r.fieldValue*1) ? (r.fieldValue > r.rule.value) : (r.fieldValue.toLowerCase() > r.rule.value.toLowerCase());
			
			},
			opposite:'less'
		},
		less:{
			satisfy:function(r){
				
				return !isNaN(r.fieldValue*1) ? (r.fieldValue < r.rule.value) : (r.fieldValue.toLowerCase() < r.rule.value.toLowerCase());
			
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

						field 	  = fieldName == 'this' ? $(r.field) : $('[name="p_'+fieldName+'"]');

					replaceObj[xpr] = {

						field 	  : field,

						fieldName : fieldName

					};

				});

				for(var o in replaceObj){

					var ro     = replaceObj[o],

						val    = $.IGRP.rules.getFieldValue($(ro.field)),

						xval   = $(r.field).attr('type') == 'number' ? val : "'"+val+"'";

					conditionStr = conditionStr.replaceAll(o, xval);

				}

				conditionStr = conditionStr.replaceAll('&lt;','<');

				conditionStr = conditionStr.replaceAll('&gt;','>');

				conditionStr = conditionStr.replaceAll('&amp;','&');

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

						field 	  = fieldName == 'this' ? $(r.field) : $('[name="p_'+fieldName+'"]');

					replaceObj[xpr] = {

						field 	  : field,

						fieldName : fieldName

					};

				});

				for(var o in replaceObj){

					var ro     = replaceObj[o],

						val    = $.IGRP.rules.getFieldValue($(ro.field)),

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
					
					ctrlTableFields($(t).attr('item-name'),true);
				});

				p.targetFields.removeClass('hiddenrules').show();

				p.targetFields.trigger('igrp.rules.show');

				$(document).trigger('igrp:rules',[{
					action : 'show',
					field  : p.targetFields
				}]);
			
			},
			opposite:'hide'
		},
		hide:{
			do:function(p){
				
				$.each(p.targetFields,function(i,t){
					var c = $(t).attr('item-type') ? 'no-required-validation' : 'no-validation-required';
					$(':input[required]',t).addClass(c);
					
					ctrlTableFields($(t).attr('item-name'),false);

				});

				p.targetFields.addClass('hiddenrules').hide();

				p.targetFields.trigger('igrp.rules.hide');

				$(document).trigger('igrp:rules',[{
					action : 'hide',
					field  : p.targetFields
				}]);


			},
			opposite:'show'
		},
		showicon:{
			do:function(p){
				$.each(p.targetFields,function(i,t){
					
					$('.input-group',t).removeClass('d-block');
					
					$('.input-group-btn, .lookup-eraser',t).removeClass('hidden');
					
					if($('.gen-date-picker',t)[0]){
						
						$('.datepicker-clear',t).removeClass('hidden');
						
						$.IGRP.components.daterangepicker.init({
	
							selector : '.gen-date-picker',
	
							parent   : t
	
						});
					}
				});

				p.targetFields.trigger('igrp.rules.showicon');
			},
			opposite:'hideicon'
		},
		hideicon:{
			do:function(p){
				$.each(p.targetFields,function(i,t){
					
					$('.input-group',t).addClass('d-block');
					
					$('.input-group-btn, .lookup-eraser',t).addClass('hidden');
					
					if($('.gen-date-picker',t)[0]){
						
						$('.datepicker-clear',t).addClass('hidden');
						
						$('.gen-date-picker',t).on('show.daterangepicker',function(ev,e){
							
							$(e.container).remove();
							
						});
					}
						
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
				
				//var url = $.IGRP.utils.getUrl(p.procedure)+'dad='+$('body').attr('app');

				var row = p.isTable == true ? p.sourceField.parents('tr:first') : null;
				
				if(p.sourceField[0].remoteRequest)
					
					p.sourceField[0].remoteRequest.abort();
				
				p.sourceField.addClass('remote-requesting');
			
				p.sourceField[0].remoteRequest = $.IGRP.request( $.IGRP.rules.getRemoteUrl(p) ,{
					params  : getParam(p),
					headers : {
				       	'X-IGRP-REMOTE' : 1
				   	},
					method 	: 'POST',
					success : function(data){

						var contents = $(data).find('content >*'),
							arrField = [];	

						$.each($(contents),function(i,item){
							
							if(item.tagName.toLowerCase() != 'messages')
								
								$.IGRP.utils.setFieldValue({tag : item, row : row});
							
						});

						if($(contents).find('messages message')[0])
							
							$.IGRP.utils.message.notify(contents, {
								
								item : p.sourceField
								
							});
					}
				});
				
				p.sourceField[0].remoteRequest.always(function(){
					
					p.sourceField.removeClass('remote-requesting');
					
				});
				
			}
		},

		remote_combobox:{
			do:function(p){
				
				//var param = p.sourceName+'='+$(p.sourceField).val();

				//var url = $.IGRP.utils.getUrl(p.procedure)+'dad='+$('body').attr('app');
				
				$.ajax({
					url 	: $.IGRP.rules.getRemoteUrl(p),
					headers : {
				       	'X-IGRP-REMOTE' : 1
				   	},
					method 	: 'post',
					dataType: 'xml',
					data 	: getParam(p)
				})
				.done(function(list) {
					
					var isString = typeof list === 'string';
					
					$.each( p.targetFields ,function(i,f){
					
						var options  = [],
						
							itemName = $(f).attr('item-name'),
							
							responseElement = isString ? list : ( list?.documentElement || false ),
							
							wrapper  = $(responseElement).is(itemName) ? list : $(list).find('rows content '+itemName)[0];

						if (wrapper) {
							
							var elementType = $.IGRP.utils.getType($(':input',f));
							
							if(elementType == 'select'){
							
								$.each($('option', wrapper), function(z, o) {
									
									var selected = $(o).attr('selected') ? true : false;
									
									options.push({
										text: $('text', o).text(),
										value: $('value', o).text(),
										selected: selected
									});
									
								});
								
								$.IGRP.components.select2.setOptions({
									select : $('select', f),
									options: options,
									isRules: true
								});
								
							}else{
								
								var holderGroup = $('.form-group',f),
									cloneGroup 	= $('.'+elementType,holderGroup).first().clone(!0);

								$('.'+elementType,holderGroup).remove();
								
								$.each($('option',wrapper),function(z,o){
									var group = cloneGroup.clone(!0),
									 	label = $('text',o).text();
									
									$('input',$(group)).attr({
										checked:$(o).attr('selected') === 'selected',
										value: $('value',o).text(),
										label: label
									});

									$('span:not(.radiomark)',$(group)).html(label);

									holderGroup.append($(group));
								});							
							}
						}
					});
					
					if($(list).find('messages message')[0])
						
						$.IGRP.utils.message.notify(list);
					
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
				var actionURL	 = $.IGRP.rules.getRemoteUrl(p) || $.IGRP.utils.getPageUrl(),
					form		 = $.IGRP.utils.getForm(),
					nodeNames    = [];
				
				$.each( p.targetFields ,function(i,f){
					nodeNames.push($(f).attr('item-name'));
				});


				$.IGRP.utils.transformXMLNodes({
				
					nodes : nodeNames,

					url   : $.IGRP.utils.getSubmitParams(actionURL,form,false),

					data  : form.serialize(),
					
					headers : {
						'X-IGRP-REMOTE' : 1
					},

					success:function(c){
						console.log(c);
						
						if ($.IGRP.components.tableCtrl.resetTableConfigurations)
							$.IGRP.components.tableCtrl.resetTableConfigurations(c.itemHTML);
						
						/*$.IGRP.utils.refreshComponents({
							
							wrapper : c.itemHTML,
							
							itemName : tableName
							
						});*/

					},

					error:function(){
						
						$.IGRP.utils.loading.hide();
						
						console.log('dsa')
					}

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
			//rtn =  new RegExp(r.rule.patern_custom).test(r.fieldValue);
			rtn =  eval(r.rule.patern_custom).test(r.fieldValue);
			console.log(rtn);
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
						
						act.isFormlist = o.isFormlist;

						$.IGRP.rules.execute2(act);

					});
			}

			if(rules[0].opposite == "1" ){

				var oppObject = jQuery.extend(true,{}, o);;

				var orule = conditionsList[rules[0].condition] ? conditionsList[rules[0].condition].opposite : null;

				var oactions = oppObject.conditions.actions.slice();

				oactions.forEach(function(a){
					
					a.action = actionsList[a.action] && actionsList[a.action].opposite ? actionsList[a.action].opposite : a.action;
					
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