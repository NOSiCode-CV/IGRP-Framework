package nosi.webapps.tutorial.pages.parametrizacao_tipo;

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
import org.hibernate.Session;
import org.hibernate.Transaction;
import nosi.webapps.tutorial.dao.Tipo;
/*----#end-code----*/
		
public class Parametrizacao_tipoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Parametrizacao_tipo model = new Parametrizacao_tipo();
		model.load();
		Parametrizacao_tipoView view = new Parametrizacao_tipoView();
		view.id_tipo.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Ut accusantium labore sed anim' as nome_tipo,'Aliqua accusantium iste elit a' as descricao_do_tipo,'hidden-1cb3_d24c' as id_tipo "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		try{
	String isEdit = Core.getParam("isEdit");
	if (Core.isNotNull(isEdit)) {
		Tipo tipofilter = new Tipo().find();
	if(Core.isNotNullOrZero(Core.getParamInt("p_id_tipo"))){
		tipofilter.andWhere("idTipo","=",Core.getParamInt("p_id_tipo"));
	}
		Tipo tipo = tipofilter.one();
		if (tipo!=null && !tipo.hasError()) {
			model.setTipo(tipo.getNome());
			model.setDescricao(tipo.getDescricao());
			model.setId_tipo_form(Core.getParamInt("p_id_tipo"));
	
	view.btn_salvar.addParameter("p_id_tipo", Core.getParam("p_id_tipo"));
	
	view.btn_salvar.addParameter("isEdit", "true");
		}
	}
	}catch ( Exception e ) {
		e.printStackTrace();
	}
	
	try{
	
	Tipo tipofilter = new Tipo().find();
	List<Tipo> tipoList = tipofilter.all();
	List<Parametrizacao_tipo.Table_1> tipoTable = new ArrayList<>();
	if(tipoList != null){
		for(Tipo tipo : tipoList){
			Parametrizacao_tipo.Table_1 row = new Parametrizacao_tipo.Table_1();
			row.setNome_tipo(tipo.getNome());
			row.setDescricao_do_tipo(tipo.getDescricao());
			row.setId_tipo(tipo.getIdTipo());
			tipoTable.add(row);
		}
	}
	model.setTable_1(tipoTable);
	}catch(Exception e){
	e.printStackTrace();
	}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Parametrizacao_tipo model = new Parametrizacao_tipo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_tipo",Core.getParam("p_id_tipo"));
		  return this.forward("tutorial","Parametrizacao_tipo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(salvar)----*/
		
	Session session = null;
	Transaction transaction = null;
	try{
	if (model.validate()) {
		session = Core.getSession(Core.defaultConnection());
		transaction = session.getTransaction();
		transaction.begin();
		Tipo tipo  = new Tipo();
		tipo.setNome(model.getTipo());
		tipo.setDescricao(model.getDescricao());
		session.persist(tipo);
		transaction.commit();
		Core.setMessageSuccess();
	}
	else if (!model.validate())
		Core.setMessageError();
	}catch ( Exception e ) {
		Core.setMessageError("Error: "+ e.getMessage());
		if (transaction != null)
			transaction.rollback();
	}finally {
		if (session != null && session.isOpen()) {
			session.close();
		}
	}
	
		/*----#end-code----*/
		return this.redirect("tutorial","Parametrizacao_tipo","index", this.queryString());	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Parametrizacao_tipo model = new Parametrizacao_tipo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_tipo",Core.getParam("p_id_tipo"));
		  return this.forward("tutorial","Parametrizacao_tipo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar)----*/
		this.addQueryString("p_id_tipo", Core.getParam("p_id_tipo"));
	
	this.addQueryString("isEdit", "true");
		
		/*----#end-code----*/
		return this.redirect("tutorial","Parametrizacao_tipo","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Parametrizacao_tipo model = new Parametrizacao_tipo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_tipo",Core.getParam("p_id_tipo"));
		  return this.forward("tutorial","Parametrizacao_tipo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(eliminar)----*/
		
		Tipo tipo = new Tipo().findOne(Core.getParamInt("p_id_tipo"));
	if (tipo != null && !tipo.hasError()) {
		boolean del = tipo.delete(tipo.getIdTipo());
		if (del == true)
			Core.setMessageSuccess("Deleted from DB successfully!");
		else
			Core.setMessageError("Error deleting person from DB!");
	} else {
		Core.setMessageError(tipo.getError().toString());
	}
		/*----#end-code----*/
		return this.redirect("tutorial","Parametrizacao_tipo","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
