var GENTABLE = function(name,params){

	CONTAINER.call(this,name,params);
	
	var container = this;

	container.xml.table       = true;
	container.xml.fieldsValue = false;
	
	/*CONFIG FIELD SORT*/
	container.sortableOptions.axis = "x";
	
	container.contextMenu = {
		type   : 'button',
		holder : 'ul.contextMenu',
		menu   : {
			selector: '.operationTable',
			label   : 'span'
		}
	};

	container.includes = {
		xsl:['operation-table','others']
	}

	container.ready = function(){
		
		container.setPropriety({
			name:'filter',
			value:{
				value: '',
				options:[
					{value : ''            ,label : ''},
					{value : 'filter_az'   ,label : 'A-Z'},
					{value : 'filter_num'  ,label : '0-9'},
					{value : 'filter_aznum',label : 'A-Z-0-9'}
				]
			},
			transform:true
		});

		container.setPropriety({
			name:'contextMenuType',
			value:{
				value: '',
				options:[
					{value : ''            ,label : ''},
					{value : 'menu'   ,label : 'Context Menu'},
					{value : 'line'  ,label : 'Opera\u00e7\u00e3o Linha'}
				]
			},
			onChange:function(val){
				var ctxH = val == 'menu' ? 'ul.contextMenu' : 'ul.contentOperationTable';
				container.contextMenu.holder = ctxH;
			},
			transform:true
		});

	}
	container.onDrawEnd = IGRP_contexMenu;
	/* WHEN A FIELD IS DROPPED - SET EXAMPLE DATA TO THE TABLE*/
	container.onFieldSet = function(field){
		field.xml.desc = true;
		if(!field.hidden){

			field.setPropriety({
				name:'align',
				propriety:{
					value:'left',
					options:[
						{value:'left',label:'Left'},
						{value:'center',label:'Center'},
						{value:'right',label:'Right'}
					]
				},
				transform:true
			});

		}
	}
	container.onContextMenuSet = function(field){
		field.setIncludes(['context']);
	}
	container.onColorFieldSet = function(field){
		container.xml.tableLegend = true;
		//field.setIncludes(['others']);
	}			
}

this[VARS.name].declareContainer({
	name:'table',
	container:GENTABLE
});