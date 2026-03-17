
if($ && $.IGRP && !$.IGRP.rules){

	$.IGRP.rules = {
			
		getFieldValue : function(field){
			const type = field.attr('type') || field.parents('[item-type]').attr('item-type');
			let fieldValue = field.val();
			const arrType = ['radio', 'radiolist', 'checkbox', 'checkboxlist'];

			if ($.inArray(type,arrType) !== -1) {
					
					fieldValue = [];
					
					$('input[name="'+field.attr('name')+'"]:checked').each(function(){
						
						fieldValue.push($(this).val());
						
					});
					
			}
			
			return fieldValue;
		},
		
		satisfy:function(p){

			let rtn = false;
			const condition = typeof p.condition == 'string' ? conditionsList[p.condition] : p.condition;

			p.fieldValue = $.IGRP.rules.getFieldValue($(p.field));

			try{

				rtn = condition ? condition.satisfy(p)/*p.condition.satisfy(fieldValue,p.testValue)*/ : true;
			
			}catch(err){

				console.log(err);

			}

			return rtn;
		},
		
		getSuffix : function(r){
			let str = null;

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
			const defaultRemote = $.IGRP.utils.getUrl(p.procedure) + 'dad=' + $('body').attr('app');
			let remote = $(':input[name="' + p.sourceName + '"]').attr('igrp-remote');
			return remote && remote != undefined ? function () {
				if (remote.indexOf('{') === 0) {
					try {
						const object = JSON.parse(remote.replaceAll("'", '"'));
						remote = object['remote-' + p.procedureName];
						return remote;
					} catch (err) {
						console.log(err)
						return defaultRemote;
					}
				} else {
					return remote;
				}
			}() : defaultRemote;
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

			const type = t || false;

			$.IGRP.configRules = data;
			
			if(!type){

				$.IGRP.typeRules = type;

				for(let fname in data){

					const rules = data[fname];

					rules.forEach(function(r){

						const targetNames = r.targets ? r.targets.split(',') : [];
						const condition = conditionsList[r.condition];
						const hasOpposite = r.opposite == "1" ? true : false;
						const source = r.isTable ? fname + '_fk' : fname;
						const events = r.event.split(',').join(' ');

						r.sourceName = source;

						if( events.indexOf('load') !== -1){

							const field = $('[name="' + fname + '"]')[0];

							var satisfyRule = $.IGRP.rules.satisfy({
								condition : condition,
								field     : field,
								rule      : r
							});

							if(satisfyRule) 
								
								$.IGRP.rules.execute(r,field);
						}
							
						$('body').on(events,'*[name="'+source+'"]',function(e){

							const satisfyRule = $.IGRP.rules.satisfy({
								condition: condition,
								field: this,
								rule: r
							});

							$.IGRP.lastActionRules = source;


							if(satisfyRule) 
								$.IGRP.rules.execute(r,this);

							//opposite - contra regra
							
							if(hasOpposite && condition.opposite){

								const oppositeRule = $.IGRP.rules.satisfy({
									condition: conditionsList[condition.opposite],
									field: this,
									rule: r
								});

								if(oppositeRule && actionsList[r.action].opposite ){
									const oppositeParams = $.extend({}, r);
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
			
			for(let fname in data){

				const rules = data[fname];

				rules.forEach(function(rule){
					
					fname = rule.isTable ? fname+'_fk' : fname;

					const events = rule.events.split(',');

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

			const rtn = [];

			const row = p.isTable ? $(p.sourceField).parents('tr')[0] : document.body;

			if(targets){

				const targetNames = typeof targets == 'string' ? targets.split(',') : targets;

				targetNames.forEach(function(t){

					const target = $('*[item-name="' + t + '"]', row).not('th,td');

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

		const ruleObj = $.extend(true, r, {});

		const targetNames = typeof r.targets == 'string' ? r.targets.split(',') : r.targets;

		//$(field).data('r-executing', true);

		//console.log(r);

		//console.log(targetNames)

		r.sourceField   = field;

		r.targetFields 	=  $.IGRP.rules.getTargets(r.targets,r);

		//console.log(r);

		$.IGRP.rules.executeAction(r);

		//$(field).data('r-executing', false);

	};

	const getParam = function (p) {

		const fields = p.request_fields,

			res = {};

		if (fields) {
			const names = fields.split(','),

				row = p.isTable ? p.sourceField.parents('tr:first') : false;

			names.forEach(function (n) {

				let elmnt = row ? row.find('[name="p_' + n + '_fk"]') : $('[name="p_' + n + '"]');
				const type = elmnt.attr('type');

				if (type == 'radio' || type == 'checkbox')

					elmnt = row ? row.find('[name="p_' + n + '_fk"]:checked') : $('input[name="p_' + n + '"]:checked');

				res['p_' + n] = elmnt.val();

				if (res['p_' + n] && typeof res['p_' + n] === 'object')

					res['p_' + n] = $.IGRP.utils.arrayValuesToString(res['p_' + n], ';');

				if (row && row.find('[name="p_' + n + '_check_fk"]')[0])
					res['p_' + n + '_check'] = row.find('[name="p_' + n + '_fk"]').is(':checked');

			});
		}

		return res;
	};

	const ctrlTableFields = function (name, action) {

		action = action === true ? 'table-cell' : 'none';

		if ($('table tr>*[item-name="' + name + '"]')[0])
			$('table tr>*[item-name="' + name + '"]').css({'display': action})
	};

	var conditionsList = {
		equal:{
			satisfy:function(r){

				let satisfy = false;

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

				let satisfy = false;

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

				let conditionStr = r.rule.value;
				const xi = '{',

					xe = '}',

					arrInit = $.IGRP.utils.string.getIndices(xi, conditionStr),

					arrEnd = $.IGRP.utils.string.getIndices(xe, conditionStr),

					replaceObj = {};

				arrInit.forEach(function(init,i){

					const end = arrEnd[i],

						xpr = conditionStr.substring(init, end + xe.length),

						fieldName = xpr.slice(xi.length, xpr.indexOf(xe)),

						field = fieldName == 'this' ? $(r.field) : $('[name="p_' + fieldName + '"]');

					replaceObj[xpr] = {

						field 	  : field,

						fieldName : fieldName

					};

				});

				for(let o in replaceObj){

					const ro = replaceObj[o],

						val = $.IGRP.rules.getFieldValue($(ro.field)),

						xval = $(r.field).attr('type') === 'number' ? val : "'" + val + "'";

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

				let conditionStr = r.rule.value;
				const xi = '{',

					xe = '}',

					arrInit = $.IGRP.utils.string.getIndices(xi, conditionStr),

					arrEnd = $.IGRP.utils.string.getIndices(xe, conditionStr),

					replaceObj = {};

				arrInit.forEach(function(init,i){

					const end = arrEnd[i],

						xpr = conditionStr.substring(init, end + xe.length),

						fieldName = xpr.slice(xi.length, xpr.indexOf(xe)),

						field = fieldName == 'this' ? $(r.field) : $('[name="p_' + fieldName + '"]');

					replaceObj[xpr] = {

						field 	  : field,

						fieldName : fieldName

					};

				});

				for(let o in replaceObj){

					const ro = replaceObj[o],

						val = $.IGRP.rules.getFieldValue($(ro.field)),

						xval = $(r.field).attr('type') == 'number' ? val : "'" + val + "'";

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
					const c = $(t).attr('item-type') ? 'no-required-validation' : 'no-validation-required';
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
					const c = $(t).attr('item-type') ? 'no-required-validation' : 'no-validation-required';
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
				const sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					const name = $(t).attr('item-name');
					$('[name="p_'+name+sfx+'"]',t).attr('disabled',true);
				});
			},
			opposite:'enabled'
		},
		enabled:{
			do:function(p){
				const sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					const name = $(t).attr('item-name');
					$('[name="p_'+name+sfx+'"]',t).removeAttr('disabled');
				});
			},
			opposite:'disabled'
		},
		readonly:{
			do:function(p){
				const sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,target){
					const name = $(target).attr('item-name');
					$('[name="p_'+name+sfx+'"]',target).attr('readonly',true);
				});
			},
			opposite:'notreadonly'
		},
		notreadonly:{
			do:function(p){
				const sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,target){
					const name = $(target).attr('item-name');
					$('[name="p_'+name+sfx+'"]',target).removeAttr('readonly');
				});
			},
			opposite:'readonly'
		},
		required:{
			do:function(p){
				const sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					const name = $(t).attr('item-name');
					$(t).attr('required',true);
					$('[name="p_'+name+sfx+'"]',t).attr('required',true);
				});
			},
			opposite:'notrequired'
		},
		notrequired:{
			do:function(p){
				const sfx = p.isTable ? '_fk' : '';
				$.each(p.targetFields,function(i,t){
					const name = $(t).attr('item-name');
					$(t).removeAttr('required');
					$('[name="p_'+name+sfx+'"]',t).removeAttr('required');
				});
			},
			opposite:'required'
		},
		size:{
			do:function(p){
				const sizes = p.sizes.split(',');

				$.each(p.targetFields,function(i,t){
					$(t).removeClass (function (index, css) {
						 //get a match to match the pattern some-class-somenumber and extract that classname
						this.initialsize = this.className.match(/col-md-\d+/)[0];
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
					const initialsize = t.initialsize;
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

				const row = p.isTable === true ? p.sourceField.parents('tr:first') : null;

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

						const contents = $(data).find('content >*'),
							arrField = [];

						$.each($(contents),function(i,item){
							
							if(item.tagName.toLowerCase() !== 'messages')
								
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

				const row = p.isTable === true ? p.sourceField.parents('tr:first') : null;

				$.ajax({
					url 	: $.IGRP.rules.getRemoteUrl(p)+'&ir_cf=xml',
					headers : {
				       	'X-IGRP-REMOTE' : 1
				   	},
					method 	: 'post',
					dataType: 'xml',
					data 	: getParam(p)
				})
				.done(function(list) {

					const isString = typeof list === 'string';

					$.each( p.targetFields ,function(i,f){

						f = $(f);

						const itemName = f.attr('item-name');

						if(row){
							f = $(`div[item-name=${itemName}]`,row);
						}
					
						let options  = [],
						
							responseElement = isString ? list : ( list?.documentElement || false ),
							
							wrapper  = $(responseElement).is(itemName) ? list : $(list).find('rows content '+itemName)[0];

						if (wrapper) {

							const elementType = $.IGRP.utils.getType($(':input', f));

							if(elementType === 'select'){
							
								$.each($('option', wrapper), function(z, o) {
									
									const selected = $(o).attr('selected') === 'selected';
									
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
								
								const holderGroup 	= $('.form-group',f),
									cloneGroup 		= $('.'+elementType,holderGroup).first().clone(!0);

								$('.'+elementType,holderGroup).remove();
								
								$.each($('option',wrapper),function(z,o){
									const group = cloneGroup.clone(!0),
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
				const actionURL = $.IGRP.rules.getRemoteUrl(p) || $.IGRP.utils.getPageUrl(),
					form = $.IGRP.utils.getForm(),
					nodeNames = [];

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
                        $.each( p.targetFields ,function(i,f){
                            $(document).trigger($(f).attr('item-name')+'-remote-list-callback', [c] )
                        });
						if ($.IGRP.components.tableCtrl && $.IGRP.components.tableCtrl.resetTableConfigurations)
							$.IGRP.components.tableCtrl.resetTableConfigurations(c.itemHTML);
                    },
                    error:function(){
                        $.IGRP.utils.loading.hide();
                    }

                });


            }
        },
		cleanValue:{
			do:function(p){

				$.each(p.targetFields,function(i,t){
					$('input,select,textarea',t).val('').trigger('change')
				});

			}
		}
	
	};

	const regexList = {
		email: {
			exp: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
			example: 'email@server.com'
		},
		date: {
			exp: /^(\d{1,2})-(\d{1,2})-(\d{4})$/,
			example: '01-01-2010'
		}

	};

	const matchRegexp = function(r){
		const roption = r.rule.patern || r.rule.pattern;
		let rtn = false;

		if(roption==='custom'){
			//rtn =  new RegExp(r.rule.patern_custom).test(r.fieldValue);
			rtn =  eval(r.rule.patern_custom).test(r.fieldValue);
			console.log(rtn);
		}else{
			const re = regexList[roption];
			rtn = re && re.exp ? re.exp.test(r.fieldValue) : false;
		}
		//console.log(rtn);
		return rtn;

	};
	var isBetween = function(r){
		let isBetween = false;
		const isDate = $(r.field).hasClass('gen-date');
		const isNum = $(r.field).attr('type') === 'number';


		const value = r.fieldValue;

		if(isDate && value){
			const dateValue = new Date(value.convertToDate()).getTime();
			const dateTest1 = new Date(r.rule.value.convertToDate()).getTime();
			const dateTest2 = new Date(r.rule.value2.convertToDate()).getTime();

			isBetween = dateValue.between(dateTest1,dateTest2);
		}

		if(isNum)
			isBetween = (value*1).between(r.rule.value,r.rule.value2);

		return isBetween;
	
	};

	let vRuleArr = [];

	const validateAndExecute = function(field, o){

		const idx = o.index || 0;

		let response = false;

		const rules = o.conditions.rules;

		if(field[0] && idx < rules.length){

			const r = rules[idx];

			const satisfy = $.IGRP.rules.satisfy({

				condition: r.condition,

				field: field[0],

				rule: r

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

						act.name = o.name;

						act.sourceField = field;

						act.isTable = o.isTable;

						act.isFormlist = o.isFormlist;

						$.IGRP.rules.execute2(act);

					});
			}

			if (rules[0].opposite === "1") {

				const oppObject = jQuery.extend(true, {}, o);

				const orule = conditionsList[rules[0].condition]
					? conditionsList[rules[0].condition].opposite
					: null;

				let oactions = oppObject?.conditions?.actions;

				if (!Array.isArray(oactions)) {
					oactions = oactions ? [oactions] : [];
				}

				oactions.forEach(function(a){
					if (a && a.action) {
						a.action = actionsList[a.action] && actionsList[a.action].opposite
							? actionsList[a.action].opposite
							: a.action;
					}
				});

				oppObject.conditions.actions = oactions;

				oppObject.conditions.rules[0].condition = orule;
				oppObject.conditions.rules[0].opposite = false;
				oppObject.index = 0;

				validateAndExecute(field, oppObject);
			}

			vRuleArr = [];

			o.index = 0;

		}

	};
	const validate = function (o) {

		const idx = o.index || 0;

		let response = false;

		if (idx < o.rules.length) {

			const r = o.rules[idx];

			const satisfy = $.IGRP.rules.satisfy({

				condition: r.condition,

				field: o.field[0],

				rule: {
					value: r.value
				}

			});

			vRuleArr.push(satisfy);

			o.index = idx + 1;

			validate(o);

		} else {

			vRuleArr.forEach(function (v) {
				response = v;
			});

			vRuleArr = [];

			if (response && o.valid)
				o.valid(response)

		}
	};

}else{
	console.log('jQuery or IGRP.js missing!')
}