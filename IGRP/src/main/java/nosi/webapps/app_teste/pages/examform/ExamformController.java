package nosi.webapps.app_teste.pages.examform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.UploadedFile;
import nosi.webapps.app_teste.dao.Exame;
import nosi.webapps.app_teste.dao.User;
import java.sql.Date;
/*----#end-code----*/
		
public class ExamformController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Examform model = new Examform();
		model.load();
		ExamformView view = new ExamformView();
		/*----#start-code(index)----*/
		
		view.btn_salvar.addParameter("p_id_user", Core.getParam("p_id_user"));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Examform model = new Examform();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(salvar)----*/
		
		try {	
				UploadedFile file = Core.upload("p_imagem_raios_x");
				if (file != null && file.getSize() != 0) {
				int fileId = Core.saveFile(file.getContent(), file.getSubmittedFileName(), null);	
				if (fileId > 0) {
				Exame exe = new Exame();
				User u = new User().findOne(Core.toInt(Core.getParam("p_id_user")));
				exe.setIdUser(u);
				exe.setNome_exame(model.getNome_exame());
				exe.setData(Core.ToDate(model.getData_exame()));
				exe.setRaioX("" + fileId);
				exe = exe.insert();
				if (exe != null)
				Core.setMessageSuccess();
				else
					Core.setMessageError();		
				}
			}
					
				
		} catch (Exception e) {
			e.printStackTrace();
			Core.setMessageError();
		}
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	
/*----#end-code----*/
}
