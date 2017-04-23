package nosi.webapps.igrp.pages.page;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Part;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;

public class PageController extends Controller {		
	
	public void actionIndex() throws IOException{
		Page model = new Page();
		PageView view = new PageView();
		view.addModel("model",model);
		this.renderView(view);
	}
	
	public PrintWriter actionSaveGenPage() throws IOException, ServletException{
		Part fileJson = Igrp.getInstance().getRequest().getPart("p_data");
		Part fileXml = Igrp.getInstance().getRequest().getPart("p_page_xml");
		Part fileXsl = Igrp.getInstance().getRequest().getPart("p_page_xsl");
		String javaCode = FileHelper.convertToString(Igrp.getInstance().getRequest().getPart("p_page_java"));
		String path = Igrp.getInstance().getRequest().getParameter("p_package");
		String class_name = Igrp.getInstance().getRequest().getParameter("p_class");
		Igrp.getInstance().getResponse().setContentType("text/xml");
		if(fileJson!=null && fileXml!=null && fileXsl!=null && javaCode!=null && javaCode!="" && path!=null && path!="" && class_name!=null && class_name!=""){
			String[] partsJavaCode = javaCode.toString().split(" END ");
			if(
					FileHelper.save(path, partsJavaCode[0]) && // save model
					FileHelper.save(path, partsJavaCode[1]) && // save view
					FileHelper.save(path, partsJavaCode[2]) && // save controller
					FileHelper.save(path, fileXml) && // save xml
					FileHelper.save(path, fileXsl) && // save xsl
					FileHelper.save(path, fileJson) // save json
			){
				return Igrp.getInstance().getResponse().getWriter().append("<messages><message type=\"success\">Operação efectuada com sucesso</message></messages>");
			}
		}
		return Igrp.getInstance().getResponse().getWriter().append("<messages><message type=\"error\">Operação falhada</message></messages>");
	}
	
	public void actionPublishGenPage() throws IOException{
		
	}
}