package nosi.webapps.tutorial.pages.editar_documentacao;

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
		
public class Editar_documentacaoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Editar_documentacao model = new Editar_documentacao();
		model.load();
		Editar_documentacaoView view = new Editar_documentacaoView();
		view.id_doc.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Labore dolor totam rem aperiam' as titulo,'Adipiscing aperiam anim sed an' as tipo,'Elit anim deserunt iste volupt' as relacionados,'Amet totam voluptatem dolor is' as data,'hidden-e013_2d6b' as id_doc "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		try{
	
	Document documentfilter = new Document().find();
	List<Document> documentList = documentfilter.all();
	List<Editar_documentacao.Table_1> documentTable = new ArrayList<>();
	if(documentList != null){
		for(Document document : documentList){
			Editar_documentacao.Table_1 row = new Editar_documentacao.Table_1();
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
		Editar_documentacao model = new Editar_documentacao();
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
		Editar_documentacao model = new Editar_documentacao();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_doc",Core.getParam("p_id_doc"));
		  return this.forward("tutorial","Editar_documentacao","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(eliminar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("tutorial","Editar_documentacao","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
