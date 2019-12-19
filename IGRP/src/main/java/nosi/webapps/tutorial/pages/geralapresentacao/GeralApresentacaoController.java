package nosi.webapps.tutorial.pages.geralapresentacao;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;

import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;

/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;

/*----#end-code----*/
		
public class GeralApresentacaoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		GeralApresentacao model = new GeralApresentacao();
		model.load();
		model.setStatbox_1_url("https://nosicode.gitbook.io/faq/");
		GeralApresentacaoView view = new GeralApresentacaoView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Officia natus sit officia aper' as documento,'/IGRP/images/IGRP/IGRP2.3/app/tutorial/geralapresentacao/GeralApresentacao.xml' as ver "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		try {
		
		Action doc_action = new Action().find().andWhere("page","=","Listar_documentos").andWhere("application","=",2).one();
		
		Menu doc_menu = new Menu().find().andWhere("application","=",2).andWhere("descr","=", "Listar Documentos").one();

		if(doc_action == null && doc_menu == null) {
			
			Action doc_insert_action = new Action();
			doc_insert_action.setAction("index");
			doc_insert_action.setAction_descr("Listar Documentos");
			doc_insert_action.setIsComponent((short)1);
			doc_insert_action.setPackage_name("nosi.webapps.tutorial.pages");
			doc_insert_action.setPage_descr("Listar Documentos");
			doc_insert_action.setPage("Listar_documentos");
			doc_insert_action.setStatus(1);
			doc_insert_action.setTipo((short)1);
			doc_insert_action.setVersion("2.3");
			doc_insert_action.setXsl_src("tutorial/listar_documentos/Listar_documentos.xsl");	
			Application app_foreign = new Application().find().andWhere("dad","=","tutorial").one();
			doc_insert_action.setApplication(app_foreign);
			doc_insert_action.insert();
			
			Core.setMessageSuccess("Ação criada");
			
			
			Menu doc_insert_menu = new Menu();
			doc_insert_menu.setDescr("Listar Documentos");
			doc_insert_menu.setFlg_base(0);
			doc_insert_menu.setOrderby(39);
			doc_insert_menu.setStatus(1);
			doc_insert_menu.setTarget("_self");
			doc_insert_menu.setAction(doc_insert_action);
			doc_insert_menu.setApplication(app_foreign);
			doc_insert_menu.setMenu(doc_insert_menu);
			doc_insert_menu.insert();
			
			Core.setMessageSuccess("Menu criada");
			
			Profile doc_insert_perfil = new Profile();
			doc_insert_perfil.setType("MEN");
			doc_insert_perfil.setType_fk(doc_insert_menu.getId());
			Organization org_foreign = new Organization().find().andWhere("code","=","org.tutorial").one();
			doc_insert_perfil.setOrganization(org_foreign);
			ProfileType pf_type_foreign = new ProfileType().find().andWhere("code","=","perfil.tutorial").one();
			doc_insert_perfil.setProfileType(pf_type_foreign);
			doc_insert_perfil.setUser(Core.getCurrentUser());
			doc_insert_perfil.insert();
			
			Core.setMessageSuccess("Perfil Criado");
				
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		List<GeralApresentacao.Table_1> lista = new ArrayList<GeralApresentacao.Table_1>();
		
		GeralApresentacao.Table_1 obj = new GeralApresentacao.Table_1();
		
		obj.setDocumento("Import IGRP WEB");
		obj.setVer("https://nosicode.cv/index.php/pt/projetos/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/8-import-igrp-java");
		//obj.setVer_desc("Abrir");//does not work
	    
		GeralApresentacao.Table_1 obj1 = new GeralApresentacao.Table_1();
		obj1.setDocumento("Minha Primeira Aplicação IGRP WEB");
		obj1.setVer("https://nosicode.cv/index.php/pt/projetos/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/9-minha-primeira-aplicacao");
		//obj1.setVer_desc("Abrir");//does not work
		
		GeralApresentacao.Table_1 obj2 = new GeralApresentacao.Table_1();
		obj2.setDocumento("Guia do utilizador Perfil Developer – IGRP Studio");
		obj2.setVer("https://igrp.cv/index.php/desenvolver-3/guias-desenvolvimento");
		//obj2.setVer_desc("Abrir");//does not work
		
		GeralApresentacao.Table_1 obj3 = new GeralApresentacao.Table_1();
		obj3.setDocumento("Guia do utilizador Perfil Admin – IGRP Core");
		obj3.setVer("https://igrp.cv/index.php/aprender-3/guia-iniciantes");
		//obj3.setVer_desc("Abrir");//does not work
		
		lista.add(obj);
		lista.add(obj1);
		lista.add(obj2);
		lista.add(obj3);
		
		/*model.loadTable_1(Core.query("hibernate-igrp-core", "SELECT 'Import IGRP WEB' as documento, 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/8-import-igrp-java' as ver "
				+ " UNION SELECT 'Minha Primeira AplicaÃ§Ã£o IGRP WEB' as documento, "
				+ " 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/9-minha-primeira-aplicacao' as ver "));
		
		view.quickbuttonbox_gestao_url.setValue(new Config().getResolveUrl("tutorial","Video_gestao_de_aplicacao","index"));
		view.quickbuttonbox_instalar_url.setValue(new Config().getResolveUrl("tutorial","Video_instalar_igrp_web","index"));
		view.quickbuttonbox_my_first_url.setValue(new Config().getResolveUrl("tutorial","Video_my_first_app","index")); 
		*/
		
		model.setTable_1(lista);
		/*Specify your connection name in first parameter*/
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
