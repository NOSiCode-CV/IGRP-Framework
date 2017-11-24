/**
 * @author: Emanuel Pereira
 * 
 * Apr 20, 2017
 *
 *
 */
/*Create Controller*/

package nosi.webapps.igrp.pages.page;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import org.apache.commons.lang.StringEscapeUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.compiler.helpers.ErrorCompile;
import nosi.core.webapp.compiler.helpers.MapErrorCompile;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;
/*----#END-PRESERVED-AREA----*/

public class PageController extends Controller {		

	
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Page model = new Page();
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		if(id!=null){
			Action a = new Action();
			a = a.findOne(Integer.parseInt(id));
			if(a!=null){
				model.setAction_descr(a.getAction_descr());
				model.setEnv_fk(a.getApplication().getId());
				model.setP_action(a.getAction());
				model.setP_page_descr(a.getPage_descr());
				model.setPage(a.getPage());
				model.setP_id(a.getId());
				model.setP_version(a.getVersion());
				model.setP_xsl_src(a.getXsl_src());
				model.setP_status(a.getStatus());
			}
		}
		PageView view = new PageView(model);
		view.env_fk.setValue(new Application().getListApps());
		view.version.setValue(Config.getVersions());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEditar(@RParam(rParamName = "id")String id) throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		Page model = new Page();
		
		Action action = new Action();
		action = action.findOne(Integer.parseInt(id));
		
		model.setEnv_fk(action.getApplication().getId());
		model.setP_version(action.getVersion());
		model.setPage(action.getPage());
		model.setAction_descr(action.getPage_descr());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();
			Application app = new Application();
			action.setApplication(app.findOne(model.getEnv_fk()));
			action.setVersion(model.getVersion());
			action.setPage(model.getPage());
			if(!nosi.core.gui.page.Page.validatePage(action.getPage())){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING,FlashMessage.MESSAGE_ERROR_VALID_PAGE);
				return this.redirect("igrp", "page", "index", new String[]{"id"}, new String[]{action.getId() + ""});
			}
			action.setPage_descr(model.getAction_descr());
			action = action.update();
			if(action!=null)
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MESSAGE_ERROR);
			return this.redirect("igrp", "page", "editar", new String[]{"id"}, new String[]{action.getId() + ""});
		}
		
		PageView view = new PageView(model);
		
		view.env_fk.setValue(new Application().getListApps());
		view.version.setValue(Config.getVersions());
		view.sectionheader_1_text.setValue("Gestão de Página - Atualizar");
		view.btn_gravar.setLink("editar&id="+id);
		
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Page model = new Page();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();			
			Application app = new Application();
			Action action = new Action();
			action.setAction("index");
			action.setApplication(app.findOne(model.getEnv_fk()));
			action.setAction_descr(model.getAction_descr());
			action.setPage_descr(model.getAction_descr());
			action.setPage(nosi.core.gui.page.Page.getPageName(model.getPage()));
			if(!nosi.core.gui.page.Page.validatePage(action.getPage())){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, FlashMessage.WARNING_PAGE_INVALID);
				return this.forward("igrp", "page", "index");
			}
			action.setStatus(model.getP_status());
			action.setVersion(model.getVersion());
			action.setPackage_name("nosi.webapps."+action.getApplication().getDad().toLowerCase()+".pages."+action.getPage().toLowerCase());
			if(model.getP_id()!=0){
				action = action.update();
			}else{
				action = action.insert();
			}
			if(action!=null){
				String json = "{\"rows\":[{\"columns\":[{\"size\":\"col-md-12\",\"containers\":[]}]}],\"plsql\":{\"instance\":\"\",\"table\":\"\",\"package\":\"nosi.webapps."+action.getApplication().getDad().toLowerCase()+".pages\",\"html\":\""+action.getPage()+"\",\"replace\":false,\"label\":false,\"biztalk\":false,\"subversionpath\":\"\"},\"css\":\"\",\"js\":\"\"}";
				String path_xsl = Config.getBasePathXsl()+Config.getResolvePathXsl(action.getApplication().getDad(), action.getPage(), action.getVersion());		
				FileHelper.save(path_xsl, action.getPage()+".json", json);
				if(FileHelper.fileExists(Config.getWorkspace())){
					FileHelper.save(Config.getWorkspace()+"/WebContent/images"+"/"+"IGRP/IGRP"+action.getVersion()+"/app/"+action.getApplication().getDad().toLowerCase()+"/"+action.getPage().toLowerCase(),action.getPage()+".json",json);
				}
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MSG_SUCCESS);
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.MSG_ERROR);
				return this.forward("igrp", "page", "index");
			}
		}
		return this.redirect("igrp", "page", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEliminar() throws IOException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Action ac = new Action();
		if(ac.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MSG_SUCCESS);
		else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.MSG_ERROR);
		return this.redirect("igrp","lista-page","index");
		/*----#END-PRESERVED-AREA----*/
	}


	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	//Save page generated
	public Response actionSaveGenPage() throws IOException, ServletException{		
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id_objeto");
		Action ac = new Action().findOne(Integer.parseInt(p_id));
		String error = "";
		if(ac!=null){			
			Part fileJson = Igrp.getInstance().getRequest().getPart("p_data");
			Part fileXml = Igrp.getInstance().getRequest().getPart("p_page_xml");
			Part fileXsl = Igrp.getInstance().getRequest().getPart("p_page_xsl");
			Part fileModel = Igrp.getInstance().getRequest().getPart("p_model");
			Part fileView = Igrp.getInstance().getRequest().getPart("p_view");
			Part fileController = Igrp.getInstance().getRequest().getPart("p_controller");				
			String path_class = Igrp.getInstance().getRequest().getParameter("p_package").trim();
			path_class = path_class.replaceAll("(\r\n|\n)", "");
			path_class = path_class.replace(".",File.separator) + File.separator +ac.getPage().toLowerCase().trim();
			String path_xsl = Config.getBasePathXsl()+Config.getResolvePathXsl(ac.getApplication().getDad(), ac.getPage(), ac.getVersion());			
			String path_xsl_work_space = Config.getWorkspace()+File.separator+"WebContent"+File.separator+"images"+File.separator+"IGRP"+File.separator+"IGRP"+ac.getVersion()+File.separator+"app"+File.separator+ac.getApplication().getDad()+File.separator+ac.getPage().toLowerCase();			
			String path_class_work_space = Config.getWorkspace() + File.separator+"src"+File.separator+ path_class;
			path_class = Config.getBasePathClass()+ path_class;
			if(fileJson!=null && fileXml!=null && fileXsl!=null && fileModel!=null && fileView!=null && fileController!=null && path_xsl!=null && path_xsl!=""  && path_class!=null && path_class!=""){
				this.processJson(fileJson,ac);
				if(
						FileHelper.saveFilesJava(path_class, ac.getPage(), new Part[]{fileModel,fileView,fileController}) &&
						FileHelper.saveFilesPageConfig(path_xsl, ac.getPage(), new Part[]{fileXml,fileXsl,fileJson})
				){
					error += this.processCompile(path_class,ac.getPage());
					if(error.equals("")){//Check if not error on the compilation class
						error = new Gson().toJson(new MapErrorCompile("Compilação efetuada com sucesso", null));
						if(FileHelper.fileExists(Config.getWorkspace())){
							if(!FileHelper.fileExists(path_class_work_space)){//check directory
								FileHelper.createDiretory(path_class_work_space);//create directory if not exist
							}
							FileHelper.saveFilesJava(path_class_work_space, ac.getPage(), new Part[]{fileModel,fileView,fileController});
							FileHelper.saveFilesPageConfig(path_xsl_work_space, ac.getPage(), new Part[]{fileXml,fileXsl,fileJson});
						}
						ac.setId(Integer.parseInt(p_id));
						ac.setXsl_src(ac.getApplication().getDad().toLowerCase()+"/"+ac.getPage().toLowerCase()+"/"+ac.getPage()+".xsl");
						ac.update();
						this.deleteFilesInMemory(new Part[]{fileModel,fileView,fileController});
						return this.renderView("<messages><message type=\"success\">Operacao efectuada com sucesso: "+StringEscapeUtils.escapeXml(error)+"</message></messages>");
					}
				}
			}
			this.deleteFilesInMemory(new Part[]{fileModel,fileView,fileController});
		}
		return this.renderView("<messages><message type=\"error\">Operacao falhada: "+StringEscapeUtils.escapeXml(error)+"</message></messages>");
	}
	
	
	private void deleteFilesInMemory(Part[] content) throws IOException {
		FileHelper.deletePartFile(content[0]);
		FileHelper.deletePartFile(content[1]);
		FileHelper.deletePartFile(content[2]);
	}

	private String processCompile(String path_class, String page) {
		String errors = "";
		path_class = path_class+File.separator;
		File[] files = new File[]{new File(path_class+page+".java"),new File(path_class+page+"View.java"),new File(path_class+page+"Controller.java")};
		Compiler compiler = new Compiler();
    	try {
			if(!compiler.compile(files)){			
				Map<String, List<ErrorCompile>> er = compiler.getErrors().stream()
				        .collect(Collectors.groupingBy(ErrorCompile::getFileName));
				errors = new Gson().toJson(new MapErrorCompile("Falha na compila��o", er));
			}
		} catch (IOException | URISyntaxException e) {
			e.printStackTrace();
		}
		return errors;
	}

	//Read json and extract transactions
	private void processJson(Part fileJson,Action ac) throws IOException {
		if(fileJson!=null){
			JSONObject objJson;
			try {
				objJson = new JSONObject(FileHelper.convertToString(fileJson));
				JSONArray rows = objJson.getJSONArray("rows");				
				for(int i=0;i<rows.length();i++){
					JSONArray collumns;
					try{
						collumns = rows.getJSONObject(i).getJSONArray("columns");
						for(int j=0;j<collumns.length();j++){
							JSONArray containers;
							try{
								containers = collumns.getJSONObject(j).getJSONArray("containers");
								for(int h=0;h<containers.length();h++){
									JSONArray fields;
									try{
										fields = containers.getJSONObject(h).getJSONArray("fields");
										this.processTransactions(fields,ac);
									}catch (JSONException e) {
									}
									JSONArray contextMenu;
									try{
										contextMenu = containers.getJSONObject(h).getJSONArray("contextMenu");
										this.processTransactions(contextMenu,ac);
									}catch (JSONException e) {
									}
								}
							}catch (JSONException e) {
							}
						}
					}catch (JSONException e) {
					}
				}	
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}
	
	//Extract transactions
	private void processTransactions(JSONArray fields,Action ac) {
		for(int i=0;i<fields.length();i++){
			JSONObject p;
			try{
				p = fields.getJSONObject(i).getJSONObject("properties");
				try{
					if(p.get("transaction")!=null && p.get("transaction").toString().equals("true")){
						this.saveTransaction(p.get("name").toString(),p.get("label").toString(),p.get("action").toString(),p.get("tag").toString(),ac);
					}
				}catch (JSONException e) {
				}
			}catch (JSONException e) {
			}
		}
	}

	//Save transactions
	private void saveTransaction(String name, String label, String action, String tag,Action ac) {
		if(ac!=null && name!=null && tag!=null){
			Transaction t = new Transaction();
			String code = ac.getApplication().getDad().toLowerCase()+"_"+ac.getPage()+"_"+tag;
			t = t.find().andWhere("code", "=", code).one();
			if(t==null){
				t = new Transaction(code, label, 1, ac.getApplication());
				t = t.insert();
			}
		}
	}

	public void actionPublishGenPage() throws IOException{
		
	}

	//list all page of an application
	public Response actionListPage() throws IOException{
		String p_dad = Igrp.getInstance().getRequest().getParameter("amp;p_dad");
		String json = "[";
		Action a = new Action();
		List<Action> actions = a.findAll(a.getCriteria().where(
					a.getBuilder().equal(a.getRoot().join("application").get("dad"), p_dad)
				));
		if(actions!=null){
			for(Action ac:actions){
				json += "{";
				json += "\"action\":\""+ac.getAction() +"\",";
				json += "\"app\":\""+ac.getApplication().getDad() +"\",";
				json += "\"page\":\""+ac.getPage() +"\",";
				json += "\"id\":\""+ac.getId() +"\",";
				json += "\"description\":\""+(ac.getPage_descr()!=null?ac.getPage_descr():ac.getPage()) +"\",";
				json += "\"link\":\""+Config.getResolvePathXsl(ac.getApplication().getDad(), ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".xsl\"";
				json += "},";
			}
		}
		json = json.substring(0, json.length()-1);
		json += "]";
		this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}
	
	//get detail page
	public Response actionDetailPage() throws IOException{
		String p_id = Igrp.getInstance().getRequest().getParameter("amp;p_id");		
		Action ac = new Action().findOne(Integer.parseInt(p_id));		
		String json = "{";
		if(ac!=null){
				json += "\"action\":\""+ac.getAction() +"\",";
				json += "\"action_descr\":\""+ac.getAction_descr() +"\",";
				json += "\"app\":\""+ac.getApplication().getDad() +"\",";
				json += "\"page\":\""+ac.getPage() +"\",";
				json += "\"id\":\""+ac.getId() +"\",";
				json += "\"filename\":\""+Config.getResolvePathXsl(ac.getApplication().getDad(), ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".xsl\",";
				json += "\"page_descr\":\""+ac.getPage_descr() +"\"";
			}
		json += "}";
		this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}
	
	public Response actionImageList() throws IOException{
		String param = Igrp.getInstance().getRequest().getParameter("amp;name");
		String menu = "";
		if(param == "menu"){
			menu = "[\"themes/default/img/icon/menu/CVM_agente.png\",\"themes/default/img/icon/menu/CVM_cell.png\",\"themes/default/img/icon/menu/CVM_data.png\",\"themes/default/img/icon/menu/CVM_gestor_agente.png\",\"themes/default/img/icon/menu/CVM_pontos_venda.png\",\"themes/default/img/icon/menu/CVM_spots.png\",\"themes/default/img/icon/menu/CVM_torre.png\",\"themes/default/img/icon/menu/Minhas_tarefas.png\",\"themes/default/img/icon/menu/Registo_distribuicao.png\",\"themes/default/img/icon/menu/Registo_extracao.png\",\"themes/default/img/icon/menu/Tarefas_concluidas.png\",\"themes/default/img/icon/menu/abono.png\",\"themes/default/img/icon/menu/accao_topologia.png\",\"themes/default/img/icon/menu/alerta.png\",\"themes/default/img/icon/menu/alteracao_PIN.png\",\"themes/default/img/icon/menu/autotanque.png\",\"themes/default/img/icon/menu/bancos.png\",\"themes/default/img/icon/menu/basemaps.png\",\"themes/default/img/icon/menu/bloco_notas_privado.png\",\"themes/default/img/icon/menu/bonificados.png\",\"themes/default/img/icon/menu/cabimento.png\",\"themes/default/img/icon/menu/clientes.png\",\"themes/default/img/icon/menu/colocacoes.png\",\"themes/default/img/icon/menu/componentes.png\",\"themes/default/img/icon/menu/condecoracao.png\",\"themes/default/img/icon/menu/confirmacao_PIN.png\",\"themes/default/img/icon/menu/consultas.png\",\"themes/default/img/icon/menu/conta-corrente.png\",\"themes/default/img/icon/menu/conteudos.png\",\"themes/default/img/icon/menu/context_menu.png\",\"themes/default/img/icon/menu/contrato.png\",\"themes/default/img/icon/menu/contribuicoes.png\",\"themes/default/img/icon/menu/descendentes.png\",\"themes/default/img/icon/menu/desenpenho.png\",\"themes/default/img/icon/menu/dessalinizadora.png\",\"themes/default/img/icon/menu/dique_1.png\",\"themes/default/img/icon/menu/disponibilidade.png\",\"themes/default/img/icon/menu/dividas.png\",\"themes/default/img/icon/menu/documentos.png\",\"themes/default/img/icon/menu/duplicar.png\",\"themes/default/img/icon/menu/enquadramento.png\",\"themes/default/img/icon/menu/espelhos.png\",\"themes/default/img/icon/menu/est.especies.png\",\"themes/default/img/icon/menu/est.fiscalizacao.png\",\"themes/default/img/icon/menu/estabelecimento.png\",\"themes/default/img/icon/menu/estast.performance-global.png\",\"themes/default/img/icon/menu/estatistica-bonificados.png\",\"themes/default/img/icon/menu/estatistica-financeira.png\",\"themes/default/img/icon/menu/estatistica.png\",\"themes/default/img/icon/menu/estatistica_contratos.png\",\"themes/default/img/icon/menu/etapas.png\",\"themes/default/img/icon/menu/exames.png\",\"themes/default/img/icon/menu/fim.png\",\"themes/default/img/icon/menu/flag_eng.png\",\"themes/default/img/icon/menu/flag_france.png\",\"themes/default/img/icon/menu/flg_port.png\",\"themes/default/img/icon/menu/fotografias.png\",\"themes/default/img/icon/menu/historico.png\",\"themes/default/img/icon/menu/historico_clinico.png\",\"themes/default/img/icon/menu/identificacao-.png\",\"themes/default/img/icon/menu/identificacao.png\",\"themes/default/img/icon/menu/idioma.png\",\"themes/default/img/icon/menu/info-menu-.png\",\"themes/default/img/icon/menu/info-menu.png\",\"themes/default/img/icon/menu/iniciar.png\",\"themes/default/img/icon/menu/internamento.png\",\"themes/default/img/icon/menu/investidores.png\",\"themes/default/img/icon/menu/layers.png\",\"themes/default/img/icon/menu/legenda.png\",\"themes/default/img/icon/menu/m_BAU.png\",\"themes/default/img/icon/menu/m_alerta_caducidade.png\",\"themes/default/img/icon/menu/m_alerta_prazos_.png\",\"themes/default/img/icon/menu/m_caixas.png\",\"themes/default/img/icon/menu/m_calendario.png\",\"themes/default/img/icon/menu/m_categoria.png\",\"themes/default/img/icon/menu/m_classificacao.png\",\"themes/default/img/icon/menu/m_empresa.png\",\"themes/default/img/icon/menu/m_empresa_.png\",\"themes/default/img/icon/menu/m_error.png\",\"themes/default/img/icon/menu/m_especies.png\",\"themes/default/img/icon/menu/m_est.licenca.png\",\"themes/default/img/icon/menu/m_est.trofeus.png\",\"themes/default/img/icon/menu/m_fiscalizacao.png\",\"themes/default/img/icon/menu/m_fontenario.png\",\"themes/default/img/icon/menu/m_frequencia_estimativa.png\",\"themes/default/img/icon/menu/m_furos.png\",\"themes/default/img/icon/menu/m_gerencia.png\",\"themes/default/img/icon/menu/m_guia.png\",\"themes/default/img/icon/menu/m_integracao.png\",\"themes/default/img/icon/menu/m_licenca.png\",\"themes/default/img/icon/menu/m_licenca_ambiental.png\",\"themes/default/img/icon/menu/m_lista.png\",\"themes/default/img/icon/menu/m_mapa.png\",\"themes/default/img/icon/menu/m_material.png\",\"themes/default/img/icon/menu/m_movimentos.png\",\"themes/default/img/icon/menu/m_outras-licencas.png\",\"themes/default/img/icon/menu/m_pesquisa_licenca_.png\",\"themes/default/img/icon/menu/m_pesquisa_mapa.png\",\"themes/default/img/icon/menu/m_pesquisa_projecto.png\",\"themes/default/img/icon/menu/m_ponto.fscalizacao.png\",\"themes/default/img/icon/menu/m_proj_investimento.png\",\"themes/default/img/icon/menu/m_reservatorio.png\",\"themes/default/img/icon/menu/m_taxas.png\",\"themes/default/img/icon/menu/m_transportes.png\",\"themes/default/img/icon/menu/m_trofeus.png\",\"themes/default/img/icon/menu/mapa_menu.png\",\"themes/default/img/icon/menu/marcacoes.png\",\"themes/default/img/icon/menu/menu_lista.png\",\"themes/default/img/icon/menu/meta-type.png\",\"themes/default/img/icon/menu/morada.png\",\"themes/default/img/icon/menu/movimentos.png\",\"themes/default/img/icon/menu/nascente.png\",\"themes/default/img/icon/menu/nivel_habilitacao.png\",\"themes/default/img/icon/menu/notas.png\",\"themes/default/img/icon/menu/notificacoes-.png\",\"themes/default/img/icon/menu/notificacoes.png\",\"themes/default/img/icon/menu/obitos.png\",\"themes/default/img/icon/menu/observacoes.png\",\"themes/default/img/icon/menu/origem.png\",\"themes/default/img/icon/menu/outdoor-menu.png\",\"themes/default/img/icon/menu/partilhados.png\",\"themes/default/img/icon/menu/partilhar.png\",\"themes/default/img/icon/menu/penas.png\",\"themes/default/img/icon/menu/perda_bonificacao.png\",\"themes/default/img/icon/menu/perda_bonificacao_2.png\",\"themes/default/img/icon/menu/permissao.png\",\"themes/default/img/icon/menu/pino_amarelo-(digital).png\",\"themes/default/img/icon/menu/pino_amarelo.png\",\"themes/default/img/icon/menu/pino_preto-(digital).png\",\"themes/default/img/icon/menu/pino_preto.png\",\"themes/default/img/icon/menu/pino_verde-(digital).png\",\"themes/default/img/icon/menu/pino_verde.png\",\"themes/default/img/icon/menu/pino_vermelho-(digital).png\",\"themes/default/img/icon/menu/pino_vermelho.png\",\"themes/default/img/icon/menu/pino_vermelho_ponto-preto-(digital).png\",\"themes/default/img/icon/menu/pino_vermelho_ponto-preto.png\",\"themes/default/img/icon/menu/poco_1.png\",\"themes/default/img/icon/menu/poco_2.png\",\"themes/default/img/icon/menu/poco_3.png\",\"themes/default/img/icon/menu/prestacoes.png\",\"themes/default/img/icon/menu/processos.png\",\"themes/default/img/icon/menu/qualidade_agua2.png\",\"themes/default/img/icon/menu/qualidade_agua4.png\",\"themes/default/img/icon/menu/regime_trab.png\",\"themes/default/img/icon/menu/registos_ligacao.png\",\"themes/default/img/icon/menu/registos_tratamento.png\",\"themes/default/img/icon/menu/regras_topologia.png\",\"themes/default/img/icon/menu/reinicializacao_PIN.png\",\"themes/default/img/icon/menu/renovacoes.png\",\"themes/default/img/icon/menu/retiradas.png\",\"themes/default/img/icon/menu/saneamento_ETAR_.png\",\"themes/default/img/icon/menu/saneamento_UDR.png\",\"themes/default/img/icon/menu/saneamento_reg_equip_recolha.png\",\"themes/default/img/icon/menu/saneamento_reg_recolha.png\",\"themes/default/img/icon/menu/saneamento_tratamento_residuos.png\",\"themes/default/img/icon/menu/seg_social.png\",\"themes/default/img/icon/menu/seguros.png\",\"themes/default/img/icon/menu/sis_abastecimento.png\",\"themes/default/img/icon/menu/sis_abastecimento2.png\",\"themes/default/img/icon/menu/sis_abastecimento3.png\",\"themes/default/img/icon/menu/sis_abastecimento4.png\",\"themes/default/img/icon/menu/tarefas.png\",\"themes/default/img/icon/menu/tarefas_pendentes.png\",\"themes/default/img/icon/menu/taxas.png\",\"themes/default/img/icon/menu/tema.png\",\"themes/default/img/icon/menu/tipo_cor.png\",\"themes/default/img/icon/menu/tipo_energia.png\",\"themes/default/img/icon/menu/tipo_equipamento.png\",\"themes/default/img/icon/menu/tipo_identificacao.png\",\"themes/default/img/icon/menu/tipo_tratamento.png\",\"themes/default/img/icon/menu/tipos.png\",\"themes/default/img/icon/menu/tratamento.png\",\"themes/default/img/icon/menu/tratamento_residuos.png\",\"themes/default/img/icon/menu/tratamento_residuos2.png\",\"themes/default/img/icon/menu/ultimas_consultas.png\",\"themes/default/img/icon/menu/ultimos_exames.png\",\"themes/default/img/icon/menu/ultimos_internamentos.png\"]";
		}else{
			menu = "[\"themes/default/img/icon/tools-bar/Book_phones.png\",\"themes/default/img/icon/tools-bar/Folha_C.png\",\"themes/default/img/icon/tools-bar/Folha_F.png\",\"themes/default/img/icon/tools-bar/Folha_M.png\",\"themes/default/img/icon/tools-bar/Folha_RC.png\",\"themes/default/img/icon/tools-bar/Folha_RF.png\",\"themes/default/img/icon/tools-bar/Folha_S.png\",\"themes/default/img/icon/tools-bar/PDF_C.png\",\"themes/default/img/icon/tools-bar/PDF_F.png\",\"themes/default/img/icon/tools-bar/PDF_M-.png\",\"themes/default/img/icon/tools-bar/PDF_M.png\",\"themes/default/img/icon/tools-bar/PDF_RC.png\",\"themes/default/img/icon/tools-bar/PDF_RF.png\",\"themes/default/img/icon/tools-bar/PDF_S.png\",\"themes/default/img/icon/tools-bar/activar.png\",\"themes/default/img/icon/tools-bar/add-temp.png\",\"themes/default/img/icon/tools-bar/add.png\",\"themes/default/img/icon/tools-bar/alterar-assinatura.png\",\"themes/default/img/icon/tools-bar/alterar-digital.png\",\"themes/default/img/icon/tools-bar/alterar-foto.png\",\"themes/default/img/icon/tools-bar/apply.png\",\"themes/default/img/icon/tools-bar/assumir_tarefas.png\",\"themes/default/img/icon/tools-bar/avaliar.png\",\"themes/default/img/icon/tools-bar/back.png\",\"themes/default/img/icon/tools-bar/balcoes.png\",\"themes/default/img/icon/tools-bar/calendario.png\",\"themes/default/img/icon/tools-bar/cancel.png\",\"themes/default/img/icon/tools-bar/circulo.png\",\"themes/default/img/icon/tools-bar/clientes_tb.png\",\"themes/default/img/icon/tools-bar/close.png\",\"themes/default/img/icon/tools-bar/contas.png\",\"themes/default/img/icon/tools-bar/contrato_tb.png\",\"themes/default/img/icon/tools-bar/ctx-acount.png\",\"themes/default/img/icon/tools-bar/ctx-attachment.png\",\"themes/default/img/icon/tools-bar/ctx-close.png\",\"themes/default/img/icon/tools-bar/ctx-delete.png\",\"themes/default/img/icon/tools-bar/ctx-demote.png\",\"themes/default/img/icon/tools-bar/ctx-details.png\",\"themes/default/img/icon/tools-bar/ctx-payment.png\",\"themes/default/img/icon/tools-bar/ctx_benefic.png\",\"themes/default/img/icon/tools-bar/ctx_disponive.png\",\"themes/default/img/icon/tools-bar/ctx_documents.png\",\"themes/default/img/icon/tools-bar/ctx_family.png\",\"themes/default/img/icon/tools-bar/ctx_group.png\",\"themes/default/img/icon/tools-bar/ctx_house.png\",\"themes/default/img/icon/tools-bar/ctx_info.png\",\"themes/default/img/icon/tools-bar/ctx_mudar_prop.png\",\"themes/default/img/icon/tools-bar/ctx_process.png\",\"themes/default/img/icon/tools-bar/ctx_selecionado.png\",\"themes/default/img/icon/tools-bar/ctx_text_list.png\",\"themes/default/img/icon/tools-bar/delete.png\",\"themes/default/img/icon/tools-bar/desativar.png\",\"themes/default/img/icon/tools-bar/disable.png\",\"themes/default/img/icon/tools-bar/distribuir.png\",\"themes/default/img/icon/tools-bar/document-excel.png\",\"themes/default/img/icon/tools-bar/document-pdf.png\",\"themes/default/img/icon/tools-bar/down.png\",\"themes/default/img/icon/tools-bar/edit.png\",\"themes/default/img/icon/tools-bar/emitir_factura.png\",\"themes/default/img/icon/tools-bar/enable.png\",\"themes/default/img/icon/tools-bar/entrar.png\",\"themes/default/img/icon/tools-bar/enviar_notificacoes.png\",\"themes/default/img/icon/tools-bar/enviar_roxo.png\",\"themes/default/img/icon/tools-bar/enviar_verde.png\",\"themes/default/img/icon/tools-bar/error.png\",\"themes/default/img/icon/tools-bar/et-add.png\",\"themes/default/img/icon/tools-bar/excel.png\",\"themes/default/img/icon/tools-bar/exportar.png\",\"themes/default/img/icon/tools-bar/familiares.png\",\"themes/default/img/icon/tools-bar/filtro.png\",\"themes/default/img/icon/tools-bar/fim.png\",\"themes/default/img/icon/tools-bar/gerencia.png\",\"themes/default/img/icon/tools-bar/grosso.png\",\"themes/default/img/icon/tools-bar/help.png\",\"themes/default/img/icon/tools-bar/imagem.png\",\"themes/default/img/icon/tools-bar/importar.png\",\"themes/default/img/icon/tools-bar/indutria.png\",\"themes/default/img/icon/tools-bar/iniciar_processo.png\",\"themes/default/img/icon/tools-bar/invoice.png\",\"themes/default/img/icon/tools-bar/keepass.png\",\"themes/default/img/icon/tools-bar/key__pencil.png\",\"themes/default/img/icon/tools-bar/key_arrow.png\",\"themes/default/img/icon/tools-bar/key_delete.png\",\"themes/default/img/icon/tools-bar/key_go.png\",\"themes/default/img/icon/tools-bar/key_plus.png\",\"themes/default/img/icon/tools-bar/keys.png\",\"themes/default/img/icon/tools-bar/liberar_tarefa.png\",\"themes/default/img/icon/tools-bar/lista.png\",\"themes/default/img/icon/tools-bar/mail.png\",\"themes/default/img/icon/tools-bar/mapa.png\",\"themes/default/img/icon/tools-bar/modulos.png\",\"themes/default/img/icon/tools-bar/mostrar.png\",\"themes/default/img/icon/tools-bar/new_modulo.png\",\"themes/default/img/icon/tools-bar/new_page.png\",\"themes/default/img/icon/tools-bar/next.png\",\"themes/default/img/icon/tools-bar/novo_cliente.png\",\"themes/default/img/icon/tools-bar/novo_contrato.png\",\"themes/default/img/icon/tools-bar/ocultar.png\",\"themes/default/img/icon/tools-bar/pagar.png\",\"themes/default/img/icon/tools-bar/pdf.png\",\"themes/default/img/icon/tools-bar/percentage.png\",\"themes/default/img/icon/tools-bar/perda_bonificacao.png\",\"themes/default/img/icon/tools-bar/preview.png\",\"themes/default/img/icon/tools-bar/print.png\",\"themes/default/img/icon/tools-bar/printer.png\",\"themes/default/img/icon/tools-bar/publish.png\",\"themes/default/img/icon/tools-bar/reenviar_notficacoes.png\",\"themes/default/img/icon/tools-bar/refresh.png\",\"themes/default/img/icon/tools-bar/regularizar.png\",\"themes/default/img/icon/tools-bar/retalho.png\",\"themes/default/img/icon/tools-bar/save.png\",\"themes/default/img/icon/tools-bar/search.png\",\"themes/default/img/icon/tools-bar/self-service.png\",\"themes/default/img/icon/tools-bar/send.png\",\"themes/default/img/icon/tools-bar/sitemap.png\",\"themes/default/img/icon/tools-bar/sms.png\",\"themes/default/img/icon/tools-bar/start.png\",\"themes/default/img/icon/tools-bar/switch.png\",\"themes/default/img/icon/tools-bar/tab.png\",\"themes/default/img/icon/tools-bar/tb_acercar.png\",\"themes/default/img/icon/tools-bar/tb_agregado-seriado.png\",\"themes/default/img/icon/tools-bar/tb_agregado-trocar.png\",\"themes/default/img/icon/tools-bar/tb_apartment.png\",\"themes/default/img/icon/tools-bar/tb_building.png\",\"themes/default/img/icon/tools-bar/tb_caderno.png\",\"themes/default/img/icon/tools-bar/tb_categoria.png\",\"themes/default/img/icon/tools-bar/tb_classification.png\",\"themes/default/img/icon/tools-bar/tb_close.png\",\"themes/default/img/icon/tools-bar/tb_community-equipment.png\",\"themes/default/img/icon/tools-bar/tb_distanciar.png\",\"themes/default/img/icon/tools-bar/tb_document.png\",\"themes/default/img/icon/tools-bar/tb_entrega_cartao.png\",\"themes/default/img/icon/tools-bar/tb_evaluation.png\",\"themes/default/img/icon/tools-bar/tb_habitacao.png\",\"themes/default/img/icon/tools-bar/tb_historico.png\",\"themes/default/img/icon/tools-bar/tb_housing-complex.png\",\"themes/default/img/icon/tools-bar/tb_imoveis.png\",\"themes/default/img/icon/tools-bar/tb_janela-dupla.png\",\"themes/default/img/icon/tools-bar/tb_licenca.png\",\"themes/default/img/icon/tools-bar/tb_link.png\",\"themes/default/img/icon/tools-bar/tb_lista.png\",\"themes/default/img/icon/tools-bar/tb_livrete.png\",\"themes/default/img/icon/tools-bar/tb_market.png\",\"themes/default/img/icon/tools-bar/tb_medir.png\",\"themes/default/img/icon/tools-bar/tb_medir_area.png\",\"themes/default/img/icon/tools-bar/tb_observacoes.png\",\"themes/default/img/icon/tools-bar/tb_print_actualizar.png\",\"themes/default/img/icon/tools-bar/tb_processos.png\",\"themes/default/img/icon/tools-bar/tb_refresh.png\",\"themes/default/img/icon/tools-bar/tb_search_land.png\",\"themes/default/img/icon/tools-bar/tb_statistically.png\",\"themes/default/img/icon/tools-bar/tb_vista-anterior.png\",\"themes/default/img/icon/tools-bar/tb_vista-inicial.png\",\"themes/default/img/icon/tools-bar/tb_zoom-janela.png\",\"themes/default/img/icon/tools-bar/transferir.png\",\"themes/default/img/icon/tools-bar/turismo.png\",\"themes/default/img/icon/tools-bar/view.png\"]";
		}
		this.format = Response.FORMAT_JSON;
		return this.renderView(menu);
	}
	
	//Extracting reserve code inserted by programmer
	public Response actionPreserveUrl() throws IOException{
		String type = Igrp.getInstance().getRequest().getParameter("type");
		String page = Igrp.getInstance().getRequest().getParameter("page");
		String app = Igrp.getInstance().getRequest().getParameter("app");
		String ac = Igrp.getInstance().getRequest().getParameter("ac");
		String your_code = "";
		if(type!=null && page!=null && app!=null && !page.equals("") && !app.equals("") && !type.equals("")){
			String controller = this.getPageController(app,page);
			if(controller!=null){
				if(type.equals("c_import")){
					int start = controller.indexOf(Config.getStartReseveCodeAction("PACKAGES_IMPORT"));
					int end = controller.indexOf(Config.getEndReserveCode());
					your_code = (start!=-1 && end!=-1)?controller.substring(start+Config.getStartReseveCodeAction("PACKAGES_IMPORT").length(), end):"";
				}else if(type.equals("c_actions")){
					int start = controller.indexOf(Config.getStartReseveCodeAction("CUSTOM_ACTIONS"));
					int end =  start!=-1? controller.indexOf(Config.getEndReserveCode(),start):-1;
					your_code = (start!=-1 && end!=-1)?controller.substring(start+Config.getStartReseveCodeAction("CUSTOM_ACTIONS").length(),end):"";
				}else if(ac!=null && !ac.equals("") && type.equals("c_on_action")){
					String actionName = "action"+ac;
					int start_ = controller.indexOf(actionName);
					int start = start_!=-1?controller.indexOf(Config.getStartReseveCodeAction(ac),start_):-1;
					int end = start!=-1?controller.indexOf(Config.getEndReserveCode(),start):-1;
					your_code = (start!=-1 && start_!=-1 && end!=-1)?controller.substring(start+Config.getStartReseveCodeAction(ac).length(), end):"";
				}else if(ac!=null && !ac.equals("") && type.equals("exception_after_action")){
					String actionName = "action"+ac;
					int start_ = controller.indexOf(actionName);
					int start = controller.indexOf(")",start_);
					int end = start!=-1?controller.indexOf("{",start):-1;
					your_code = (start_!=-1 && start!=-1 && end!=-1)?controller.substring(start+")".length(), end):"";
				}
			}
		}
		your_code = StringEscapeUtils.escapeXml(your_code);
		return this.renderView("<your_code>"+your_code+"</your_code>");
	}
	
	private String getPageController(String app,String page) {
		String workspace = Config.getWorkspace()+"/src/nosi/webapps/"+app.toLowerCase()+"/pages/"+page.toLowerCase();
		String controller = null;
		if(FileHelper.dirExists(workspace)){
			controller = FileHelper.readFile(workspace, page+"Controller.java");
		}
		else{
			workspace = Config.getBasePathClass()+"nosi/webapps/"+app.toLowerCase()+"/pages/"+page.toLowerCase();
			if(FileHelper.fileExists(workspace+page+"Controller.java")){
				controller = FileHelper.readFile(workspace, page+"Controller.java");
			}
		}
		return controller;
	}

	public void actionListService(){
		
	}
	
	//View page with xml
	public Response actionVisualizar() throws IOException{
		String p_id = Igrp.getInstance().getRequest().getParameter("id");
		Action ac = new Action().findOne(Integer.parseInt(p_id));	
		if(ac!=null){			
			String content = FileHelper.readFileFromServer(Config.getResolvePathXsl(ac),ac.getPage()+".xml");
			return this.renderView(content);
		}
		return null;
	}
	
	//For Editor
	public Response actionMetodosCore(){
		List<Map<String,List<String>>> metodos = new ArrayList<>();
		for(Method method:Core.class.getDeclaredMethods()){
			Map<String,List<String>> m = new HashMap<>();
			List<String> mm = new ArrayList<>();
				for(Parameter param:method.getParameters()){
					mm.add(param.getName());
				}
			m.put(method.getName(), mm);
			metodos.add(m);
		}
		this.format = Response.FORMAT_JSON;
		return this.renderView(new Gson().toJson(metodos));
	}
	
	
	public Response actionListDomains() throws IOException{
	 	String json = "{\"list\":[\"7M_CATEGORIAS\",\"ACL_ELEMENT\",\"ACOMP_ENT\",\"ACOMP_EST_PROD\",\"ALIENACAO_FOGO\",\"ALINHAMENTO\",\"ALTERAR NOTA\",\"ALT_MTR_CM\",\"ALT_PRD_CM\",\"ALT_VEL_INV\",\"AMBEINTE\",\"AMBIENTE\",\"AM_FAMILY_ASSET\",\"AM_MANDATORY\",\"AM_PORT_TYPE\",\"AM_RACK_SPEC\",\"AM_STATUS\",\"AM_TIPO_SPEC\",\"ANEXO_EXPEDIENTE\",\"ANO\",\"AREA_DETALHE\",\"ARFA_SETOR\",\"ARFA_TP_DIPLOMA\",\"ARM_FINANCIADOR\",\"ARM_PRIORIDADE\",\"ARM_USO\",\"ASSOCIAR\",\"ASSOC_NEGOCIOS\",\"AVALIA CONVITE\",\"AVALIAÃƒâ€¡ÃƒÆ’O ATRIBUÃƒï¿½DA\",\"AVAL_OBRA\",\"AVD_ACEITAR\",\"AVD_COMPETENCIA\",\"AVD_DIMENSAO\",\"AVD_GRAFICO\",\"AVD_HORA\",\"AVD_METRICAS\",\"AVD_TIP_AVA\",\"BANCO\",\"BUSS_AREA\",\"BUS_AR\",\"CAB_DEC\",\"CAD_ALTIMETRIA\",\"CAD_DESPACHO\",\"CAD_ESTADO\",\"CAD_PARECER\",\"CAD_PONTOS\",\"CAD_TIPO_CLAIM\",\"CAD_TP_STATUS\",\"CAPITALIZAÃƒâ€¡ÃƒÆ’O\",\"CARLOS_CATEGORIA\",\"CARLOS_LOCALIDADE\",\"CARLOS_STATUS\",\"CATEGORY_TYPE\",\"CAT_AREA_NEG\",\"CAT_CATEG_PRODUTO\",\"CAT_ESTADO\",\"CAT_EST_PROJ\",\"CAT_FUNCAO\",\"CAT_NIVEL_ACESSO\",\"CAT_NIVEL_ESCOLAR\",\"CAT_OBJECTO\",\"CAT_ORIG_CLI\",\"CAT_ORIG_REC\",\"CAT_TP_CLIENTE\",\"CAT_TP_DOC\",\"CAT_TP_INTERVENCAO\",\"CAT_TP_OBS\",\"CHART_TYPE\",\"CLONE_OPTION\",\"CLONE_OPTION_ACT\",\"CODE_PEDIDO\",\"CODE_PERFIL\",\"CONDITION\",\"CONTINENTE\",\"CONTR_TP_DEBITO\",\"CON_EXT_ESTADO\",\"COR\",\"CUSTA_BENEFICIARIO\",\"CUSTA_TP_NATUREZA\",\"DATA_SOURCE\",\"DECISAO\",\"DECLARACAO_FISCAL\",\"DEMO\",\"DEMO_DEMO_IGRP\",\"DESTINO_OBRA\",\"DGESC - GRAU EQUIVALÃƒÅ NCIA\",\"DM_MEIO_PAG\",\"DM_N_INSCRITO\",\"DM_PARECER\",\"DM_TP_FILTRO\",\"DM_TP_HIST_LAB\",\"DM_TP_MUDANCA\",\"DOC_MNEC\",\"DOC_STATUS\",\"D_ABONO\",\"D_ARM_ARMAZEM\",\"D_ARM_ESTADO_INVENTARIO\",\"D_ARM_ESTADO_REG\",\"D_ARM_FINANCIADOR\",\"D_ARM_MARCA\",\"D_ARM_MOEDA\",\"D_ARM_SIM_NAO\",\"D_ARM_TP_MOVIMENTO\",\"D_ARM_TP_PRODUTO\",\"D_CATEGORY_TYPE\",\"D_CLASS_TYPE\",\"D_COMPTBLDD\",\"D_CONTRIBUINTE\",\"D_DESPACHO\",\"D_MEIO_PAGAMENTO\",\"D_MOMENTO_COBRANCA\",\"D_PARECER\",\"D_PRIORIDADE\",\"D_REGIME_BENS\",\"D_RNI_ESTADO_CIVIL\",\"D_RNI_ORGAO\",\"D_RNI_TP_DOC\",\"D_SNC_ENTIDADE\",\"D_TIPO_PASSAPORTE\",\"D_TIPO_URGENCIA_PASS\",\"D_USO\",\"ECRAN_DETAILS\",\"ECRAN_DET_INFO\",\"ECRAN_DET_REGRA\",\"ECRAN_DET_VALID\",\"EDUGLOBAL - MENU\",\"EFECTIVO\",\"EFEITO_FORM\",\"ENT_APROVACAO\",\"ENV_DETAILS\",\"EQUIV_DOC\",\"ESTADO\",\"ESTADO ASSOC\",\"ESTADO_AGENDA\",\"ESTADO_APROVACAO_FATURA\",\"ESTADO_CABIMENTO_FATURA\",\"ESTADO_CLAIM\",\"ESTADO_CONFLITO\",\"ESTADO_FATURA\",\"ESTADO_FATURA_APROVA\",\"ESTADO_INVENTARIO\",\"ESTADO_MOBILIDADE\",\"ESTADO_PARTY\",\"ESTADO_PGTO\",\"ESTADO_REGISTO\",\"EST_PROJ\",\"EVEN_ESTADO\",\"EVEN_T_AREA\",\"EVEN_T_CATEGORY\",\"EVEN_T_MUNICIP\",\"EVEN_T_RECURSO\",\"EXTENSAO\",\"FASE_PROC_TOPO\",\"FATURA_ACOMPANHAMENTO\",\"FINANCIADOR\",\"FISC_CM_RESULT\",\"FLUENCIA_LEC_ESC\",\"GE:_ESTADO_CIVIL\",\"GENERATOR\",\"GE_ESTADO_FISICO_REGISTRO\",\"GE_LADO\",\"GE_MANU_AUTOM\",\"GE_NATURALEZA\",\"GE_OFICINA\",\"GE_ORIGEM_REGISTRO\",\"GE_REG_SEXO\",\"GE_REG_T_MATRIMONIO\",\"GE_SEXO\",\"GE_STATUS\",\"GE_TIPO_CONTRATO\",\"GE_TIPO_DOCUMENTO\",\"GE_TIPO_OBJETO\",\"GE_TIPO_REGISTRO\",\"GRAFICO_MOVEL\",\"GRAM_GEN\",\"GRAM_NUM\",\"GRAU_ACADEMICO\",\"GRE_TP_DEC\",\"GRUPO_PROFISSIONAL\",\"IGRP_APLICACOES\",\"IGRP_DIMENSOES\",\"IGRP_LIC_TIPO_MUDANCA\",\"IGRP_LIC_TP_DOC_PESQ\",\"IGRP_METRICAS\",\"IGRP_THEMES\",\"IIH_ESTADO_CONSER\",\"IIH_EXI_MANUT\",\"IIH_EXTRACAO_AGUA\",\"IIH_FORMA_BASE\",\"IIH_GESTAO\",\"IIH_IMPLANTACAO\",\"IIH_INEX_MUITO\",\"IIH_LOCAL_FISICA\",\"IIH_PROV_AGUA\",\"IIH_PROX_CASA\",\"IIH_TIPO_AQUIFERO\",\"IIH_TIPO_BOMBA\",\"IIH_TIPO_BOMBA_SB\",\"IIH_TIPO_CONSTRUCAO\",\"IIH_TIPO_DADOS\",\"IIH_TIPO_ENERGIA\",\"IIH_TIPO_OBJECTO\",\"IIH_USO_AGUA\",\"INFO_DOC_TYPE\",\"INSTANCE_FLOW\",\"INTEGRATION\",\"INVESTIMENTO\",\"IN_OUT\",\"ITALICO\",\"JUROS\",\"LAB\",\"LAB_REDLAB\",\"LANG_CODE\",\"LIMITES_DIREITOS\",\"LMITS_ESTADO\",\"LMITS_ESTADO_ENTREGA\",\"LMITS_ESTADO_PEDIDO\",\"LOOKUP_DB\",\"LOOP_FLOW\",\"L_SIGE_ANO\",\"L_SIGE_ANO_LETIVO\",\"L_SIGE_AREA\",\"L_SIGE_NIVEL_ENSINO\",\"L_SIGE_PERIODO\",\"MARAVILHA\",\"MARITAL\",\"MC_ACTIVIDADE\",\"METRICAS_ASSOC\",\"MIREX_TP_DOMINIO\",\"MIREX_TP_NATUREZA\",\"MNOVU - CONCURSO\",\"MNOVU - CONTEMPLADO\",\"MNOVU - EQUIPAMENTO\",\"MNOVU - FACTOR\",\"MNOVU - FORMULA\",\"MNOVU - TP- FICHA\",\"MNOVU_CONFIRMADO\",\"MNOVU_CONTEMPLADO\",\"MNOVU_GRUPO_ITEM\",\"MNOVU_GRUPO_TP_FICHA\",\"MNOVU_NR_PRESTACAO\",\"MNOVU_VALIDADO\",\"MOEDA\",\"MONTH\",\"MOTIVO_PERDA\",\"NATIVENESS\",\"NATUREZA_OBRA\",\"NAT_JURIDICA\",\"NEGRITO\",\"NIF_GE_COMBO_DIMENSIONES\",\"NIF_GE_COMBO_METRICAS\",\"NIF_GE_ESTADO\",\"NIF_GE_ESTADO_NIF\",\"NIF_GE_FORMA_JURIDICA\",\"NIF_GE_TP_AUTORIZACION\",\"NIF_GE_TP_CONTRIBUYENTE\",\"NIF_GE_TP_DOCUMENTO\",\"NIVEL DE ALCANCE DA META\",\"NIVEL DE ALCANCE DO COMPORTAMENTO\",\"NIVEL_INSTRUCAO\",\"NOTIFICA_ENTIDADE\",\"NOTIF_EST_ENVIO\",\"NOTIF_PERIODIC\",\"NOT_DIMENSAO\",\"NOT_MODALIDADE\",\"NUMERACAO\",\"N_TENDO\",\"OBJ_FISCALIZACAO_CM\",\"OPERADORA_CHIP\",\"ORD_T_ESPECIALIDADE\",\"ORD_T_ESTADO\",\"ORD_T_INSCRICAO\",\"ORD_T_TIPO\",\"ORD_T_TIPO_EXERCICIO\",\"ORD_T_TIPO_ORD\",\"ORG_CLONE_OPTION\",\"PAGE_TYPE\",\"PAG_OP\",\"PARAMETRIZA_ASSOC\",\"PARECER_AMBIENTAL\",\"PARECER_AUG\",\"PARECER_AUGI\",\"PARECER_CONFLITO\",\"PARECER_SOCIAL_GENERO\",\"PARTY_TYPE\",\"PART_ORAGNICA_DEFAULT\",\"PART_TP_PART_PAI_FILHO\",\"PART_T_ENTIDADE\",\"PED_MNEC\",\"PERF_CLONE_OPTION\",\"PLAN_DOC_TYPE\",\"POR_ATOS\",\"PPOJ_FINAL\",\"PRAZO\",\"PRECAD_AGENDA_VISITA\",\"PRECAD_CONC_ADMIN\",\"PRECAD_DECL\",\"PRECAD_DOMINIO_LINGUA\",\"PRECAD_ESTADO_RECOMENDACAO\",\"PRECAD_FASE_CLAIM\",\"PRECAD_FINALIDADE\",\"PRECAD_FORMA_AQUISICAO\",\"PRECAD_GRAU_ESCOLAR\",\"PRECAD_LINGUA\",\"PRECAD_MEDIDA_DURACAO\",\"PRECAD_MSG_ERRO\",\"PRECAD_NACIONALIDADE\",\"PRECAD_NATUREZA\",\"PRECAD_OPINIAO_EAT\",\"PRECAD_OPINIAO_EAT_MA\",\"PRECAD_PH_FRACAO\",\"PRECAD_REL_AGREGADO\",\"PRECAD_SITUACAO_LAB\",\"PRECAD_TIPOLOGIA_TITULAR\",\"PRECAD_TIPO_DADOS\",\"PRECAD_TIPO_OCUPANTE\",\"PRECAD_TIPO_VISITA\",\"PRECAD_TP_NECES_ESPECIAL\",\"PRIORITY\",\"PROC_ACT\",\"PROD\",\"PROD_EXA_SNIACPROD\",\"PROD_INPSEXA\",\"PROD_NOSIPROD1\",\"PROD_RNIEXA\",\"PROD_SAUDEEXA\",\"PROFILE_TYPE\",\"PROJECT_TYPE\",\"PROJ_ARQ_TP\",\"PROJ_PROF\",\"PUBLICO_ALVO\",\"REASON_ACTION\",\"RECLAMAÃƒâ€¡ÃƒÆ’O\",\"RECLAMAÃƒâ€¡ÃƒÆ’O OU RECURSO\",\"RECURSO\",\"REG\",\"REQ_TYPE\",\"REQ_T_DOCUMENT\",\"RESUL_FISC_CM\",\"RES_APROVACAO\",\"RES_FASE_PLANO\",\"REUSL_TOPO\",\"RH_DIMENSAO\",\"RH_ESTADO\",\"RH_METRICA\",\"RH_METRICAS\",\"RH_QUADRO_PENSAO\",\"RNI_TIPO_SERVICO\",\"RRR_OBJ_TYPE\",\"SEARCH_TYPE\",\"SECTOR\",\"SEMANA\",\"SEND_MANNER\",\"SEND_STATUS\",\"SEND_TYPE\",\"SEXO\",\"SIGE -  PERIODO\",\"SIGE -  TIPO MENU\",\"SIGE - AGENDA REPETICAO\",\"SIGE - ANO CURRICULAR\",\"SIGE - ANO LECTIVO\",\"SIGE - APROVEITAMENTO\",\"SIGE - AREA\",\"SIGE - CICLO\",\"SIGE - COMPORTAMENTO\",\"SIGE - ESCALAO\",\"SIGE - ESCOLA\",\"SIGE - ESPECIALIDADE\",\"SIGE - ESTADO\",\"SIGE - ESTADO DISC ALUNO\",\"SIGE - ESTADO FALTA\",\"SIGE - ESTADO PEDIDO\",\"SIGE - MENU ITEM PAI\",\"SIGE - MOTIVO ANULACAO\",\"SIGE - MOTIVO REDUCAO PROP\",\"SIGE - NR IRMAO ENSINO\",\"SIGE - ORIGEM PEDIDO\",\"SIGE - PAUTA_REG_OBS\",\"SIGE - PERIODO PROPINA\",\"SIGE - TIPO DE NOTA\",\"SIGE - TIPO FALTA\",\"SIGE - TITULAR DECLARAÃƒâ€¡ÃƒÆ’O\",\"SIGE - VIA\",\"SIGE- TRIMESTRE\",\"SIGE_EFEITO_DECLARAÃƒâ€¡ÃƒÆ’O\",\"SIGE_MOTIVO_JUSTIFICACAO\",\"SIGE_NR_MATRICULA\",\"SIGE_PARENTESCO\",\"SIGE_S_N\",\"SIGE_TP_ASSUNTO\",\"SIGE_TP_DECLARACAO\",\"SIGE_VIA_MARCACAO_SUMARIO\",\"SIGPG_STOCK\",\"SIGPG_TIPO_BEM\",\"SIG_MUNICIPIOS_CV\",\"SIMNAO\",\"SIM_ASC_TP_PREDIO\",\"SIM_NAO\",\"SIN_OUTORG_ORDEM\",\"SIS_PAGAMENTO\",\"SNC_CARGO\",\"SNC_ESTADO_ASSOC\",\"SNC_TIPO_ASSOCIACAO\",\"SNC_TIPO_DOCUMENTO\",\"SNIAC_CONSULTA\",\"SNIAC_MOTIVO_2VIA\",\"SNITE_FUNCTIONAL_ROAD_CLASS\",\"SNITE_OBJ_TP_DOC\",\"SOCIAL_ESTADO\",\"SOCIAL_SIM_NAO\",\"STAGE\",\"STAGE_STAGIN\",\"START_MODE\",\"STATUS\",\"STATUS_DIVIDA\",\"STATUS_NAME\",\"STATUS_PART\",\"STATUS_VERSAO\",\"ST_ METRICA\",\"ST_ METRICA_PGTO\",\"ST_ METRICA_PRST\",\"ST_ASSOC\",\"ST_A_PNS_SUB\",\"ST_DIMENSAO\",\"ST_DIMENSAO_ PGTO\",\"ST_DIMENSAO_ PRST\",\"ST_ESTADO\",\"ST_ESTADO_CNTB\",\"ST_ESTADO_ENTIDADE\",\"ST_ESTADO_PROCESSO\",\"ST_EST_MULT\",\"ST_EST_VALD\",\"ST_FOS_ENTRADA\",\"ST_FOS_ENTREGA\",\"ST_F_PAGAMENTO\",\"ST_MTV\",\"ST_NOTIFICA\",\"ST_PROC\",\"ST_PRST\",\"ST_QUALIFICA\",\"ST_TP_ACAO\",\"ST_TP_CONTRIBUINTE\",\"ST_TP_DOC\",\"ST_TP_DOC_PROC\",\"ST_TP_FNCRO\",\"ST_TP_FOS\",\"ST_TP_PEDIDO\",\"ST_TP_PESQ\",\"ST_TP_REG\",\"ST_TP_UTENTE\",\"ST_VALIDA\",\"SUBLINHADO\",\"TARGET\",\"TEMPO\",\"TESTE\",\"TESTE_DEPLOY\",\"TES_CX_STATUS\",\"TES_STATUS\",\"TES_T_POSTO\",\"TES_T_TESOURARIA\",\"TF\",\"TIMESTOPSUNITS\",\"TIME_UNITY\",\"TIPO\",\"TIPO_ANEXO\",\"TIPO_CUSTA\",\"TIPO_DOC_MOV\",\"TIPO_ESCALA\",\"TIPO_FILME\",\"TIPO_PD\",\"TIPO_PROTECAO\",\"TIPO_RECLAMAÃƒâ€¡ÃƒÆ’O\",\"TIPO_SALDO\",\"TIPO_UTENTE\",\"TIP_CONST\",\"TOPO_OBJ_COMP\",\"TOPO_PAR\",\"TP_ANO\",\"TP_APROVEITAMENTO\",\"TP_COMISSAO\",\"TP_COMPROMISS\",\"TP_CONTACTO\",\"TP_DIMENSAO_IND\",\"TP_DIVIDA\",\"TP_DOC\",\"TP_DOCUMENTO\",\"TP_DOC_CONS_EXT\",\"TP_DOC_INPS\",\"TP_DOC_NEGOCIOS\",\"TP_ENCAMINHAMENTO_CM\",\"TP_ENTIDADE\",\"TP_ENTITY\",\"TP_ESTADO\",\"TP_ESTADO_IRRE\",\"TP_ESTADO_IRREGULARIDADE\",\"TP_EXECUCAO\",\"TP_FERIA\",\"TP_FICHA\",\"TP_FONTE_DADO\",\"TP_FONTE_DADOS\",\"TP_FUNCIONARIO\",\"TP_FUNC_RH\",\"TP_GRAFICO\",\"TP_HORA\",\"TP_INSTITUICAO\",\"TP_INTERVENIENTE \",\"TP_INTERVINIENTE\",\"TP_LEIS\",\"TP_LOTE\",\"TP_LOTEAMENTO\",\"TP_MOVEL\",\"TP_NATUREZA\",\"TP_NUMERACAO\",\"TP_OCUPACAO\",\"TP_OPERACAO\",\"TP_ORIGEM\",\"TP_PARTILHA\",\"TP_PARTY\",\"TP_PERMISAO\",\"TP_PRESTADOR\",\"TP_Pessoa\",\"TP_RECLAMACAO\",\"TP_REP_GEOG\",\"TP_REQUERENTE\",\"TP_SOCIEDADE\",\"TP_TERMINAL\",\"TRIMESTRE\",\"TYPE_MULTI\",\"TYPE_PONDERAÃƒâ€¡ÃƒÆ’O\",\"T_REC\",\"Tipologia\",\"USERPROFILE\",\"USERSTATUS\",\"VAL_EXEC_OBRA\",\"VAL_FISC_OBRA\",\"VIA_LEVANTAMENTO\",\"VISTO_MNEC\",\"WF_COND\",\"WF_DOCTP_AUX\",\"WF_RUN_TYPE\",\"WF_STATUS\",\"WF_TIME_SCALE\",\"XXX\",\"YES_NO\",\"custa_t_tp_iten\",\"d_cad_tipologia\",\"mes_ref\",\"tp_recurso\",\"tp_stake\"]}";;
	 	this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}
	
	public Response actionDomainsValues() throws IOException{
		 String json = "[{\"value\": \"Y\",\"text\": \"Sim\"},{\"value\": \"N\",\"text\": \"Nao\"}]";
		 this.format = Response.FORMAT_JSON;
		 return this.renderView(json);
	}
	
	public Response actionGetPageJson() throws IOException{
		 String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		 String json = "";
		 if(p_id!=null && !p_id.equals("")){
			 Action ac = new Action().findOne(Integer.parseInt(p_id));
			 if(ac!=null){
				 json = FileHelper.readFileFromServer(Config.getResolvePathXsl(ac), ac.getPage()+".json");
			 }
		 }
		 this.format = Response.FORMAT_JSON;
		 return this.renderView(json);
	}
	/*----#END-PRESERVED-AREA----*/
}
