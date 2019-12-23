package nosi.webapps.tutorial.pages.inserir_documento;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.webapps.tutorial.dao.Document;
import nosi.webapps.tutorial.dao.Tipo;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/*----#end-code----*/
		
public class Inserir_documentoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Inserir_documento model = new Inserir_documento();
		model.load();
		 //model.setLink_upload_img(this.getConfig().getResolveUrl("igrp","file","save-image-txt&p_page_name="+Core.getCurrentPage()));
		Inserir_documentoView view = new Inserir_documentoView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.type.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.relacionados.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
	    try{
	String isEdit = Core.getParam("isEdit");
	if (Core.isNotNull(isEdit)) {
		Document documentfilter = new Document().find();
	if(Core.isNotNullOrZero(Core.getParamInt("p_id_doc"))){
		documentfilter.andWhere("idDoc","=",Core.getParamInt("p_id_doc"));
	}
		Document document = documentfilter.one();
		if (document!=null) {
			model.setId_doc(""+document.getIdDoc());
            model.setTitulo(document.getTitulo());
            model.setType(document.getIdType().getNome());
            model.setDescricao(document.getDescricao());
            model.setRelacionados(document.getRelacionados()!=null?document.getRelacionados().split(";"):null);
	
	view.btn_salvar.addParameter("p_id_doc", Core.getParam("p_id_doc"));
	
	view.btn_salvar.addParameter("isEdit", "true");
		}
	}
	}catch ( Exception e ) {
		e.printStackTrace();
	}
            	
	try{
	Document documentfilter = new Document().find();
	
	List<Document> documentList = documentfilter.all();
	view.relacionados.setValue(Core.toMap(documentList, "idDoc","titulo"));
	}catch ( Exception e ) {
		e.printStackTrace();
	}
   try{   
	Tipo tipofilter = new Tipo().find();
	List<Tipo> tipoList = tipofilter.all();
	view.type.setValue(Core.toMap(tipoList, "idTipo","nome","-- Selecionar --"));
   	}catch ( Exception e ) {
		e.printStackTrace();
	}   
  
      model.setLink_upload_img(this.getConfig().getResolveUrl("igrp","file","save-image-txt&p_page_name="+Core.getCurrentPage()));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Inserir_documento model = new Inserir_documento();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("tutorial","Inserir_documento","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(salvar)----*/
      Session session = null;
      Transaction transaction = null;
      String isEdit = Core.getParam("isEdit");
      try{
		session = Core.getSession(Core.defaultConnection());
		transaction = session.getTransaction();
		transaction.begin();
      
		Document document  = new Document();

		if(Core.isNotNull(isEdit)) {
			 document = session.find(Document.class, Core.getParamInt("p_id_doc"));
		}
      
		if (document != null){
			document.setTitulo(model.getTitulo());
            Tipo tipo_foreign = session.find(Tipo.class, Core.toInt(model.getType()));
			document.setIdType(tipo_foreign);
            document.setDescricao(model.getDescricao());
            document.setRelacionados(model.getRelacionados()!=null?String.join(";",model.getRelacionados()) : null);
            document.setData(Core.getCurrentDateSql());  
		}
		session.persist(document);
		transaction.commit();
		Core.setMessageSuccess();

	}catch ( Exception e ) {
		Core.setMessageError("Error: "+ e.getMessage());
		if (transaction != null)
			transaction.rollback();
	}finally {
		if (session != null && session.isOpen()) {
			session.close();
		}
	}
      
      if(Core.isNotNull(isEdit)) {
		this.addQueryString("isEdit", "true");
		return this.forward("tutorial","Inserir_documento","index",this.queryString());
	}
		
		/*----#end-code----*/
		return this.redirect("tutorial","Inserir_documento","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
