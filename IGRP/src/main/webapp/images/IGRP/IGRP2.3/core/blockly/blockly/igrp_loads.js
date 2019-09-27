/**
 * @fileoverview Generating Java for math blocks.
 * @author q.neutron@gmail.com (Quynh Neutron)
 */
'use strict';

goog.provide('Blockly.Java.selenium');

goog.require('Blockly.Java');

var GEN = null;

var blockyInit = false;

var COMPARISON = [["==", "=="],["!=", "!="],[">=", ">="], ["<=", "<="],[">=", ">="], [">", ">"], ["<", "<"]];

var CORE_IF = [["verificar se está nulo", "verificar se está nulo"],["verificar se não está nulo", "verificar se não está nulo"]];

var CORE_MSG = [["mensagem sucesso", "mensagem sucesso"],["mensagem de erro", "mensagem erro"]];

var CORE_CONV = [["converter para inteiro", "converter para inteiro"],["converter texto para data", "converter texto para data"],["converter para texto", "converter para texto"]];

var FIND = [["--", "--"],["all", "todos"],["one", "um"]];

var FINDLIST = [["--", "--"],["all", "TODOSS"],["one", "UMM"]];

var TIPO = [["Inteiro", "Inteiro"],["Data", "Data"],["Texto", "Texto"]];

var WHERE = [["=", "WHERE_EQ"],["!=", "WHERE_DIF"],["<", "WHERE_LT"],[">", "WHERE_GT"],["like", "WHERE_LIKE"]];

var FILTER = [["andWhere", "andWhere"],["andWhereIsNull", "andWhereIsNull"],["andWhereIsNotNull", "andWhereIsNotNull"],["andWhereBetween", "andWhereBetween"],
			  ["orWhere", "orWhere"],["orWhereIsNull", "orWhereIsNull"],["orWhereIsNotNull", "orWhereIsNotNull"],["orWhereBetween", "orWhereBetween"],
			  ["having", "having"],["where", "where"]];

var ANDOR = [["and", "and"],["or", "or"]];

var TRU_FAL = [["true", "true"],["false", "false"]];

var daoClasses = {};

var IGRP_BLOCKLY_DROPS={
	
	daos : {}
		
};

var AppTitle, PageTitle, pagetitle;
var fields_model = [];
var form_id = [];
var key_model = [];
var fields_table = [];
var fields_separator = [];
var fields_formlist = [];
var chart = [];
var tables_model = [];
var separator_model = [];
var formlist_model = [];
var str = '';
var buttons_model = [], all_buttons = [];
var daos_list = [], bloc_fields = [];
var imports_insert = [];
var imports_list = [];
var fields_esp_row = [];
var custom_action = [];
var select = [];
var addcombo=0, addseparator=0, addforeign=0, addchart=0, addtable =0, addbutton=0, addmodel=0, addformlist=0;

//CALCULAR ALTURA DA PÁGINA BLOCKY

Blockly.Blocks.texts.HUE = 200;

var calcHeight = function() {

	$('#gen-blocky-view').height(function() {

		return $(window).height() - 59 - 37

	});

}

var GetJavaType = {
		
	text : 'String',
	
	number : 'Integer',
	
	date : 'String',
	
	file : 'File',
		
	select : 'Select',
	
	email : 'String',
	
	link : 'Link'
		
}

$(window).resize(function() {
	calcHeight();
});


$('#save_bloco_igrp').on('click',function() {
	if (typeof (Storage) !== "undefined") {
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace);
		localStorage.setItem(document.getElementById("content_blocks").value,Blockly.Xml.domToText(xml));
		alert("Bloco salvado");
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
	
	if (typeof (Storage) !== "undefined") {
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace);
		localStorage.setItem(document.getElementById("content_blocks").value,Blockly.Xml.domToText(xml));
		Blockly.mainWorkspace.clear();
	}
	var IGRPblockly = document.getElementById("content_blocks").value;
	if (typeof (Storage) !== "undefined") {
		if (localStorage.data !== null) {
		var xml = Blockly.Xml.textToDom(localStorage.getItem(IGRPblockly));
		Blockly.Xml.domToWorkspace(xml,Blockly.mainWorkspace);
		var code = Blockly.Java.workspaceToCode(Code.workspace);
		   content.textContent = code; 
		console.log("Bloco Atualizado");
		}
	}
});

$('#active_selenium').on('click', function() {
	$(this).toggleClass('active');
	$("#content_selenium").toggleClass('active');
	
});

//************************************************** GET XML FIELDS FORM ***************************************


window.IGRPBlocklyInit = function(){

	 fields_model = []; 
	 fields_model.push(['--','--']);
	 chart = []; 
	 chart.push(['--','--']);
	 form_id = []; 
	 form_id.push(['--','--']);
	 key_model= [];
	 key_model.push(['--','--']);
	 fields_table = []; 
	 fields_table.push(['--','--']);
	 fields_separator = []; 
	 fields_separator.push(['--','--']);
	 fields_formlist = []; 
	 fields_formlist.push(['--','--']);
	 tables_model = []; 
	 bloc_fields = []; 
	 separator_model = []; 
	 tables_model.push(['--','--']);
	 separator_model.push(['--','--']);
	 formlist_model = []; 
	 formlist_model.push(['--','--']);
	 buttons_model = [];
	 buttons_model.push([ '--', '--' ]);
	 all_buttons = [];
	 daos_list = [];
	 daos_list.push([ '--', '--' ]);
	 imports_insert = [];
	 imports_insert.push([ '--', '--' ]);
	 imports_list = [];
	 imports_list.push([ '--', '--' ]);
	 fields_esp_row = [];
	 fields_esp_row.push([ '--', '--' ]);
	 custom_action = []; 
	 custom_action.push([ '--', '--' ]);
	 select = [];
	 select.push([ '--', '--' ]);
	 
	 addcombo=0, addseparator=0, addforeign=0, addchart=0, addtable=0, addbutton=0, addmodel=0, addformlist=0;
	
	var BlocklyXML = $.parseXML(VARS.getGen().getXML());
	
	 AppTitle = $('rows>app', BlocklyXML).text();
	 PageTitle = $('rows>page', BlocklyXML).text();
	 pagetitle = PageTitle.toLowerCase();
	 
	 IGRP_BLOCKLY_DROPS.tablesTest = {};
		
		$('rows>content>*[type="table"]', BlocklyXML).each(function(i, element) {
			
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName] = [];
			
			$(element).find('>fields>*').each(function(x, field) {
				
			var	 tag = $(field).prop('tagName');
			
			var type = $(field).attr('java-type') || $(field).attr('type');
			
			var javaType = GetJavaType[type] || type || 'String';
			
				
			fields_table.push([ tag, javaType + '::'+tag]);
			
			IGRP_BLOCKLY_DROPS.tablesTest[element.tagName].push( [ tag, javaType + '::'+tag] );	
			
			})
	
		});
	 
	// ********************************************** GET XML FIELDS  ***************************************
		
		$('rows>content>*', BlocklyXML).each(function(i, element) {
			
			if($(element).attr('type')== 'table')
			{
				var table = $(element).prop('tagName');
				
				tables_model.push([ table, table ]);
				
				addtable++;
				
				console.log("Contador:"+addtable);
				
				if(addtable == 1)
				{
				
				$('#toolbox').append(
						'<category id="table" name="Table" colour="140" class="blocly-dynamic">'
						+'</category>'
						+'<sep class="blocly-dynamic"></sep>'
						);
				}
					
					var getColumnsBlock = function(){
						
						var rtn = '';
						
						var first = true;
						
						IGRP_BLOCKLY_DROPS.tablesTest[table].forEach(function(f, fi){

							rtn+= '<block type="rowtable'+table+'" prev-statement="Linha" next-statement="Linha" color="140">'
							
										+'<value type="value" title="set" name="fields_model">'
											+'<field type="dropdown" name="coluna" options="IGRP_BLOCKLY_DROPS.tablesTest.'+table+'"></field>'
											+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'			
										+'</value><next>';''
	
						});
						
						IGRP_BLOCKLY_DROPS.tablesTest[table].forEach(function(f, fi){
							
							rtn+='</next></block>';
							
						})
						
						
						return rtn;
					}
					
					$('#table').append(
					
								'<block type="listar_'+table+'" id="'+table+'" color="140" mutator="where" prev-statement="" next-statement="" inline="true">'
								+'<value name="value1" type="dummy">'
								+'<field type="dropdown" name="table" title="'+table+'"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
								+'<field type="dropdown" name="find" title="list" options="IGRP_BLOCKLY_DROPS.findList"></field>'
								+'</value>'
								+'<value name="value2" type="statement" check="Linha" >'
								+getColumnsBlock()
								+'</value>'
							+'</block>'
		
							);
					}
			
				
			if($(element).attr('type')== 'separatorlist')
			{
				var separator = $(element).prop('tagName');
				separator_model.push([ separator, separator ]);
				addseparator++;
			}
			
			if($(element).attr('type')== 'formlist')
			{
				var formlist = $(element).prop('tagName');
				formlist_model.push([ formlist, formlist ]);
				addformlist++;
			}
			
			if($(element).attr('type')== 'chart')
			{
				var char = $(element).prop('tagName');
				chart.push([ char, char ]);
				addchart++;
			}
			
	});
	
	$('rows>content>*[type]', BlocklyXML).each(function(i, element) {
		
		$(element).find('>fields>*').each(function(x, field) {
			
		var	 tag = $(field).prop('tagName');
		
		var type = $(field).attr('java-type') || $(field).attr('type');
		
		var key  = $(field).attr('iskey');
		
		var domain = $(field).attr('domain');
		
		var tagg = $(field).attr('tag');
		
		var javaType = GetJavaType[type] || type || 'String';
		
		if(type == "select" && domain !="")
		{
			fields_model.push([ tag, 'SelectDom*'+domain+'::'+tag]);
			addmodel++;
		}
		else
		{
			fields_model.push([ tag, javaType + '::'+tag]);
			addmodel++;
		}
		
		if(tag == "hidden")
		{
			form_id.push([ tagg, tagg ]);
			fields_model.push([ tagg, javaType + '::'+tagg]);
			addmodel++;
		}
		
		if(key == "true")
		{
			key_model.push([ tag, tag]);
			addforeign++;
			
		}
		
		if(type == "select" && domain== "")
		{
			select.push([ tag, tag ]);
			addcombo++;		
		}
		
		})
	});	
	
	$('rows>content>*[type="separatorlist"]', BlocklyXML).each(function(i, element) {
		$(element).find('>fields>*').each(function(x, field) {
			
		var	 tag = $(field).prop('tagName');
		
		var type = $(field).attr('java-type') || $(field).attr('type');
		
		var javaType = GetJavaType[type] || type || 'String';
		
		var domain = $(field).attr('domain');
		
		if(type == "select" && domain !="")
		{
			fields_separator.push([tag, 'SelectDom*'+domain+'::'+tag]);
		}
		else
			fields_separator.push([ tag, javaType + '::'+tag]);
		
		})
	});
	
	$('rows>content>*[type="formlist"]', BlocklyXML).each(function(i, element) {
		$(element).find('>fields>*').each(function(x, field) {
			
		var	 tag = $(field).prop('tagName');
		
		var type = $(field).attr('java-type') || $(field).attr('type');
		
		var javaType = GetJavaType[type] || type || 'String';
		
		var domain = $(field).attr('domain');
		
		if(type == "select" && domain !="")
		{
			fields_formlist.push([tag, 'SelectDom*'+domain+'::'+tag]);
		}
		else
			fields_formlist.push([ tag, javaType + '::'+tag]);
		
		})
	});
	
	if(addmodel !=0)
		{
	
			$('#toolbox').append(
				'<category id="model" name="Model '+PageTitle+'" colour="300" class="blocly-dynamic">'
				
					 +'<block type="model_set" prev-statement="" next-statement="" color="300">'
				 		+'<value name="value1" type="value" title="set model">'
				 			+'<field type="dropdown" name="set_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
				 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/model_icon.svg"></field>'
						+'</value>'
					 +'</block>'
					 
					 +'<block type="model_get" output="" color="300">'
					 	+'<value name="value1" type="dummy" title="get model">'
					 		+'<field type="dropdown" name="get_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
					 		+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/model_icon.svg"></field>'
					 	+'</value>'
					 +'</block>'
					 
					+'<block type="corre_get_param" output="" color="300">' 
						+'<value name="value1" type="dummy"  title="get parameter">'
							+'<field type="field_text" name="param" options=""></field>'
						+'</value>'
					+'</block>'
					
					+'<block type="param_foreign" output="" color="300" class="blocly-dynamic">'
						+'<value name="value1" type="value"  title="get foreign-key">'
						+'</value>'	
					+'</block>'
					
					+'<category id="model" name="Custom Code" colour="300" class="blocly-dynamic">'
					
						 +'<block type="set_custom_line" prev-statement="" next-statement="" color="300">'
					 		+'<value name="value1" type="value" title="custom code">'
					 			+'<field type="field_text" name="param" options=""></field>'
							+'</value>'
						 +'</block>'
						 
						 +'<block type="get_custom_line" output="" color="300">'
						 	+'<value name="value1" type="value" title="custom code">'
						 		+'<field type="field_text" name="param" options=""></field>'
						 	+'</value>'
						 +'</block>'
					 
					 +'</category>'
					 
				 +'</category>'
				 +'<sep class="blocly-dynamic"></sep>'
			  );	
		}
	
	if(addcombo!=0)
	{
	$('#toolbox').append(
		'<category id="combo" name="Combo-box" colour="100" class="blocly-dynamic">'
		+'<block type="fill_combo" color="100" prev-statement="" next-statement="" inline="true">'
			+'<value name="value1" type="dummy" title="fill combo-box">'
				+'<field type="dropdown" name="selecao" options="IGRP_BLOCKLY_DROPS.selecao"></field>'
			+'</value>'
			+'<value name="value2" type="statement">'
				+'<block type="option_combo" color="100" prev-statement="" next-statement="" inline="true">'
					+'<value name="value1" type="dummy" title="option">'
						+'<field type="field_text" name="opcao_val" options="key"></field>'
						+'<field type="field_text" name="opcao_des" options="value"></field>'
					+'</value>'
				+'</block>'
			+'</value>'
		+'</block>'
		
		+'<block type="combo_dao" color="100" mutator="where" prev-statement="" next-statement="" inline="true" >'
		+'<value name="value1" type="dummy">'
			+'<field type="dropdown" name="selecao" title="fill combo-box" options="IGRP_BLOCKLY_DROPS.selecao"></field>'
			+'<field type="dropdown" name="dao" title="with DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
		+'</value>'
		+'<value name="key_val" type="statement" check="Linha">'
			+'<block type="option_dao" prev-statement="Linha" next-statement="Linha" color="100" inline="true">'
				+'<value type="value" title="key" name="key_val">'
				+'</value>'
				+'<value type="value" title="value" name="value_val">'
			+'</value>'
			+'</block>'
		+'</value>'
		+'</block>'	
		
		+'</category>'
		+'<sep class="blocly-dynamic"></sep>'
		);
	}
		
	var str='';
	$('item[rel]', BlocklyXML).each(function(i, element) {
		var button = $(element).attr('rel');
		var page_target = $(element).find('>page').text();
		
		buttons_model.push([ button, button ]);
		
		all_buttons.push(button);
		
		addbutton++;
		addmodel++;
		
	});
	
	all_buttons.forEach(function(button) {
		str += '<value name="'+button+'1" type="dummy" title="action '+button+'" class="blocly-dynamic"></value>'
	 			+'<value name="'+button+'" type="statement" class="blocly-dynamic"></value>';
		});
	$('#controller').append(str);
	$('#controller').append('<value name="custom1" type="dummy" title="custom action" class="blocly-dynamic"></value>'
 			+'<value name="custom_actions" type="statement" class="blocly-dynamic"></value>');
	
	
// *******************************************GET DAO OBJECTS **********************************************/
	var iurlArr = path.split('/');
	var iurl   = iurlArr[0] == '' ? iurlArr[1] : 'IGRP';
	
	$.ajax({url : '/'+iurl+'/app/webapps?r=igrp_studio/Env/Retornarxml&app_name='+AppTitle, headers : {'x-igrp-remote' : 1},
	method : 'GET',
	dataType : 'xml',
	
	success : function(data) {
		
		//console.log(data)
		
		var temdao = '';
		
			temdao = $(data).find('dao>').text();
		
		if(temdao != '')
		{
			
			$('#toolbox').append(
					'<category id="dao" name="DAO" colour="160" class="blocly-dynamic">'
							+'<block type="inserir_dao" mutator="separatori" color ="160" prev-statement="" next-statement="" inline="true">'
								+'<value type="dummy" title="save DAO">'
									+'<field type="dropdown" name="dao" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
									+'<field type="field_text" name="param_id" title="or update by parameter:" options=""></field>'
								+'</value>'
								+'<value name="value2" type="statement"></value>'
						+'</block>'
						
						+'<block type="index_editar" color ="160" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy" >'
								+'<field type="dropdown" name="dao" title="fill model with DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
								+'<field type="field_text" name="param_id" title="by parameter:" options=""></field>'
							+'</value>'
							+'<value name="value2" type="statement"></value>' 
						+'</block>'
						
//						+'<block type="instance_dao" color ="160" prev-statement="" next-statement="">'
//							+'<value name="findone" type="value" >'
//								+'<field type="dropdown" name="dao" title="declarate obj in DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
//								+'<field type="text" options="or find by:"></field>'
//							+'</value>'
//						+'</block>'
//					
						+'<block type="dao_obj" color ="160" output="" title="obj"></block>'
						
					+'</category><sep class="blocly-dynamic"></sep>');
				
				if(addforeign!=0)
				{
				$('#toolbox').append(
					'<category id="foreign" name="Primary-Key" colour="60" class="blocly-dynamic">'
						
					+'<block type="enviar_p" color ="60" prev-statement="" next-statement="">'
						+'<value name="PARAM" type="dummy">'
							+'<field type="dropdown" name="iskey" title="send primary-key" options="IGRP_BLOCKLY_DROPS.keys"></field>'
						+'</value>'
					+'</block>'	
					
					+'<block type="editar_dao" color ="60" title="send parameter isEdit" prev-statement="" next-statement=""></block>'
					
					+'<block type="apagar" color="60" prev-statement="" next-statement="" inline="true">'
					+'<value name="valor1" type="value">'
						+'<field type="dropdown" name="dao" title="delete in DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
						+'<field type="dropdown" name="iskey" title="where param" options="IGRP_BLOCKLY_DROPS.keys"></field>'
						+'<field type="text" options="="></field>'
					+'</value>'
					+'</block>'
					+'</category>'
					+'<sep class="blocly-dynamic"></sep>'
					);
				}
				
				if(addchart!=0)
				{
				$('#toolbox').append('<category id="dashboard" name="Dashboard" colour="120" class="blocly-dynamic">'
						+'<category id="chart" name="Chart" colour="150">'
						+'<block type="grafico" color ="120" prev-statement="" next-statement="" >'
							+'<value name="value1" type="dummy" title="fill chart">'
								+'<field type="dropdown" name="grafico" options="IGRP_BLOCKLY_DROPS.chart_model"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="eixoX"  title="Eixo X" type="value"></value>'
							+'<value name="eixoY"  title="Eixo Y" type="value"></value>' 
						+'</block>'
						+'</category>'
						+'</category>'
						+'<sep class="blocly-dynamic"></sep>'
						);
				}
				
				if(addbutton!=0)
				{
				$('#model').append(	
						'<block type="rediret_p" color="300" prev-statement="" next-statement="" inline="true" class="blocly-dynamic">'
							+'<value name="value1" type="dummy" >'
							+'<field type="field_text" name="param" title="add parameter" options=""></field>'
							+'<field type="dropdown" name="button"  title=" in button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
							+'</value>'
						+'</block>'
				
						+'<block type="add_isedit" prev-statement="" next-statement="" color="300" class="blocly-dynamic">'
							+'<value name="value3" type="dummy">'
							+'<field type="dropdown" name="button" title="add parameter isEdit in button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
							+'</value>'
						+'</block>'
							
						);
				}
				
				if(addseparator!=0)
				{
				$('#toolbox').append(	
					'<category id="separator" name="Separator-List" colour="80" class="blocly-dynamic">'
						+'<block type="separator" mutator="where" color="80"  prev-statement="" next-statement="" inline="true">'
							+'<value name="id_separator" type="value">'
							+'<field type="dropdown" name="table" title="list" options="IGRP_BLOCKLY_DROPS.separators"></field>'
							+'<field type="dropdown" name="dao_sep" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'<field type="text" options="set Id separator"></field>'
							+'</value>'
							+'<value name="value2" type="statement" >'
								+'<block type="sep_row" prev-statement="" next-statement="" color="80">'
									+'<value type="value" title="set" name="fields_model">'
										+'<field type="dropdown" name="coluna" options="IGRP_BLOCKLY_DROPS.fields_SEP"></field>'
										+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
									+'</value>'
								+'</block>'
							+'</value>'
						+'</block>'
						+'<block type="save_separator" color="80"  prev-statement="" next-statement="" inline="true">'
							+'<value type="dummy">'
							+'<field type="dropdown" name="table" title=" save" options="IGRP_BLOCKLY_DROPS.separators"></field>'
							+'<field type="dropdown" name="dao_sep" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement" >'
							+'</value>'
							+'<value name="delete" title="delete row by" type="value" >'
							+'</value>'
						+'</block>'
						
						+'<block type="get_row_sep" output="" color="300">'
							+'<value type="dummy" title="get row separator" name="fields_model">'
								+'<field type="dropdown" name="get_row_sep" options="IGRP_BLOCKLY_DROPS.fields_SEP"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
							+'</value>'
						+'</block>'
					+'</category>'
					+'<sep class="blocly-dynamic"></sep>'
						);
				}
				
				if(addformlist!=0)
				{
				$('#toolbox').append(	
					'<category id="formlist" name="Form-List" colour="200" class="blocly-dynamic">'
						+'<block type="formlist" mutator="where" color="200"  prev-statement="" next-statement="" inline="true">'
							+'<value name="id_formlist" type="value">'
							+'<field type="dropdown" name="table" title="list" options="IGRP_BLOCKLY_DROPS.formlists"></field>'
							+'<field type="dropdown" name="dao_form" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'<field type="text" options="set Id formlist"></field>'
							+'</value>'
							+'<value name="value2" type="statement" >'
								+'<block type="sep_form" prev-statement="" next-statement="" color="200">'
									+'<value type="value" title="set" name="fields_model">'
										+'<field type="dropdown" name="coluna" options="IGRP_BLOCKLY_DROPS.fields_FORM"></field>'
										+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
									+'</value>'
								+'</block>'
							+'</value>'
						+'</block>'
						+'<block type="save_formlist" color="200"  prev-statement="" next-statement="" inline="true">'
							+'<value type="dummy">'
							+'<field type="dropdown" name="table" title=" save" options="IGRP_BLOCKLY_DROPS.formlists"></field>'
							+'<field type="dropdown" name="dao_sep" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'	
							+'</value>'
							+'<value name="value2" type="statement" >'
							+'</value>'
							+'<value name="delete" title="delete row by" type="value" >'
							+'</value>'
						+'</block>'
						
						+'<block type="get_row_form" output="" color="300">'
							+'<value type="dummy" title="get row formlist" name="fields_model">'
								+'<field type="dropdown" name="get_row_sep" options="IGRP_BLOCKLY_DROPS.fields_FORM"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
							+'</value>'
						+'</block>'
					+'</category>'
					+'<sep class="blocly-dynamic"></sep>'
						);
				}
				
				if(addcombo!=0)
				{
				$('#combo').append(
					
					);
				}
				
				if(addtable!=0)
				{
			
				}
	}
		
		$(data).find('dao>*').each(function(i, f) {
			
			var daos = $(f).prop('tagName');
			
			daoClasses[daos] = true;
			
			daos_list.push([ daos, daos ]);
			bloc_fields.push(daos);
									
			$('#dao').append('<category id="'+daos+'" name="'+daos+'" colour="150"></category>\n');
			
		});
		
		bloc_fields.forEach(function(daos) { 
			var fieldy_list = [];
			var FIELDY_MEANS = {};
			var FIELDY_MEANS_GET = {};
			var FIELDY_MEANS_STR = {};
			fieldy_list.push(['--','--' ]);
			
			IGRP_BLOCKLY_DROPS.daos[daos] = fieldy_list
			
			$(data).find('dao>' + daos+ '>*').each(function(i, f) {

				var field = $('nome',f).text(),
					
					type = $('tipo',f).text();
					
				fieldy_list.push([field,type+'::'+field ]);
				
				var Upfieldy = field.charAt(0).toUpperCase()+ field.slice(1).toLowerCase();
				FIELDY_MEANS[field] = 'set'+Upfieldy;
				FIELDY_MEANS_GET[field] = '.get'+Upfieldy+'()';
				FIELDY_MEANS_STR[field] = '"'+field+'"';
			})
			
			Blockly.Java['set'+daos] = function(block) {
				var fieldy_mean = FIELDY_MEANS[block.getFieldValue('FIELDY_LIST')];
				var statements_script = Blockly.Java.statementToCode(block,'SCRIPT'),
				code = '';
					try{
						statements_script = JSON.parse(statements_script);
						var statements_script_insert = statements_script.insert || '';
						  var statements_script_code = statements_script.code || '';
						  code = ''+statements_script_code+''
						  +'obj.'+fieldy_mean +'('+ statements_script_insert+');\n'; 	  
					}catch(e){
						code = 'obj.'+fieldy_mean +'('+ statements_script+');\n';
					}
				return code;
			};
			
			Blockly.Java['get'+daos] = function(block) {
				var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
				var fieldys_mean = FIELDY_MEANS_GET[block.getFieldValue('FIELDY_LIST')];
				
				var importy_dao= 'import nosi.webapps.'+AppTitle+'.dao.'+daos+';\n';
				
				if (importss_list.indexOf(importy_dao) === -1 )
				{
				importss_list = importss_list.concat(importy_dao);
				}
			
				return fieldys_mean;
	
			};
			
			Blockly.Java['str'+daos] = function(block) {
				var fieldy_str = FIELDY_MEANS_STR[block.getFieldValue('FIELDY_STR')];
				
				return fieldy_str;
			};

			
			$('#'+daos+'').append(
				'<block type="set-dao-'+daos+'" igrp="tete" color="160"  prev-statement="" next-statement="" class="blocly-dynamic">'
					+'<value name="value1" type="value" title="set '+daos+'">'
						+'<field type="dropdown" name="fields" options="IGRP_BLOCKLY_DROPS.daos.'+daos+'"></field>'
						+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
					+'</value>'
				+'</block>\n');
			
			$('#'+daos+'').append(
					'<block type="get-dao-'+daos+'" color="160" output="" class="blocly-dynamic">'
					+'</block>'
					);
	});
	
	 IGRP_BLOCKLY_DROPS = $.extend(IGRP_BLOCKLY_DROPS,{
			
			comparison : COMPARISON,
			
			core_msg : CORE_MSG,
			
			core_conv : CORE_CONV,
			
			core_if : CORE_IF,
			
			find : FIND,
			
			tipo : TIPO,
			
			where : WHERE,
			
			and_or : ANDOR,
			
			true_false : TRU_FAL,
			
			dao_list : daos_list,
			
			buttons : buttons_model,
			
			fields : fields_model,
			
			tables : tables_model,
			
			separators : separator_model,
			
			formlists : formlist_model,
			
			esp_rows : fields_esp_row,
			
			selecao : select,
			
			ID_MODEL : form_id,
			
			findList : FINDLIST,
			
			keys : key_model,
			
			fields_TABLE : fields_table,
			
			fields_SEP : fields_separator,
			
			fields_FORM : fields_formlist,
			
			chart_model : chart
					
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
	
}

var codeBlockStart = '/* Start-Code-Block (',

	codeBlockEnd   = '/* End-Code-Block */';

function GetBlocklyImports(){
	
	try{
		
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace),
		
			//if( type.indexOf('listar_') == 0 )
		
			listarImports = $('block[type*="listar_"]',xml),	
			
			inserirImports = $('block[type="inserir_dao"]',xml),
			
			fillComboImports = $('block[type="fill_combo"]',xml),
			
			separatorImports = $('block[type="separator"]',xml),
			
			formlistImports = $('block[type="formlist"]',xml),
			
			saveseparatorImports = $('block[type="save_separator"]',xml),
			
			saveformlistImports = $('block[type="save_formlist"]',xml),
			
			graficoImports = $('block[type="grafico"]',xml),
			
			combodaoImports = $('block[type="combo_dao"]',xml),
			
			daosImports   = $('block[type*="set-dao-"], block[type*="get-dao-"]',xml),
			
			fieldDaos     = $('field[name="dao"]', xml),
			
			Fields 		  = $('field', xml),
			
			fieldsImportsMap = {
				'Date' : true,
				//'Select' : true,
				'File' : true,
				'Link' : true
			}
			
			rtn = '';
		
		if(listarImports[0])
			
			rtn+='<import type="listar">Listar</import>';
		
		if(fillComboImports[0])
			
			rtn+='<import type="fill_combo">Select</import>';
		
		if(separatorImports[0])
			
			rtn+='<import type="separator">Separator</import>';

		if(formlistImports[0])
			
			rtn+='<import type="formlist">Formlist</import>';
		
		if(saveseparatorImports[0])
			
			rtn+='<import type="save_separator">saveSeparator</import>';
		
		if(saveformlistImports[0])
			
			rtn+='<import type="save_formlist">saveFormlist</import>';
		
		if(graficoImports[0])
			
			rtn+='<import type="grafico">Graficos</import>';
		
		if(inserirImports[0])
			
			rtn+='<import type="inserir_dao">Inserir Daos</import>';
		
		if(combodaoImports[0])
			
			rtn+='<import type="combo_dao">Combo Dao</import>';
				
		if(daosImports[0] || fieldDaos[0]){
			
			var incs = {};
			
			daosImports.each(function(i, dao){
				
				var daoClass = $.trim($(dao).attr('type').split('et-dao-').pop());
				
				if(!incs[daoClass])
					
					incs[daoClass] = true;

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

		var fieldsInc = {};
		
		Fields.each(function(i,f){
			
			var text = $(f).text();
			
			if(text.indexOf('::') >=0 ){
				
				var strSplit = text.split('::'),
				
					type     = strSplit[0],
					
					val 	 = strSplit[1];
				
				if(fieldsImportsMap[type] && !fieldsInc[type]){
					
					fieldsInc[type] = true;
					
				}
				
				if(daoClasses[type]){
					
					fieldsInc[type] = 'dao';
					
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
	
	var pageBlockly = null;
	
	GEN.on('ready', function(){
		
		IGRPBlocklyInit();
		
		$('#igrp-form-gen').on('blockly-ready', function(){
			
			if(pageBlockly){
				
				setTimeout(function(){
					
					Blockly.mainWorkspace.clear();
					
					Blockly.Xml.domToWorkspace(pageBlockly, Blockly.mainWorkspace);
					
				},400)		
				
			}
	
		})
		
	});
	
	$('li[rel="gen-blocky"]').on('click',function() {
		
		$('.blocly-dynamic').remove();
		
		IGRPBlocklyInit();
		
		$('#tab_blocks').click();
		
		setTimeout(function(){
			
			$('#refresh_bloco').click();
			
		}, 400)

	})
	
	$('#igrp-form-gen').on('on-export', function(e, data){
		
		data.blocklyData = GetDefaultBlocklyXML();
		
	})
	
	$('#igrp-form-gen').on('on-import', function(e, data){
		
		if( data.blocklyData ){
			var xml = Blockly.Xml.textToDom( data.blocklyData );
			pageBlockly = xml;
		}
			
	})
	
})
