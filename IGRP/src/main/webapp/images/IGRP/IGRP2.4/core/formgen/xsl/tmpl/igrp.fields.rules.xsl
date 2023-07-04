<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="rules-list">
       
        <div class="box gen-container-item "  gen-class="" item-name="separatorlist_2">
          <div class="box-body IGRP-separatorlist" id="gen-rules-holder"  tag="separatorlist_2" dialog="true">
            <div class="splist-form-holder clearfix">

              <div class="splist-form clearfix" role="form">

                <div class="form-group col-md-6 " item-name="gen_rule_name" item-type="text">
                  <label>Name</label>
                  <input type="text" name="p_gen_rule_name" class="form-control rule-setter" rel="gen_rule_name"/>
                </div>
              
                <div class="col-md-6 form-group" item-name="gen_rule_event" item-type="select" required="required">
                    <label>Event</label>
                    <select  required="required" multiple="multiple" name="p_gen_rule_event" class="form-control rule-setter select2" rel="gen_rule_event">
                        <option value="load" label="Load">Load</option>
                        <option value="change" label="Change">Change</option>
                        <option value="blur" label="Blur">Blur</option>
                        <option value="keyup" label="Keyup">Keyup</option>
                        <option value="click" label="Click">Click</option>
                    </select>
                </div>
                
                <div class="box-head subtitle" text-color="1"><span>Condition/Value</span></div>
                
                <div class="col-md-6 form-group" item-name="gen_rule_condition" item-type="select" >
                  <label>Condition</label>
                  <select  name="p_gen_rule_condition" class="select2 form-control rule-setter" rel="gen_rule_condition">
                      
                      <option value=""></option>
                      
                      <option value="equal">Equals</option>

                      <option value="diff">Differs</option>

                      <option value="contains">Contains</option>  

                      <option value="notcontains">Not Contains</option>

                      <option value="checked">Checked</option>  

                      <option value="unchecked">Unchecked</option>
                  
                      <option value="greater">Greater than</option>

                      <option value="less">Less than</option>
                     
                      <option value="between">Between</option>
                      
                      <option value="notnull">Not Null</option>

                      <option value="null">Null</option>
                      
                      <option value="startwith">Start With</option>

                      <option value="notstartwith">Not Start With</option>

                      <option value="endwith">End With</option>

                      <option value="notendwith">Not End With</option>

                      <option value="regexp">RegExp</option>
                      
                      <option value="notregexp">Not RegExp</option>
                      
                      <option value="jsx">Custom</option>

                  </select>
                </div>
                
                <div class="form-group col-md-6" item-name="gen_rule_value" item-type="text">
                    <label>Value</label>
                    <input name="p_gen_rule_value" type="text" class="form-control rule-setter" rel="gen_rule_value"/>
                </div>

                <div class="form-group col-md-6" item-name="gen_rule_value2" item-type="text">
                    <label>Value 2</label>
                    <input name="p_gen_rule_value2" type="text" class="form-control rule-setter" rel="gen_rule_value2"/>
                </div>

                <div class="col-md-6 form-group"  item-name="gen_rule_patern" item-type="select" required="required">
                    <label>Pattern</label>
                    <select  required="required" name="p_gen_rule_patern" class="form-control rule-setter select2" rel="gen_rule_patern">
                        <option></option>
                        <option value="email">E-mail</option>
                        <option value="date">Date</option>
                        <option value="custom">Custom</option>
                    </select>
                </div>

                <div class="form-group col-md-12" item-name="gen_rule_patern_custom" item-type="text">
                    <label>Custom Pattern</label>
                    <input name="p_gen_rule_patern_custom" type="text" class="form-control rule-setter" rel="gen_rule_patern_custom"/>
                </div>

                <div class="col-md-12" item-name="gen_rule_opposite" item-type="checkbox">
                    <div class="form-group">
                        <div class="checkbox form-check-offset">
                            <label>
                                <input type="checkbox" name="p_gen_rule_opposite" class="checkbox" label="Opposite Rule?" value="1" rel="gen_rule_opposite"/>Opposite Rule?
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group hidden col-md-6" item-name="gen_rule_actions" item-type="text">
                    <label>Actions</label>
                    <input name="p_gen_rule_actions" type="text" class="form-control rule-setter" rel="gen_rule_actions"/>
                </div>

              </div>
            </div>

            <div class="table-box box-body box-table-contents splist-table">
              <table rel="T_separatorlist_2" id="separatorlist_2" class="table table-striped gen-data-table">
                <thead>
                  <tr>

                    <th align="" item-name="gen_rule_name">
                      <span>
                        Name
                      </span>
                    </th>

                    <th align="" item-name="gen_rule_event">
                      <span>
                        Event
                      </span>
                    </th>

                    <th class="table-btn">
                      <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                        <i class="fa fa-plus"/>
                      </a>
                    </th>
                  </tr>
                </thead>
                <tbody>

                </tbody>
              </table>
            </div>
          </div>
        </div>
        
        <div id="act-list-wrp" class="hidden">
          <div class="box gen-container-item " gen-class="" item-name="actions_list">
            <div class="box-body IGRP-separatorlist" tag="actions_list" dialog="false">
              <div class="splist-form-holder">
                <div class="splist-form" role="form">

                  <div class="box-head subtitle" text-color="1"><span>Actions/Targets</span></div>

                  <div class="col-sm-6 form-group  gen-fields-holder" item-name="gen_rule_action" item-type="select" required="required">
                    
                    <label for="p_gen_rule_action">
                      Action
                    </label>

                    <select class="form-control rule-setter select2 " id="actions_list_gen_rule_action" name="p_gen_rule_action" required="required">
                      <option value="show" >Show</option>
                      <option value="showicon" >Show Icon (date lookup)</option>
                      <option value="hide">Hide</option>
                      <option value="hideicon">Hide Icon (date lookup)</option>
                      <option value="disabled">Disable</option>
                      <option value="enabled">Enable</option>
                      <option value="required">Required</option>
                      <option value="notrequired">Not Required</option>
                      <option value="cleanValue">Clean Value</option>
                      <option value="readonly">Readonly</option>
                      <option value="notreadonly">Not Readonly</option>
                      <option value="remote">Remote</option>
                      <option value="remote_combobox">Remote Combo Box</option>
                      <option value="remote_list">Remote List</option>
                      <option value="message">Notify</option>
                    </select>

                  </div>

                  <div class="col-sm-6 form-group  gen-fields-holder" item-name="gen_rule_targets" item-type="select">
                    <label for="p_gen_rule_targets">
                      Targets
                    </label>
                    <select class="form-control rule-setter select2 " multiple="multiple" id="actions_list_gen_rule_targets" name="p_gen_rule_targets" rel="gen_rule_action">
                      
                    </select>
                  </div>

                  <div class="form-group col-sm-6   gen-fields-holder" item-name="gen_rule_procedure" item-type="text">
                    <label for="p_gen_rule_procedure">
                      <span>
                        Procedure
                      </span>
                    </label>
                    <input type="text" value="" class="form-control rule-setter " id="p_gen_rule_procedure" name="p_gen_rule_procedure" maxlength="500" placeholder="Action ex: index">
                    </input>
                  </div>

                  <div class="form-group col-sm-6   gen-fields-holder" item-name="gen_rule_request_fields" item-type="text">
                    <label for="p_gen_rule_request_fields">
                      <span>
                        Request Fields
                      </span>
                    </label>

                    <select class="form-control rule-setter select2 " multiple="multiple" id="gen_rule_request_fields" name="p_gen_rule_request_fields" ></select>

                  </div>

                  <div class="col-sm-6 form-group  gen-fields-holder" item-name="gen_rule_msg_type" item-type="select" >
                    <label for="p_gen_rule_msg_type">
                      Message Type
                    </label>
                    <select class="form-control rule-setter select2 " id="actions_list_gen_rule_msg_type" name="p_gen_rule_msg_type" >
                      <option value="info">Info</option>
                      <option value="success">Success</option>
                      <option value="warning">Warning</option>
                      <option value="danger">Danger</option>
                    </select>
                  </div>

                  <div class="form-group col-sm-12   gen-fields-holder" item-name="gen_rule_msg" item-type="text">
                    <label for="p_gen_rule_msg">
                      <span>
                        Message
                      </span>
                    </label>
                    <input type="text" value="" class="form-control rule-setter " id="p_gen_rule_msg" name="p_gen_rule_msg" maxlength="2000" placeholder="">
                    </input>
                  </div>

                </div>
              </div>
              <div class="table-box box-body box-table-contents splist-table">
                <table rel="T_actions_list" id="actions_list" class="table table-striped gen-data-table">
                  <thead>
                    <tr>

                      <th align="" item-name="gen_rule_action">
                        <span>
                          Action
                        </span>
                      </th>

                      <th align="" item-name="gen_rule_targets">
                        <span>
                          Targets
                        </span>
                      </th>

                      <th class="table-btn">
                        <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                          <i class="fa fa-plus"/>
                        </a>
                      </th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

    </xsl:template>
    
</xsl:stylesheet>