package nosi.webapps.igrp_design_system.pages.teste_new_java_code;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
import nosi.webapps.igrp_design_system.pagedelegate.ITeste_new_java_codeDelegate;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Teste_new_java_codeController extends Controller {

	private ITeste_new_java_codeDelegate teste_new_java_code;

	public Teste_new_java_codeController() {
		teste_new_java_code = getComponent(ITeste_new_java_codeDelegate.class);
	}
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_new_java_code model = new Teste_new_java_code();
		model.load();
		Teste_new_java_codeView view = new Teste_new_java_codeView();
		teste_new_java_code.index(model, view);
		
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		
		view.setModel(model);
		return this.renderView(view);	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
