/**
 * @fileoverview Generating Java for math blocks.
 * @author rodfelfer@hotmail.com (Rodney Fernandes)
 */
'use strict';

goog.provide('Blockly.Java.selenium');

goog.require('Blockly.Java');

var blockyInit = false;

var calcHeight = function() {

	$('#gen-blocky-view').height(function() {

		return $(window).height() - 59 - 37

	});

}

var COMPARISON = [["==", "=="],["!=", "!="],[">=", ">="], ["<=", "<="],[">=", ">="], [">", ">"], ["<", "<"]];

var COMPAR= {'==': '==','!=': '!=','>=': '>=','<=': '<=','>': '>','<': '<',};

var CORER = [["Converter para inteiro", "Converter para inteiro"],["Mensagem de sucesso", "Mensagem de sucesso"],["Mensagem de erro", "Mensagem de erro"],["Verificar se está nulo", "Verificar se está nulo"],
			["Converter texto para data", "Converter texto para data"],["Converter para texto", "Converter para texto"]];

var CORE= {'Mensagem de sucesso': 'Core.setMessageSucess','Mensagem de erro': 'Core.setMessageError','Converter para inteiro': 'Core.toInt','Verificar se está nulo': 'Core.isNull',
		'Converter texto para data': 'Core.ToDate', 'Converter para texto': '""+'	};

var FIND = [["todos", "todos"],["um", "um"]];

var FIN= {'todos': 'all()','um': 'one()'};

var TIPO = [["Inteiro", "Inteiro"],["Data", "Data"],["Texto", "Texto"]];

var TIP= {'Inteiro': 'Integer','Data': 'Date','Texto': 'String'};

var WHERE = [["=", "="],["!=", "!="]];

var WHER= {'=': ',"=",','!=': ',"<>",'};

var ANDOR = [["and", "and"],["or", "or"]];

var ANDO= {'and': '&&','or': '||'};

var TRU_FAL = [["true", "true"],["false", "false"]];

var TRU_FA= {'true': 'true','false': 'false'};



Blockly.Java['core_set'] = function(block) {
	var core = CORE[block.getFieldValue('CORER')];
	var state = Blockly.Java.statementToCode(block, 'STATE');
	var code = core + '(' + state + ');\n';
	return code;
};

Blockly.Java['core_din'] = function(block) {
	var core = CORE[block.getFieldValue('COR')];
	var state = Blockly.Java.statementToCode(block, 'STATE');
	var code = core + '(' + state + ')';
	return code;
};

Blockly.Java['tru_fa'] = function(block) {
	var tr_fa = TRU_FA[block.getFieldValue('TRU_FAL')];
	return tr_fa;
};

Blockly.Java['and_or'] = function(block) {
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	var and_or = ANDO[block.getFieldValue('ANDOR')];
	var statements_script2 = Blockly.Java.statementToCode(block, 'SCRIPT2');
	var code = statements_script + and_or+ statements_script2;
	return code;
};



Blockly.Java['esp_model'] = function(block) {
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	var esp_model = FIELDS_ESP_MEANS[block.getFieldValue('FIELDS_ESP_MODEL')];
	  return JSON.stringify(esp_model);
};

Blockly.Java['model_set'] = function(block) {
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	var set_model = FIELDS_SET_MEANS[block.getFieldValue('FIELDS_SET_MODEL')];
	var code = 'model.'+set_model+'('+statements_script+');';
	return code;
};

Blockly.Java['model_get'] = function(block) {
	var fields_mean = FIELDS_MEANS[block.getFieldValue('FIELDS_MODEL')];
	return 'model.'+fields_mean;
};

Blockly.Java['row'] = function(block) {
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	var set_model = FIELDS_SET_MEANS[block.getFieldValue('FIELDS_SET_MODEL')];
	var code = 'row.'+set_model+'(obj'+statements_script+');\n';
	return code;
};

Blockly.Java['esp_row'] = function(block) {
	var set_row= '';
		set_row = FIELDS_ROW_MEANS[block.getFieldValue('FIELDS_ESP_ROW')];
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	
	 var importiss = 'import nosi.webapps.igrp.dao.CLob;\n';
	 
	 if(set_row != undefined)
	{
	 
	 if (set_row.indexOf("download&file_id=") != -1)
		{
		 if (importss_list.indexOf(importiss) == -1)
			{
		importss_list = importss_list.concat(importiss);
		}
		}
	}
	var code = set_row +statements_script+');\n';
	return code;
};

Blockly.Java['action_button'] = function(block) {
	var statements_script = Blockly.Java.statementToCode(block,'SCRIPT');
	var but_mean = buttons_MEANS[block.getFieldValue('BUTTONS_MODEL')];
	var targ_mean = target_MEANS[block.getFieldValue('BUTTONS_MODEL')];
	var Upbut = but_mean.charAt(0).toUpperCase()+ but_mean.slice(1).toLowerCase();
	var code = 'public Response action'+ Upbut+ '() throws IOException, IllegalArgumentException, IllegalAccessException{\n'
			+ ''+ PageTitle+ ' model = new '+ PageTitle+ '();\n'
			+ 'model.load();\n'
			+ '/*----#start-code('+but_mean+')----*/\n'
			+ '\n'
			+ statements_script
			+ '/*----#end-code----*/\n'
			+ 'return this.redirect("'+ AppTitle+ '","'+ targ_mean+ '","index", this.queryString());\n'
			+ '}\n';
	return code;
};

Blockly.Java['inserir_dao'] = function(block) {
	var dao_mean = DAOS_MEANS[block.getFieldValue('DAO')];
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	var code =
		'try {\n' 
		+dao_mean+ ' obj = new ' + dao_mean+ '();\n'
		+statements_script
		+'if(obj != null){\n'
		+'obj.insert();\n'
		+'Core.setMessageSuccess();\n'
		+'}else{\n'
		+'Core.setMessageError();\n'
		+'}\n'	
		+ '} catch (Exception e) {\n'
		+ 'e.printStackTrace();\n'
		+ 'Core.setMessageError();\n' 
		+ '}\n';
	return code;
};

var importss_list= '';

Blockly.Java['listar'] = function(block) {
	var dao_mean = DAOS_MEANS[block.getFieldValue('DAO')];
	var Uptable = tables_MEANS[block.getFieldValue('TABLE')];
	var statements_script = Blockly.Java.statementToCode(block, 'LINHA');
	
	var find= FIN[block.getFieldValue('FIND')];
	var dao_low='';
	var wheres = '';
	var import_dao='';
	
	for (var i = 0; i < Contador; i++) 
	{
		var state1 = Blockly.Java.statementToCode(block, 'ADD' + i);
		var where = WHER[block.getFieldValue(i+'WHERE')];
		var state2 = Blockly.Java.statementToCode(block, 'ADD' + i+'STATE2');
		var total= '.andWhere('+state1+where+state2+')\n';
		
		 wheres = wheres.concat(total);
	}

	var importis = 'import java.util.ArrayList;\n'
						+ 'import java.util.List;\n';
		
	if(dao_mean != undefined)
	{
		 dao_low = dao_mean.toLowerCase();
		 import_dao = 'import nosi.webapps.'+AppTitle+'.dao.;';
		 
	}
	
	if (importss_list.indexOf(importis) === -1)
	{
	importss_list = importss_list.concat(importis);
	}
	
	if (importss_list.indexOf("import nosi.webapps") === -1 )
	{
	importss_list = importss_list.concat(import_dao);
	}
	
	if (importss_list.indexOf("import nosi.webapps.") != -1)
	{
		importss_list = importss_list.replace(/dao.*;/, 'dao.'+dao_mean+';');
	}
	
	var code = 
		''+importss_list+'\n'
		+'try {\n'
		+'List<' + dao_mean + '> ' + dao_low + 'List = new '+ dao_mean + '().find()'+wheres+'.'+find+';\n' 
		+ 'List<'+PageTitle+'.' + Uptable + '> '+dao_low+'Table = new ArrayList<'+PageTitle+'.' + Uptable + '>();\n' 
		+'if (' + dao_low + 'List != null){\n'
		+ 'for('+ dao_mean+' obj : '+dao_low+'List){\n'
		+ ''+PageTitle+'.' + Uptable + ' row = new '+PageTitle+'.' + Uptable + '();\n' 
		+ ''+ statements_script 
		+ ''+dao_low+'Table.add(row);\n' 
		+ '}\n'
		+ '}\n'
		+ 'model.set' + Uptable + '('+dao_low+'Table);\n'
		+'} catch (Exception e) {\n'
		+'e.printStackTrace();\n'
		+'}\n';
	return code;
};

Blockly.Java['criar_dao'] = function(block) {
	var nomedao = '';
	var table_name = '';
	
		if(block.getFieldValue('NOME'))
		{
		nomedao= block.getFieldValue('NOME');
		}
		if(block.getFieldValue('TABLE'))
		{
		table_name = block.getFieldValue('TABLE');
		}
				
	var name_dao = nomedao.charAt(0).toUpperCase()+ nomedao.slice(1).toLowerCase();
	var table_nam = table_name.toLowerCase();
	
	var find= FIN[block.getFieldValue('FIND')];
	var declar_fields = '';
	var getset = '';
	
	for (var i = 0; i < ContFields; i++) {
		
		var variavel = block.getFieldValue(i+'TEXT');
		var tipo = TIP[block.getFieldValue(i+'TIPO')];
		var variav = variavel.toLowerCase();
		
		var total= '@Column(name = "'+variav+'")\n'
	    			+'private '+tipo+' '+variav+';\n \n';
		
		declar_fields = declar_fields.concat(total);
	}
	
	for (var i = 0; i < ContFields; i++) {
		
		//var variavel = Blockly.Java.statementToCode(block,'ADD' + i);
		var tipo = TIP[block.getFieldValue(i+'TIPO')];
		var variavel = block.getFieldValue(i+'TEXT');
		var variav = variavel.toLowerCase();
		var varup = variavel.charAt(0).toUpperCase()+ variavel.slice(1).toLowerCase();
		
		var total= 
		'public '+tipo+' get'+varup+'() {\n'
		+'return this.'+variav+';\n'
		+'}\n'
		+'public void set'+varup+'('+tipo+' '+variav+') {\n'
		+'	this.'+variav+' = '+variav+';\n'
		+'}\n';
		
		getset = getset.concat(total);
	}

	var code = 
		'package nosi.webapps.'+ AppTitle+'.dao;\n'
		+'import java.io.Serializable;\n'
		+'import javax.persistence.*;\n'
		+'import java.io.Serializable;\n'
		+'import java.sql.Date;\n'
		+'import nosi.base.ActiveRecord.BaseActiveRecord;\n \n'
		+'@Entity\n'
		+'@Table(name = "'+table_nam+'", schema="public")\n \n'
		+'public class '+name_dao+' extends BaseActiveRecord<'+name_dao+'> implements Serializable {\n'
		+'private static final long serialVersionUID = 1L;\n'
	    +'@Id\n'
	    +'@GeneratedValue(strategy = GenerationType.IDENTITY)\n'
	    +'@Basic(optional = false)\n'
		+declar_fields
		+ 'public '+name_dao+'() {\n'
	    +'}\n'
	    +getset
	    +'}\n'
	    +'//adicionar mapeamento no ficherio '+ AppTitle+'.cfg.xml: <mapping class="nosi.webapps.'+ AppTitle+'.dao.'+name_dao+'"/>';
	    
	return code;
};

Blockly.Java['imports_insert'] = function(block) {
	var imports = imports_insert_MEANS[block.getFieldValue('IMPORT')];
	return imports;
};

Blockly.Java['imports_list'] = function(block) {
	var imports = imports_list_MEANS[block.getFieldValue('IMPORT')];
	return imports;
};

Blockly.Java['custom_action'] = function(block) {
	var action = custom_action_MEANS[block.getFieldValue('ACTION')];
	  return action;
};

Blockly.Java['select'] = function(block) {
	var tag = select_MEANS[block.getFieldValue('SELECT')];
	var statements_script = Blockly.Java.statementToCode(block, 'SCRIPT');
	var code=
	'LinkedHashMap<String, String> '+tag+' = new LinkedHashMap<>();\n'
	+tag+'.put(null, gt("-- Selecionar --"));\n'
	+statements_script
	+'view.'+tag+'.setValue('+tag+');\n';
	return code;
};

Blockly.Java['opcao'] = function(block) {
	var tag = select_MEANS[block.getFieldValue('SELECT')];
	var statements_script = '';
	if(block.getFieldValue('OPCAO'))
	{
		statements_script= block.getFieldValue('OPCAO');
	}
	var code= tag+'.put('+statements_script+', gt('+statements_script+'));\n';
return code;
};

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
		alert("Bloco Atualizado");
		}
	}
});

$('#active_selenium').on('click', function() {
	$(this).toggleClass('active');
	$("#content_selenium").toggleClass('active');
	
});




