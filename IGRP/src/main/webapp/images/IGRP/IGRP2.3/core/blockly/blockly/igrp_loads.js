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

var COMPAR= {'==': '==','!=': '!=','>=': '>=','<=': '<=','>': '>','<': '<',};

var CORE_IF = [["verificar se está nulo", "verificar se está nulo"]];

var CORE_MSG = [["mensagem sucesso", "mensagem sucesso"],["mensagem de erro", "Mensagem erro"]];

var CORE_CONV = [["converter para inteiro", "converter para inteiro"],["converter texto para data", "converter texto para data"],["converter para texto", "converter para texto"]];

var CORE= {'Mensagem de sucesso': 'Core.setMessageSucess','Mensagem de erro': 'Core.setMessageError','Converter para inteiro': 'Core.toInt','Verificar se está nulo': 'Core.isNull',
		'Converter texto para data': 'Core.ToDate', 'Converter para texto': '""+'	};

var FIND = [["--", "--"],["todos", "todos"],["um", "um"]];

var FIN= {'todos': 'all()','um': 'one()'};

var TIPO = [["Inteiro", "Inteiro"],["Data", "Data"],["Texto", "Texto"]];

var TIP= {'Inteiro': 'Integer','Data': 'Date','Texto': 'String'};

var WHERE = [["=", "WHERE_EQ"],["!=", "WHERE_DIF"],["like", "WHERE_LIKE"]];

var WHER= {'=': ',"=",','!=': ',"<>",'};

var ANDOR = [["and", "and"],["or", "or"]];

var ANDO= {'and': '&&','or': '||'};

var TRU_FAL = [["true", "true"],["false", "false"]];

var TRU_FA= {'true': 'true','false': 'false'};

var IGRP_BLOCKLY_DROPS={
	
	daos : {}
		
};

var AppTitle, PageTitle, pagetitle;
var fields_model = [],FIELDS_MEANS = {}, FIELDS_SET_MEANS = {};
var fields_esp_model = [], FIELDS_ESP_MEANS = {};
var tables_model = [],tables_MEANS = {};
var str = '';
var buttons_model = [], buttons_MEANS = {}, target_MEANS = {}, all_buttons = [];
var daos_list = [], DAOS_MEANS = {}, bloc_fields = [];
var imports_insert = [], imports_insert_MEANS = {};
var imports_list = [], imports_list_MEANS = {};
var fields_esp_row = [], FIELDS_ROW_MEANS = {};
var custom_action = [], custom_action_MEANS = {};
var select = [], select_MEANS = {};

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
		
	select : 'String'
		
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

	 fields_model = []; FIELDS_MEANS = {}; FIELDS_SET_MEANS = {};
	 fields_model.push(['--','--']);
	 fields_esp_model = []; FIELDS_ESP_MEANS = {};
	 fields_esp_model.push(['--','--']);
	 tables_model = []; tables_MEANS = {};
	 tables_model.push(['--','--']);
	 buttons_model = []; buttons_MEANS = {}; target_MEANS = {}; all_buttons = [];
	 buttons_model.push([ '--', '--' ]);
	 daos_list = []; DAOS_MEANS = {}; bloc_fields = [];
	 daos_list.push([ '--', '--' ]);
	 imports_insert = []; imports_insert_MEANS = {};
	 imports_insert.push([ '--', '--' ]);
	 imports_list = []; imports_list_MEANS = {};
	 imports_list.push([ '--', '--' ]);
	 fields_esp_row = []; FIELDS_ROW_MEANS = {};
	 fields_esp_row.push([ '--', '--' ]);
	 custom_action = []; custom_action_MEANS = {}; 
	 custom_action.push([ '--', '--' ]);
	 select = []; select_MEANS = {};
	 select.push([ '--', '--' ]);
	
	var BlocklyXML = $.parseXML(VARS.getGen().getXML());
	
	 AppTitle = $('rows>app', BlocklyXML).text();
	 PageTitle = $('rows>page', BlocklyXML).text();
	 pagetitle = PageTitle.toLowerCase();
	 
	 //$('#'+daos+'').append('<block type="set'+daos+'"></block>\n');
	
	$('rows>content>*[type]', BlocklyXML).each(function(i, element) {
		$(element).find('>fields>*').each(function(x, field) {
			
		var tag = $(field).prop('tagName');
		var type = $(field).attr('type');
		
		//fields_model.push([ tag, tag ]);
		var Uptag = tag.charAt(0).toUpperCase()+ tag.slice(1).toLowerCase();
		FIELDS_MEANS[tag] = 'get'+Uptag+'()';
		FIELDS_SET_MEANS[tag] = 'set'+Uptag;
		
		var javaType = GetJavaType[type] || type;
		
		fields_esp_model.push([ tag, javaType + '::'+tag]);
		
		fields_model.push([ tag, javaType + '::'+tag]);
		
		if(type == "text")
		{
			//fields_esp_model.push([ "texto "+tag, "texto "+tag  ]);
			FIELDS_ESP_MEANS[tag] = {code:'', insert: '(model.get'+Uptag+'())'};
			
		}
		
		if(type == "file")
		{
			//fields_esp_model.push([ "ficheiro "+tag, "ficheiro "+tag ]);
			FIELDS_ESP_MEANS[tag] = {code:'UploadedFile file = Core.upload("p_'+tag+'");\n'
			+'int fileId = 0;\n'		
			+'if (file != null && file.getSize() != 0) {\n'
			+'fileId = Core.saveFile(file.getContent(), file.getSubmittedFileName(), null);\n'
			+'}else{\n'
			+'	Core.setMessageError("Ficheiro não foi submetido");\n'
			+'}\n', insert:'"" + fileId'};
			
			imports_insert.push([ "import upload ", tag ]);
			imports_insert_MEANS[tag] = 'import nosi.core.webapp.UploadedFile;\n';
		}
		
		if(type == "date")
		{
			//fields_esp_model.push([ "data "+tag, "data "+tag ]);
			FIELDS_ESP_MEANS[tag] = {code:'', insert:'Core.ToDate(model.get'+Uptag+'())'};
			
			imports_insert.push([ "import data ", tag ]);
			imports_insert_MEANS[tag] = 'import java.sql.Date;\n';
		}
		
		if(type == "select")
		{
			select.push([ tag, tag ]);
			select_MEANS[tag] = tag; 
	
			
			imports_insert.push([ "import seleção ", tag ]);
			imports_insert_MEANS[tag] = 'import java.util.LinkedHashMap;\n'+'import static nosi.core.i18n.Translator.gt;\n';
		}
		
		if(type == "link")
		{
			fields_esp_row.push([ "link "+tag, "link "+tag ]);
			FIELDS_ROW_MEANS[tag] = 'row.set'+Uptag+'("'+ AppTitle+ '", "'+ PageTitle+ '", "download&file_id="+';
			
			imports_list.push([ "import download ", tag ]);
			imports_list_MEANS[tag] = 'import nosi.webapps.igrp.dao.CLob;\n';
			
			custom_action.push([ "download "+tag, tag ]);
			custom_action_MEANS[tag] = 
				
					'public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException {\n'
					+'int fileId = Core.getParamInt("file_id");\n'
					+'CLob c = Core.getFile(fileId);\n'
					+'byte[] content = c.getC_lob_content();\n'
					+'String name = c.getName();\n'
					+'String contentType = c.getMime_type();\n'
					+'boolean download = false;\n'
					+'return this.xSend(content, name, contentType, download);\n'
					+'}\n';
		}
		
		})
	});

// ********************************************** GET XML BUTTONS FORM ***************************************
	
	var str='';
	$('item[rel]', BlocklyXML).each(function(i, element) {
		var button = $(element).attr('rel');
		var page_target = $(element).find('>page').text();
		
		buttons_model.push([ button, button ]);
		buttons_MEANS[button] = button;
		target_MEANS[button] = page_target;
		all_buttons.push(button);
		
	});
	
	all_buttons.forEach(function(button) {
//		str += '<block type ="action_'+button+'" color="180" prev-statement="" >'
//	 	+'<value name="value1" type="dummy" title="Action botão '+button+'" ></value>'
//	 	+'<value name="CODE" type="statement">'
//	 	+'</block>';
//		</value><next>
		str += '<value name="'+button+'1" type="dummy" title="Action botão '+button+'" ></value>'
	 			+'<value name="'+button+'" type="statement"></value>';
		});
//	all_buttons.forEach(function(button) {
//		str += '</next></block>\n';
//		});
	$('#controller').append(str);
	$('#controller').append('<value name="custom1" type="dummy" title="Custom Action" ></value>'
 			+'<value name="custom_actions" type="statement"></value>');
	
	
	// ********************************************** GET XML FIELDS TABLE ***************************************
	$('rows>content>*', BlocklyXML).each(function(i, element) {
		
		if($(element).attr('type')== 'table')
			{
				var table = $(element).prop('tagName');
				var Uptable = table.charAt(0).toUpperCase()+ table.slice(1).toLowerCase();
				tables_model.push([ table, table ]);
				tables_MEANS[table] = Uptable;
			}
		});
	
	// ********************************************* END XML LOAD ***********************************************
	console.log(AppTitle)
// *******************************************GET DAO OBJECTS **********************************************/
	$.ajax({url : '/IGRP/app/webapps?r=igrp_studio/Env/Retornarxml&app_name='+AppTitle, headers : {'x-igrp-remote' : 1},
	method : 'GET',
	dataType : 'xml',
	// data: YourData,
	success : function(data) {
		
		$(data).find('dao>*').each(function(i, f) {
			var daos = $(f).prop('tagName');
			
			daos_list.push([ daos, daos ]);
			DAOS_MEANS[daos] = '' + daos + '';
			bloc_fields.push(daos);
			
			imports_list.push([ "import "+daos, daos]);
			imports_list_MEANS[daos] = 'import nosi.webapps.'+AppTitle+'.dao.'+daos+';\n';
			
			imports_insert.push([ "import "+daos, daos]);
			imports_insert_MEANS[daos] = 'import nosi.webapps.'+AppTitle+'.dao.'+daos+';\n';
									
			$('#dao').append('<category id="'+daos+'" name="'+daos+'" colour="#990000"></category>\n');
		});

		bloc_fields.forEach(function(daos) {
			var fieldy_list = [];
			var FIELDY_MEANS = {};
			var FIELDY_MEANS_GET = {};
			var FIELDY_MEANS_STR = {};
			fieldy_list.push(['--','--' ]);
			
			IGRP_BLOCKLY_DROPS.daos[daos] = fieldy_list
			
			$(data).find('dao>' + daos+ '>*').each(function(i, f) {
				console.log(f)
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
				'<block type="set-dao-'+daos+'" color="160"  prev-statement="" next-statement="">'
					+'<value name="value1" type="value" title="set'+daos+'">'
						+'<field type="dropdown" name="fields" options="IGRP_BLOCKLY_DROPS.daos.'+daos+'"></field>'
						+'<field type="image" name="img" src="https://image.flaticon.com/icons/svg/149/149206.svg"></field>'
					+'</value>'
				+'</block>\n');
			
			$('#'+daos+'').append(
					'<block type="get-dao-'+daos+'" color="160" output="">'
					 +'<value name="value1" type="value" title="get'+daos+'">'
						+'<field type="dropdown" name="fields" options="IGRP_BLOCKLY_DROPS.daos.'+daos+'"></field>'
						+'<field type="image" name="img" src="https://image.flaticon.com/icons/svg/149/149206.svg"></field>'
						+'</value>'
					+'</block>\n');
			$('#'+daos+'').append(
					'<block type="str-dao-'+daos+'"color="160" output="">'
						+'<value name="value1" type="dummy" title="'+daos+'">'
							+'<field type="dropdown" name="fields" options="IGRP_BLOCKLY_DROPS.daos.'+daos+'"></field>'
							+'<field type="image" name="img" src="https://image.flaticon.com/icons/svg/149/149206.svg"></field>'
						+'</value>'
					+'</block>\n');
	});
			
	imports_list.push([ "imports listar","imports para listar"]);
	imports_list_MEANS['imports listar'] = 'import java.util.ArrayList;\n'+ 'import java.util.List;\n';
	
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
			
			esp_models : fields_esp_model,
			
			fields : fields_model,
			
			tables : tables_model,
			
			esp_rows : fields_esp_row,
			
			selecao : select,
			
			//field_list : fieldy_list
					
		});
	 

	 $('#toolbox').append(
		'<category id="model" name="'+PageTitle+' model" colour="#990000">'
			 +'<block type="model_set" prev-statement="" next-statement="" color="300">'
		 		+'<value name="value1" type="value" title="set model">'
		 			+'<field type="dropdown" name="set_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
				+'</value>'
			 +'</block>'
			 +'<block type="model_get" output="" color="300">'
			 	+'<value name="value1" type="dummy" title="get model">'
			 		+'<field type="dropdown" name="get_model" options="IGRP_BLOCKLY_DROPS.fields"></field>'
			 	+'</value>'
			 +'</block>'
			 +'<block type="inserir_model" output="" color="300">'
			 	+'<value name="value1" type="dummy" title="inserir model">'
			 	+'<field type="dropdown" name="inserir_model" options="IGRP_BLOCKLY_DROPS.esp_models"></field>'
			 	+'</value>'
			 +'</block>'
		 +'</category>'
	  );
		
		if (!blockyInit) {
			
			Code.init();
			
			blockyInit=true;
			
			//SetupBlockly();
			var demoWorkspace = Blockly.mainWorkspace;

			Blockly.Xml.domToWorkspace( $('#inicial_script')[0] ,demoWorkspace);
		}
	},
	error : function(data) {
		alert('Error: '+data);
	}
	});
	
}
	
//});


/* config xml xsl transform */

var codeBlockStart = '/* Start-Code-Block (',

	codeBlockEnd   = '/* End-Code-Block */';

function GetDefaultBlocklyXML(){
	try{
		var xml = Blockly.Xml.workspaceToDom(Blockly.mainWorkspace),
		
			xmlStr = new XMLSerializer().serializeToString(xml);
	  
		xmlStr = xmlStr.replaceAll('xmlns="http://www.w3.org/1999/xhtml"' ,'');
	 
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
	
	GEN.on('ready', function(){
		
		IGRPBlocklyInit();
		
	});
	
	$('li[rel="gen-blocky"]').on('click',function() {
		
		
		IGRPBlocklyInit();
		
		$('#tab_blocks').click();
		
		setTimeout(function(){
			
			$('#refresh_bloco').click();
			
		}, 400)

	})

})






