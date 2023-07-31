
package nosi.webapps.igrp.pages.file;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Properties;
/*----#end-code----*/

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.TempFileHelper;
import nosi.core.webapp.helpers.UrlHelper;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.TempFile;


public class FileController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		File model = new File();
		model.load();
		FileView view = new FileView();
		/*----#start-code(index)----*/
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	public Response actionGetFile() throws Exception {
			
		String uuid= Core.getParam("uuid");		
		System.out.println("Entrado: " + uuid);
		CLob file;
		if(Core.isNotNull(uuid))
			 file = Core.getFileByUuid(uuid);
		else
			 file = Core.getFile(Core.getParamInt("p_id").intValue());
		if(file!=null) {
			if(!(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated())  && !file.getEstado().equals("AP")){
				throw new Exception("File not public. Not estado AP");
			}
			return this.xSend(file.getC_lob_content(), file.getName(), file.getMime_type(), false);
		}else		
			throw new Exception("File not found.");
		
	}
	
	public Response actionGetPublicFile() throws Exception {
		
		String uuid= Core.getParam("uuid");		
		CLob file;
		if(Core.isNotNull(uuid))
			 file = Core.getFileByUuid(uuid);
		else
			 file = Core.getFile(Core.getParamInt("p_id").intValue());
		if(file!=null) {
			if(!file.getEstado().equals("AP")){
				throw new Exception("File not public. Not estado AP");
			}
			return this.xSend(file.getC_lob_content(), file.getName(), file.getMime_type(), false);
		}else		
			throw new Exception("File not found.");
		
	}
	
	public Response actionGetTempFile() throws Exception {		
		TempFile file = TempFileHelper.getTempFile(Core.getParam("p_uuid"));
		if(file!=null)
			return this.xSend(file.getContent(), file.getName(), file.getMime_type(), false);
		throw new Exception("File not found.");
	}
	
	public Response actionSaveImage()  throws Exception {		
		Properties p = new Properties();
		Integer id = Integer.valueOf(-1);
		String uuid = Core.saveFileNGetUuid("p_file_name");
		if(Core.isNull(uuid)) {			
			p.put("msg", Core.gt("Error saving file."));
		}else {
			id= new CLob().find().andWhere("uuid", "=",uuid).one().getId();
		}
		p.put("id", id);
		p.put("uuid", uuid);
		this.format = Response.FORMAT_JSON;
		return this.renderView(Core.toJson(p));
	}
	
	public Response actionSaveImageTxt()  throws IOException, ServletException {
		boolean r = false;
		String fileName="";
		String appName= Core.getCurrentApp().getDad();
		String pageName = Core.getParam("p_page_name");
		try {
			Part file = Core.getFile("p_file_name");
			if (file != null) {
				fileName = file.getSubmittedFileName();
				fileName =  fileName.replaceAll(" ", "-");
				if(Core.isNotNull(fileName)) {
					int index = fileName.lastIndexOf(".");
					if(index!=-1) {
						String extensionName = fileName.substring(index+1);
						String workSapce = Path.getImageWorkSpaceTxt(appName,pageName);
						if(Core.isNotNull(workSapce))//Saving in your workspace case exists
							r = FileHelper.saveImage(workSapce, fileName,extensionName.toLowerCase(), file);
						//Saving into server
						r = FileHelper.saveImage(Path.getImageServerTxt(appName,pageName), fileName,extensionName.toLowerCase(), file);
					}
				}
			}
		} catch (ServletException e) {
			r = false;
		}
		
		//String baseUrl = Igrp.getInstance().getRequest().getRequestURL().toString();
		
		//String fileNameUrl= UrlHelper.urlEncoding(fileName);
		
		String link = "?r=igrp/File/get-image-txt&p_app_name="+appName+"&p_page_name="+pageName+"&p_file_name="+fileName;
		
	//	System.out.println("Link doc:"+link);
		if(r)
			return this.renderView("{\"type\":\"success\",\"message\":\""+FlashMessage.MESSAGE_SUCCESS+"\",\"link\":\""+link+"\"}");
		else
			return this.renderView("{\"type\":\"error\",\"message\":\""+FlashMessage.MESSAGE_ERROR+"\",\"link\":\"\"}");
	}
	
	public Response actionGetImageTxt()  throws IOException, IllegalArgumentException, IllegalAccessException {
		Response resp = new Response();
		String fileName = Core.getParam("p_file_name");
		String appName = Core.getParam("p_app_name");
		String pageName = Core.getParam("p_page_name");
		if(Core.isNotNull(fileName)) {
			String baseUrl = Igrp.getInstance().getRequest().getRequestURL().toString();
			return this.redirectToUrl(baseUrl.toString().replaceAll("app/webapps", "images")+"/IGRP/IGRP2.3/assets/img/"+appName+"/"+pageName+"/"+fileName);
		}
		resp.setContent(FlashMessage.MSG_ERROR);	
		return resp;
	}
	/*----#end-code----*/
	}
