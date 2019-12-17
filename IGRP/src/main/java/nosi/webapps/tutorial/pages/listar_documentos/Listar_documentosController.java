package nosi.webapps.tutorial.pages.listar_documentos;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.webapps.tutorial.dao.Tipo;
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.tutorial.dao.Document;
import org.apache.commons.text.StringEscapeUtils;
import java.util.Arrays;
import nosi.core.gui.components.IGRPButton;

/*----#end-code----*/
		
public class Listar_documentosController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Listar_documentos model = new Listar_documentos();
		model.load();
		Listar_documentosView view = new Listar_documentosView();
		/*----#start-code(index)----*/
	
        System.out.println(Core.getCurrentDate());
        System.out.println(Core.getCurrentDataTime());
        System.out.println(Core.getCurrentDate1());
        System.out.println(Core.getCurrentDateSql());
		
      try{
	
          List<Tipo> tipoList = new Tipo().find().all();

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

          model.setTreemenu_1(tipoTable);

      }catch(Exception e){

      e.printStackTrace();

      }
      
      
      try{
  	    
	        Document documentfilter = new Document().find();
	    
	        if(Core.isNotNullOrZero(Core.getParam("p_type"))){
	
	            documentfilter.andWhere("tipo.nome","=",Core.getParam("p_type"));
	        }
	
	        if(Core.isNotNullOrZero(Core.getParamInt("p_id"))){
	
	            documentfilter.andWhere("idDoc","=",Core.getParamInt("p_id"));
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
		return this.redirect("igrp_web_doc","Teste_treemenu","index", this.queryString());	
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
   
   public String getXml2(String id) {

	   String xml2 = "<item>" + 
		"<title>Teste</title>" +	   
		"<app>tutorial</app>" +		
		"<page>Teste_treemenu</page>" +
		"<link>index&amp;p_id="+id+"</link>" +
		"<target>_self</target>" +
		"<img>link|fa-angle-right</img>" +
		"<preview/>" +
		"</item>";
     
  return xml2;
  } 


/*----#end-code----*/
}
