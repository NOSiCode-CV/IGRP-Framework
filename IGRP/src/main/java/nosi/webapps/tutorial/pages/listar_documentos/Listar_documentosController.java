package nosi.webapps.tutorial.pages.listar_documentos;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.dao_helper.SaveMapeamentoDAO;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.databse.helpers.QueryInterface;

import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.webapps.tutorial.dao.Tipo;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp_studio.pages.listapage.ListaPage;
import nosi.webapps.igrp_studio.pages.listapage.ListaPage.Table_2;
import nosi.webapps.tutorial.dao.Document;
import org.apache.commons.text.StringEscapeUtils;
import nosi.core.gui.components.IGRPButton;
/*----#end-code----*/
		
public class Listar_documentosController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Listar_documentos model = new Listar_documentos();
		model.load();
		Listar_documentosView view = new Listar_documentosView();
		/*----#start-code(index)----*/
	
		
	try {
		
		Action doc_action = new Action().find().andWhere("page","=","Listar_documentos").andWhere("xsl_src","=","tutorial/listar_documentos/Listar_documentos.xsl").one();
		
		Menu doc_menu = new Menu().find().andWhere("application","=", Core.findApplicationByDad("tutorial").getId()).andWhere("descr","=", "Listar Documentos").one();

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
			
			Core.setMessageSuccess("Ação de documentação criada");
			
			
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
			
			Core.setMessageSuccess("Menu de documentação criada");
			
			Profile doc_insert_perfil = new Profile();
			doc_insert_perfil.setType("MEN");
			doc_insert_perfil.setType_fk(doc_insert_menu.getId());
			Organization org_foreign = new Organization().find().andWhere("code","=","org.tutorial").one();
			doc_insert_perfil.setOrganization(org_foreign);
			ProfileType pf_type_foreign = new ProfileType().find().andWhere("code","=","perfil.tutorial").one();
			doc_insert_perfil.setProfileType(pf_type_foreign);
			doc_insert_perfil.setUser(Core.getCurrentUser());
			doc_insert_perfil.insert();
			
			Core.setMessageSuccess("Perfil de documentação Criado");
				
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
      try{
	
          List<Tipo> tipoList = new Tipo().find().all();
          
          Collections.sort(tipoList, new SortbyID());

          List< Listar_documentos.Treemenu_1> tipoTable = new ArrayList<>();
        
          if(tipoList != null){
        	  
              for(Tipo tip : tipoList){

                  Listar_documentos.Treemenu_1 row = new Listar_documentos.Treemenu_1();

                   row.setTreemenu_1_link_desc(tip.getDescricao());

                   row.setTreemenu_1_child("1"); 

                   row.setTreemenu_1_tmid(""+tip.getIdTipo());

                   //row.setTreemenu_1_link("#");

                   tipoTable.add(row);
              }
          }
          
         // tipoTable.sort(Comparator.comparing(Listar_documentos.Treemenu_1::getTreemenu_1_link_desc));
          
          model.setTreemenu_1(tipoTable);

      }catch(Exception e){

      e.printStackTrace();

      }
      
      
      try{
  	    
	        Document documentfilter = new Document().find();
	    
	        if(Core.isNotNullOrZero(Core.getParam("p_type"))){
	        	
	        	String tipo_doc = Core.getParam("p_type");
	        	
	        	int id_doc = 0;
	        	
	        	switch(tipo_doc) {
	        	  case "bpmn": id_doc = 71; break; case "partilha":id_doc = 52; break; case "report": id_doc = 162; break; case "select": id_doc = 84; break;
	        	  case "text": id_doc = 216; break; case "table": id_doc = 47; break; case "dominio": id_doc = 50; break; case "perfil": id_doc = 67; break;
	        	  case "base_dados": id_doc = 65; break; case "acesso": id_doc = 63; break; case "organica": id_doc = 66; break; case "studio": id_doc = 55; break;
	        	  case "menu": id_doc = 68; break; case "transacao": id_doc = 69; break; case "utilizador": id_doc = 75; break; case "new_app": id_doc = 74; break;
	        	  case "page": id_doc = 59; break; case "gerador": id_doc = 78; break; case "design": id_doc = 79; break; case "import_sql": id_doc = 82; break;
	        	  case "mvc": id_doc = 72; break; case "calendar": id_doc = 196; break; case "file": id_doc = 87; break; case "file_editor": id_doc = 91; break;
	        	  case "chart": id_doc = 198; break; case "circlestatbox": id_doc = 200; break; case "fingerprint": id_doc = 202; break; case "formlist": id_doc = 203; break;
	        	  case "iframe": id_doc = 206; break; case "infopanel": id_doc = 208; break; case "leafletmap": id_doc = 210; break; case "mapchart": id_doc = 212; break;
	        	  case "separatorlist": id_doc = 301; break; case "tabcontent": id_doc = 218; break; case "toolsbar": id_doc = 220; break; case "treemenu": id_doc = 222; break;
	        	  case "verticalmenu": id_doc = 224; break; case "video": id_doc = 226; break; case "view": id_doc = 228; break; case "checkbox": id_doc = 231; break;
	        	  case "checkboxlist": id_doc = 233; break; case "color": id_doc = 235; break; case "date": id_doc = 237; break; case "link": id_doc = 239; break;
	        	  case "img": id_doc = 241; break; case "lookup": id_doc = 243; break; case "number": id_doc = 245; break; case "plaintext": id_doc = 247; break;
	        	  case "radiolist": id_doc = 249; break; case "range": id_doc = 251; break; case "button": id_doc = 255; break; case "email": id_doc = 307; break;
	        	  case "sqltools": id_doc = 311; break; case "map_os": id_doc = 349; break; case "smallbox": id_doc = 351; break; case "statbox": id_doc = 353; break;
	        	  case "locator": id_doc = 355; break; case "url": id_doc = 361; break; case "hidden": id_doc = 363; break; case "password": id_doc = 396; break;
	        	  case "box": id_doc = 444; break; case "separator": id_doc = 398; break; case "textarea": id_doc = 400; break; case "texteditor": id_doc = 402; break;
	        	  case "time": id_doc = 404; break; case "virtualkeyboard": id_doc = 406; break; case "import": id_doc = 409; break; case "carousel": id_doc = 445; break;
	        	  case "form": id_doc = 262; break; case "panels": id_doc = 446; break; case "quickbuttonbox": id_doc = 447; break; case "sectionheader": id_doc = 448; break;
	        	  case "timeline": id_doc = 449; break; case "treelist": id_doc = 450; break; case "radio": id_doc = 451; break; case "new_page": id_doc = 76; break;
	        	  case "crud": id_doc = 457; break; default: id_doc = 54;
	        	}

	            //documentfilter.andWhere("idType.nome","=",Core.getParam("p_type"));
	        	
	        	documentfilter.andWhere("idDoc","=",id_doc);
	        }
	
	        else if(Core.isNotNullOrZero(Core.getParamInt("p_id"))){
	        	
	            documentfilter.andWhere("idDoc","=",Core.getParamInt("p_id"));
	        }
	        
	        else {
	        	
	        	 documentfilter.andWhere("idDoc","=",54);	
	        }
	       
	        
	        Document document = documentfilter.one();
	    
	        if (document!=null) {
	          
	          view.sectionheader_1_text.setValue(document.getTitulo());
	          
	          model.setForm_1_plaintext_1(document.getDescricao());
              
              model.setAtualizado_em(document.getData()!=null?Core.dateToString(document.getData(),"dd-MM-yyyy"):null);
	          
	          model.setId_rel(document.getRelacionados());
	          
	          if(Core.isNotNull(model.getId_rel())) {
	        	  
	        	  String[]p_id2 = model.getId_rel().split(";");
		            
		          if(p_id2 != null){
		          	  
		                for(String x : p_id2){
		               	 
		               	Document documen = new Document().findOne(Core.toInt(x));
		               	
		               	IGRPButton btn_relaciona = new IGRPButton(documen.getTitulo(),"tutorial","Listar_documentos","index&p_id="+documen.getIdDoc(),"void","link|fa-angle-right","","");
		               	btn_relaciona.propertie.add("type","specific").add("rel","relacionados").add("refresh_components","");
		               	
		               	view.documentos_relacionados.addButton(btn_relaciona);

		                }
		            }
	          }
	         
	          
	        }
	    
	  	}catch(Exception e){
	    
	  e.printStackTrace();
	    
	  }

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	/*
	public Response actionRemote_treemenu_1() throws IOException, IllegalArgumentException, IllegalAccessException{
		String p_id = Core.getParam("p_id");
		String p_active = Core.getParam("p_active");
		Listar_documentos model = new Listar_documentos();
		//programming your save edit calendar
		Response response = new Response();
		response.setContentType(Response.FORMAT_XML);
		response.setContent("your message");
		return response;
		
	}
	*/
	public Response actionDocumentos_relacionados() throws IOException, IllegalArgumentException, IllegalAccessException{
		Listar_documentos model = new Listar_documentos();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_web_doc","Teste_treemenu","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(documentos_relacionados)----*/
		
		
		/*----#end-code----*/
		return this.redirect("tutorial","Listar_documentos","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
public Response actionRemote_treemenu_1() throws IOException, IllegalArgumentException, IllegalAccessException{
		
  		String p_id = Core.getParam("p_id");
  
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" + " <treemenu_1> " + "<table>" + "<value>";
		  
		Document documentfilter = new Document().find();
		  
        if(Core.isNotNullOrZero(p_id)){

            documentfilter.andWhere("idType","=",Core.toInt(p_id));
        }
		List<Document> documentList = documentfilter.all();
		
		Collections.sort(documentList, new SortbyID2());

		for (Document li : documentList) {

		xml += getXml(li.getIdDoc() + "",p_id, li.getTitulo(), "1");

		}

		xml += "</value>" + "</table>" + "</treemenu_1>";

		return this.renderView(xml);
		
	}
	
   public String getXml(String id, String idpai, String desc_menu, String child) {

	   String xml = "<row>" + 
		"<treemenu_1_link>" + StringEscapeUtils.escapeXml11(Core.getIGRPLink("tutorial", "Listar_documentos", "index")+"&p_id="+id)+"</treemenu_1_link>" +		
		"<treemenu_1_link_desc>" + desc_menu + "</treemenu_1_link_desc>" +
		"<treemenu_1_tmid>" + id + "</treemenu_1_tmid>" +
		"<treemenu_1_parent>"+idpai+"</treemenu_1_parent>" +
		"<treemenu_1_icon/>" +
		//"<treemenu_1_child>" + child + "</treemenu_1_child>" +
		"<treemenu_1_active/>" +
		"</row>";
     
  return xml;
  } 
   
//   public String getXml2(String id) {
//
//	   String xml2 = "<item>" + 
//		"<title>Teste</title>" +	   
//		"<app>tutorial</app>" +		
//		"<page>Teste_treemenu</page>" +
//		"<link>index&amp;p_id="+id+"</link>" +
//		"<target>_self</target>" +
//		"<img>link|fa-angle-right</img>" +
//		"<preview/>" +
//		"</item>";
//     
//  return xml2;
//  } 
   
   class SortbyID implements Comparator<Tipo> {
		
		@Override
		public int compare(Tipo o1, Tipo o2) {
			// TODO Auto-generated method stub
			return o1.getOrdem()-o2.getOrdem();
		
		}
	}
   
   class SortbyID2 implements Comparator<Document> {
		
		@Override
		public int compare(Document o1, Document o2) {
			// TODO Auto-generated method stub
			return o1.getOrdem()-o2.getOrdem();
		
		}
	}
 
/*----#end-code----*/
}
