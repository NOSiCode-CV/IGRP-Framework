var TIMELINE = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();

	var container = this;
	
	container.fields = false;

	container.xml.structure = 'table';

	container.xml.type = 'timeline';

	container.includes = {
		xsl : ['timeline'],
		css : [ { path : '/plugins/timeline/timeline.css' } ]
	}

	container.ready = function(){
		
		//container.SET.hasTitle(true);

		container.setPropriety({
			name:'style',
			label:'Style',
			value:{
				value:'hexa-theme',
				options:[
					{value:'hexa-theme',label:'Hexa Theme'},
					{value:'circle-theme',label:'Circle Theme'}
				]
			}
		});

		container.setPropriety({
			name: 'target',
			value:{
				value: '_self',
				options: $.IGRP.defaults.buttons.targets
			}
		});

		container.setPropriety({
			name:'bg',
			label:'Background',
			value:{
				value:'cp-cyan',
				list:{
					items:$.IGRP.components.colorPalettes.colors || [{"value":"cp-cyan","label":"Cyan"}],
					itemTemplate:'<span label="#label#" class="#value#" style="height:20px;width:20px;"></span>',
				
					
				},
				size:'12'
			},
			isField   : true,
			valuePersist : true
		});

		container.setPropriety({
			name: 'clean',
			value:true,
			xslValue:'clean'
		});

	}

	container.xml.getStructure = function(o){
		
		var rtn    = '<fields>',
			row    = '',
			tag    = container.GET.tag(),
			target = container.GET.target(); 

		rtn += '<'+tag+'_icon type="img" maxlength="30"><label>Icon</label></'+tag+'_icon>';
		rtn += '<'+tag+'_hd type="text" maxlength="40"><label>Header</label></'+tag+'_hd>';
		rtn += '<'+tag+'_date type="date" maxlength="40"><label>Date</label></'+tag+'_date>';
		rtn += '<'+tag+'_text type="text" maxlength="4000"><label>Content</label></'+tag+'_text>';
		rtn += '<'+tag+'_btn type="link" target="'+target+'" maxlength="4000"><label>Button</label></'+tag+'_btn>';
		rtn += '</fields><table><value>';
		for (var i = 0; i < 3; i++) {
			

			row += '<row>';
			row += '<'+tag+'_icon>fa-check</'+tag+'_icon>';
			row += '<'+tag+'_hd>'+DATA.get( { type : 'text'} )+'</'+tag+'_hd>';
			row += '<'+tag+'_date>'+(i+1)+' de Out de 201'+(3-i)+'</'+tag+'_date>';
			row += '<'+tag+'_text>'+DATA.get( { type : 'plaintext', maxLength:150  } )+'</'+tag+'_text>';
			row += '<'+tag+'_btn>button</'+tag+'_btn>';
			row += '<'+tag+'_btn_desc>Link</'+tag+'_btn_desc>';			
			row += '</row>';
		}
		rtn +=row+'</value></table>';

		return rtn;

	}
};

this[VARS.name].declareContainer({
	name:'timeline',
	container:TIMELINE
});