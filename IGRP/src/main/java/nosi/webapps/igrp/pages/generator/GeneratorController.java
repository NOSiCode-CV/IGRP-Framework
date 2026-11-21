package nosi.webapps.igrp.pages.generator;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.BufferedReader;
import java.io.IOException;
import java.security.SecureRandom;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import nosi.core.webapp.*;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Strings;
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

	/** Largest JSON body accepted by actionTransform (characters). */
	private static final int MAX_TRANSFORM_BODY = 10 * 1024 * 1024;

	/**
	 * Server-side XSLT used by xml.xsl.transform.js when the browser has no XSLTProcessor (Chrome 158+).
	 * Reachable without login (PagesScapePermission) so public pages keep working, hence:
	 * <ul>
	 *   <li>JSON body only: a cross-site HTML form cannot send application/json (CSRF);</li>
	 *   <li>xslPath: a .xsl file under /images/ only, run on XXE-safe XML, document() limited to /images/;</li>
	 *   <li>xsl (stylesheet sent by the client): logged-in users only, secure processing, no includes/document().</li>
	 * </ul>
	 * Body: {xml, xslPath | xsl, xslBasePath, xslParams}.
	 */
	public Response actionTransform() throws Exception {
		this.format = Response.FORMAT_HTML;

		HttpServletRequest request = Igrp.getInstance().getRequest();
		User user = Igrp.getInstance().getUser();
		boolean authenticated = user != null && user.isAuthenticated();

		String contentType = request.getContentType();
		if (contentType == null || !contentType.toLowerCase(Locale.ROOT).startsWith("application/json")) {
			return transformError(HttpStatus.STATUS_400, "JSON body required");
		}
		if (request.getContentLengthLong() > MAX_TRANSFORM_BODY) {
			return transformError(HttpStatus.STATUS_413, "Request too large");
		}

		try {
			String body = readLimited(request, MAX_TRANSFORM_BODY);
			if (body == null) {
				return transformError(HttpStatus.STATUS_413, "Request too large");
			}

			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(body);
			String xmlStr = root.path("xml").asText(null);
			String xslStr = root.hasNonNull("xsl") ? root.get("xsl").asText() : null;
			String xslPath = xslStr == null ? root.path("xslPath").asText(null) : null;
			String xslBasePath = root.path("xslBasePath").asText(null);
			Map<String, String> xslParams = root.hasNonNull("xslParams")
					? mapper.convertValue(root.get("xslParams"), new TypeReference<Map<String, String>>() {})
					: Collections.<String, String>emptyMap();

			if (xmlStr == null) {
				return transformError(HttpStatus.STATUS_400, "Missing xml");
			}

			String html;
			if (StringUtils.isNotBlank(xslPath)) {
				String xslWebPath = imagesXslPath(xslPath);
				if (xslWebPath == null) {
					return transformError(HttpStatus.STATUS_400, "Invalid xslPath");
				}
				ServletContext ctx = request.getServletContext();
				html = Controller.performClientXsltTransformFromPath(xmlStr, xslWebPath,
						includeBaseFor(xslBasePath, xslWebPath), ctx, xslParams);
			} else if (xslStr != null) {
				if (!authenticated) {
					return transformError(HttpStatus.STATUS_403, "Login required");
				}
				html = Controller.performClientXsltTransform(xmlStr, xslStr, xslParams, request.getServletContext());
			} else {
				return transformError(HttpStatus.STATUS_400, "Missing xsl or xslPath");
			}
			return renderView(html.replaceFirst("^<\\?xml[^>]*\\?>", "").trim());
		} catch (Exception ex) {
			// Anonymous callers can trigger this: log one line, keep the stack trace for DEBUG.
			LOGGER.warn("generator/transform failed: {}", Controller.rootCauseSummary(ex));
			LOGGER.debug("generator/transform failed (detail)", ex);
			// Details only for logged-in users (Studio); anonymous callers get a generic message.
			return transformError(HttpStatus.STATUS_500,
					authenticated ? "XSLT transform error: " + ex.getMessage() : "XSLT transform error");
		}
	}

	private static Response transformError(HttpStatus status, String message) {
		Response resp = new Response();
		resp.setType(1);
		resp.setHttpStatus(status);
		resp.setContent(message);
		return resp;
	}

	/** Reads at most maxChars characters of the body; null when it is longer. */
	private static String readLimited(HttpServletRequest request, int maxChars) throws IOException {
		StringBuilder sb = new StringBuilder();
		char[] buf = new char[8192];
		try (BufferedReader reader = request.getReader()) {
			int n;
			while ((n = reader.read(buf)) != -1) {
				if (sb.length() + n > maxChars) {
					return null;
				}
				sb.append(buf, 0, n);
			}
		}
		return sb.toString();
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


	public static String keepFromImages(String path) {
		if (StringUtils.isBlank(path)) {
			return path;
		}

		int idx = Strings.CS.indexOf(path, "/images/");

		if (idx >= 0) {
			return StringUtils.substring(path, idx);
		}

		return path;
	}

	/** Client path/URL as a normalised webapp path under /images/, or null when it points anywhere else. */
	public static String imagesPath(String raw) {
		if (StringUtils.isBlank(raw)) {
			return null;
		}
		String path = Controller.normalizeXslWebPath(keepFromImages(raw.split("[?#]", 2)[0]));
		return path != null && path.startsWith("/images/") ? path : null;
	}

	/** Client xslPath as a .xsl file under /images/, or null. */
	public static String imagesXslPath(String raw) {
		String path = imagesPath(raw);
		return path != null && path.toLowerCase(Locale.ROOT).endsWith(".xsl") ? path : null;
	}

	/**
	 * Client xslBasePath, accepted only when it is a parent folder of the stylesheet's own folder
	 * (e.g. formgen util/java for util/java/mvc/XSL_CONTROLLER.xsl). This keeps the compiled-template
	 * cache bounded; anything else (or the stylesheet's own folder) means "no include base".
	 */
	public static String includeBaseFor(String rawBase, String xslWebPath) {
		String base = imagesPath(rawBase);
		if (base == null || xslWebPath == null) {
			return null;
		}
		String xslDir = xslWebPath.substring(0, xslWebPath.lastIndexOf('/'));
		return xslDir.startsWith(base + "/") ? base : null;
	}

	private String escapeHtmlComment(String s) {
		if (s == null) return "";
		return s.replace("--", "- -");
	}
	/*----#END-PRESERVED-AREA----*/
}