package nosi.webapps.igrp.pages.generator;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.BufferedReader;
import java.io.IOException;
import java.security.SecureRandom;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletContext;
import nosi.core.webapp.*;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.File;
import java.util.*;

/*----#END-PRESERVED-AREA----*/

public class GeneratorController extends Controller{
	
	
	private final SecureRandom r= new SecureRandom();
	public Response actionIndex() throws IOException{		
		/*----#START-PRESERVED-AREA(INDEX)----*/
		this.isNoCached=true;		
		Generator model = new Generator();
		Integer id = Core.getParamInt("p_id_page");
		if(Core.isNotNullOrZero(id)){
			try{
				Action ac = new Action();
				ac = ac.findOne(id);	
				if(ac!=null){
					model.setGen_elements(this.getConfig().getLinkImgBase().replace("\\", "/")+"images/IGRP/Config/formgen.config.txt?id=");
					model.setId_objeto(id);
					model.setId(ac.getId());
					model.setId_pai(ac.getApplication().getId());
					model.setLink_image(this.getConfig().getLinkImgBase().replace("\\", "/")+"images/IGRP/Config/img.list.php?name=");
					model.setVersion(ac.getVersion());
					String json = this.getConfig().getCurrentBaseServerPahtXsl(ac)+ File.separator +ac.getPage()+".json";
					if(FileHelper.fileExists(json)){
						json = this.getConfig().getCurrentResolvePathPage(ac.getApplication().getDad(),ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".json?v="+r.nextInt();
						model.setPage_form(json.replace("\\", "/"));
					}else if(FileHelper.fileExists(json.replaceAll(".json", ".xml"))){
						String xmlp = this.getConfig().getCurrentResolvePathPage(ac.getApplication().getDad(),ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".xml?v="+r.nextInt();
						model.setPage_form(xmlp.replace("\\", "/"));
					}
					model.setPackage_(this.getConfig().getPackage(ac.getApplication().getDad(), ac.getPage()));
					model.setPage(ac.getPage());
					GeneratorView view = new GeneratorView(model);
					return this.renderView(view,true);
				}
			}catch(NumberFormatException e){
				return this.redirect("igrp", "error-page", "exception");
			}
		}
		return this.redirect("igrp", "error-page", "exception");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private static final Logger LOGGER = LoggerFactory.getLogger(GeneratorController.class);

	// nosi/webapps/igrp/pages/generator/GeneratorController.java
    	public Response actionTransform() throws Exception {

			this.format   = Response.FORMAT_HTML;

    		String xmlStr;
			String xslStr = "";
			String xslPath = null;
    		Map<String, String> xslParams = new LinkedHashMap<>();
    		String contentType = Igrp.getInstance().getRequest().getContentType();
    		if (contentType != null && contentType.contains("application/json")) {
    			// read raw body

    			StringBuilder sb = new StringBuilder();
    			try (BufferedReader reader = Igrp.getInstance().getRequest().getReader()) {
    				String line;
    				while ((line = reader.readLine()) != null) {
    					sb.append(line);
    				}
    			}
    			// Decode Base64 first
				String body = sb.toString();

				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(body);

				xmlStr = root.get("xml").asText();


				if (root.get("xslPath") == null || root.get("xsl")!=null)
					xslStr = root.get("xsl").asText();
				else
					xslPath =  root.get("xslPath").asText();
				xslParams =
						mapper.convertValue(root.get("xslParams"),
								new TypeReference<Map<String,String>>(){});

			} else {
    			xmlStr = Core.getParam("xml");
    			xslStr = Core.getParam("xsl");
				xslPath = Core.getParam("xslPath");
    		}

    		try {

					String html;

				if (xslPath != null && !xslPath.isBlank()) {
					ServletContext ctx = Igrp.getInstance().getRequest().getServletContext();

					html = Controller.performXsltTransformFromPath(
							xmlStr,
							xslPath,
							ctx,
							xslParams
					);
				} else {

					html = Controller.performXsltTransform(
							xmlStr,
							xslStr,
							xslParams
					);
				}
    			return renderView(html.replaceFirst("^<\\?xml[^>]*\\?>", "").trim());
    		} catch (Exception ex) {
    			LOGGER.error("generator/transform failed", ex);
    			Response resp = new Response();
    			resp.setType(1);
    			resp.setHttpStatus(HttpStatus.STATUS_500);
    			resp.setContent("XSLT transform error: " + ex.getMessage());
    			return resp;
    		}
    	}


	private Response errorResponse(String message) {
		this.format = Response.FORMAT_HTML;
		Response resp = new Response();
		resp.setType(1);
		resp.setCharacterEncoding(Response.CHARSET_UTF_8);
		resp.setContentType(Response.FORMAT_HTML);
		resp.setContent("<!-- XSLT Transform Error: " + escapeHtmlComment(message) + " -->");
		return resp;
	}


	private String escapeHtmlComment(String s) {
		if (s == null) return "";
		return s.replace("--", "- -");
	}
	/*----#END-PRESERVED-AREA----*/
}