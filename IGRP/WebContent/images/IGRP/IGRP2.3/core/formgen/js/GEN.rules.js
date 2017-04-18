var GENRULES = {
	
	add:function(rules){
		//jQuery.isEmptyObject({});
		if($.isEmptyObject(rules)) 
			return false;
		else{
			var rtn = '',
				rStr= '';
			try{
				rStr = JSON.stringify(rules);
				rtn +='$.IGRP.rules.set('+rStr+');';
			}catch(e){
				console.log(e)
			}
			
			return {
				caller :rtn,
				content:rStr
			};
		}

	},
	setTargets:function(object,g){
		var GEN = g ? g : VARS.getGen();
		var modal   = $(VARS.edition.modal);

		var separatorlist = $('[rel="rules"] .IGRP-separatorlist',modal)[0];

		var targetsFields = $('[name="p_gen_rule_targets"]',separatorlist);

		targetsFields.html('');
		
		GEN.getContainers().forEach(function(c){
			var cTag = c.GET.tag();
			targetsFields.append('<option class="gen-container" value="'+cTag+'">'+cTag+'</option>');

			c.GET.fields().forEach(function(f){
				targetsFields.append('<option class="gen-field" value="'+f.GET.tag()+'">'+f.GET.tag()+'</option>');
			});

			if(c.contents){
				c.contents.forEach(function(i){
					if(i.genType == 'field')
						targetsFields.append('<option class="field" value="'+i.GET.tag()+'">'+i.GET.tag()+'</option>');
				})
			}

		});

		separatorlist.resetAll();
	
		separatorlist.setRows(GENRULES.setPrefix(object.rules,'gen_rule_'));

		$('.modal-header ul li[rel="rules"]',modal).show();
	},
	setPrefix :function(rules,prefix){
		var rtn = [];
		rules.forEach(function(r){
			var object = {};
			for(var i in r){
				object[prefix+i] = r[i];
			}
			rtn.push(object);
		});
		return rtn;
	},
	init:function(_slist){
		var slist = _slist ? _slist : $('#gen-rules-holder')[0];

		slist.events.on('row-add',function(r){
			//console.log(r);
			var eventtext = r.row.find('td[item-name="gen_rule_event"] .separator-list-td-val');
			var v         = r.values;
			var text      = 'on'+v.gen_rule_event.label+': '+v.gen_rule_action.label+' [ '+v.gen_rule_targets.value+' ] case '+v.gen_rule_condition.label+' '+v.gen_rule_value.label	;
			
			eventtext.html(text);
		});

		//select2 template
		$('.rule-setter[rel="gen_rule_targets"]').select2({
		  	templateResult: function(state) {
			 	if (!state.id) { return state.text; }
			 	var _class = state.element ? $(state.element).attr('class') : '';
			 	var c      = state.text.indexOf('.') != -1 ? 'gen-field' : 'gen-container'; 
				var $state = $('<span class="rules-target '+_class+'">' + state.text + '</span>');
			  	
			  	return $state;
			}
		});

		//RULES SET
		$.IGRP.rules.set({
		  "p_gen_rule_condition": [
		    {
		      "event": "change",
		      "condition": "notnull",
		      "action": "hide",
		      "targets": "gen_rule_value2,gen_rule_patern",
		      "name": "Condition Rule 1",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "notnull",
		      "action": "show",
		      "targets": "gen_rule_value",
		      "name": "Condition Rule 2",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "null",
		      "action": "hide",
		      "targets": "gen_rule_value",
		      "name": "Disable Value",
		      "opposite": "1"
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "notnull",
		      "action": "hide",
		      "targets": "gen_rule_value",
		      "name": "Disable Value",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "between",
		      "action": "show",
		      "targets": "gen_rule_value2",
		      "name": "Condition Rule 3",
		      "opposite": "1"
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "between",
		      "action": "size",
		      "targets": "gen_rule_value,gen_rule_value2",
		      "sizes" :"col-md-3,col-md-3",
		      "name": "Set Values Size",
		      "opposite": "1"
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "regexp",
		      "action": "show",
		      "targets": "gen_rule_patern",
		      "name": "Condition Rule 4",
		      "opposite": "1"
		    },
		    {
		      "event": "change",
		      "condition": "diff",
		      "value": "regexp",
		      "action": "notrequired",
		      "targets": "gen_rule_patern",
		      "name": "Pattern Not Required",
		      "opposite": "1"
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "regexp",
		      "action": "hide",
		      "targets": "gen_rule_value",
		      "name": "Condition Rule 5",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "action": "hide",
		      "targets": "gen_rule_value2,gen_rule_patern",
		      "name": "Condition Rule 6",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "condition": "equal",
		      "value": "between",
		      "action": "show",
		      "targets": "gen_rule_value,gen_rule_value2",
		      "name": "Condition Rule 7",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "condition": "equal",
		      "value": "regexp",
		      "action": "show",
		      "targets": "gen_rule_patern",
		      "name": "Condition Rule 8",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "condition": "equal",
		      "value": "regexp",
		      "action": "hide",
		      "targets": "gen_rule_value",
		      "name": "Condition Rule 9",
		      "opposite": ""
		    }
		  ],
		  "p_gen_rule_action": [
		    {
		      "event": "load",
		      "action": "hide",
		      "targets": "gen_rule_procedure,gen_rule_msg_type,gen_rule_msg",
		      "name": "Action Rule 1",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "notnull",
		      "action": "hide",
		      "targets": "gen_rule_procedure,gen_rule_msg_type,gen_rule_msg",
		      "name": "Action Rule 2",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "message",
		      "action": "hide",
		      "targets": "gen_rule_targets",
		      "name": "Action Rule 3",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "diff",
		      "value": "message",
		      "action": "show",
		      "targets": "gen_rule_targets",
		      "name": "Action Rule 4",
		      "opposite": ""
		    },
		    {
		      "event": "change",
		      "condition": "diff",
		      "value": "message",
		      "action": "notrequired",
		      "targets": "gen_rule_msg_type",
		      "name": "Message Not Required",
		      "opposite": "1"
		    },
		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "message",
		      "action": "show",
		      "targets": "gen_rule_msg_type,gen_rule_msg",
		      "name": "Action Rule 5",
		      "opposite": ""
		    },

		    {
		      "event": "change",
		      "condition": "contains",
		      "value": "remote",
		      "action": "show",
		      "targets": "gen_rule_procedure",
		      "name": "Action Rule 6",
		      "opposite": ""
		    },

		    {
		      "event": "change",
		      "condition": "equal",
		      "value": "remote_combobox",
		      "action": "show",
		      "targets": "gen_rule_procedure",
		      "name": "Action Rule 6",
		      "opposite": "1"
		    },

		    {
		      "event": "load",
		      "condition": "equal",
		      "value": "message",
		      "action": "hide",
		      "targets": "gen_rule_targets",
		      "name": "Action Rule 7",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "condition": "diff",
		      "value": "message",
		      "action": "show",
		      "targets": "gen_rule_targets",
		      "name": "Action Rule 8",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "condition": "equal",
		      "value": "message",
		      "action": "show",
		      "targets": "gen_rule_msg_type,gen_rule_msg",
		      "name": "Action Rule 9",
		      "opposite": ""
		    },
		    {
		      "event": "load",
		      "condition": "contains",
		      "value": "remote",
		      "action": "show",
		      "targets": "gen_rule_procedure",
		      "name": "Action Rule 10",
		      "opposite": ""
		    }
		  ],
		  "p_gen_rule_patern":[
		  	{
		      "event": "change",
		      "condition": "equal",
		      "value": "custom",
		      "action": "show",
		      "targets": "gen_rule_patern_custom",
		      "name": "Show Custom Pattern",
		      "opposite": "1"
		    }

		  ]
		  
		});
		
	}
}