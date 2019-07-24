package nosi.webapps.app_teste.pages.userform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import nosi.core.webapp.UploadedFile;
import nosi.webapps.app_teste.dao.User;
import java.util.LinkedHashMap;
import static nosi.core.i18n.Translator.gt;

//import nosi.webapps.app_teste.dao.Exame;
/*----#end-code----*/
		
public class UserFormController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserForm model = new UserForm();
		model.load();
		UserFormView view = new UserFormView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.genero.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado_civil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_de_beneficiario.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		LinkedHashMap<String, String> targets = new LinkedHashMap<>(); 
		targets.put(null, gt("-- Selecionar --"));
		targets.put("masculino", gt("Masculino"));
		targets.put("feminino", gt("Feminino"));
		view.genero.setValue(targets);
		
		LinkedHashMap<String, String> target = new LinkedHashMap<>(); 
		target.put(null, gt("-- Selecionar --"));
		target.put("segurado", gt("Segurado"));
		target.put("nao_segurado", gt("Não segurado"));
		view.tipo_de_beneficiario.setValue(target);

		LinkedHashMap<String, String> targe = new LinkedHashMap<>(); 
		targe.put(null, gt("-- Selecionar --"));
		targe.put("solteiro", gt("Solteiro"));
		targe.put("casado", gt("Casado"));
		view.estado_civil.setValue(targe);
	//User u = new User();
		
		String isEdit = Core.getParam("isEdit");

		if (Core.isNotNull(isEdit)) {
			// select com query
//		QueryInterface query = Core.query("app_teste_postgresql_1","SELECT id_user as id_user,nome as nome,morada as morada, file as file FROM public.user")
//				.where("id_user=:id_user")
//				.addInt("id_user",model.getId_user());
//		model.load(query);

			// select com dao

			User u = new User().findOne(Core.getParamInt("p_id_user"));

			if (u != null)
			
			{

				model.setNome(u.getNome());
				model.setMorada(u.getMorada());
				model.setEstado_civil(u.getEstado_civil());
				model.setGenero(u.getGenero());
				model.setContacto(u.getContacto());
				model.setData_do_registo(Core.dateToString(u.getData_regis()));
				model.setEmail(u.getEmail());
				model.setData_nascimento(Core.dateToString(u.getData_nasc()));
				model.setTipo_de_beneficiario(u.getBeneficiario());
				model.setId_user(u.getIdUser());
		}

			view.btn_save.setLink("save&isEdit=true");
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionList() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserForm model = new UserForm();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(list)----*/

		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserForm model = new UserForm();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","UserForm","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(save)----*/

		try {

			// ResultSet r = null;

			String isEdit = Core.getParam("isEdit");
			//UploadedFile file = Core.upload("p_file");
	
			User u = new User();
			if (!Core.isNull(isEdit)) {
				u = u.findOne(Core.getParamInt("p_id_user"));
			}
			
//			if (file != null && file.getSize() != 0) {
//				int fileId = Core.saveFile(file.getContent(), file.getSubmittedFileName(), null);
//				if (fileId > 0) {
					// inserção com query
//			r = Core.insert("app_teste_postgresql_1","public","user")		
//				.addString("nome",model.getNome())
//				.addString("morada",model.getMorada())
//				.addString("file", ""+fileId)
//				.execute();

					// inserção com dao
					
					u.setNome(model.getNome());
					u.setMorada(model.getMorada());
					u.setGenero(model.getGenero());
					u.setBeneficiario(model.getTipo_de_beneficiario());
					u.setData_nasc(Core.ToDate(model.getData_nascimento()));
					u.setData_regis(Core.ToDate(model.getData_do_registo()));
					u.setEstado_civil(model.getEstado_civil());
					u.setContacto(model.getContacto());
					u.setEmail(model.getEmail());
				    
					
					//u.setFile("" + fileId);
//				}
//			}
			if (Core.isNull(isEdit)) {
				u = u.insert();

				if (u != null)

					Core.setMessageSuccess();

				else
					Core.setMessageError();

			} else {

				// editar com query
//			r = Core.update("app_teste_postgresql_1","public","user")		
//				.addString("nome",model.getNome())
//				.addString("morada",model.getMorada())
//				.addString("file", ""+fileId)
//				.where("id_user=:id_user")
//				.addInt("id_user",model.getId_user())
//				.execute();

				// editar com dao
				u = u.update();

				if (u != null && !u.hasError())
					Core.setMessageSuccess("Information updated successfully. Id: " + u.getIdUser());
				else
					Core.setMessageError(u.getError().toString());
			}
//		if(!r.hasError()){
//			Core.setMessageSuccess();
//		 }else{
//			Core.setMessageError();
//			 return this.forward("app_teste","UserForm","index");
//		}

		} catch (Exception e) {
			e.printStackTrace();
			Core.setMessageError();
		}
		/*----#end-code----*/
		return this.redirect("app_teste","UserForm","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
}
