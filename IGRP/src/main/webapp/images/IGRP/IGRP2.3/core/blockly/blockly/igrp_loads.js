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

var FIND = [["--", "--"],["todos", "todos"],["um", "um"]];

var FINDLIST = [["--", "--"],["todos", "TODOSS"],["um", "UMM"]];

var TIPO = [["Inteiro", "Inteiro"],["Data", "Data"],["Texto", "Texto"]];

var WHERE = [["=", "WHERE_EQ"],["!=", "WHERE_DIF"],["<", "WHERE_LT"],[">", "WHERE_GT"],["like", "WHERE_LIKE"]];

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
var chart = [];
var tables_model = [];
var separator_model = [];
var str = '';
var buttons_model = [], all_buttons = [];
var daos_list = [], bloc_fields = [];
var imports_insert = [];
var imports_list = [];
var fields_esp_row = [];
var custom_action = [];
var select = [];

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
	
	date : 'Date',
	
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
		console.log(Storage)
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
		Blockly.Xml.domToWorkspace(Blockly.mainWorkspace, xml);
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
	 tables_model = []; 
	 separator_model = []; 
	 tables_model.push(['--','--']);
	 separator_model.push(['--','--']);
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
	
	var BlocklyXML = $.parseXML(VARS.getGen().getXML());
	
	 AppTitle = $('rows>app', BlocklyXML).text();
	 PageTitle = $('rows>page', BlocklyXML).text();
	 pagetitle = PageTitle.toLowerCase();
	 
	// ********************************************** GET XML FIELDS  ***************************************
		$('rows>content>*', BlocklyXML).each(function(i, element) {
			
			if($(element).attr('type')== 'table')
				{
					var table = $(element).prop('tagName');
					tables_model.push([ table, table ]);
				}
			
				
			if($(element).attr('type')== 'separatorlist')
			{
				var separator = $(element).prop('tagName');
				separator_model.push([ separator, separator ]);
			}
			
			if($(element).attr('type')== 'chart')
			{
				var char = $(element).prop('tagName');
				chart.push([ char, char ]);
			}
			
			});
	
	$('rows>content>*[type]', BlocklyXML).each(function(i, element) {
		
		$(element).find('>fields>*').each(function(x, field) {
			
		var	 tag = $(field).prop('tagName');
		
		var type = $(field).attr('type');
		
		var key  = $(field).attr('iskey');
		
		var javaType = GetJavaType[type] || type || 'String';
		
		if(tag == "hidden")
		{
			var tagg = $(field).attr('tag');
			form_id.push([ tagg, tagg ]);
			fields_model.push([ tagg, javaType + '::'+tagg]);
		}
		else
		{
			fields_model.push([ tag, javaType + '::'+tag]);
		}
		
		if(key == "true")
		{
			key_model.push([ tag, tag]);
			
		}
		
		if(type == "select")
		{
			select.push([ tag, tag ]);
		}
		
		
		
		})
	});
	
	$('rows>content>*[type="table"]', BlocklyXML).each(function(i, element) {
		$(element).find('>fields>*').each(function(x, field) {
			
		var	 tag = $(field).prop('tagName');
		
		var type = $(field).attr('type');
		
		var javaType = GetJavaType[type] || type || 'String';
		
		fields_table.push([ tag, javaType + '::'+tag]);
		
		})
	});
	
	$('rows>content>*[type="separatorlist"]', BlocklyXML).each(function(i, element) {
		$(element).find('>fields>*').each(function(x, field) {
			
		var	 tag = $(field).prop('tagName');
		
		var type = $(field).attr('type');
		
		var javaType = GetJavaType[type] || type || 'String';
		
		fields_separator.push([ tag, javaType + '::'+tag]);
		
		})
	});
	
	$('#toolbox').append(
		'<category id="model" name="'+PageTitle+' model" colour="300">'
		
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
			 
		 +'</category>'
		 +'<sep></sep>'
	  );
		
// ********************************************** GET XML BUTTONS FORM ***************************************
	var str='';
	$('item[rel]', BlocklyXML).each(function(i, element) {
		var button = $(element).attr('rel');
		var page_target = $(element).find('>page').text();
		
		buttons_model.push([ button, button ]);
		
		all_buttons.push(button);
		
	});
	
	all_buttons.forEach(function(button) {
		str += '<value name="'+button+'1" type="dummy" title="action button '+button+'" ></value>'
	 			+'<value name="'+button+'" type="statement"></value>';
		});
	$('#controller').append(str);
	$('#controller').append('<value name="custom1" type="dummy" title="custom action" ></value>'
 			+'<value name="custom_actions" type="statement"></value>');
	
	
	// ********************************************* END XML LOAD ***********************************************
	
// *******************************************GET DAO OBJECTS **********************************************/
	var iurlArr = path.split('/');
	var iurl   = iurlArr[0] == '' ? iurlArr[1] : 'IGRP';
	
	$.ajax({url : '/'+iurl+'/app/webapps?r=igrp_studio/Env/Retornarxml&app_name='+AppTitle, headers : {'x-igrp-remote' : 1},
	method : 'GET',
	dataType : 'xml',
	
	success : function(data) {
		
		console.log(data)
		
		var temdao = '';
		
			temdao = $(data).find('dao>').text();
		
		if(temdao != '')
		{
			
			$('#toolbox').append('<category id="dao" name="DAO" colour="150"></category>');
			
			$('#toolbox').append(
					'<category id="insert" name="Insert" colour="150">'
					
						+'<block type="inserir_dao" color ="60" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy" title="insert DAO">'
								+'<field type="dropdown" name="dao" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement"></value>'  
						+'</block>'
						+'<category id="combo" name="Combo-box" colour="150">'
						+'<block type="fill_combo" color="60" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy" title="fill combo-box">'
								+'<field type="dropdown" name="selecao" options="IGRP_BLOCKLY_DROPS.selecao"></field>'
							+'</value>'
							+'<value name="value2" type="statement">'
							
								+'<block type="option_combo" color="60" prev-statement="" next-statement="" inline="true">'
									+'<value name="value1" type="dummy" title="option">'
										+'<field type="field_text" name="opcao_val" options="key"></field>'
										+'<field type="field_text" name="opcao_des" options="value"></field>'
									+'</value>'
								+'</block>'
					
							+'</value>'
						+'</block>'
						+'</category>'
						+'<block type="enviar_p" color ="60" prev-statement="" next-statement="">'
							+'<value name="PARAM" type="dummy">'
								+'<field type="dropdown" name="iskey" title="send param" options="IGRP_BLOCKLY_DROPS.keys"></field>'
							+'</value>'
						+'</block>'	
						+'<category id="foreign" name="Foreign-Key" colour="150">'
						+'<block type="rediret_p" color="60" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy" >'
								+'<field type="field_text" name="param" title="rediret foreign key" options=""></field>'
								+'<field type="dropdown" name="button"  title="to" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
							+'</value>'
						+'</block>'
						
						+'<block type="core_get_param" output="" color="60">'
							+'<value name="value1" type="dummy"  title="insert foreign key">'
							+'</value>'	
						+'</block>'
						+'</category>'
						+'<category id="separator" name="Separator-List" colour="150">'
						+'<block type="separator" color="60"  prev-statement="" next-statement="" inline="true">'
						+'<value name="value1" type="dummy">'
							+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'	
							+'<field type="dropdown" name="id_model" title="Id form" options="IGRP_BLOCKLY_DROPS.ID_MODEL"></field>'	
							+'<field type="dropdown" name="table" title="separator" options="IGRP_BLOCKLY_DROPS.separators"></field>'
						+'</value>'
						+'<value name="set_model" type="statement" >'
						 +'<block type="model_set" prev-statement="" next-statement="" color="300">'
					 		+'<value name="value1" type="value" title="set model">'
					 			+'<field type="dropdown" name="set_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
					 			+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/model_icon.svg"></field>'
							+'</value>'
						 +'</block>'
						+'</value>'	
						+'<value name="where1" type="value">'
						+'<field type="dropdown" name="dao_sep" title="DAO separator" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
						+'<field type="text" options="where"></field>'
						+'</value>'
						+'<value name="where2" type="value">'
						+'<field type="dropdown" name="where_signal" options="IGRP_BLOCKLY_DROPS.where"></field>'
						+'</value>'
						+'<value name="id_separator" type="value"  title="Id separator"></value>'
						+'<value name="value2" type="statement" >'
							+'<block type="sep_row" prev-statement="" next-statement="" color="130">'
							+'<value type="value" title="set" name="fields_model">'
								+'<field type="dropdown" name="coluna" options="IGRP_BLOCKLY_DROPS.fields_SEP"></field>'
								+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
							+'</value>'
						+'</block>'
						+'</value>'
						+'<value name="value3" type="dummy">'
						+'<field type="dropdown" name="button" title="rediret to insert button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
						+'</value>'  
						+'</block>'
						+'<block type="save_separator" color="60"  prev-statement="" next-statement="" inline="true">'
						+'<value name="value1" type="dummy">'
							+'<field type="dropdown" name="dao" title="save DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'	
							+'<field type="dropdown" name="id_model" title="Id form" options="IGRP_BLOCKLY_DROPS.ID_MODEL"></field>'	
							+'<field type="dropdown" name="table" title="separator" options="IGRP_BLOCKLY_DROPS.separators"></field>'
							
						+'</value>'
						+'<value name="insert_dao" type="statement" >'
						+'</value>'
						+'<value name="id_dad" type="value">'
						+'<field type="dropdown" name="dao_sep" title="save DAO separator" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
						+'<field type="text" options="get id"></field>'	
						+'</value>'
						+'<value name="value2" type="statement" >'
						+'</value>'
						+'<value name="delete" title="deleted by" type="value" >'
						+'</value>'
						+'</block>'
						+'<block type="get_row_sep" output="" color="300">'
						+'<value type="dummy" title="get row separator" name="fields_model">'
							+'<field type="dropdown" name="get_row_sep" options="IGRP_BLOCKLY_DROPS.fields_SEP"></field>'
							+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
						+'</value>'
						+'</category>'	
						+'<category id="chart" name="Chart" colour="150">'
						+'<block type="grafico" color ="60" prev-statement="" next-statement="" >'
							+'<value name="value1" type="dummy" title="fill chart">'
								+'<field type="dropdown" name="grafico" options="IGRP_BLOCKLY_DROPS.chart_model"></field>'
								+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="eixoX"  title="Eixo X" type="value"></value>'
							+'<value name="eixoY"  title="Eixo Y" type="value"></value>' 
						+'</block>'
						+'</category>'
					+'</category>'
					
					+'<category id="update" name="Update" colour="150">'
					
						+'<block type="index_editar" color ="40" prev-statement="" next-statement="" inline="true">'
							+'<value name="value1" type="dummy" >'
								+'<field type="dropdown" name="dao" title="update DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
							+'</value>'
							+'<value name="value2" type="statement"></value>' 
							+'<value name="value3" type="dummy">'
								+'<field type="dropdown" name="button" title="rediret to insert button" options="IGRP_BLOCKLY_DROPS.buttons"></field>'
							+'</value>'  
						+'</block>'
						
						+'<block type="editar_dao" color ="40" prev-statement="" next-statement="">'
							+'<value name="PARAM" type="dummy">'
								+'<field type="dropdown" name="iskey" title="update by param" options="IGRP_BLOCKLY_DROPS.keys"></field>'
							+'</value>'
						+'</block>'	
						
					+'</category>'
					
					+'<category id="list" name="List" colour="150">'
					
					+'<block type="listar" color="130" mutator="where" prev-statement="" next-statement="" inline="true">'
						+'<value name="value1" type="dummy">'
						+'<field type="dropdown" name="table" title="table" options="IGRP_BLOCKLY_DROPS.tables" igrp-on-change="IGRP_BLOCKLY_ELEMENTS.listar.onTableSet(item)"></field>'
						+'<field type="dropdown" name="dao" title="DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'	
						+'<field type="dropdown" name="find" title="list" options="IGRP_BLOCKLY_DROPS.findList"></field>'
						+'</value>'
						+'<value name="value2" type="statement" check="Linha" >'
							+'<block type="row" prev-statement="Linha" next-statement="Linha" color="130">'
								+'<value type="value" title="set" name="fields_model">'
									+'<field type="dropdown" name="coluna" options="IGRP_BLOCKLY_DROPS.fields_TABLE"></field>'
									+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/row_icon.svg"></field>'
									
									+'<block type="GET_DAO_LIST" output="" color="160">'
										+'<value type="dummy" title="get DAO" name="fields_model">'
											+'<field type="dropdown" name="coluna" options="IGRP_BLOCKLY_DROPS.fields_TABLE"></field>'
											+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
										+'</value>'
									+'</block>'
								
								+'</value>'
							+'</block>'
						+'</value>'
					+'</block>'
					
					+'</category>'
					
					+'<category id="delete" name="Delete" colour="150">'
					
						+'<block type="apagar" color="100" prev-statement="" next-statement="" inline="true">'
							+'<value name="valor1" type="value">'
								+'<field type="dropdown" name="dao" title="delete in DAO" options="IGRP_BLOCKLY_DROPS.dao_list"></field>'
								+'<field type="dropdown" name="iskey" title="by param" options="IGRP_BLOCKLY_DROPS.keys"></field>'
							+'</value>'
						+'</block>'
					
					+'</category>'
					
					+'<sep></sep>');
			
			$('#core').append();
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
				'<block type="set-dao-'+daos+'" igrp="tete" color="160"  prev-statement="" next-statement="">'
					+'<value name="value1" type="value" title="set'+daos+'">'
						+'<field type="dropdown" name="fields" options="IGRP_BLOCKLY_DROPS.daos.'+daos+'"></field>'
						+'<field type="image" name="img" src="'+path+'/core/blockly/blockly/media/dao.svg"></field>'
					+'</value>'
				+'</block>\n');
			
			$('#'+daos+'').append(
					'<block type="get-dao-'+daos+'" color="160" output="">'
					 /*+'<value name="value1" type="value" title="get'+daos+'">'
						+'<field type="dropdown" name="fields" options="IGRP_BLOCKLY_DROPS.daos.'+daos+'"></field>'
						+'<field type="image" name="img" src="https://image.flaticon.com/icons/svg/149/149206.svg"></field>'
						+'</value>'*/
					+'</block>\n');
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
			
			esp_rows : fields_esp_row,
			
			selecao : select,
			
			ID_MODEL : form_id,
			
			findList : FINDLIST,
			
			keys : key_model,
			
			fields_TABLE : fields_table,
			
			fields_SEP : fields_separator,
			
			chart_model : chart
					
		});

		if (!blockyInit) {
			
			Code.init();
			
			blockyInit=true;

			var demoWorkspace = Blockly.mainWorkspace;

			Blockly.Xml.domToWorkspace( $('#inicial_script')[0] ,demoWorkspace);
			
			$('#igrp-form-gen').trigger('blockly-ready');
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
		
			listarImports = $('block[type="listar"]',xml),
			
			fillComboImports = $('block[type="fill_combo"]',xml),
			
			separatorImports = $('block[type="separator"]',xml),
			
			saveseparatorImports = $('block[type="save_separator"]',xml),
			
			graficoImports = $('block[type="grafico"]',xml),
			
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
		
		if(saveseparatorImports[0])
			
			rtn+='<import type="save_separator">saveSeparator</import>';
		
		if(graficoImports[0])
			
			rtn+='<import type="grafico">Grafico</import>';
				
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
					
					Blockly.Xml.domToWorkspace(Blockly.mainWorkspace, pageBlockly );
					
				},400)		
				
			}
	
		})
		
	});
	
	$('li[rel="gen-blocky"]').on('click',function() {
		
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
