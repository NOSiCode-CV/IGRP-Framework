/*
 HELPERS
 
Variaveis = DECLARATE_VARIABLES
Model gerais = FIELDS_MODEL_GENERAL
Combos = FILL_COMBO
Paramentros Button = PARAMETERS_BUTTONS
Form = BLOCKS_FORM
Table = BLOCKS_TABLE
Checkbox = CHECKBOX-TABLE
Separador-lista = BLOCK_SEPARATOR-LIST
Form-list = BLOCK_FORM-LIST
View = BLOCK_VIEW
Grafico = BLOCK_GRAFICO
Stabox = BLOCK_STATBOX
Dao Blocks = DAO_BLOCKS
Service Blocks = SERVICE_BLOCKS
Imports = BLOCK_IMPORTS

*/
/**
 * @author Rodney Fernandes
 */
'use strict';
goog.provide('Blockly.Java.selenium');
goog.require('Blockly.Java');

	// ***************** DECLARATE_VARIABLES **********************
var GEN = null,
	blockyInit = false,
	globalAjaxData ="",
    COMPARISON, RETURNS, CORE_SET, CORE_GET, CORE_ATUAL, CORE_CONVERT, ORDER, FIND, CHECK_SELECT, TIPO, WHERE, FILTER, ANDOR, FINDLIST,FINDLISTDAO, TRU_FAL, CRUD,
    COLLECTORS;   
	COLLECTORS = [["Count", "counting"],["Sum", "summingLong"],["Average", "averagingInt"], ["Max", "maxBy"],["Min", "minBy"]],
	COMPARISON = [["==", "=="],["!=", "!="],[">=", ">="], ["<=", "<="],[">=", ">="], [">", ">"], ["<", "<"]],
	RETURNS = [["forward", "forward"],["redirect", "redirect"]], 
    CORE_SET = [["Set Sending Email", "enviar_email"], ["Set Message Sucess", "messageSucess"], ["Set Message Error", "messageError"], 
                ["Set Message Warning", "messageWarning"],["Set Message Info", "messageInfo"],["Set Message Info Link", "messageInfoLink"]],
    CORE_GET = [["Get Parameter Int", "Integer::apanhar_parametro_inteiro"], ["Get Parameter Text", "String::apanhar_parametro_texto"],["Get Report Param", "String::apanhar_parametro_report"],["Get Domain by Name", "String::get_domain"]],
    CORE_ATUAL = [["Atual Date", "LocalDate::data_atual"], ["Atual User Name", "String::nome_utilizador_atual"],["Atual User Email", "String::email_utilizador_atual"],
	        ["Atual User Id", "Integer::id_utilizador_atual"]],
    CORE_CONVERT = [["Convert To Int", "Integer::toInt"],["Convert To String", "String::toString"], ["Convert To Double", "double::toDouble"],["Convert To Long", "Long::toLong"]],
	ORDER = [["id", ""],["Order by Asc", "order_by_asc"],["Order by Desc", "order_by_desc"]],
	FIND = [["--", "--"],["all", "todos"],["one", "um"]], 
	FINDLIST = [["all", "TODOSS"],["limit", "limit"],["one", "UMM"]],
	FINDLISTDAO = [["one", "UMM"],["limit", "limit"],["all", "TODOSS"]],
	CRUD = [["insert", "insert"],["update", "update"],["delete", "delete"]],
	CHECK_SELECT = [["checks", "String::checks"],["unchecks", "String::unchecks"]],
	TIPO = [["Inteiro", "Inteiro"],["Data", "Data"],["Texto", "Texto"]],
	WHERE = [["=", "WHERE_EQ"],["!=", "WHERE_DIF"],["<", "WHERE_LT"],["<=", "WHERE_LTE"],[">", "WHERE_GT"],[">=", "WHERE_GTE"],
		["like", "WHERE_LIKE"],["notlike", "WHERE_NOTLIKE"]],
	FILTER = [["andWhere", "andWhere"],["andWhereIsNull", "andWhereIsNull"],["andWhereNotNull", "andWhereNotNull"],
		["andWhereBetween", "andWhereBetween"],	["orWhere", "orWhere"],["orWhereIsNull", "orWhereIsNull"],["orWhereNotNull", "orWhereNotNull"],
		["orWhereBetween", "orWhereBetween"], ["having", "having"],["where", "where"],["whereIn", "whereIn"],["whereNotIn", "whereNotIn"]],
	ANDOR = [["and", "and"],["or", "or"]], 
	TRU_FAL = [["true", "true"],["false", "false"]]; 
var	daoClasses = {},
	serviceClasses = {},
	IGRP_BLOCKLY_DROPS={ 
		daos : {},
		services : {}
		
	},

	AppTitle, PageTitle, fullClassService, packageService, pagetitle, fields_model = [], form_id = [], key_model = [], fields_table = [],
	fields_separator = [], PAGES = [], DOMAINS = [],
	fields_formlist = [], fields_model_form = [], view_model = [], fields_model_view = [], chart = [], tables_model = [], statbox_model =[],
	separator_model = [],formlist_model = [], form_model = [], buttons_model = [], all_buttons = [], daos_list = [], services_list = [], bloc_fields = [],
	service_fields = [], operations_list = [],
	imports_insert = [], imports_list = [], fields_esp_row = [], custom_action = [], select = [], checkbox_table = [],
	addcombo=0, addcheckbox_table=0, addseparator=0, addforeign=0, addchart=0, addtable =0, addbutton=0, addmodel=0, 
	addstatbox=0, addformlist=0, addform=0, addview=0, custombutton=0, helpers = [], addhelpers = 0, but_table = [], add_but_table = 0,
	read = [], add_read = 0;
var temservices = '';
Blockly.Blocks.texts.HUE = 200;

var GetJavaType = {		
	text : 'String',
	number : 'Integer',
	date : 'String',	
	file : 'File',	
	select : 'String',
	email : 'String',
	link : 'Link',
	checkbox : 'Integer',
	img: 'Image',
	lookup : 'String',
	password : 'String',
	plaintext : 'String',
	hidden: 'String',
	radiolist : 'Integer',
	time : 'String'
};

// ************** PREVIOUS FUNCTIONS************************
var calcHeight = function() {
	$('#gen-blocky-view').height(function() {
		return $(window).height() - 59 - 37;
	});
};

$(window).resize(function() {
	calcHeight();
});
$('#save_bloco_igrp').on('click',function() {	
	if (typeof (Storage) !== "undefined") {
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace);
		localStorage.setItem(document.getElementById("content_blocks").value,Blockly.Xml.domToText(xml));
		alert("Bloco Salvado");
		Blockly.mainWorkspace.clear();	
	}
});
$('#restore_bloco_igrp').on('click', function() {
	Blockly.mainWorkspace.clear();
	var IGRPblockly = document.getElementById("content_blocks").value;
	if (typeof (Storage) !== "undefined") {
		if (localStorage.data !== null) {	
		var xml = Blockly.Xml.textToDom(localStorage.getItem(IGRPblockly));
		Blockly.Xml.domToWorkspace(Blockly.mainWorkspace, xml);
		alert("Bloco Restaurado");
		}
	}
});
$('#refresh_bloco').on('click', function() {
	var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace);
	if (typeof (Storage) !== "undefined") {		
		localStorage.setItem(document.getElementById("content_blocks").value,Blockly.Xml.domToText(xml));
		Blockly.mainWorkspace.clear();
	}
	if (typeof (Storage) !== "undefined") {
		if (localStorage.data !== null) {	
		Blockly.Xml.domToWorkspace(xml,Blockly.mainWorkspace);
		var code = ''; 
		content.textContent = code;    
		console.log("Bloco Atualizado");
		}
	}	
});
$('#active_selenium').on('click', function() {
	$(this).toggleClass('active');
	$("#content_selenium").toggleClass('active');
	
});
	// ************** INIT LOAD XML AND REQUEST **************************
	window.IGRPBlocklyInit = function(){
	 fields_model = [], fields_model.push(['--','--']), chart = [], chart.push(['--','--']), form_id = [], view_model=[], 
	 form_id.push(['--','--']), key_model= [], key_model.push(['--','--']), fields_table = [], fields_table.push(['--','--']),
	 fields_separator = [], fields_separator.push(['--','--']), fields_formlist = [], fields_model_form = [], fields_model_view = [], 
	 fields_formlist.push(['--','--']), tables_model = [], bloc_fields = [], service_fields = [], separator_model = [], tables_model.push(['--','--']), 
	 separator_model.push(['--','--']), formlist_model = [], formlist_model.push(['--','--']),  form_model.push(['--','--']), 
	 buttons_model = [], buttons_model.push([ '--', '--' ]), all_buttons = [], daos_list = [], services_list = [], daos_list.push([ '--', '--' ]),
	 services_list.push([ '--', '--' ]),  operations_list = [],  operations_list.push([ '--', '--' ]),
	 imports_insert = [], imports_insert.push([ '--', '--' ]), imports_list = [], imports_list.push([ '--', '--' ]), fields_esp_row = [], 
	 fields_esp_row.push([ '--', '--' ]), custom_action = [], custom_action.push([ '--', '--' ]), select = [], select.push([ '--', '--' ]), 
	 checkbox_table = [], checkbox_table.push([ '--', '--' ]), addcombo=0, addcheckbox_table=0, addseparator=0, addforeign=0, addchart=0, 
	 addtable=0, addstatbox=0, addbutton=0, addmodel=0, addformlist=0, addform=0, addview=0, custombutton=0, helpers = [], addhelpers = 0,
	 but_table=[]; add_but_table=0, read = [], add_read = 0;
	 
	 var BlocklyXML = $.parseXML(VARS.getGen().getXML());
	 AppTitle = $('rows>app', BlocklyXML).text();
	 PageTitle = $('rows>page', BlocklyXML).text();
	 pagetitle = PageTitle.toLowerCase();
	 IGRP_BLOCKLY_DROPS.tablesTest = {};
	 
	 // ************** FIELDS_MODEL_GENERAL **************************	 
	 
	 $('rows>content>*[type!=separatorlist][type!=formlist]', BlocklyXML).each(function(i, element) {	 
		$(element).find('>fields>*').each(function(x, field) {		
			var tag = $(field).prop('tagName'),
			tagg = $(field).attr('tag'),
			type = $(field).attr('java-type') || $(field).attr('type'),
			multiple = $(field).attr('multiple'),
			range = $(field).attr('range'),
			ChooseType = $(field).attr('type'),
			key  = $(field).attr('iskey'),
			domain = $(field).attr('domain'),
			persist = $(field).attr('persist'),
			javaType = GetJavaType[type] || type || 'String';					
			if(multiple =="true"){	
				fields_model.push([ tag, 'String[]'+'::'+tag]);
				addmodel++;
			}
			else if(range =="true"){	
				fields_model.push([ tag, 'String'+'::'+tag+'//range']);
				addmodel++;
			}
			else if(javaType =="String" && persist =="true"){
				fields_model.push([ tag, 'Section'+'::'+tag]);
				addmodel++;
			}
			else if(tag == "hidden"){
				form_id.push([ tagg, tagg ]);
				fields_model.push([ tagg, javaType + '::'+tagg]);
				addmodel++;
			}
			else {
				fields_model.push([ tag, javaType + '::'+tag]);
				addmodel++;
			}
			
			if(key == "true"){
				key_model.push([ tag, tag]);
				addforeign++;	
			}	
			if(ChooseType == "select" && domain== "" || ChooseType == "checkboxlist" && domain== "" || ChooseType == "radiolist" && domain== ""){
				select.push([ tag, tag ]);	
				addcombo++;		
			}
		});	
	});		 
	 if(addmodel !=0){		 
		$('#toolbox').append(	
			'<category id="model" name="Model '+PageTitle+'" colour="300" class="blocly-dynamic">'
				 +'<block type="set_model" prev-statement="" next-statement="" coment="teste" color="300">'
			 		+'<value name="value1" type="value" title="set model">'
			 			+'<field type="dropdown" name="set_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
			 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/model_icon.svg"></field>'
					+'</value>'
				 +'</block>'
				 +'<block type="get_model" output="" color="300">'
				 	+'<value name="value1" type="dummy" title="get model">'
				 		+'<field type="dropdown" name="get_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
				 		+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/model_icon.svg"></field>'
				 	+'</value>'
				 +'</block>'
			 +'</category>'
			 +'<sep class="blocly-dynamic"></sep>'
		  );
		
		$('#toolbox').append(
				'<category id="parameters" name="Parameters" colour="60" class="blocly-dynamic">'	
				+'<block type="core_get_param" output="" color="60">' 
				+'<value name="value1" type="dummy"  title="get parameter">'
					+'<field type="field_text" name="param" options=""></field>'
					+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/get-icon.svg"></field>'
				+'</value>'
				+'</block>'
				+'</category>'
				+'<sep class="blocly-dynamic"></sep>'
			);	
		}
	 
	 // ************** HELPERS **************************	 	 
	 $('rows>content>*', BlocklyXML).each(function(i, element) {
	 	$(element).each(function(x, component) {		
			var tag = $(component).prop('tagName');
			if(tag != 'title'){
				helpers.push([ tag, tag]);
				addhelpers++;
			}
		});
	 	$(element).find('[type!=table]>fields>*').each(function(x, field) {
			var tag = $(field).prop('tagName');
			if(tag != 'hidden'){
				read.push([ tag, tag]);
				add_read++;
			}
		});
		$(element).find('>fields>*').each(function(x, field) {		
			var tag = $(field).prop('tagName'),
				type =$(field).attr('type');
			if(tag != 'hidden' && type !='hidden'){
				helpers.push([ tag, tag]);
				addhelpers++;
			}
		});
		$(element).find('>tools-bar>*').each(function(x, field) {		
			var buttom = $(field).attr('rel');	
			helpers.push([ 'btn_'+buttom, 'btn_'+buttom]);
			addhelpers++;			
		});
		$(element).find('>table>context-menu>*').each(function(x, field) {		
			var but_ta = $(field).attr('rel');	
			helpers.push([ 'btn_'+but_ta, 'btn_'+but_ta]);
			addhelpers++;
			but_table.push([ 'btn_'+but_ta, 'btn_'+but_ta]);
			add_but_table++;
		});	
	});	
	 
	 if(addhelpers !=0){	
		$('#toolbox').append(
				'<category id="helpers" name="Properties" colour="260" class="blocly-dynamic">'
				 +'<block type="set_visible" prev-statement="" next-statement="" color="260">'
			 		+'<value name="value1" type="dummy" title="set visible">'
			 			+'<field type="dropdown" name="set_visible" options="IGRP_BLOCKLY_DROPS.HELPERS"></field>'
			 			+'<field type="dropdown" name="tru_fal" options="IGRP_BLOCKLY_DROPS.true_false"></field>'
			 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/invisible.svg"></field>'
					+'</value>'
				 +'</block>'
				 +'</category>'
				+'<sep class="blocly-dynamic"></sep>'	
		  );
		}
	 if(add_but_table !=0){	
			$('#helpers').append(
				 '<block type="set_visible_row" prev-statement="" next-statement="" color="260" class="blocly-dynamic">'
			 		+'<value name="value1" type="dummy" title="hide row button">'
			 			+'<field type="dropdown" name="set_visible_row" options="IGRP_BLOCKLY_DROPS.BUT_TABLE"></field>'
			 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/invisible.svg"></field>'
					+'</value>'
				 +'</block class="blocly-dynamic">'
			  );
			}
	 if(add_read !=0){	
			$('#helpers').append(
					 '<block type="set_readonly" prev-statement="" next-statement="" color="260">'
				 		+'<value name="value1" type="dummy" title="set read only">'
				 			+'<field type="dropdown" name="set_readonly" options="IGRP_BLOCKLY_DROPS.READ"></field>'
				 			+'<field type="dropdown" name="tru_fal" options="IGRP_BLOCKLY_DROPS.true_false"></field>'
				 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/edit.svg"></field>'
						+'</value>'
					 +'</block>'
					 +'<block type="set_disabled" prev-statement="" next-statement="" color="260">'
				 		+'<value name="value1" type="dummy" title="set disabled">'
				 			+'<field type="dropdown" name="set_disabled" options="IGRP_BLOCKLY_DROPS.READ"></field>'
				 			+'<field type="dropdown" name="tru_fal" options="IGRP_BLOCKLY_DROPS.true_false"></field>'
				 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/edit.svg"></field>'
						+'</value>'
					 +'</block>'
			  );
			}
	 
	// ******************* BLOCKS_FORM *************************	
		
		$('rows>content>*[type="form"]', BlocklyXML).each(function(i, element) {
			
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];
			$(element).find('>fields>*').each(function(x, field) {
				var tag = $(field).prop('tagName'),
					tagg = $(field).attr('tag'),
					type = $(field).attr('java-type') || $(field).attr('type'),
					multiple = $(field).attr('multiple'),
					range = $(field).attr('range'),
					javaType = GetJavaType[type] || type || 'String';
				
				if(multiple =="true"){
					fields_model_form.push([ tag, 'String[]'+'::'+tag]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push([tag, 'String[]'+ '::'+tag]);
				}
				else if(range =="true"){	
					fields_model_form.push([ tag, 'String'+'::'+tag+'//range']);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push([tag, 'String'+'::'+tag+'//range']);
				}
				else if(tag == "hidden"){
					fields_model_form.push([ tagg, javaType + '::'+tagg]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tagg, javaType + '::'+tagg] );	
				}
				else {
					fields_model_form.push([ tag, javaType + '::'+tag]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );	
				}
			});	
			
			if($(element).attr('type')== 'form'){
				var form = $(element).prop('tagName');
				form_model.push([ form, form ]);
				addform++;
				if(addform == 1){					
				$('#toolbox').append(
						'<category id="form" name="Form" colour="180" class="blocly-dynamic"></category>'
						+'<sep class="blocly-dynamic"></sep>'
						);
				}		
				
				var getFormBlock = function(){
					var rtn = '';
					
					/************** SET MODEL FORM *****************************/
					
					IGRP_BLOCKLY_DROPS.tablesTest[form].forEach(function(f, fi){
						rtn+= '<block type="model_form_'+f[1]+'" prev-statement="" next-statement="" color="300">'
								+'<value type="value" name="value1">'
									+'<field type="text" options="set '+f[0]+'"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
									+'</value><next>';
					});
						rtn+= '<block type="add_isedit" prev-statement="" next-statement="" color="60" class="blocly-dynamic">'
									+'<value name="value3" type="dummy">'
										+'<field type="dropdown" name="button" title="send parameter isEdit in button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
										+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
									+'</value>';			
					IGRP_BLOCKLY_DROPS.tablesTest[form].forEach(function(f, fi){
						rtn+='</next></block>';	
					});
					rtn+='</next></block>';
					return rtn;
				};
				
				$('#form').append(		
					'<category id="'+form+'" name="'+form+'" colour="180" class="blocly-dynamic">'
					
						/************** FILL FORM ***************/
					
						+'<block type="formuu_'+form+'" mutator="where" color="180"  prev-statement="" next-statement="" inline="true">'
							+'<value type="dummy">'
								+'<field type="text" options="fill '+form+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value type="value" name="get_pa">'
								+'<field type="text" options="find"></field>'
							+'</value>'
							+'<value name="value2" type="statement" >'
								+getFormBlock()
							+'</value>'
						+'</block>'
						
						/************** SAVE FORM ***************/
						
						+'<block type="save_formu_'+form+'" mutator="separatori" color="180"  prev-statement="" next-statement="" inline="true">'
							+'<value type="dummy">'
								+'<field type="text" options="save '+form+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement" ></value>'
						+'</block>'	
						
						/************** GET MODEL FORM ***************/
						
						+'<block type="mod_form'+form+'" output="" color="300">'
							+'<value type="dummy" title="get model" name="value1">'
								+'<field type="dropdown" name="get_model" options="IGRP_BLOCKLY_DROPS.tablesTest.'+form+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
							+'</value>'
						+'</block>'
					+'</category>'
					
				);
			}
		});
	 
	 	// ************** FILL_COMBO ********************************	 
		if(addcombo!=0){
			
		$('#toolbox').append(
			'<category id="combo" name="Choose-List" colour="100" class="blocly-dynamic">'	
			+'<block type="fill_combo" color="100" prev-statement="" next-statement="" inline="true">'
				+'<value name="value1" type="dummy" title="fill">'
					+'<field type="dropdown" name="selecao" options="IGRP_BLOCKLY_DROPS.selecao"></field>'
					+'<field type="checkbox" name="selecionar" title="select option?" options="FALSE"></field>'
				+'</value>'
				+'<value name="value2" type="statement">'
					+'<block type="option_combo" color="100" prev-statement="" next-statement="" inline="true">'
						+'<value name="value1" type="dummy" title="option">'
							+'<field type="field_text" name="opcao_val" options="key"></field>'
							+'<field type="field_text" name="opcao_des" options="description"></field>'
						+'</value>'
					+'</block>'
				+'</value>'
			+'</block>'
			+'<block type="combo_dao" color="100" mutator="where" prev-statement="" next-statement="" inline="true" >'
				+'<value name="value1" type="dummy">'
					+'<field type="dropdown" name="selecao" title="fill" options="IGRP_BLOCKLY_DROPS.selecao"></field>'
					+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
					+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
					+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
					+'<field type="checkbox" name="selecionar" title="select option?" options="FALSE"></field>'
				+'</value>'
				+'<value name="key_val" type="statement" check="Linha">'
					+'<block type="option_dao" prev-statement="Linha" next-statement="Linha" color="100" inline="true">'
						+'<value type="value" title="key" name="key_val">'
						+'</value>'
						+'<value type="value" title="description" name="value_val">'
					+'</value>'
					+'</block>'
				+'</value>'
			+'</block>'	
			+'</category>'
			+'<sep class="blocly-dynamic"></sep>'
			);
		}
		
	    // ****************** PARAMETERS_BUTTONS *************************
		var str=''; 
		
		$('item[rel]', BlocklyXML).each(function(i, element){	
			var button = $(element).attr('rel'),
				custom = $(element).attr('custom_return');
			buttons_model.push([ button, button ]);
			all_buttons.push(button);
			addbutton++;
			addmodel++;
			if (custom == 'true'){
				custombutton ++;	
			}
		});
		
		all_buttons.forEach(function(button) {	
			str += '<value name="'+button+'1" type="dummy" title="action '+button+'" class="blocly-dynamic"></value>'
		 			+'<value name="'+button+'" type="statement" class="blocly-dynamic"></value>';	
		});
		$('#controller').append(str);
		$('#controller').append(
				'<value name="custom1" type="dummy" title="custom action" class="blocly-dynamic"></value>'	
	 			+'<value name="custom_actions" type="statement" class="blocly-dynamic"></value>'	
		);
		
		if(addbutton!=0){	
		$('#parameters').append(	
			'<block type="rediret_p" color="60" prev-statement="" next-statement="" inline="true" class="blocly-dynamic">'
				+'<value name="value1" type="dummy" >'
				+'<field type="field_text" name="param" title="send parameter" options=""></field>'
				+'<field type="dropdown" name="button"  title=" in button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
				+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
				+'</value>'
			+'</block>'
			+'<block type="send_par_dao" color="60" prev-statement="" next-statement="" inline="true" class="blocly-dynamic">'
				+'<value type="dummy" >'
					+'<field type="field_text" name="param" title="send parameter" options=""></field>'
				+'</value>'
				+'<value type="value" name="dao_field"  title="="></value>'
				+'<value type="dummy" >'
					+'<field type="dropdown" name="button"  title=" in button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
					+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
				+'</value>'
			+'</block>'
			+'<block type="add_isedit" prev-statement="" next-statement="" color="60" class="blocly-dynamic">'
				+'<value name="value3" type="dummy">'
				+'<field type="dropdown" name="button" title="send parameter isEdit in button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
				+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
				+'</value>'
			+'</block>'
			+'<block type="param_dao" color="60" prev-statement="" next-statement="" inline="true" class="blocly-dynamic">'
				+'<value name="value1" type="dummy" >'
					+'<field type="field_text" name="param" title="add parameter" options=""></field>'
				+'</value>'
				+'<value type="value" name="dao_field"  title="="></value>'
				+'<value type="dummy">'
				+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
				+'</value>'
			+'</block>'
			);
		}
		
		if(custombutton!=0)	{	
		$('#toolbox').append(
				'<category id="custombutton" name="Custom Return" colour="40" class="blocly-dynamic">'	
				+'<block type="custombutton" color="40" prev-statement="" next-statement="" inline="true" class="blocly-dynamic">'
					+'<value name="value1" type="dummy" >'
						+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/custom-icon.svg"></field>'
						+'<field type="dropdown" name="return" title ="return" options="IGRP_BLOCKLY_DROPS.returns"></field>'
						+'<field type="text" name="param" options="page:"></field>'
						+'<field type="dropdown" name="page" options="IGRP_BLOCKLY_DROPS.pages"></field>'
					+'</value>'
				+'</block>'
				+'</category>'
				+'<sep class="blocly-dynamic"></sep>'
			);
		}
		
	 // *************** BLOCKS_TABLE ********************
		
	 $('rows>content>*[type="table"]', BlocklyXML).each(function(i, element){	
		 
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];
			$(element).find('>fields>*').each(function(x, field) {
				var	tag = $(field).prop('tagName'),
					tag_hidden = $(field).attr('tag'),
					type = $(field).attr('java-type') || $(field).attr('type'),
					ChooseType = $(field).attr('type'),
					javaType = GetJavaType[type] || type || 'String';
				if(ChooseType == "checkbox"){
					checkbox_table.push([ tag, tag ]);	
					addcheckbox_table++;		
				}
				if(tag == 'hidden'){	
					fields_table.push([ tag_hidden, javaType + '::'+tag_hidden]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag_hidden, javaType + '::'+tag_hidden] );	
				}else{
					fields_table.push([ tag, javaType + '::'+tag]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );	
				}		
			});
		});
	 
	$('rows>content>*', BlocklyXML).each(function(i, element){	
		
		if($(element).attr('type')== 'table'){	
			var	 table = $(element).prop('tagName');
			tables_model.push([ table, table ]);
			addtable++;
			if(addtable == 1){
			$('#toolbox').append('<category id="table" name="Table" colour="140" class="blocly-dynamic"></category>'	
					+'<sep class="blocly-dynamic"></sep>');
			}	
			var getColumnsBlock = function(){
				var rtn = '';
				IGRP_BLOCKLY_DROPS.tablesTest[table].forEach(function(f, fi){
					rtn+= '<block type="rowtable'+f[1]+'" prev-statement="Linha" next-statement="Linha" color="300">'
								+'<value type="value" name="fields_model">'
									+'<field type="text" options="Set '+f[0]+'"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'	
								+'</value><next>';
				});		
				IGRP_BLOCKLY_DROPS.tablesTest[table].forEach(function(f, fi){
					rtn+='</next></block>';	
				});
				return rtn;
			};
			
			$('#table').append(
					'<category id="'+table+'" name="'+table+'" colour="140" class="blocly-dynamic">'
						+'<block type="listar_'+table+'" color="140" mutator="where" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy">'
								+'<field type="dropdown" name="table" title="'+table+'"></field>'
								+'<field type="comment" options="This block is used to list datas from a DAO class in one table."></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement" check="Linha" >'
								+getColumnsBlock()
							+'</value>'
						+'</block>'
						+'</category>');	
						if(temservices != ''){
						$('#table').append(
							+'<block type="lstar_service_'+table+'" color="140" prev-statement="" next-statement="" inline="true">'
								+'<value name="value1" type="dummy">'
									+'<field type="dropdown" name="table" title="'+table+'"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'</value>'
								+'<value name="value2" type="statement" check="Linha" >'
									+getColumnsBlock()
								+'</value>'
							+'</block>'
							);
						}
			}
	});
	
	// ******************* CHECKBOX-TABLE ***********************	
	if(addcheckbox_table != 0){	
	$('#toolbox').append(
		'<category id="checkbox_tab" name="Check-box Table" colour="100" class="blocly-dynamic">'	
			+'<block type="checkbox_table" color="100" prev-statement="" next-statement="" inline="true">'
				+'<value type="dummy" title="check-box selecteds">'
					+'<field type="dropdown" name="checkbox" options="IGRP_BLOCKLY_DROPS.checkbox_t"></field>'
					+'<field type="text" options="unselecteds?"></field>'
				+'</value>'
			+'</block>'
			+'<block type="checkss" color="300" output="">'
				+'<value type="dummy">'
					+'<field type="dropdown" name="check_sel" options="IGRP_BLOCKLY_DROPS.checksel"></field>'
				+'</value>'
			+'</block>'
		+'</category>'
		+'<sep class="blocly-dynamic"></sep>'
		);
	}		
	// ********************* BLOCK_SEPARATOR-LIST ***************************			
	$('rows>content>*[type="separatorlist"]', BlocklyXML).each(function(i, element){
		
		IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];
		$(element).find('>fields>*').each(function(x, field) {
			var	tag = $(field).prop('tagName'),
				type = $(field).attr('java-type') || $(field).attr('type'),
				javaType = GetJavaType[type] || type || 'String',
				domain = $(field).attr('domain');
			if(type == "select" && domain !="")
			{
				fields_separator.push([tag, 'SelectDomSep*'+domain+'::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [tag, 'SelectDomSep*'+domain+'::'+tag] );	
			}
			else{
				fields_separator.push([ tag, javaType + '::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );	
			}	
		});		
		if($(element).attr('type')== 'separatorlist'){
			var separator = $(element).prop('tagName');
			separator_model.push([ separator, separator ]);
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( ["id_row_"+separator, "String::id_rrow_"+separator] );
			addseparator++;
			if(addseparator == 1)
			{
			$('#toolbox').append(
					'<category id="separator" name="Separator-List" colour="80" class="blocly-dynamic"></category>'
					+'<sep class="blocly-dynamic"></sep>'
					);
			}			
			var getSeparatorBlock = function(){
				var rtn = '';
				IGRP_BLOCKLY_DROPS.tablesTest[separator].forEach(function(f, fi){
					rtn+= '<block type="sep_row_'+f[0]+'$$'+f[1]+'" prev-statement="" next-statement="" color="300">'
							+'<value type="value" name="fields_model">'
								+'<field type="text" options="set '+f[0]+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
							+'</value><next>';
				});			
				IGRP_BLOCKLY_DROPS.tablesTest[separator].forEach(function(f, fi){	
					rtn+='</next></block>';	
				});
				return rtn;
			};	
			$('#separator').append(	
					'<category id="'+separator+'" name="'+separator+'" colour="80" class="blocly-dynamic">'
						+'<block type="separator_'+separator+'" mutator="where" color="80"  prev-statement="" next-statement="" inline="true">'
							+'<value type="dummy">'
								+'<field type="text" options="list '+separator+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement" >'
							+getSeparatorBlock()
							+'</value>'
						+'</block>'
						+'<block type="save_sepator_'+separator+'" color="80"  prev-statement="" next-statement="" inline="true">'
							+'<value type="value" name="edited">'
								+'<field type="text" options="save '+separator+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
								+'<field type="text" options="edit by"></field>'
							+'</value>'
							+'<value name="value2" type="statement" >'
							+'</value>'
						+'</block>'
						+'<block type="get_row_sep_'+separator+'" output="" color="300">'
							+'<value type="dummy" title="get row separator" name="fields_model">'
								+'<field type="dropdown" name="get_row_sep" options="IGRP_BLOCKLY_DROPS.tablesTest.'+separator+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
							+'</value>'
						+'</block>'
					+'</category>'
				);
			}
	});
	
	// ****************** BLOCK_FORM-LIST ****************************
	
	$('rows>content>*[type="formlist"]', BlocklyXML).each(function(i, element) {
		IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];
		$(element).find('>fields>*').each(function(x, field) {
			var	tag = $(field).prop('tagName'),
				type = $(field).attr('java-type') || $(field).attr('type'),
				javaType = GetJavaType[type] || type || 'String',
				domain = $(field).attr('domain');
			if(type == "select" && domain !="")
			{
				fields_formlist.push([tag, 'SelectDomSep*'+domain+'::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [tag, 'SelectDomSep*'+domain+'::'+tag] );
			}
			else{		
				fields_formlist.push([ tag, javaType + '::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );
			}
		});	
		if($(element).attr('type')== 'formlist'){
			var formlist = $(element).prop('tagName');
			formlist_model.push([ formlist, formlist ]);
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( ["id_row_"+formlist, "String::id_rrow_"+formlist] );
			addformlist++;
			if(addformlist == 1)
			{
			$('#toolbox').append(
					'<category id="formlist" name="Form-List" colour="200" class="blocly-dynamic"></category>'
					+'<sep class="blocly-dynamic"></sep>'
				);
			}		
			var getFormlistBlock = function(){
				var rtn = '';
				IGRP_BLOCKLY_DROPS.tablesTest[formlist].forEach(function(f, fi){
					rtn+= '<block type="sep_form_'+f[0]+'$$'+f[1]+'"  prev-statement="" next-statement="" color="300">'
							+'<value type="value" name="fields_model">'
								+'<field type="text" options="set '+f[0]+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
								+'</value><next>';
				});
				IGRP_BLOCKLY_DROPS.tablesTest[formlist].forEach(function(f, fi){
					rtn+='</next></block>';
				});
				return rtn;
			};
			$('#formlist').append(	
				'<category id="'+formlist+'" name="'+formlist+'" colour="200" class="blocly-dynamic">'
					+'<block type="forrmlist_'+formlist+'" mutator="where" color="200"  prev-statement="" next-statement="" inline="true">'
						+'<value type="dummy">'
							+'<field type="text" options="list '+formlist+'"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
							+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
						+'</value>'
						+'<value name="value2" type="statement" >'
						+getFormlistBlock()
						+'</value>'
					+'</block>'
					+'<block type="save_forlist_'+formlist+'" color="200"  prev-statement="" next-statement="" inline="true">'
						+'<value type="value" name="edited">'
							+'<field type="text" options="save '+formlist+'"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
							+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'<field type="text" options="edit by"></field>'
						+'</value>'
						+'<value name="value2" type="statement" >'
						+'</value>'
					+'</block>'
					+'<block type="get_row_form_'+formlist+'" output="" color="300">'
						+'<value type="dummy" title="get row formlist" name="fields_model">'
							+'<field type="dropdown" name="get_row_sep" options="IGRP_BLOCKLY_DROPS.tablesTest.'+formlist+'"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
						+'</value>'
					+'</block>'
				+'</category>'
			);
		}	
	});
	
	// ************************ BLOCK_VIEW ****************************
	
	$('rows>content>*[type="view"]', BlocklyXML).each(function(i, element) {	
		IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];	
	$(element).find('>fields>*').each(function(x, field) {
			var	tag = $(field).prop('tagName'),
				type = $(field).attr('java-type') || $(field).attr('type'),
				tagg = $(field).attr('tag'),
				multiple = $(field).attr('multiple'),
				javaType = GetJavaType[type] || type || 'String';	
			if(multiple =="true"){
				fields_model_view.push([ tag, 'String[]'+'::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, 'String[]'+ '::'+tag] );	
			}
			else if(tag == "hidden"){	
				fields_model_view.push([ tagg, javaType + '::'+tagg]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tagg, javaType + '::'+tagg] );	
			}
			else if(tag.includes("_img")){	
				fields_model_view.push([ tag, 'Image_View::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, 'Image_View::'+tag] );	
			}
			else {
				fields_model_view.push([ tag, javaType + '::'+tag]);
				IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );
			}	
		});	
		if($(element).attr('type')== 'view'){
			var view = $(element).prop('tagName');
			view_model.push([ view, view ]);
			addview++;
			if(addview == 1){		
			$('#toolbox').append(
					'<category id="view" name="View" colour="200" class="blocly-dynamic"></category>'
					+'<sep class="blocly-dynamic"></sep>'
				);
			}	
			var getViewBlock = function(){
				var rtn = '';
				IGRP_BLOCKLY_DROPS.tablesTest[view].forEach(function(f, fi){
					rtn+= '<block type="model_form_'+f[1]+'"  prev-statement="" next-statement="" color="300">'
							+'<value type="value" name="value1">'
								+'<field type="text" options="set '+f[0]+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
								+'</value><next>';
				});
				IGRP_BLOCKLY_DROPS.tablesTest[view].forEach(function(f, fi){	
					rtn+='</next></block>';	
				});	
				return rtn;
			};
			$('#view').append(		
				'<category id="'+view+'" name="'+view+'" colour="180" class="blocly-dynamic">'
					+'<block type="vieww_'+view+'" mutator="where" color="180"  prev-statement="" next-statement="" inline="true">'
						+'<value type="dummy">'
							+'<field type="text" options="fill '+view+'"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
							+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
						+'</value>'
						+'<value type="value" name="get_pa">'
							+'<field type="text" options="find"></field>'
						+'</value>'
						+'<value name="value2" type="statement" >'
						+getViewBlock()
						+'</value>'
					+'</block>'	
					+'<block type="mod_view'+view+'" output="" color="300">'
						+'<value type="dummy" title="get model" name="value1">'
							+'<field type="dropdown" name="get_model" options="IGRP_BLOCKLY_DROPS.tablesTest.'+view+'"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
						+'</value>'
					+'</block>'
				+'</category>'
			);
		}	
	});	
	
	// ***************** BLOCK_GRAFICO **************************
	
	$('rows>content>*[type="chart"]', BlocklyXML).each(function(i, element){	
	if($(element).attr('type')== 'chart'){
			var char = $(element).prop('tagName');
			var char_type= $(element).find('chart_type').text();	
			chart.push([ char, char ]);
			addchart++;
			if(addchart == 1){
			$('#toolbox').append(
					'<category id="dashboard" name="Dashboard" colour="80" class="blocly-dynamic"></category>'
					+'<sep class="blocly-dynamic"></sep>'
				);
			}
			var eixos='';
			if(char_type != 'pie' && char_type != 'funnel' && char_type != 'semipie'){
				eixos =	'<next>'
							+'<block type="EixoY" color ="300" prev-statement="" next-statement="">'
								+'<value name="eixo"  title="Eixo Y" type="value"></value>'		
									+'<next>'
										+'<block type="EixoZ" color ="300" prev-statement="" >'
											+'<value name="eixo" title="Eixo Z"  type="value">'
											+'</value>'
										+'</block>'	
									+'</next>'
							+'</block>'
						+'</next>'
					+'</value>'
				+'</block>';
			}else	{
				eixos = '<next>'
							+'<block type="EixoY_Z" color ="300" prev-statement="" next-statement="" >'
								+'<value name="eixo" title="Eixo Y" type="value">'
								+'</value>'				
							+'</block>'
						+'</next>'
					+'</value>'
				+'</block>';				
			}
			$('#dashboard').append(		
					'<category id="'+char+'" name="'+char+'" colour="120" class="blocly-dynamic">'
						+'<block type="grafico_'+char+'" color ="120" mutator="where" prev-statement="" next-statement=""  inline="true">'
							+'<value name="value1" type="dummy" >'
								+'<field type="text" options="fill '+char+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="groupby"  title="group by " type="value">'
							+'</value>'
							+'<value name="value2" type="statement">'
								+'<block type="EixoX" color ="300" prev-statement="" next-statement="">'
									+'<value name="eixo"  title="Eixo X" type="value"></value>'
										+ eixos
					+'</category>'
				+'</category>'
			);
		}
	});
	
	// ****************** BLOCK_STATBOX ******************************
	
	 $('rows>content>*[type="statbox"]', BlocklyXML).each(function(i, element){	
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];
			$(element).find('>fields>*').each(function(x, field) {
				var	tag = $(field).prop('tagName'),
					tag_hidden = $(field).attr('tag'),
					type = $(field).attr('java-type') || $(field).attr('type'),
					ChooseType = $(field).attr('type'),
					javaType = GetJavaType[type] || type || 'String';
				if(ChooseType == "checkbox"){
					checkbox_table.push([ tag, tag ]);	
					addcheckbox_table++;		
				}
				if(tag == 'hidden'){	
					fields_table.push([ tag_hidden, javaType + '::'+tag_hidden]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag_hidden, javaType + '::'+tag_hidden] );	
				}else{
					fields_table.push([ tag, javaType + '::'+tag]);
					IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );	
				}
				
			});
		});
	 
	$('rows>content>*', BlocklyXML).each(function(i, element){	
		if($(element).attr('type')== 'statbox'){	
			var	 statbox = $(element).prop('tagName');
			statbox_model.push([ statbox, statbox ]);
			addstatbox++;
			if(addstatbox == 1){
			$('#toolbox').append('<category id="statbox" name="Stat Box" colour="70" class="blocly-dynamic"></category>'	
					+'<sep class="blocly-dynamic"></sep>');
			}	
			var getColumnsBlock = function(){
				var rtn = '';
				IGRP_BLOCKLY_DROPS.tablesTest[statbox].forEach(function(f, fi){
					rtn+= '<block type="statfields_'+f[1]+'" prev-statement="" next-statement="" color="300">'
								+'<value type="value" name="fields_model">'
									+'<field type="text" options="Set '+f[0]+'"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'	
								+'</value><next>';
				});	
				IGRP_BLOCKLY_DROPS.tablesTest[statbox].forEach(function(f, fi){
					rtn+='</next></block>';	
				});
				return rtn;
			};
			
			$('#statbox').append(
					'<category id="'+statbox+'" name="'+statbox+'" colour="70" class="blocly-dynamic">'
						+'<block type="sttbox_'+statbox+'" color="70" mutator="where" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy">'
								+'<field type="dropdown" name="table" title="'+statbox+'"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="dropdown" name="dao" title=" count DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement" check="Linha" >'
								+getColumnsBlock()
							+'</value>'
						+'</block>'
						
						+'<block type="dao_count" output="" color="160" class="blocly-dynamic">'
							+'<value type="dummy" >'
								+'<field type="dropdown" name="dao"  title="total" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
							+'</value>'	
						+'</block>'
					+'</category>'
					);
		}
	});
	
    // ***************** DAO_BLOCKS ***********************
	
	var iurlArr = path.split('/'),
		iurl   = iurlArr[0] == '' ? iurlArr[1] : 'IGRP';
	$.ajax({
		url : '/'+iurl+'/app/webapps?r=igrp_studio/Env/Retornarxml&app_name='+AppTitle, 
		headers : {'x-igrp-remote' : 1},
		method : 'GET',
		dataType : 'xml',
		success : function(data) {
			globalAjaxData = data;
			console.log(data);
		var temdao = '';
			temdao = $(data).find('dao>').text();
		if(temdao != ''){
			$('#toolbox').append(
					'<category id="dao" name="DAO" colour="160" class="blocly-dynamic">'
							+'<block type="list_simple_dao" color ="160" prev-statement="" next-statement="" mutator="where" inline="true">'
								+'<value type="dummy" name="value1" title="select">'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
									+'<field type="text" options="DAO"></field>'
									+'<field type="dropdown" name="dao" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
									+'<field type="checkbox" name="selecionar" title="keep connection?" options="FALSE"></field>'
								+'</value>'
								+'<value name="value2" type="statement">'
								+'</value>'
							+'</block>'
							+'<block type="insert_simple_dao" color ="160" prev-statement="" next-statement="" inline="true">'
								+'<value type="dummy" name="value1" title="insert">'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
									+'<field type="text" options="DAO"></field>'
									+'<field type="dropdown" name="dao" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
								+'</value>'
								+'<value type="statement" name="value2">'
								+'</value>'
							+'</block>'
							+'<block type="update_simple_dao" color ="160" prev-statement="" next-statement="" mutator="where" inline="true">'
							+'<value type="dummy" name="value1" title="update">'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="text" options="DAO"></field>'
								+'<field type="dropdown" name="dao" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value type="value" name="get_pa">'
								+'<field type="text" options="find"></field>'
							+'</value>'
							+'<value type="statement" name="value2">'
							+'</value>'
						+'</block>'
						+'<block type="apagar" color ="160" prev-statement="" next-statement="" mutator="where" inline="true">'
							+'<value type="dummy" name="value1" title="delete">'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="text" options="DAO"></field>'
								+'<field type="dropdown" name="dao" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value type="value" name="get_pa">'
								+'<field type="text" options="find"></field>'
							+'</value>'
						+'</block>'
					+'</category><sep class="blocly-dynamic"></sep>'
			);
				if(addforeign!=0){
					$('#parameters').append(
						'<block type="enviar_p" color ="60" prev-statement="" next-statement="">'
							+'<value name="PARAM" type="dummy">'
								+'<field type="dropdown" name="iskey" title="add primary-key" options="IGRP_BLOCKLY_DROPS.keys"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
							+'</value>'
						+'</block>'	
						
						+'<block type="editar_dao" color ="60" prev-statement="" next-statement="">'
							+'<value type="dummy">'
								+'<field type="text" options="add parameter isEdit"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/send-icon.svg"></field>'
							+'</value>'
						+'</block>'
					);		
				}	
				$(data).find('dao>*').each(function(i, f) {
					var daos = $(f).prop('tagName');
					daoClasses[daos] = true;
					daos_list.push([ daos, daos ]);
					bloc_fields.push(daos);					
					$('#dao').append('<category id="'+daos+'" name="'+daos+'" colour="160"></category>\n');
				});
				bloc_fields.forEach(function(daos) { 
					var fieldy_list = [];
					fieldy_list.push(['', 'ObjectDao'+'::'+daos]);
					IGRP_BLOCKLY_DROPS.daos[daos] = fieldy_list;
					$(data).find('dao>' + daos+ '>*').each(function(i, f) {
						var field = $('nome',f).text(),
							type = $('tipo',f).text();
							fieldy_list.push([field,type+'::'+field ]);	
					});
					$('#'+daos+'').append(
						'<block type="set-dao-'+daos+'" igrp="tete" color="160"  prev-statement="" next-statement="" class="blocly-dynamic">'
							+'<value name="value1" type="value" title="set '+daos+'">'
							+'</value>'
						+'</block>\n');
					$('#'+daos+'').append(
							'<block type="get-dao-'+daos+'" color="160" output="" class="blocly-dynamic">'
							+'</block>'
							);
				});
		}
		
		// ***************** SERVICE_BLOCKS ***********************
		
		temservices = $(data).find('services>').text();
		if(temservices != ''){
			$('#toolbox').append(
					'<category id="service" name="Services" colour="120" class="blocly-dynamic">'
							+'<block type="list_simple_service" color ="120" prev-statement="" next-statement="" inline="true">'
								+'<value type="dummy" name="value1" title="select">'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/left-arrow.svg"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
									+'<field type="text" options="service"></field>'
									+'<field type="dropdown" name="service" options="IGRP_BLOCKLY_DROPS.service_list"></field>'
								+'</value>'
								+'<value name="value2" type="statement">'
								+'</value>'
							+'</block>'
							+'<block type="insert_simple_service" color ="120" prev-statement="" next-statement="" inline="true">'
							+'<value type="dummy" name="value1" title="insert">'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
								+'<field type="text" options="Service"></field>'
								+'<field type="dropdown" name="service" options="IGRP_BLOCKLY_DROPS.service_list"></field>'
							+'</value>'
							+'<value type="statement" name="value2">'
							+'</value>'
						+'</block>'
						+'<block type="update_simple_service" color ="120" prev-statement="" next-statement="" inline="true">'
						+'<value type="dummy" name="value1" title="update">'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
							+'<field type="text" options="Service"></field>'
							+'<field type="dropdown" name="service" options="IGRP_BLOCKLY_DROPS.service_list"></field>'
						+'</value>'
						+'<value type="statement" name="value2">'
						+'</value>'
					+'</block>'
					+'<block type="apagar_service" color ="120" prev-statement="" next-statement="" inline="true">'
						+'<value type="dummy" name="value1" title="delete">'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/right-arrow.svg"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
							+'<field type="text" options="Service"></field>'
							+'<field type="dropdown" name="service" options="IGRP_BLOCKLY_DROPS.service_list"></field>'
						+'</value>'
					+'</block>'
					+'</category><sep class="blocly-dynamic"></sep>'
			);
			
			$(data).find('services>*').each(function(i, f) {
				var services = $(f).prop('tagName');
				serviceClasses[services] = true;
				services_list.push([ services, services ]);
				service_fields.push(services);					
				$('#service').append('<category id="'+services+'" name="'+services+'" colour="120"></category>\n');
			});
			service_fields.forEach(function(services) { 
				var fieldy_list = [];
				fieldy_list.push(['', 'ObjectService'+'::'+services]);
				IGRP_BLOCKLY_DROPS.services[services] = fieldy_list;
				
				fullClassService = $(data).find('services>' + services+ '>full_class_name').text();				
				packageService = fullClassService.split('.')[4];			
				
				$(data).find('services>' + services+ '>operations>*').each(function(i, f) {
					var operations = $(f).prop('tagName');
					var tipoServico = $(f).find('>return>tipo').text().split(".").pop();
					var numParams =0;
					
					$(data).find(operations+'>params>*').each(function(i, f) {					
						numParams++;			 					 	
					});

					operations_list.push([service_fields+": " +operations, service_fields+'$$'+numParams+'::'+operations+'//'+tipoServico ]);
					
					$('#'+services).append('<category id="'+operations+'" name="'+operations+'" colour="120"></category>\n');
					
					$(f).find('>return>fields>*').each(function(i, f) {
						var field = $('nome',f).text(),
							type = $('tipo',f).text().split(".").pop();
							fieldy_list.push([field,type+'::'+field ]);	
					});
					$('#'+operations).append(
						'<block type="set-service-'+tipoServico+'" igrp="tete" color="120"  prev-statement="" next-statement="" class="blocly-dynamic">'
							+'<value name="value1" type="value" title="set '+tipoServico+'">'
								+'<field type="dropdown" name="DAO_FIELD" options="IGRP_BLOCKLY_DROPS.services.'+services+'"></field>'
							+'</value>'
						+'</block>\n');
					$('#'+operations).append(
						'<block type="get-service-'+tipoServico+'" color="120" output="" class="blocly-dynamic">'
							+'<value name="value1" type="dummy" title="get '+tipoServico+'">'
								+'<field type="dropdown" name="DAO_FIELD" options="IGRP_BLOCKLY_DROPS.services.'+services+'"></field>'
							+'</value>'
						+'</block>'
						);	
				});	
			});
		}	
	
	 IGRP_BLOCKLY_DROPS = $.extend(IGRP_BLOCKLY_DROPS,{
			comparison : COMPARISON,
			core_set : CORE_SET,
			core_get : CORE_GET,
			core_atual : CORE_ATUAL,
			core_convert : CORE_CONVERT,
			find : FIND,
			tipo : TIPO,
			where : WHERE,
			checksel : CHECK_SELECT,
			returns : RETURNS,
			pages : PAGES,
			domains : DOMAINS,
			order : ORDER,
			collectors : COLLECTORS,
			and_or : ANDOR,
			true_false : TRU_FAL,
			dao_list : daos_list,
			service_list : services_list,
			operation_list : operations_list,
			buttons : buttons_model,
			fields : fields_model,
			tables : tables_model,
			separators : separator_model,
			formlists : formlist_model,
			esp_rows : fields_esp_row,
			selecao : select,
			checkbox_t : checkbox_table,
			ID_MODEL : form_id,
			findList : FINDLIST,
			findListDao : FINDLISTDAO,
			keys : key_model,
			fields_TABLE : fields_table,
			fields_SEP : fields_separator,
			fields_FORM : fields_formlist,
			chart_model : chart,
			HELPERS : helpers,
			BUT_TABLE :but_table,
			READ :read,
			crud :CRUD

		});

		if (!blockyInit) {
			Code.init();
			blockyInit=true;
			var demoWorkspace = Blockly.mainWorkspace;
			Blockly.Xml.domToWorkspace( $('#inicial_script')[0] ,demoWorkspace);
			$('#igrp-form-gen').trigger('blockly-ready');
		}else{
			var toolbox = $('#toolbox')[0];
			Blockly.mainWorkspace.updateToolbox(toolbox);
			SetupBlockly();
		}
	},
	
	error : function(data) {
		console.log('Error: '+data);
	}
	});
};

// ***************** BLOCK_IMPORTS **************************

var codeBlockStart = '/* Start-Code-Block (',
	codeBlockEnd   = '/* End-Code-Block */';

function GetBlocklyImports(){
	try{
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace),
			listarImports = $('block[type*="listar_"], block[type*="lstar_service_"] ',xml),	
			inserirImports = $('block[type="inserir_dao"]',xml),
			checkImports = $('block[type="checkbox_table"]',xml),
			inserirImports2 = $('block[type*="save_formu_"]',xml),
			inserirImports3 = $('block[type="insert_simple_dao"], block[type="insert_simple_service"]',xml),
			fillComboImports = $('block[type="fill_combo"]',xml),
			separatorImports = $('block[type*="separator_"]',xml),
			formlistImports = $('block[type*="forrmlist_"]',xml),
			saveseparatorImports = $('block[type*="save_sepator_"]',xml),
			saveformlistImports = $('block[type*="save_forlist"]',xml),
			graficoImports = $('block[type*="grafico_"]',xml),
			combodaoImports = $('block[type="combo_dao"]',xml),
			daosImports   = $('block[type*="set-dao-"], block[type*="get-dao-"]',xml),
			serviceImports   = $('block[type*="get-service-"] , block[type*="get-service-"]',xml),
			fieldDaos     = $('field[name="dao"]', xml),
			fieldServices     = $('field[name="service"]', xml),
			Fields 		  = $('field', xml),
			listSimpledao = $('block[type="list_simple_dao"]',xml),
			fieldsImportsMap = {
				'Date' : true,
				'File' : true,
				'Link' : true,
				'LocalTime' : true,
				'LocalDate' : true,
				'LocalDateTime' : true
			};
		var rtn='';
		if(listarImports[0])
			rtn+='<import type="listar">Listar</import>';
		if(fillComboImports[0])
			rtn+='<import type="fill_combo">Select</import>';
		if(separatorImports[0])
			rtn+='<import type="separator">Separator</import>';
		if(formlistImports[0])
			rtn+='<import type="formlist">Formlist</import>';
		if(saveseparatorImports[0]){
			saveseparatorImports.each(function(i, sep){
				var blockType =$.trim($(sep).attr('type').split('save_sepator_').pop());
				rtn+='<import type="save_separator">'+blockType+'</import>';
			});
		}
		if(saveformlistImports[0]){
			saveformlistImports.each(function(i, form){
				var blockType =$.trim($(form).attr('type').split('save_forlist_').pop());
				rtn+='<import type="save_formlist">'+blockType+'</import>';
			});	
		}
		if(graficoImports[0]){
			graficoImports.each(function(i, grap){
				var blockType =$.trim($(grap).attr('type').split('grafico_').pop());
				rtn+='<import type="grafico">'+blockType+'</import>';
			});	
		}
		if(inserirImports[0])
			rtn+='<import type="inserir_dao">Inserir Daos</import>';
		if(inserirImports2[0])
			rtn+='<import type="inserir_dao">Inserir Daos</import>';
		if(inserirImports3[0])
			rtn+='<import type="insert_simple_dao">Inserir Daos</import>';
		if(combodaoImports[0])
			rtn+='<import type="combo_dao">Combo Dao</import>';
		if(checkImports[0])
			rtn+='<import type="checkbox_table">Check-box Import</import>';
		if(listSimpledao[0])
			rtn+='<import type="list_simple_dao">List Dao Import</import>';
		if(daosImports[0] || fieldDaos[0]){
			var incs = {};
			daosImports.each(function(i, dao){
				var dao_child = $(dao).find('field[name="DAO_FIELD"]:contains("_FK#")');
				var child_table_name = dao_child[0] ? dao_child.text().split('_FK#')[0] : false;
 				var daoClass = $.trim($(dao).attr('type').split('et-dao-').pop());
				if(!incs[daoClass])
					incs[daoClass] = true;
				if(child_table_name)
					if(!incs[child_table_name])
						incs[child_table_name] = true;
			});
			fieldDaos.each(function(i,fdao){
				var daoClss = $(fdao).text();
				if(!incs[daoClss])
					incs[daoClss] = true;
			});
			for(var i in incs){
				rtn+='<import type="dao">'+i+'</import>';
			}
		}
		if(serviceImports[0] || fieldServices[0]){
			var incs = {};
			serviceImports.each(function(i, dao){
				var dao_child = $(dao).find('field[name="DAO_FIELD"]:contains("_FK#")');
				var child_table_name = dao_child[0] ? dao_child.text().split('_FK#')[0] : false;
 				var daoClass = $.trim($(dao).attr('type').split('et-service-').pop());
				if(!incs[daoClass])
					incs[daoClass] = true;
				if(child_table_name)
					if(!incs[child_table_name])
						incs[child_table_name] = true;
			});
			fieldServices.each(function(i,fservice){
				var serviceClss = $(fservice).text();
				if(!incs[serviceClss])
					incs[serviceClss] = true;
			});
			for(var i in incs){
				rtn+='<import type="service" package="'+packageService+'">'+i+'</import>';
			}
			
		}
		var fieldsInc = {};
		Fields.each(function(i,f){
			var text = $(f).text();
			if(text.indexOf('::') >=0 ){
				var types = text.split('::')[0];
				if(fieldsImportsMap[types] && !fieldsInc[types]){
					console.log(types)
					fieldsInc[types] = true;
				}
				if(daoClasses[types]){
					fieldsInc[types] = 'dao';
				}
				if(serviceClasses[types]){
					fieldsInc[types] = 'service';
				}
			}
		});
		for(var x in fieldsInc){
			var type = fieldsInc[x] != true ?  fieldsInc[x] : 'fields';
			rtn+='<import type="'+type+'">'+x+'</import>';
		}
		return '<imports>'+rtn+'</imports>';
	}catch(err){
		return '';
	}
}

function GetDefaultBlocklyXML(){
	try{
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace),
			xmlStr = new XMLSerializer().serializeToString(xml);
		xmlStr = xmlStr.replaceAll(' xmlns="http://www.w3.org/1999/xhtml"' ,'');
		return xmlStr;
	}catch(err){
		return '';
	}
}

function GetBlocklyXML(){
	var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace),
		xmlStr = new XMLSerializer().serializeToString(xml);
	 xmlStr = xmlStr.replaceAll('xmlns="http://www.w3.org/1999/xhtml"' ,'');
	  var MainXML = ( 
	    '<main>'+
	    	'<config>'+
	    		'<app>'+
	    			'<title>'+AppTitle+'</title>'+
	    		'</app>'+
	    		'<page>'+
	    			'<title>'+PageTitle+'</title>'+
	    		'</page>'+
	    	'</config>'+
	    	xmlStr+
	    '</main>'	  
	  );
	  return vkbeautify.xml(MainXML); 
}

function GetBlocklyActionsCode(callback){
	var xml = GetBlocklyXML(),
		xmlDoc;
	if (window.DOMParser) {
		// code for modern browsers
		var parser = new DOMParser();
		xmlDoc = parser.parseFromString(xml,"text/xml");
	} else {
	  // code for old IE browsers
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = false;
		xmlDoc.loadXML(xml);
	} 

	$('<div/>').XMLTransform({
		xml : xmlDoc,
		xsl : path+'/core/blockly/transform/xsl/IGRP.blockly.java.xsl',
		xslBasePath : path+'/core/blockly/transform/xsl',
		complete:function(content){
			var html = content.html();
			var response = HandleCode(html);
			if(callback)
				callback(response);
		}
	});
}

function HandleCode(code){
	code = code || GetBlocklyXML();
	var startsIndexArray = getIndicesOf( codeBlockStart, code ),
		endsIndexArray   = getIndicesOf( codeBlockEnd, code ),
		response  		 = {};
	if(startsIndexArray.length == endsIndexArray.length){
		startsIndexArray.forEach(function(startIndex,i){
			var endIndex = endsIndexArray[i],
				blockCode = code.substring(startIndex,endIndex),
				startDeclarionEnd = ') */',
				nameStartIdx = blockCode.indexOf(codeBlockStart),
				nameEndIdx = blockCode.indexOf(startDeclarionEnd),
				actionName = blockCode.substring(nameStartIdx + codeBlockStart.length, nameEndIdx),
				startExpression = codeBlockStart+actionName+startDeclarionEnd,
				actionCode = blockCode.substring(startExpression.length, blockCode.length);
			response[actionName] = actionCode;	
		});
		return response;
	}	
}

$.IGRP.on('init', function(){
	GEN = VARS.getGen();
	console.log(GEN)
	GEN.on('ready', function(){
		PAGES = function(){
			var arr = [];
			GEN.DETAILS.linkPageList.forEach(function(item){
				arr.push( [item.page,item.page] );
			});
			return arr;
		}();
		DOMAINS = function(){
			var arr = [];
			GEN.DETAILS.domains.forEach(function(item){
				var doma = item.value.split(' «')[0];
				arr.push( [doma,doma] );
			});
			return arr;
		}();
	});

	var pageBlockly = null;
	GEN.on('ready', function(){
		IGRPBlocklyInit();
		$('#igrp-form-gen').on('blockly-ready', function(){
			if(pageBlockly){
				setTimeout(function(){
					Blockly.mainWorkspace.clear();
					Blockly.Xml.domToWorkspace(pageBlockly, Blockly.mainWorkspace);
				},400);		
			}
		});
	});
	
	$(document).on('blockly-widget-div-created', function(e, element){
		var inputSearch = $('<input class="blockly-search-widget"/>');
		$(element).append(inputSearch);
		inputSearch.on('keyup', function(){
			var items = $('.goog-menuitem-content', element),
				val   = inputSearch.val();
			if(val.length > 0 ){
				items.hide();
				var found = items.filter(':contains('+val+')');
				found.show();
			}
			else{
				items.show();
			}	
		});
	});
	
	$('li[rel="gen-blocky"]').on('click',function() {
		$('.blocly-dynamic').remove();
		IGRPBlocklyInit();
		$('#tab_blocks').click();
		setTimeout(function(){
			$('#refresh_bloco').click();
		}, 400);
	});
	
	$('#igrp-form-gen').on('on-export', function(e, data){
		data.blocklyData = GetDefaultBlocklyXML();
	});
	
	$('#igrp-form-gen').on('on-import', function(e, data){
		if( data.blocklyData ){
			var xml = Blockly.Xml.textToDom( data.blocklyData );
			pageBlockly = xml;
		}	
	});
});
