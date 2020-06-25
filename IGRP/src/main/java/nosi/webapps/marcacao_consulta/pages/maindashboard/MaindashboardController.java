package nosi.webapps.marcacao_consulta.pages.maindashboard;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.xml.soap.SOAPException;

import org.json.JSONObject;
import org.json.XML;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class MaindashboardController extends Controller { 
	
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Maindashboard model = new Maindashboard();
		model.load();
		MaindashboardView view = new MaindashboardView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Elit stract perspiciatis accusantium deserunt totam consectetur adipiscing totam stract mollit deserunt omnis officia laudantium mollit perspiciatis l' as nome,'Lorem sit dolor voluptatem dolor totam officia doloremque laudantium elit perspiciatis omnis magna l' as morada,'Lorem ut m' as data_nascimento "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		view.getPage().displayFooter(true); 
		view.getPage().setCopyright("Tipo Estrutura: Centro de Saúde - Estrutura: Hospital central - Serviço: Banco de Urgencia");
		
		System.out.println(Core.getReportParam("p_usa") + " - " + Core.getReportParam("p_sis") + " - " + Core.getReportParam("p_param") + " - " + Core.getReportParam("p_nosi")); 
		
		model.loadTable_1(Core.query("marcacao_consulta_postgresql_1","select nome as nome, morada as morada, data_nascimento as data_nascimento from tbl_utente "));
		
		//model.setView_1_img(Core.getLinkFile(61)); 
		
		//model.setImages(Core.getLinkFile(61)); 
		
		
		String base64 = "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"; 
		view.images.setValue("data:image/png;base64," + base64);
      
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Maindashboard model = new Maindashboard();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("marcacao_consulta","Maindashboard","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		
     try{
       
        Core.saveFile("p_upload"); 
      
      Core.setMessageSuccess(); 
       
     }catch(Exception e){
       e.printStackTrace(); 
     }
		
		/*----#end-code----*/
		return this.redirect("marcacao_consulta","Maindashboard","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	/*
	public static void main(String[] args) throws Exception {
		 String wsdlUrl = "http://biztalk.gov.cv/redws2/nosiws.asmx?wsdl";
       
      // An Map of Soap HTTP Headers
      Map<String, String> headers = new HashMap<String, String>();
      headers.put("SOAPAction", "http://nosi/ws/NosiWS/trata");
      headers.put("Content-Type", "text/xml;charset=utf-8");
      
      // An Map of Soap Envelope namespace
      Map<String, String> namespaces = new HashMap<String, String>();
      namespaces.put("ws", "http://nosi/ws");
      namespaces.put("nos", "NosiWS"); 
      
      Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
      Map<String, Object> subContent = new LinkedHashMap<String, Object>();
      Map<String, Object> subSubContent = new LinkedHashMap<String, Object>(); 
      
      subSubContent.put("pServico", "PROCESS_BANCA");
      subSubContent.put("pArgs", "<![CDATA[<INBANCA><OPER>GET_ESTADO_DUC</OPER><DUC>920010904598</DUC></INBANCA>]]>");
      subContent.put("nos:trata", subSubContent);
      bodyContent.put("ws:trata", subContent);
		
      nosi.core.webapp.webservices.soap.SoapClient sc = Core.soapClient(wsdlUrl, namespaces, headers,
              bodyContent, "SOAP-ENV", "http://schemas.xmlsoap.org/soap/envelope/");
     
      
      if (sc != null && sc.hasErrors()) { // Verifica se ocorreu algum erro ... 
          
          Core.setMessageError(Arrays.toString(sc.getErrors().toArray())); 
          
      } else { // Preencher os dados na tabela 
   	   // retorna soap body como um java.util.Map 
        /*  Map<String, Object> map = sc.getResponseBody("s");
          
          if (map != null) {
        	  for(Map.Entry<String, Object> obj : map.entrySet()) {
        		  System.out.println(obj.getKey() + " " + obj.getValue()); 
        	  }
          }*/
    /*	  String xml = "";
		  ByteArrayOutputStream out = new ByteArrayOutputStream();
		  sc.getResponse().writeTo(out);
		  xml = new String(out.toByteArray()); 
		  
		  System.out.println("xml: " + xml);
      }
	}*/
	
	public static void main(String[] args) {
		String xml = "<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\"><s:Body><trataResponse xmlns=\"http://nosi/ws\"><trataResponse xmlns=\"NosiWS\" xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\"><return xmlns=\"\">&lt;?xml version='1.0' encoding='UTF-8'?&gt;&lt;Operacao&gt;&lt;DUC&gt;920010904598&lt;/DUC&gt;&lt;CODIGO&gt;-&lt;/CODIGO&gt;&lt;ENTIDADE&gt;92001&lt;/ENTIDADE&gt;&lt;REFERENCIA&gt;090459829&lt;/REFERENCIA&gt;&lt;MONTANTE&gt;70350&lt;/MONTANTE&gt;&lt;DESCRICAO&gt;LIQUIDADO&lt;/DESCRICAO&gt;&lt;/Operacao&gt;</return></trataResponse></trataResponse></s:Body></s:Envelope>\r\n"; 
		JSONObject jsonObject = XML.toJSONObject(xml); 
		System.out.println(jsonObject); 
	}

/*----#end-code----*/
}
