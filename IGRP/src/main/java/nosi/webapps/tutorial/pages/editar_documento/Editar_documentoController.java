package nosi.webapps.tutorial.pages.editar_documento;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.tutorial.dao.Document;
import nosi.webapps.tutorial.dao.Tipo;

/*----#end-code----*/
		
public class Editar_documentoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Editar_documento model = new Editar_documento();
		model.load();
		Editar_documentoView view = new Editar_documentoView();
		view.id_doc.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Totam voluptatem adipiscing ip' as titulo,'Adipiscing sit laudantium iste' as tipo,'Mollit aliqua omnis unde omnis' as relacionados,'Laudantium adipiscing sed sit' as data,'hidden-3fab_50e5' as id_doc "));
		  ----#gen-example */
		/*----#start-code(index)----*/
	try{
	
	Document documentfilter = new Document().find();
	List<Document> documentList = documentfilter.all();
	List<Editar_documento.Table_1> documentTable = new ArrayList<>();
	if(documentList != null){
		for(Document document : documentList){
			Editar_documento.Table_1 row = new Editar_documento.Table_1();
			row.setTitulo(document.getTitulo());
			row.setTipo(document.getIdType().getNome()!=null?document.getIdType().getDescricao():null);
			row.setRelacionados(document.getRelacionados());
			row.setData(document.getData()!=null?Core.dateToString(document.getData(),"dd-MM-yyyy"):null);
			row.setId_doc(""+document.getIdDoc());
			documentTable.add(row);
		}
	}
	model.setTable_1(documentTable);
	}catch(Exception e){
	e.printStackTrace();
	}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Editar_documento model = new Editar_documento();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_doc",Core.getParam("p_id_doc"));
		  return this.forward("tutorial","Inserir_documento","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar)----*/
		
		this.addQueryString("p_id_doc", Core.getParam("p_id_doc"));
	
		this.addQueryString("isEdit", "true");
		
		/*----#end-code----*/
		return this.redirect("tutorial","Inserir_documento","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Editar_documento model = new Editar_documento();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_doc",Core.getParam("p_id_doc"));
		  return this.forward("tutorial","Editar_documento","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(eliminar)----*/
		
	Document document = new Document().findOne(Core.getParamInt("p_id_doc"));
	if (document != null && !document.hasError()) {
		boolean del = document.delete(document.getIdDoc());
		if (del == true)
			Core.setMessageSuccess("Deleted from DB successfully!");
		else
			Core.setMessageError("Error deleting person from DB!");
	} else {
		Core.setMessageError(document.getError().toString());
	}
	
		/*----#end-code----*/
		return this.redirect("tutorial","Editar_documento","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
