package nosi.webapps.igrp_studio.pages.daogenerator;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */

/* End-Code-Block */


/*----#start-code(packages_import)----*/
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.core.webapp.helpers.CheckBoxHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.dao_helper.GerarClasse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;

/*----#end-code----*/
		
public class DaogeneratorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Daogenerator model = new Daogenerator();
		model.load();
		model.setAdd_datasource_botton("igrp_studio","ListaPage","index");
		DaogeneratorView view = new DaogeneratorView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as check_table,'Totam officia aperiam consecte' as table_name "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.schema.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		model.setAdd_datasource_botton("igrp","ConfigDatabase","index");
		view.aplicacao.setValue(new Application().getListApps());
		view.btn_gerar_dao.setLink("index&dad_id="+model.getAplicacao());
		
		List<String> list_table = null;
		
		if(Core.isNotNull(model.getAplicacao())) {
			
			final Map<Object, Object> listDSbyEnv = new Config_env().getListDSbyEnv(Core.toInt(model.getAplicacao()));
			view.data_source.setValue(listDSbyEnv);
			
			if(Core.isNotNull(model.getData_source())) {
				
				Config_env config = new Config_env().find()
													.andWhere("id","=",Core.toInt(model.getData_source()))
													.andWhere("application", "=",Core.toInt(model.getAplicacao()))
													.one();	
				Map<String,String> schemasMap = DatabaseMetadaHelper.getSchemas(config);
				view.schema.setValue(schemasMap);
				
				if(Core.isNotNull(model.getSchema())) {
					list_table = DatabaseMetadaHelper.getTables(config,model.getSchema());
					List<Daogenerator.Table_1> list_tb = new ArrayList<>();
					int i =1;
					for(String li : list_table) {
						Daogenerator.Table_1 tb = new Daogenerator.Table_1();
						
						tb.setTable_name(li);
						tb.setCheck_table(i);
						tb.setCheck_table_check(-1);
						i++;
						list_tb.add(tb);
					}
					model.setTable_1(list_tb);
										
					//action gerar --- put here to aproveitar a list_table
					String[] rows_id = Core.getParamArray("p_check_table_fk");
					String[] p_checkbox_check = Core.getParamArray( "p_check_table_check_fk" );
					boolean r = false;
					
					if(Core.isNotNull(p_checkbox_check) && Core.isNotNull(rows_id)) {
						CheckBoxHelper cbh = Core.extractCheckBox(rows_id, p_checkbox_check); 
						if(Core.isNotNull(cbh)) {
							for(String id_ch : cbh.getChekedIds()) {
								String tableName = list_table.get(Integer.parseInt(id_ch)-1);
								String dad_name = new Application().findOne(Core.toInt(model.getAplicacao())).getDad();
									r = this.generateDAO(config,model.getSchema(),tableName, dad_name);
							}
							
							if(r) {
								Core.setMessageSuccess("Classe DAO gerado sucesso!");
							}
							else {
								Core.setMessageError();
							}
							
							
						}
					}
					/* --  FIM ACTION GERAR  --*/
					
				}
			}
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGerar_dao() throws IOException, IllegalArgumentException, IllegalAccessException{
		Daogenerator model = new Daogenerator();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Daogenerator","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		
		
		/*----#start-code(gerar_dao)----*/
		
		return this.forward("igrp_studio","Daogenerator","index",this.queryString());
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/
	

	//resolver o problema do nome da tabela
	private String resolveDAOName(String tabela_name) {
		String dao_name_class = "";
		for(String aux : tabela_name.split("_")){
			dao_name_class += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		}
		return dao_name_class;
	}
	
	
	private boolean generateDAO(Config_env config,String schema, String tableName, String dad_name){ 
		boolean flag = false;
		String dao_name_class = this.resolveDAOName(tableName);
		flag = this.processGenerate(config, dao_name_class, schema,tableName, dad_name);
		return flag;
	}
	

	private boolean processGenerate(Config_env config, String dao_name_class, String schema, String tableName, String dad_name) {
		boolean flag = false;
		boolean flag_compile = false;
		List<DatabaseMetadaHelper.Column> columns = null;
		
		try {
			columns = DatabaseMetadaHelper.getCollumns(config, schema, tableName);
			
			//Gerar conteúdo da classe DAO
			String content = new GerarClasse().gerarCode(dad_name,tableName,dao_name_class, columns,schema,config);
			
			//Salvar os files de classe DAO
			flag = this.saveFiles(dao_name_class+".java", content, dad_name);
			
			//compilar as classes DAO
			this.compiler.addFileName(this.config.getPathDAO(dad_name)+File.separator+dao_name_class+".java");
			flag_compile = this.processCompiler();
			if(!flag_compile) {
				Core.setMessageWarning("Ups... Erro na compilação");
			}
		} catch (Exception e) {
			Core.setMessageError(tableName+" error: "+e.getMessage());
			return false;
		}
		
		return flag;
	}
	
	private boolean saveFiles(String fileName,String content,String dad_name) throws IOException {
		boolean flag = false;
		if(Core.isNotNull(content)) {
			flag = FileHelper.save(this.config.getPathDAO(dad_name), fileName, content);
		}
		return flag;
	}
	
	
	private Compiler compiler = new Compiler();
	
	//para poder compilar classe DAO
	private boolean processCompiler() {
		this.compiler.compile();
		return !this.compiler.hasError();
	}
	
/*----#end-code----*/
}
