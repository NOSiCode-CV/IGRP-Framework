var NOSICASIGNER = function(name,params){
	CONTAINER.call(this,name,params);
	
	var GEN = VARS.getGen();

	var container = this;
	
	container.fields = false;

	container.xml.structure = 'form';

	container.xml.type = 'nosicasigner';

	container.includes = {
		xsl : ['nosicasigner'],
		css :[ 
			{ path:'/plugins/select2/select2.min.css' }, 
			{ path:'/plugins/select2/select2.style.css' } 
		],
		js  : [ 
			{ path :'/core/igrp/form/igrp.forms.js'},
			{ path:'/plugins/select2/select2.full.min.js'}, 
			{ path:'/plugins/select2/select2.init.js'},
			{ path:'/plugins/nosicaSigner/nosicaSigner.js'}
		]
	}

	container.ready = function(){
		
		//container.SET.hasTitle(true);

		/**container.setPropriety({
			name: 'target',
			value:{
				value: '_self',
				options: $.IGRP.defaults.buttons.targets
			}
		});*/
	}

	container.xml.getStructure = function(o){
		
		let rtn = `<fields>
				<nosicasigner_file name="p_nosicasigner_file" type="file" placeholder="Carregue o documento que pretende assinar" accept="" targetrend="iframe_1" multiple="false" rendvalue="true" maxlength="250" required="false" disabled="false" right="false" tooltip="false" disable_copy_paste="false" class="primary">
					<label>Documento</label>
					<value/>
				</nosicasigner_file>
				<nosicasigner_available_tokens name="p_nosicasigner_available_tokens" placeholder="Escolher uns dos tokens para poder assinar o documento" type="select" multiple="false" tags="false" load_service_data="false" domain="" maxlength="250" required="false" change="false" disabled="false" right="false" java-type="" tooltip="false" disable_copy_paste="false">
                    <label>Tokens Disponíveis</label>
                    <list>
                        <option/>
                        <option>
                            <text>Option 1</text>
                            <value>1</value>
                        </option>
                        <option>
                            <text>Option 2</text>
                            <value>2</value>
                        </option>
                        <option>
                            <text>Option 3</text>
                            <value>3</value>
                        </option>
                        <option>
                            <text>Option 4</text>
                            <value>4</value>
                        </option>
                    </list>
                </nosicasigner_available_tokens>
				<nosicasigner_available_certificates name="p_nosicasigner_available_certificates" placeholder="Escolher uns dos certificates para poder assinar o documento" type="select" multiple="false" tags="false" load_service_data="false" domain="" maxlength="250" required="false" change="false" disabled="false" right="false" java-type="" tooltip="false" disable_copy_paste="false">
                    <label>Certificados Disponíveis</label>
                    <list>
                        <option/>
                        <option>
                            <text>Option 1</text>
                            <value>1</value>
                        </option>
                        <option>
                            <text>Option 2</text>
                            <value>2</value>
                        </option>
                        <option>
                            <text>Option 3</text>
                            <value>3</value>
                        </option>
                        <option>
                            <text>Option 4</text>
                            <value>4</value>
                        </option>
                    </list>
                </nosicasigner_available_certificates>
				<nosicasigner_btn name="p_nosicasigner_btn" type="link" target="_self" request_fields="" target_fields="" closerefresh="false" refresh_components="" refresh_submit="false" adbcli="" action="index" page="Pagina_home" app="teste_local" custom_action="" action_type="false" class="link" btnSize="" iconColor="#333" iconClass="" img="fa-link" maxlength="250" placeholder="" desclabel="false" right="false" tooltip="false" disable_copy_paste="false">
                    <label>Assinar</label>
                    <value>/IGRP/images/IGRP/IGRP2.3/app/teste_local/pagina_home/Pagina_home.xml</value>
                </nosicasigner_btn>
			</fields>`; 

		

		return rtn;

	};
};

this[VARS.name].declareContainer({
	name:'nosicasigner',
	container:NOSICASIGNER
});