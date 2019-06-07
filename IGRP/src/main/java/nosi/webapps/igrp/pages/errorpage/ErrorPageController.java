package nosi.webapps.igrp.pages.errorpage;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import javax.servlet.RequestDispatcher;
import nosi.core.webapp.Igrp;
/*----#end-code----*/
		
public class ErrorPageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ErrorPage model = new ErrorPage();
		model.load();
		ErrorPageView view = new ErrorPageView();
		/*----#start-code(index)----*/
	
	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionVoltar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ErrorPage model = new ErrorPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(voltar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	//private Logger logger = LogManager.getLogger(ErrorPageController.class);
	public Response actionException() throws IOException, IllegalArgumentException, IllegalAccessException{
      ErrorPage model = new ErrorPage();
      model.load();
		ErrorPageView view = new ErrorPageView();
	//	if(Igrp.getInstance().getUser().isAuthenticated()){
			
			Exception e = (Exception)Igrp.getInstance().getRequest().getAttribute(RequestDispatcher.ERROR_EXCEPTION);
			if(e!=null)
				e.printStackTrace();
			
			String errorMsg = Igrp.getInstance().getRequest().getAttribute("javax.servlet.error.message") + ""; 
			
			//logger.error(errorMsg);
			
			try {
				Igrp.getInstance().getFlashMessage().addMessage("error", errorMsg );
				// dbug
				Core.log(Igrp.getInstance().getRequest().getSession().getAttribute("igrp.error").toString());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				Core.log("TryCatch: "+e.toString());
			}
			
			Igrp.getInstance().getFlashMessage().addMessage("info", Core.gt("Por favor contactar o serviço de HELPDESK para mais informações.(helpdesk@nosi.cv - Tel:2607973)"));
			view.setModel(model);
			return this.renderView(view);
//		}
//		else
//			return this.redirect("igrp", "login", "login");
	}
	
	
	/*----#end-code----*/
}
