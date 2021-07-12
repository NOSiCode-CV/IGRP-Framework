package nosi.webapps.igrp_studio.pages.migration;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.zip.CRC32;

import nosi.core.config.ConfigDBIGRP;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.RepTemplateSourceParam;
import nosi.webapps.igrp.dao.Transaction;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.io.File; 

/*----#end-code----*/
		
public class MigrationController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Migration model = new Migration();
		model.load();
		MigrationView view = new MigrationView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_pagina(Core.query(null,"SELECT '1' as pagina_ids,'Perspiciatis totam consectetur sit dolor unde accusantium sit labore doloremque laudantium magna anim ut voluptatem ipsum mollit aliqua stract dolorem' as descricao_pagina "));
		model.loadTable_report(Core.query(null,"SELECT '1' as report_ids,'Accusantium natus rem labore totam omnis iste perspiciatis natus amet consectetur magna natus rem aliqua sed accusantium voluptatem sed labore consect' as descricao_report "));
		model.loadTable_domain_info(Core.query(null,"SELECT '1' as domain_ids,'Elit labore dolor consectetur voluptatem dolor officia totam natus officia ipsum unde natus perspiciatis elit officia omnis consectetur deserunt sed a' as descricao_domain "));
		model.loadTable_tipo_documento(Core.query(null,"SELECT '1' as tipo_doc_ids,'Aperiam laudantium omnis anim amet accusantium perspiciatis dolor ut elit perspiciatis ut rem iste adipiscing sit elit adipiscing amet stract ipsum ap' as descricao_tipo_doc "));
		model.loadTbl_transation(Core.query(null,"SELECT '1' as transation_ids,'Unde amet iste voluptatem iste sed aliqua lorem sed sit perspiciatis consectetur elit omnis consectetur omnis magna perspiciatis labore anim stract do' as descricao_transation "));
		model.loadTable_connections(Core.query(null,"SELECT '1' as conexao_ids,'Lorem aperiam officia sit ut voluptatem anim adipiscing sit amet aperiam accusantium magna laudantium rem voluptatem labore mollit deserunt sed ipsum' as descricao_conexao "));
		model.loadTbl_bpmn(Core.query(null,"SELECT '1' as bpmn_ids,'Natus magna amet anim omnis rem lorem ipsum doloremque magna sed aperiam omnis aperiam aliqua sit do' as descricao_bpmn "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		
		Map<Object, Object> listApp = new Application().getListApps();
		if(listApp!=null && listApp.size()==2) 
			model.setAplicacao(listApp.keySet().stream().filter(a->a!=null).findFirst().get().toString());
		view.aplicacao.setValue(listApp);
		
		if(Core.isNotNull(model.getAplicacao())) {
			loadPages(model);
			loadTransactions(model);
			loadDomains(model);
			loadConections(model); 
			loadReports(model);
		}
		
		view.table_connections.setVisible(model.getTable_connections() != null && !model.getTable_connections().isEmpty());
		view.table_domain_info.setVisible(model.getTable_domain_info() != null && !model.getTable_domain_info().isEmpty());
		view.table_pagina.setVisible(model.getTable_pagina() != null && !model.getTable_pagina().isEmpty());
		view.table_report.setVisible(model.getTable_report() != null && !model.getTable_report().isEmpty());
		view.tbl_transation.setVisible(model.getTbl_transation() != null && !model.getTbl_transation().isEmpty());
		view.tbl_bpmn.setVisible(model.getTbl_bpmn() != null && !model.getTbl_bpmn().isEmpty());
		view.table_tipo_documento.setVisible(model.getTable_tipo_documento() != null && !model.getTable_tipo_documento().isEmpty());
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionMigrar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Migration model = new Migration();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","Migration","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (migrar)  *//* End-Code-Block  */
		/*----#start-code(migrar)----*/
		
		String[] report_ids = Core.getParamArray("p_report_ids_check_fk");
		String[] domain_ids = Core.getParamArray("p_domain_ids_check_fk");
		String[] page_ids = Core.getParamArray("p_pagina_ids_check_fk");
		String[] conexao_ids = Core.getParamArray("p_conexao_ids_check_fk");
		String[] transation_ids = Core.getParamArray("p_transation_ids_check_fk");
		String[] bpmn_ids = Core.getParamArray("p_bpmn_ids_check_fk");
		String[] tipo_doc_ids = Core.getParamArray("p_tipo_doc_ids_check_fk");
		
		if(transation_ids==null && report_ids==null && domain_ids==null && page_ids==null && conexao_ids==null && bpmn_ids == null && tipo_doc_ids == null) {
			Core.setMessageWarning(Core.gt("Por favor selecione os dados a serem exportados"));
			return this.forward("igrp_studio","Migration","index", this.queryString());	
		}
		
		Application app = new Application().findOne(Core.toInt(model.getAplicacao()));
		
		if(this.saveContent(app.getDad(), this.generateContent(app, page_ids, conexao_ids, transation_ids, domain_ids, report_ids)))
			Core.setMessageSuccess();
		else {
			Core.setMessageError(); 
			return this.forward("igrp_studio","Migration","index");	
		}
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","Migration","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	private void loadPages(Migration model) {
		String sql = "SELECT id as pagina_ids,0 as pagina_ids_check,concat(page_descr,' (',page,')') as descricao_pagina "
				   + "FROM tbl_action "
				   + "WHERE env_fk=:application_id AND status=1 AND processkey is null";
		/*if(Core.isNotNull(model.getModulo())) {
			sql+= " AND (";
			int count=0;
			int size = model.getModulo().length;			
			for(String modulo:model.getModulo()) {
				sql+=" nomeModulo='"+modulo+"'";
				++count;
				if(count!=size)
					sql+=" OR ";
			}
			sql+= ")";
		}*/
		model.loadTable_pagina(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,sql).addInt("application_id", Core.toInt(model.getAplicacao())));
	
	}
	
	private void loadTransactions(Migration model) {
		String sql = "SELECT id as transation_ids,0 as transation_ids_check, concat(descr,' (',code,')') as descricao_transation "
				   + "FROM tbl_transaction "
				   + "WHERE status=1 AND env_fk=:application_id";
		model.loadTbl_transation(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,sql).addInt("application_id", Core.toInt(model.getAplicacao())));
	}
	
	private void loadConections(Migration model) {
		String sql = "SELECT id as conexao_ids,0 as conexao_ids_check, name as descricao_conexao "
				   + "FROM tbl_config_env "
				   + "WHERE env_fk=:application_id";
		model.loadTable_connections(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,sql).addInt("application_id", Core.toInt(model.getAplicacao())));
	}
	
	private void loadReports(Migration model) {
		String sql = "SELECT id as report_ids,0 as report_ids_check, concat(name,' (',code,')') as descricao_report "
				   + "FROM tbl_rep_template "
				   + "WHERE env_fk=:application_id AND status=1 ";
		model.loadTable_report(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,sql).addInt("application_id", Core.toInt(model.getAplicacao())));
	}
	
	private void loadDomains(Migration model) {
		String sql = "SELECT id as domain_ids,0 as domain_ids_check, dominio as descricao_domain FROM tbl_domain WHERE status='ATIVE' AND env_fk=" + model.getAplicacao(); 
		model.loadTable_domain_info(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,sql));
		if(model.getTable_domain_info() != null && !model.getTable_domain_info().isEmpty())
			model.setTable_domain_info(model.getTable_domain_info().stream().collect(Collectors.groupingBy(Migration.Table_domain_info::getDescricao_domain)).values().stream().map(m->m.get(0)).collect(Collectors.toList()));
	}
	
	private String generateContent(Application app, String[] page_ids, String[] conexao_ids, String[] transation_ids, String[] domain_ids, String[] report_ids) {
		StringBuilder content = new StringBuilder(); 
		generatePackageName(content);
		generateImports(content);
		content.append("/**\n"); 
		content.append(" * " + Core.getCurrentUser().getName() + "\n"); 
		content.append(" * " + Core.getCurrentDate("MMM dd, yyyy") + "\n"); 
		content.append(" */\n"); 
		content.append("public class " + this.FILE_NAME_PREFIX + app.getDad() + " extends IgrpMigrationTemplate{\n\n"); 
		content.append("\tpublic " + this.FILE_NAME_PREFIX + app.getDad() + "() {\n"); 
		content.append("\t  super();\n"); 
		
		content.append(":methods"); 
		
		content.append("\t}\n"); 
		
		this.generateGetChecksum(content);
		
		generateAppContent(content, app);
		
		generatePagesContent(content, page_ids); 
		
		generateTransactionContent(content, transation_ids);
		
		generateDomainsContent(content, domain_ids);
		
		generateDbConnectionContent(content, conexao_ids);
		
		generateReportContent(app, content, report_ids);
		
		content.append("\n}"); 
		
		String result = content.toString();
		
		StringBuilder methods = new StringBuilder();
		if(result.contains("app()")) methods.append("\t  app();\n"); 
		if(result.contains("pages()")) methods.append("\t  pages();\n"); 
		if(result.contains("transactions()")) methods.append("\t  transactions();\n"); 
		if(result.contains("domains()")) methods.append("\t  domains();\n"); 
		if(result.contains("dbConnections()")) methods.append("\t  dbConnections();\n"); 
		if(result.contains("reports()")) methods.append("\t  reports();\n"); 
		
		result = result.replace(":methods", methods.toString()); 
		
		return generateCheckSumNReturn(result); 
	} 
	
	
	
	private void generatePackageName(StringBuilder content) {
		content.append("package " + FILE_PATH_NAME.replaceAll(Pattern.quote(File.separator), ".")  + ";\n\n"); 
	}
	
	private void generateImports(StringBuilder content) {
		content.append("import nosi.core.webapp.Core;\n"); 
		content.append("import nosi.webapps.igrp.dao.Action;\n"); 
		content.append("import nosi.webapps.igrp.dao.Application;\n"); 
		content.append("import nosi.webapps.igrp.dao.Config_env;\n"); 
		content.append("import nosi.webapps.igrp.dao.Domain;\n"); 
		content.append("import nosi.webapps.igrp.dao.DomainType;\n"); 
		content.append("import nosi.webapps.igrp.dao.User;\n"); 
		content.append("import nosi.webapps.igrp.dao.Config_env;\n"); 
		content.append("import nosi.webapps.igrp.dao.RepTemplate;\n"); 
		content.append("import nosi.webapps.igrp.dao.RepSource;\n"); 
		content.append("import nosi.webapps.igrp.dao.RepTemplateSource;\n"); 
		content.append("import nosi.webapps.igrp.dao.RepTemplateSourceParam;\n"); 
		content.append("import nosi.webapps.igrp.dao.CLob;\n"); 
		content.append("import nosi.webapps.igrp.dao.Transaction;\n\n"); 
	}
	
	private void generateAppContent(StringBuilder content, Application app) {
		content.append("\tprivate void app(){\n"); 
		content.append("\t  this.app = new Application(\"" + app.getDad() + "\", \"" + app.getName() + "\", \"" + app.getImg_src() 
		+ "\", \"" + app.getDescription() + "\", " + app.getStatus() + ", null,\"" + app.getTemplate() + "\");\n"); 
		content.append("\t}\n\n"); 
	}
	
	private void generatePagesContent(StringBuilder content, String[] page_ids) {
		if(Core.isNotNullMultiple(page_ids)) { 
			content.append("\tprivate void pages(){\n"); 
			for(String pageId : page_ids) {
				if(pageId != null && !pageId.trim().isEmpty()) {
					Action action = new Action().findOne(Core.toInt(pageId)); 
					if(action != null) {
						content.append("\t  this.actions.add(new Action(\"" + action.getPage() + "\", \"" + action.getAction() + "\", \"" + action.getPackage_name() 
						+ "\", \"" + action.getXsl_src() + "\", \"" + action.getPage_descr() + "\", \"" + action.getAction_descr() 
							+ "\", \"" + action.getVersion()+ "\", " + action.getStatus() + ", this.app, (short)" + action.getIsComponent() + ", " 
						+ (action.getNomeModulo() != null ? "\"" + action.getNomeModulo() + "\"" : null) + ", " + (action.getProcessKey() != null ? "\"" + action.getProcessKey() + "\"" : null)  + ", (short)" + action.getTipo() + "));\n"); 
					}
				}
			}
			content.append("\t}\n\n"); 
		}
	}
	
	private void generateTransactionContent(StringBuilder content, String[] transation_ids) {
		if(Core.isNotNullMultiple(transation_ids)) { 
			content.append("\tprivate void transactions(){\n"); 
			for(String transationId : transation_ids) {
				if(transationId != null && !transationId.trim().isEmpty()) {
					Transaction transaction = new Transaction().findOne(transationId); 
					if(transaction != null) {
						content.append("\t  this.transactions.add(new Transaction(\"" + transaction.getCode() + "\", \"" + transaction.getDescr() + "\", " 
								+ transaction.getStatus() + ", this.app));\n");
					}
				}
			}
			content.append("\t}\n\n"); 
		}
	}
	
	private void generateDomainsContent(StringBuilder content, String[] domain_ids) {
		if(Core.isNotNullMultiple(domain_ids)) {
			content.append("\tprivate void domains(){\n"); 
			for(String domainId: domain_ids) {
				if(domainId != null && !domainId.trim().isEmpty()) {
					Domain domain = new Domain().findOne(domainId); 
					if(domain != null) {
						content.append("\t  this.domains.add(new Domain(\"" + domain.getDominio() + "\", \"" + domain.getValor() 
							+ "\", \"" + domain.getDescription() + "\", \"" + domain.getStatus() + "\", " + domain.getordem() + ", DomainType." + domain.getDomainType() + ", this.app));\n"); 
					}
				}
			}
			content.append("\t}\n\n"); 
		}
		
	}
	private void generateDbConnectionContent(StringBuilder content, String[] conexao_ids) {
		if(Core.isNotNullMultiple(conexao_ids)) {
			content.append("\tprivate void dbConnections(){\n"); 
			for(String conexaoId: conexao_ids) {
				Config_env conf = new Config_env().findOne(Core.toInt(conexaoId)); 
				if(conf != null) 
					content.append("\t  this.configs.add(new Config_env(" + (conf.getPort() != null ?  "\""+ conf.getPort() + "\"" : null) + "," + (conf.getHost() != null ? " \"" + conf.getHost() + "\"" : null) + "," + (conf.getName_db() != null ? " \"" + conf.getName_db() + "\""  : null) + "," 
						+ (conf.getCharset() != null ? " \"" + conf.getCharset() + "\"" : null) + ", \"" + conf.getType_db() + "\", \"" + conf.getUsername() + "\", \"" + conf.getPassword() 
						+ "\", \"" + conf.getName() + "\", \"" + conf.getUrl_connection() + "\", \"" + conf.getDriver_connection() + "\", this.app, (short)" + conf.getIsDefault() 
						+ "," + (conf.getConnection_identify() != null ? " \"" + conf.getConnection_identify() + "\"" : null) + "));\r");
			} 
			content.append("\t}\n\n"); 
		}
	}
	
	private void generateReportContent(Application app, StringBuilder content, String[] report_ids) { 
		
		List<RepTemplate> reports = this.loadAllReportTemplateByIds(report_ids);
		
		if(!reports.isEmpty()) {
			content.append("\tprivate void reports(){\n");
			for(int i = 0; i < reports.size(); i++) { 
				RepTemplate aux = reports.get(i); 
				if(aux.getXml_content().getC_lob_content() != null) 
					saveReportJsonOrXslContent(app.getDad(), new String(aux.getXml_content().getC_lob_content(), Charset.forName("utf-8")), aux.getCode() + ".json"); 
				if(aux.getXsl_content().getC_lob_content() != null) 
					saveReportJsonOrXslContent(app.getDad(), new String(aux.getXsl_content().getC_lob_content(), Charset.forName("utf-8")), aux.getCode() + ".xsl"); 
				// RepTemplate & CLOB 
				content.append("\t	User userCreated" + i + " = new User();" + "\n");
				content.append("\t	userCreated" + i + ".setUser_name(\"" + aux.getUser_created().getUser_name() +  "\");" + "\n");
				content.append("\t	User userUpdated" + i + " = new User();" + "\n");
				content.append("\t	userUpdated" + i + ".setUser_name(\"" + aux.getUser_updated().getUser_name() +  "\");" + "\n");
				content.append("\t	Application env" + i + " = new Application();" + "\n");
				content.append("\t	env" + i + ".setDad(\"" + aux.getApplication().getDad() +  "\");" + "\n");
				content.append("\t	RepTemplate report" + i + " = new RepTemplate(\"" + aux.getCode() + "\", \"" + aux.getName() + "\","
						+ " Core.ToDateUtil(\"" + Core.dateToString(aux.getDt_created(), "yyyy-MM-dd") + "\", \"yyyy-MM-dd\"),"
						+ " Core.ToDateUtil(\"" + Core.dateToString(aux.getDt_updated(), "yyyy-MM-dd") + "\", \"yyyy-MM-dd\"),"
						+ aux.getStatus() + ", userCreated" + i + ", userUpdated" + i + ", env" + i + ", " 
						+ " new CLob(\"" + aux.getXml_content().getName() + "\" ,\"" + aux.getXml_content().getMime_type() + "\", null, Core.ToDateUtil(\"" + Core.dateToString(aux.getXml_content().getDt_created(), "yyyy-MM-dd") + "\", \"yyyy-MM-dd\"), env" + i + ", \"" + aux.getXml_content().getUuid() + "\"),"
						+ " new CLob(\"" + aux.getXsl_content().getName() + "\" ,\"" + aux.getXsl_content().getMime_type() + "\", null, Core.ToDateUtil(\"" + Core.dateToString(aux.getXsl_content().getDt_created(), "yyyy-MM-dd") + "\", \"yyyy-MM-dd\"), env" + i + ", \"" + aux.getXsl_content().getUuid() + "\"), "
						+ "\"" + aux.getReport_identify() + "\");\n"); 
				
				// DataSource 
				List<RepSource> repSources = loadRepDataSources(aux);
				for(int j = 0; j < repSources.size(); j++) {
					RepSource dataSource = repSources.get(j);
					content.append("\t	User userCreated" + i + "_" + j + " = new User();" + "\n");
					content.append("\t	userCreated" + i + "_" + j  + ".setUser_name(\"" + dataSource.getUser_created().getUser_name() +  "\");" + "\n");
					content.append("\t	User userUpdated" + i + "_" + j  + " = new User();" + "\n");
					content.append("\t	userUpdated" + i + "_" + j  + ".setUser_name(\"" + dataSource.getUser_updated().getUser_name() +  "\");" + "\n");
					content.append("\t	Config_env configEnv" + i + "_" + j  + " = new Config_env();" + "\n");
					content.append("\t	configEnv" + i + "_" + j  + ".setConnection_identify(\"" + dataSource.getConfig_env().getConnection_identify() +  "\");" + "\n");
					content.append("\t	this.repDataSources.add(" + 
							"new RepSource(\"" + dataSource.getName() + "\", \"" + dataSource.getType() + "\", "
							+ dataSource.getType_fk() + ", \"" + dataSource.getType_name() + "\", \"" + dataSource.getType_query().replaceAll("[\\n\\r]", "") + "\", " + dataSource.getStatus() + ","
							+ " Core.ToDate(\"" + Core.dateToString(dataSource.getDt_created(), "yyyy-MM-dd") + "\", \"yyyy-MM-dd\"), "
							+ " Core.ToDate(\"" + Core.dateToString(dataSource.getDt_updated(), "yyyy-MM-dd") + "\", \"yyyy-MM-dd\"), "
							+ "userCreated" + i + "_" + j  + ", userUpdated" + i + "_" + j  + ", configEnv" + i + "_" + j  + ", env" + i + ", "
							+ "\"" + dataSource.getSource_identify() + "\" , \"" + dataSource.getTaskid() + "\", \"" + dataSource.getProcessid() + "\", \"" + dataSource.getFormkey() + "\")"
							+ ");\n");
				}
				
				//Assoc. Report with DataSource 
				List<RepTemplateSource> repTemplateSources = loadRepTemplateDataSources(aux); 
				for(int k = 0; k < repTemplateSources.size(); k++) {
					RepTemplateSource reportSource = repTemplateSources.get(k); 
					content.append("\t	RepSource repSource" + i + "_" + k + " = new RepSource();" + "\n");
					content.append("\t	repSource" + i + "_" + k + ".setSource_identify(\"" + reportSource.getRepSource().getSource_identify() + "\");" + "\n");
					content.append("\t	RepTemplateSource reportSource" + i + "_" + k + " = new RepTemplateSource(report" + i + ", repSource" + i + "_" + k + ");\n"); 
					List<RepTemplateSourceParam> parameters = reportSource.getParameters(); 
					for(int j = 0; j < parameters.size(); j++) {
						RepTemplateSourceParam param = parameters.get(j); 
						content.append("\t	reportSource" + i + "_" + k + ".getParameters().add(new RepTemplateSourceParam(reportSource" + i + "_" + k +  ", \"" + param.getParameter() + "\", \"" + param.getParameter_type() + "\"));\n");
					}
					content.append("\t	report" + i + ".getReptemplatesources().add(reportSource" + i + "_" + k + ");\n"); 
				}
				content.append("\t	this.reports.add(report" + i + ");\n"); 
			}
			content.append("\t}\n\n"); 
		}
	}
	
	private List<RepTemplate> loadAllReportTemplateByIds(String []report_ids) { 
		List<RepTemplate> allReports = new ArrayList<>(); 
		if(report_ids != null && report_ids.length > 0) 
			for(String id : report_ids) 
				if(!id.trim().isEmpty()) {
					RepTemplate report = new RepTemplate().findOne(Core.toInt(id));
					if(report != null) 
						allReports.add(report); 
				}
		return allReports;
	}
	
	private List<RepSource> loadRepDataSources(RepTemplate report){
		List<RepSource> repSources = new ArrayList<>(); 
		List<RepTemplateSource> sources = loadRepTemplateDataSources(report);
		if(sources != null && !sources.isEmpty()) 
			repSources = sources.stream().map(obj->obj.getRepSource()).collect(Collectors.toList());
		return repSources; 
	}
	
	private List<RepTemplateSource> loadRepTemplateDataSources(RepTemplate report){
		return new RepTemplateSource()
		 .find()
		 .andWhere("repTemplate","=",report.getId())
		 .all();
	}
	
	private void generateGetChecksum(StringBuilder content) { 
		content.append("\n\n"); 
		content.append("\t@Override\n"); 
		content.append("\tpublic Integer getChecksum() {\n"); 
		content.append("\t	return :checkSum;\n"); 
		content.append("\t}\n\n"); 
	}
	
	private String generateCheckSumNReturn(String content) {
		CRC32 crc32 = new CRC32(); 
		crc32.update(content.toString().getBytes());
		int checkSum = (int)crc32.getValue(); 
		checkSum = Math.abs(checkSum); 
		return content.replace(":checkSum", checkSum + ""); 
	}
	
	private boolean saveContent(String appDad, String content) {
		Path path = Paths.get(this.configApp.getConfig().getRawBasePathClassWorkspace() + FILE_PATH_NAME, FILE_NAME_PREFIX + appDad + FILE_NAME_SUFIX); 
		Path parent = path.getParent(); 
		boolean success = true;
		try {
			if(Files.notExists(parent)) 
				parent = Files.createDirectories(parent); 
			Files.write(path, content.getBytes(Charset.forName("utf-8")), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING); 
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success; 
	}
	
	private boolean saveReportJsonOrXslContent(String appDad, String content, String filename) {
		Path path = Paths.get(this.configApp.getConfig().getPathWorkspaceResources() + File.separator + FILE_PATH_NAME + File.separator + appDad, filename); 
		Path parent = path.getParent(); 
		boolean success = true;
		try {
			if(Files.notExists(parent)) 
				parent = Files.createDirectories(parent); 
			Files.write(path, content.getBytes(Charset.forName("utf-8")), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING); 
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success; 
	}
	
	private final String FILE_PATH_NAME = "nosi" + File.separator + "core" + File.separator + "db" + File.separator + "migration" + File.separator + "igrp"; 
	private final String FILE_NAME_PREFIX = "R__"; 
	private final String FILE_NAME_SUFIX = ".java"; 
	
/*----#end-code----*/
}
