  
  var GENRULES = {
    
    add:function(rules){
      //console.log(rules)
      //jQuery.isEmptyObject({});
      if($.isEmptyObject(rules)) 
        return false;
      else{
        var rtn  = '',
            rStr = '';
        try{
        
          var rObj = GENRULES.strucRules(rules);

          var type = "'actionsList'";
          
          rStr = JSON.stringify(rObj);
        
          rtn +='$.IGRP.rules.set('+rStr+','+type+');';

        }catch(e){
          console.log(e)
        }
        
        return {
          caller :rtn,
          content:rStr
        };
      }

    },

    strucRules:function(rules){
      var rtn = {};
      //console.log(rules)
      //rules.forEach(function(r){


      for(var ctrl in rules){
        
        var rule = rules[ctrl];

        rtn[ctrl] = [];

        rule.forEach(function(r){
          
          var actions = r.actions ? JSON.parse(r.actions.replaceAll('gen_rule_','').replace(/'/g,'"')) : '';

         GENRULES.configActions( actions );
          
          var robj = {
            name   : r.name,
            events : r.event,
            isTable : r.isTable,
            conditions : {
              
              rules : [{
                condition     : r.condition,
                value         : r.value,
                value2        : r.value2,
                patern        : r.patern,
                patern_custom : r.patern_custom,
                opposite      : r.opposite
              }],

              actions : actions

            }
          }

          rtn[ctrl].push(robj);

        });

        
      }

      return rtn;

    },

    configActions:function(actions){
      
      var GEN = VARS.getGen();

      if(actions && actions[0])

        actions.forEach(function(a){

          if(a.procedure){
            var app     = GEN.SETTINGS.table ? GEN.SETTINGS.table.split('.')[0] : GEN.DETAILS.app,
                package = GEN.SETTINGS.package,
                proc    = a.procedure;

            a.procedure = GEN.SETTINGS.gentype == 'java' ? 'webapps?r='+GEN.DETAILS.app+'/'+GEN.DETAILS.page+'/'+proc : app+'.'+package+'.'+proc;

          }

        });
    },

    setTargets:function(object,g){

      var GEN = g ? g : VARS.getGen();

      var modal   = $(VARS.edition.modal);

      var separatorlist = $('[rel="rules"] .IGRP-separatorlist',modal)[0];

      var actionslist   = $('[rel="rules"] .IGRP-separatorlist[tag="actions_list"]',modal)[0];

      var targetsFields = $('#actions_list_gen_rule_targets,#gen_rule_request_fields');

      targetsFields.html('');

      //console.log(separatorlist);

      //console.log(actionslist)
      
      GEN.getContainers().forEach(function(c){
        var cTag = c.GET.tag();
        targetsFields.append('<option class="gen-container" value="'+cTag+'">'+cTag+'</option>');

        c.GET.fields().forEach(function(f){
          targetsFields.append('<option class="gen-field gen-targets-field" value="'+f.GET.tag()+'">'+f.GET.tag()+'</option>');
        });

        if(c.contents){
          c.contents.forEach(function(i){
            if(i.genType == 'field')
              targetsFields.append('<option class="field gen-targets-field" value="'+i.GET.tag()+'">'+i.GET.tag()+'</option>');
          })
        }

      });

      targetsFields.select2({

        templateResult: function(state) {
       
          if (!state.id) 
            
            return state.text; 

          var _class = state.element ? $(state.element).attr('class') : '',

              c      = state.text.indexOf('.') != -1 ? 'gen-field' : 'gen-container',

              $state = $('<span class="rules-target '+_class+'">' + state.text + '</span>');
            
          return $state;

        }

      });

      separatorlist.resetAll();

      setTimeout(function(){
        
        if(object.rules[0] && !object.rules[0].actions)
          GENRULES.translateRules(object);

       
        separatorlist.setRows( GENRULES.setPrefix(object.rules,'gen_rule_') );

      },350)
      


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

    translateRules:function(o){
      //"[{'':'','':'','':'','gen_rule_msg_type':'','gen_rule_msg':''}]"
      var translates = ["action","targets","procedure","msg_type","msg"];
    
      o.rules.forEach(function(r){
        
        var actionsObj = [{}];

        translates.forEach(function(t){
          actionsObj[0]['gen_rule_'+t] = r[t];
          delete r[t];
        });

        r.actions = JSON.stringify( actionsObj ).replace(/"/g,"'");

      });


    },

    init:function(_slist){

      var configSep = function(){

        var slist = _slist ? _slist : $('#gen-rules-holder')[0];

        slist.events.on('dialog-open',function(){
         
          var cond = $('[name="p_gen_rule_condition"]').val();

          if(cond == 'jsx'){
            
            try{

              var val = $('[name="p_gen_rule_value"]').val();

              if( val )

                val = val.replaceAll('&lt;','<');

                val = val.replaceAll('&gt;','>');

                val = val.replaceAll('&amp;','&');

                $('[name="p_gen_rule_value"]').val(val);

            }catch(err){

              console.log(err);

            }
            

          }
         

        });

        slist.events.on('row-add',function(r){
          
          /*var eventtext = r.row.find('td[item-name="gen_rule_event"] .separator-list-td-val');
          var v         = r.values;
          var text      = 'on'+v.gen_rule_event.label+': '+v.gen_rule_action.label+' [ '+v.gen_rule_targets.value+' ] case '+v.gen_rule_condition.label+' '+v.gen_rule_value.label  ;
          
          eventtext.html(text);*/

        });
        
        //select2 template
        
        /*$('#actions_list_gen_rule_targets').select2({
            templateResult: function(state) {
            console.log(state)
            if (!state.id) { return state.text; }
            var _class = state.element ? $(state.element).attr('class') : '';
            var c      = state.text.indexOf('.') != -1 ? 'gen-field' : 'gen-container'; 
            var $state = $('<span class="rules-target '+_class+'">' + state.text + '</span>');
              
              return $state;
          },
          templateSelection : function(d){
            console.log(d)
          }
        });*/

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
              "value": "checked",
              "action": "hide",
              "targets": "gen_rule_value",
              "name": "Disable Value",
              "opposite": ""
            },

            {
              "event": "change",
              "condition": "equal",
              "value": "unchecked",
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
              "condition": "jsx",
              "value": "{this} == 'regexp' || {this} == 'notregexp'",
              "action": "show",
              "targets": "gen_rule_patern",
              "name": "Condition Rule 4",
              "opposite": "1"
            },
            {
              "event": "change",
              "condition": "jsx",
              "value": "{this} != 'regexp' && {this} != 'notregexp'",
              "action": "notrequired",
              "targets": "gen_rule_patern,gen_rule_patern_custom",
              "name": "Pattern Not Required",
              "opposite": "1"
            },
            {
              "event": "load",
              "condition": "jsx",
              "value": "{this} != 'regexp' && {this} != 'notregexp'",
              "action": "notrequired",
              "targets": "gen_rule_patern,gen_rule_patern_custom",
              "name": "Pattern Not Required",
              "opposite": "1"
            },
            {
	            "event": "change",
	            "condition": "jsx",
	            "value": "{this} != 'regexp' && {this} != 'notregexp'",
	            "action": "hide",
	            "targets": "gen_rule_patern_custom",
	            "name": "Pattern Not Required",
	            "opposite": ""
	          },
	          {
	            "event": "load",
	            "condition": "jsx",
	            "value": "{this} != 'regexp' && {this} != 'notregexp'",
	            "action": "hide",
	            "targets": "gen_rule_patern_custom",
	            "name": "Pattern Not Required",
	            "opposite": ""
	          },
	          {
              "event": "change",
              "condition": "jsx",
              "value": "{this} == 'regexp' || {this} == 'notregexp'",
              "action": "hide",
              "targets": "gen_rule_value",
              "name": "Condition Rule 5",
              "opposite": "1"
            },
            {
              "event": "load",
              "action": "hide",
              "targets": "gen_rule_value2,gen_rule_patern,gen_rule_patern_custom",
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
              "targets": "gen_rule_request_fields,gen_rule_procedure,gen_rule_msg_type,gen_rule_msg",
              "name": "Action Rule 1",
              "opposite": ""
            },
            {
              "event": "change",
              "condition": "notnull",
              "action": "hide",
              "targets": "gen_rule_request_fields,gen_rule_procedure,gen_rule_msg_type,gen_rule_msg",
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
              "targets": "gen_rule_request_fields,gen_rule_procedure",
              "name": "Action Rule 6",
              "opposite": ""
            },

            /*{
              "event": "change",
              "condition": "equal",
              "value": "remote",
              "action": "hide",
              "targets": "gen_rule_targets",
              "name": "Action Rule 6.1",
              "opposite": "1"
            },*/

            {
              "event": "load",
              "condition": "equal",
              "value": "remote",
              "action": "hide",
              "targets": "gen_rule_targets",
              "name": "Action Rule 6.2",
              "opposite": "1"
            },

            /*{
              "event": "change",
              "condition": "equal",
              "value": "remote_combobox",
              "action": "show",
              "targets": "gen_rule_request_fields,gen_rule_procedure",
              "name": "Action Rule 6.1",
              "opposite": "1"
            },*/

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
              "targets": "gen_rule_request_fields,gen_rule_procedure",
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

        var sepConditions = $('.IGRP-separatorlist[tag="separatorlist_2"]')[0];

        var sepActions    = $('.IGRP-separatorlist[tag="actions_list"]')[0];

        //add row
        sepConditions.events.on('row-add',function(o){
        
          var actionsJSON = sepActions.toJSON();
          
          if(actionsJSON[0]){
          
            var actionsStr = JSON.stringify( actionsJSON );

            o.row.find('[name="p_gen_rule_actions_fk"]').val( actionsStr.replace(/"/g,"'") );
         
          }

          sepActions.resetAll();

        });

        //open dialog
        sepConditions.events.on('dialog-open',function(o){
         
          var mbody = o.content.parent(),

              actionsStr = $('[name="p_gen_rule_actions"]').val().replace(/'/g,'"');
          
            $('#igrp-global-modal').removeAttr('tabindex');

          if(actionsStr){

            var actions = JSON.parse(actionsStr);

            sepActions.resetAll();

            sepActions.setRows( actions );
            
          }
         
          mbody.append(sepActions);

        });

        //close dialog
        sepConditions.events.on('before-dialog-hide',function(o){
         
          $(sepActions).prependTo( $('[item-name="actions_list"]') );
          $('#actions_list tbody',sepActions).html('');
        });

      };

      if(_slist.events)
        configSep();
      else
        setTimeout(function(){
          configSep();
        },350);
    }
  }
